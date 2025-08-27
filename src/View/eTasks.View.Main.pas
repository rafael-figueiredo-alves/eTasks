unit eTasks.View.Main;

interface

{$region 'Dependências Globais'}
uses
  System.Classes,
  FMX.Controls,
  FMX.Types,
  FMX.Forms,
  FMX.Objects,
  FMX.Layouts,
  eTasks.Components.Interfaces,
  eTasks.View.Layouts.Interfaces,
  eTasks.View.Services.Interfaces,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  eTasks.Components.MenuEnums,
  FMX.Effects,
  FMX.Memo.Types,
  FMX.ScrollBox,
  FMX.Memo;
{$endregion}

type
  TfMain = class(TForm, iMainLayout)
    {$region 'Base screen components'}
    MainLayout               : TLayout;
    ContentLayout            : TLayout;
    ListsLayout              : TLayout;
    ScreensLayout            : TLayout;
    FolhaDeEstilos           : TStyleBook;
    {$endregion}
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    {$region 'Virtual components'}
    AppBar                   : iAppBar;
    TitleBar                 : iTitleBar;
    MainMenu                 : iMainMenu;
    AvatarMenu               : iAvatarMenu;
    LanguageMenu             : iLanguageMenu;
    ActionButton             : iActionButton;
    NavigationManagerService : iNavigationManagerService;
    ResourceManager          : iResourceManager;
    CurrentPage              : iPageLayout;
    {$endregion}
    procedure SetTheme(sender : TObject);
    procedure TranslateUI;
    procedure OpenMainMenu(sender : TObject);
    procedure OpenAvatarMenu(sender : TObject);
    procedure MainMenuItemClick(const item: TMainMenuItems);
    procedure SetMainMenuItemTitle(const item: TMainMenuItems);
    procedure AvatarMenuItemClick(const item: TAvatarMenuItems);
    procedure MostrarMensagem(sender: TObject);
    procedure OnLanguageChanged(const Lang: string);
    procedure SetVisibilityActionButton(const Visible: Boolean);

    {$region 'Métodos Base'}
    procedure RestrictScreenSize;

    procedure ScreensLayoutChange;
    function GetPage: iPageLayout;
    procedure SetPage(value: iPageLayout);
    property Page: iPageLayout read GetPage write SetPage;
    function FormWidth: Integer;
    procedure SetSelectedPage(const Page: TMainMenuItems);
    {$endregion}
  public
    { Public declarations }
    SelectedMainMenuItem : TMainMenuItems;
  end;

var
  fMain: TfMain;

implementation

{$region 'Dependências Internas'}
uses
  {$IFDEF ANDROID}
  eTasks.Shared.Android.Utils,
  {$endif}
  eTasks.Components.ColorPallete,
  eTasks.Components.Builder,
  eTasks.Shared.Consts,
  eTranslate4Pascal,
  eTasks.View.NavigationManager,
  eTasks.View.ThemeService,
  eTasks.Components.TranslationEnums,
  System.Generics.Collections,
  eTasks.View.LanguageService,
  eTasks.Components.ToastService,
  eTasks.Components.DialogService,
  System.SysUtils,
  eTasks.Shared.TranslateKeyConsts,
  LocalStorage4Pascal, eTasks.View.ResourceManagerService,
  eTasks.View.ActionButtonVisibleService;
{$endregion}

{$R *.fmx}

{$region 'Eventos de Gerência de Métodos dos Menus'}
procedure TfMain.AvatarMenuItemClick(const item: TAvatarMenuItems);
begin
  case item of
    TAvatarMenuItems.EditProfile    : NavigationManagerService.GoToProfile(self);
    TAvatarMenuItems.ChangePassword : DialogService.Warn('AVISO', 'Implementar');
    TAvatarMenuItems.Logout         : DialogService.Warn('AVISO', 'Implementar');
    TAvatarMenuItems.Conquers       : NavigationManagerService.GoToRewards(self);
    TAvatarMenuItems.Settings       : NavigationManagerService.GoToSettings(self);
    TAvatarMenuItems.ChangeTheme    : SetTheme(nil);
    TAvatarMenuItems.ChangeLanguage : LanguageMenu.OpenMenu;
    TAvatarMenuItems.About          : NavigationManagerService.GoToAbout(self);
  end;
end;

