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
  eTasks.View.Menu1,
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
    FolhaDeEstilos: TStyleBook;
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
    Menu1                    : TMenu1;
    CurrentPage              : iPageLayout;
    {$endregion}
    procedure SetTheme(sender : TObject);
    procedure TranslateUI;
    procedure OpenMenu(sender : TObject);
    procedure OpenAvatarMenu(sender : TObject);
    procedure MainMenuItemClick(const item: TMainMenuItems);
    procedure AvatarMenuItemClick(const item: TAvatarMenuItems);
    procedure MostrarMensagem(sender: TObject);

    procedure RestrictScreenSize;

    procedure ScreensLayoutChange;
    function GetPage: iPageLayout;
    procedure SetPage(value: iPageLayout);
    property Page: iPageLayout read GetPage write SetPage;
    function FormWidth: Integer;

    procedure TesteLanguage(const Lang: string);
  public
    { Public declarations }
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
  eTasks.Shared.TranslateKeyConsts, LocalStorage4Pascal;
{$endregion}

{$R *.fmx}

procedure TfMain.AvatarMenuItemClick(const item: TAvatarMenuItems);
begin
  case item of
    TAvatarMenuItems.EditProfile    : DialogService.Warn('AVISO', 'Implementar');
    TAvatarMenuItems.ChangePassword : DialogService.Warn('AVISO', 'Implementar');
    TAvatarMenuItems.Logout         : DialogService.Warn('AVISO', 'Implementar');
    TAvatarMenuItems.Conquers       : DialogService.Warn('AVISO', 'Implementar');
    TAvatarMenuItems.Settings       : DialogService.Warn('AVISO', 'Implementar');
    TAvatarMenuItems.ChangeTheme    : DialogService.Warn('AVISO', 'Implementar');
    TAvatarMenuItems.ChangeLanguage : LanguageMenu.OpenMenu;
    TAvatarMenuItems.About          : DialogService.Warn('AVISO', 'Implementar');
  end;
end;

procedure TfMain.MainMenuItemClick(const item: TMainMenuItems);
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

procedure TfMain.FormCreate(Sender: TObject);
begin
  NavigationManagerService := TNavigationManager.New(ScreensLayout, ScreensLayoutChange);

  AppBar := TBars.AppBar(fMain, MainLayout).isDarkMode(ThemeService.isDarkTheme);
    AppBar.SetButtonAppBarAction(ThemeBtn, SetTheme).isDarkMode(ThemeService.isDarkTheme);
    AppBar.SetButtonAppBarAction(MenuBtn, OpenMenu).isDarkMode(ThemeService.isDarkTheme);
    AppBar.SetButtonAppBarAction(AvatarBtn, OpenAvatarMenu).isDarkMode(ThemeService.isDarkTheme);

  TitleBar := TBars.TitleBar(fMain, MainLayout).isDarkMode(ThemeService.isDarkTheme);
  MainMenu := TMenus.MainMenu(fMain, ThemeService.isDarkTheme).OnMainMenuItemClick(MainMenuItemClick);
  AvatarMenu := TMenus.AvatarMenu(fMain).isDarkMode(ThemeService.isDarkTheme).OnAvatarMenuItemClick(AvatarMenuItemClick);
  LanguageMenu := TMenus.LanguageMenu(fMain, ThemeService.isDarkTheme).OnLanguageSelected(TesteLanguage).Selected(LocalStorage4Delphi.GetString(LSK_Language, 'pt-BR'));

  ActionButton := TButtons.ActionButton(fMain).OnClick(MostrarMensagem).SetHint('Clique para um teste').isDarkMode(ThemeService.isDarkTheme);

  Self.Fill.Color := TColorPallete.GetColor(Background, ThemeService.isDarkTheme);

  ThemeService.SubscribeInterface([AppBar, TitleBar, MainMenu, AvatarMenu, ActionButton, DialogService]);
  ThemeService.ApplyTheme;

  Menu1 := tMenu1.New(NavigationManagerService, self, ListsLayout);

  LanguageService.SubscribeMethod('MainForm', TranslateUI);

  TToast.ToastMessage(fMain);

  TModalDlg.ModalDialogs(fMain);

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

procedure TfMain.SetPage(value: iPageLayout);
begin
  CurrentPage := value;
end;
{$EndRegion}

procedure TfMain.OpenAvatarMenu(sender: TObject);
begin
  AvatarMenu.OpenMenu;
end;

procedure TfMain.OpenMenu(sender: TObject);
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

{$Region 'Language Functions'}
procedure TfMain.TesteLanguage(const Lang: string);
begin
  LanguageService.SetLanguage(Lang);
end;

procedure TfMain.TranslateUI;
begin
  ActionButton.SetHint(eTranslate.Translate(ActionButton_Hint, 'Adicionar'));
end;
{$EndRegion}

end.
