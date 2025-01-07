unit eTasks.View.Main;

interface

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
  eTasks.View.Services.Interfaces;

type
  TTeste = procedure of Object;

  TfMain = class(TForm, iMainLayout)
    MainLayout               : TLayout;
    ContentLayout            : TLayout;
    ListsLayout              : TLayout;
    ScreensLayout            : TLayout;
    Circle1                  : TCircle;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    AppBar                   : iAppBar;
    TitleBar                 : iTitleBar;
    MainMenu                 : iOffcanvas;
    AvatarMenu               : iAvatarMenu;
    ActionButton             : iActionButton;
    NavigationManagerService : iNavigationManagerService;
    Menu1                    : TMenu1;
    CurrentPage              : iPageLayout;
    procedure SetTheme(sender : TObject);
    procedure SetLanguage(sender : TObject);
    procedure TranslateUI;
    procedure OpenMenu(sender : TObject);
    procedure OpenAvatarMenu(sender : TObject);

    procedure RestrictScreenSize;

    procedure ScreensLayoutChange;
    function GetPage: iPageLayout;
    procedure SetPage(value: iPageLayout);
    property Page: iPageLayout read GetPage write SetPage;
    function FormWidth: Integer;
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

uses
  eTasks.Components.ColorPallete,
  eTasks.Components.Builder,
  eTasks.Shared.Consts,
  {$IFDEF ANDROID}
  eTasks.Shared.Android.Utils,
  {$endif}
  eTranslate4Pascal,
  eTasks.View.NavigationManager,
  eTasks.View.ThemeService;

{$R *.fmx}

procedure TfMain.FormCreate(Sender: TObject);
begin
  NavigationManagerService := TNavigationManager.New(ScreensLayout, ScreensLayoutChange);

  AppBar := TComponentBars.AppBar(fMain, MainLayout).isDarkMode(ThemeService.isDarkTheme);
    AppBar.SetButtonAppBarAction(ThemeBtn, SetTheme).isDarkMode(ThemeService.isDarkTheme);
    AppBar.SetButtonAppBarAction(MenuBtn, OpenMenu).isDarkMode(ThemeService.isDarkTheme);
    AppBar.SetButtonAppBarAction(AvatarBtn, OpenAvatarMenu).isDarkMode(ThemeService.isDarkTheme);

  TitleBar := TComponentBars.TitleBar(fMain, MainLayout).isDarkMode(ThemeService.isDarkTheme);
  MainMenu := TComponentOffcanvas.MainMenu(fMain).isDarkMode(ThemeService.isDarkTheme);
  AvatarMenu := tComponentOffCanvas.AvatarMenu(fMain).isDarkMode(ThemeService.isDarkTheme);

  ActionButton := TComponentButtons.ActionButton(fMain).OnClick(SetLanguage).SetHint('Clique para um teste').isDarkMode(ThemeService.isDarkTheme);

  ThemeService.SubscribeInterface([AppBar, TitleBar, MainMenu, AvatarMenu, ActionButton]);

  Menu1 := tMenu1.New(NavigationManagerService, self, ListsLayout);

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
procedure TfMain.SetLanguage(sender : TObject);
begin
  if(eTranslate.GetLanguage = 'pt-BR')then
   eTranslate.SetLanguage('en-US')
  else
   eTranslate.SetLanguage('pt-BR');

  TranslateUI;
end;

procedure TfMain.TranslateUI;
begin
  TitleBar.SetTitle(eTranslate.Translate('Main.Title'));
  AppBar.SetTitle(eTranslate.Translate('Main.Title'));
  ActionButton.SetHint(eTranslate.Translate('Main.Title'));
end;
{$EndRegion}

end.