procedure TfMain.MainMenuItemClick(const item: TMainMenuItems);
begin
  case item of
    TMainMenuItems.Home :
      begin
        ResourceManager.OpenHomePage;
      end;
    TMainMenuItems.Tasks:
      begin
        ResourceManager.OpenTasks;
      end;
    TMainMenuItems.Goals:
      begin
        ResourceManager.OpenGoals;
      end;
    TMainMenuItems.Shopping:
      begin
        ResourceManager.OpenShopping;
      end;
    TMainMenuItems.Readings:
      begin
        ResourceManager.OpenReadings;
      end;
    TMainMenuItems.Notes:
      begin
        ResourceManager.OpenNotes;
      end;
    TMainMenuItems.Finance:
      begin
        ResourceManager.OpenFinances;
      end;
  end;
end;
{$endregion}

procedure TfMain.FormCreate(Sender: TObject);
begin
  NavigationManagerService := TNavigationManager.New(ScreensLayout, ScreensLayoutChange);
  ActionButtonVisibleService.SetActionButtonVisibleEvent(SetVisibilityActionButton);

  AppBar := TBars.AppBar(fMain, MainLayout).isDarkMode(ThemeService.isDarkTheme);
    AppBar.SetButtonAppBarAction(ThemeBtn, SetTheme).isDarkMode(ThemeService.isDarkTheme);
    AppBar.SetButtonAppBarAction(MenuBtn, OpenMainMenu).isDarkMode(ThemeService.isDarkTheme);
    AppBar.SetButtonAppBarAction(AvatarBtn, OpenAvatarMenu).isDarkMode(ThemeService.isDarkTheme);

  TitleBar := TBars.TitleBar(fMain, MainLayout).isDarkMode(ThemeService.isDarkTheme);
  MainMenu := TMenus.MainMenu(fMain, ThemeService.isDarkTheme).OnMainMenuItemClick(MainMenuItemClick);
  AvatarMenu := TMenus.AvatarMenu(fMain).isDarkMode(ThemeService.isDarkTheme).OnAvatarMenuItemClick(AvatarMenuItemClick);
  LanguageMenu := TMenus.LanguageMenu(fMain, ThemeService.isDarkTheme).OnLanguageSelected(OnLanguageChanged).Selected(LocalStorage4Delphi.GetString(LSK_Language, 'pt-BR'));

  ActionButton := TButtons.ActionButton(fMain).OnClick(MostrarMensagem).isDarkMode(ThemeService.isDarkTheme);

  Self.Fill.Color := TColorPallete.GetColor(Background, ThemeService.isDarkTheme);

  ThemeService.SubscribeInterface([AppBar, TitleBar, MainMenu, AvatarMenu, ActionButton, DialogService]);
  ThemeService.ApplyTheme;

  ResourceManager := TResourceManagerService.New(NavigationManagerService, self, ListsLayout, ScreensLayout);

  LanguageService.SubscribeMethod('MainForm', TranslateUI);

  TToast.ToastMessage(fMain);

  TModalDlg.ModalDialogs(fMain);

  SelectedMainMenuItem := TMainMenuItems.Home;

  ResourceManager.OpenHomePage;

  TranslateUI;
end;

{$Region 'IMainLayout Methods}
function TfMain.FormWidth: Integer;
begin
  Result := Self.Width;
end;

function TfMain.GetPage: iPageLayout;
begin
  Result := CurrentPage;
end;

procedure TfMain.MostrarMensagem(sender: TObject);
begin
  DialogService.ShowError('Teste', 'Teste, Ocorreu um problema! Ocorreu um problema! Ocorreu um problema! Ocorreu um problema! Ocorreu um problema! Ocorreu um problema! Ocorreu um problema! Ocorreu um problema! Ocorreu um problema! Ocorreu um problema! Ocorreu um problema! Ocorreu um problema!', 'Teste');
end;

procedure TfMain.SetMainMenuItemTitle(const item: TMainMenuItems);
begin
  case item of
    TMainMenuItems.Home :
      begin
        TitleBar.SetTitle(eTranslate.Translate(Titles_HomePage, 'Bem vindo ao eTasks'));
        AppBar.SetTitle(eTranslate.Translate(Titles_HomePage, 'Bem vindo ao eTasks'));
      end;
    TMainMenuItems.Tasks:
      begin
        TitleBar.SetTitle(eTranslate.Translate(Titles_TasksPage, 'Minhas tarefas'));
        AppBar.SetTitle(eTranslate.Translate(Titles_TasksPage, 'Minhas tarefas'));
      end;
    TMainMenuItems.Goals:
      begin
        TitleBar.SetTitle(eTranslate.Translate(Titles_GoalsPage, 'Minhas Metas'));
        AppBar.SetTitle(eTranslate.Translate(Titles_GoalsPage, 'Minhas Metas'));
      end;
    TMainMenuItems.Shopping:
      begin
        TitleBar.SetTitle(eTranslate.Translate(Titles_ShoppingPage, 'Minhas Compras'));
        AppBar.SetTitle(eTranslate.Translate(Titles_ShoppingPage, 'Minhas Compras'));
      end;
    TMainMenuItems.Readings:
      begin
        TitleBar.SetTitle(eTranslate.Translate(Titles_ReadingsPage, 'Minhas leituras'));
        AppBar.SetTitle(eTranslate.Translate(Titles_ReadingsPage, 'Minhas leituras'));
      end;
    TMainMenuItems.Notes:
      begin
        TitleBar.SetTitle(eTranslate.Translate(Titles_NotesPage, 'Minhas Anotações'));
        AppBar.SetTitle(eTranslate.Translate(Titles_NotesPage, 'Minhas Anotações'));
      end;
    TMainMenuItems.Finance:
      begin
        TitleBar.SetTitle(eTranslate.Translate(Titles_FinancePage, 'Minhas Finanças'));
        AppBar.SetTitle(eTranslate.Translate(Titles_FinancePage, 'Minhas Finanças'));
      end;
  end;
end;

procedure TfMain.SetPage(value: iPageLayout);
begin
  CurrentPage := value;
end;

procedure TfMain.SetSelectedPage(const Page: TMainMenuItems);
begin
  SelectedMainMenuItem := Page;
  SetMainMenuItemTitle(SelectedMainMenuItem);
  MainMenu.Selected(Page);
end;

{$EndRegion}

procedure TfMain.OpenAvatarMenu(sender: TObject);
begin
  AvatarMenu.OpenMenu;
end;

procedure TfMain.OpenMainMenu(sender: TObject);
begin
  fMain.MainMenu.OpenMenu;
end;

{$Region 'Layout/Size Functions'}
procedure TfMain.RestrictScreenSize;
begin
  if(fMain.Width < MinimumWidth)then
   fMain.Width := MinimumWidth;

  if(fmain.Height < MinimumHeight)then
   fMain.Height := MinimumHeight;
end;

procedure TfMain.ScreensLayoutChange;
begin

  if(fMain.Width > MobileSizeWidth)then
   begin
     ScreensLayout.Parent := ContentLayout;
     ScreensLayout.Align := TAlignLayout.Right;
     ScreensLayout.Width := fMain.Width / 2;
     ScreensLayout.Visible := True;
   end
  else
   begin
     if(Assigned(CurrentPage))then
     if(ScreensLayout.ContainsObject(CurrentPage.Layout))then
      begin
       ScreensLayout.Parent := fMain;
       ScreensLayout.Align := TAlignLayout.Contents;
       ScreensLayout.Visible := True;
      end
     else
      begin
        ScreensLayout.Parent := nil;
        ScreensLayout.Visible := False;
      end
     else
      begin
        ScreensLayout.Parent := nil;
        ScreensLayout.Visible := False;
      end;
   end;
end;

procedure TfMain.FormResize(Sender: TObject);
begin
  RestrictScreenSize;

  ScreensLayoutChange;

  AppBar.ShowTitleBar(fMain.Width > MobileSizeWidth);
  TitleBar.Resize(fMain.Width);

  if(Assigned(CurrentPage))then
   CurrentPage.Resize(fMain.Width);
end;
{$EndRegion}

procedure TfMain.SetTheme(sender: TObject);
begin
  ThemeService.ChangeTheme;
  Self.Fill.Color := TColorPallete.GetColor(Background, ThemeService.isDarkTheme);
end;


procedure TfMain.SetVisibilityActionButton(const Visible: Boolean);
begin
  ActionButton.IsVisible(Visible);
end;

{$Region 'Language Functions'}
procedure TfMain.OnLanguageChanged(const Lang: string);
begin
  LanguageService.SetLanguage(Lang);
end;

procedure TfMain.TranslateUI;
var
  AvatarTexts       : TDictionary<TAvatarMenuTexts, string>;
  MainMenuTexts     : TDictionary<TMainMenuTexts, string>;
  LanguageMenuTexts : TDictionary<TLanguageMenuTexts, string>;
  DialogTexts       : TDictionary<TDialogTexts, string>;
begin
  SetMainMenuItemTitle(SelectedMainMenuItem);

  ActionButton.SetHint(eTranslate.Translate(ActionButton_Hint, 'Adicionar'));

  AvatarTexts := TDictionary<TAvatarMenuTexts, string>.Create;
  try
    with AvatarTexts do
     begin
      Add(TAvatarMenuTexts.EditProfile, eTranslate.Translate(AvatarMenu_EditProfile, 'Editar Perfil'));
      Add(TAvatarMenuTexts.ChangePassword, eTranslate.Translate(AvatarMenu_ChangePassword, 'Trocar Senha'));
      Add(TAvatarMenuTexts.Logout, eTranslate.Translate(AvatarMenu_Logout, 'Sair'));
      Add(TAvatarMenuTexts.Conquers, eTranslate.Translate(AvatarMenu_Conquers, 'Conquistas'));
      Add(TAvatarMenuTexts.Settings, eTranslate.Translate(AvatarMenu_Settings, 'Configurações'));
      Add(TAvatarMenuTexts.ChangeTheme, eTranslate.Translate(AvatarMenu_ChangeTheme, 'Trocar Tema'));
      Add(TAvatarMenuTexts.ChangeLanguage, eTranslate.Translate(AvatarMenu_ChangeLanguage, 'Trocar Idioma'));
      Add(TAvatarMenuTexts.About, eTranslate.Translate(AvatarMenu_About, 'Sobre eTasks'));
     end;

     AvatarMenu.ChangeLanguage(AvatarTexts);
  finally
    FreeAndNil(AvatarTexts)
  end;

  MainMenuTexts := TDictionary<TMainMenuTexts, string>.Create;
  try
    with MainMenuTexts do
     begin
      Add(TMainMenuTexts.Title, eTranslate.Translate(MainMenu_Title, 'MENU'));
      Add(TMainMenuTexts.Home, eTranslate.Translate(MainMenu_Home, 'Inicio'));
      Add(TMainMenuTexts.Tasks, eTranslate.Translate(MainMenu_Tasks, 'Minhas Tarefas'));
      Add(TMainMenuTexts.Goals, eTranslate.Translate(MainMenu_Goals, 'Minhas Metas'));
      Add(TMainMenuTexts.Shopping, eTranslate.Translate(MainMenu_Shopping, 'Minhas Compras'));
      Add(TMainMenuTexts.Readings, eTranslate.Translate(MainMenu_Readings, 'Minhas Leituras'));
      Add(TMainMenuTexts.Notes, eTranslate.Translate(MainMenu_Notes, 'Minhas Anotações'));
      Add(TMainMenuTexts.Finance, eTranslate.Translate(MainMenu_Finances, 'Minhas Finanças'));
     end;

     MainMenu.ChangeLanguage(MainMenuTexts);
  finally
    FreeAndNil(MainMenuTexts)
  end;

  LanguageMenuTexts := TDictionary<TLanguageMenuTexts, string>.Create;
  try
    with LanguageMenuTexts do
     begin
      Add(TLanguageMenuTexts.LanguagesTitle, eTranslate.Translate(LanguageMenu_Title, 'IDIOMAS'));
     end;

     LanguageMenu.ChangeLanguage(LanguageMenuTexts);
  finally
    FreeAndNil(LanguageMenuTexts)
  end;

  DialogTexts := TDictionary<TDialogTexts, string>.Create;
  try
    with DialogTexts do
     begin
       Add(TDialogTexts.CopyButton, eTranslate.Translate(Dialog_CopyButton, 'Copiar'));
       Add(TDialogTexts.CopyErrorMsg, eTranslate.Translate(Dialog_CopyErrorMsg, 'Falha ao copiar detalhes!'));
       Add(TDialogTexts.CopySuccessMsg, eTranslate.Translate(Dialog_CopySuccessMsg, 'Detalhes copiados com sucesso!'));
       Add(TDialogTexts.CancelButton, eTranslate.Translate(Dialog_CancelButton, 'Cancelar'));
       Add(TDialogTexts.OkButton, eTranslate.Translate(Dialog_OkButton, 'Confirmar'));
       Add(TDialogTexts.MoreDetails, eTranslate.Translate(Dialog_MoreDetails, 'Mais detalhes'));
     end;

     DialogService.ChangeLanguage(DialogTexts);
  finally
    FreeAndNil(DialogTexts);
  end;

  AppBar.SetButtonAppBarHints(TButtonAppBar.ThemeBtn, eTranslate.Translate(AppBar_BtnThemeChanger, 'Trocar Tema'));
  AppBar.SetButtonAppBarHints(TButtonAppBar.MenuBtn, eTranslate.Translate(AppBar_BtnMainMenu, 'Menu principal'));
  AppBar.SetButtonAppBarHints(TButtonAppBar.AvatarBtn, eTranslate.Translate(AppBar_BtnAvatarMenu, 'Menu do usuário'));
end;
{$EndRegion}

end.
