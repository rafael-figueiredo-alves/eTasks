unit eTasks.View.Main;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Effects,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Layouts,
  eTasks.Components.Interfaces,
  FMX.MultiView, eTasks.View.PageLayout, eTasks.View.Interfaces;

type
  TTeste = procedure of Object;

  TfMain = class(TForm)
    MainLayout: TLayout;
    ContentLayout: TLayout;
    ListsLayout: TLayout;
    ScreensLayout: TLayout;
    Button1: TButton;
    Circle1: TCircle;
    Button2: TButton;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    AppBar       : iAppBar;
    TitleBar     : iTitleBar;
    MainMenu     : iOffcanvas;
    AvatarMenu   : iAvatarMenu;
    ActionButton : iActionButton;
    fDarkMode : Boolean;
    Teste : iPageLayout;
    Nav : iNavigationManagerService;
    procedure SetTheme(sender : TObject);
    procedure SetLanguage(sender : TObject);
    procedure TranslateUI;
    procedure OpenMenu(sender : TObject);
    procedure OpenAvatarMenu(sender : TObject);

    procedure RestrictScreenSize;
    procedure ScreensLayoutChange;
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
  eTranslate4Pascal, eTasks.View.Teste, eTasks.View.NavigationManager;

{$R *.fmx}

procedure TfMain.Button1Click(Sender: TObject);
begin
    Nav.GoToAbout(Teste).Resize(fMain.Width);
end;

procedure TfMain.Button2Click(Sender: TObject);
begin
  Nav.GoToTasks(Teste).Resize(fMain.Width);
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  Nav := TNavigationManager.New(ScreensLayout, ScreensLayoutChange);

  fDarkMode := False;
  AppBar := TComponentBars.AppBar(fMain, MainLayout).isDarkMode(fDarkMode);
  TitleBar := TComponentBars.TitleBar(fMain, MainLayout);
  MainMenu := TComponentOffcanvas.MainMenu(fMain);
  AvatarMenu := tComponentOffCanvas.AvatarMenu(fMain);
  AppBar.SetButtonAppBarAction(ThemeBtn, SetTheme);
  AppBar.SetButtonAppBarAction(MenuBtn, OpenMenu);
  AppBar.SetButtonAppBarAction(AvatarBtn, OpenAvatarMenu);
  ActionButton := TComponentButtons.ActionButton(fMain).OnClick(SetLanguage).SetHint('Clique para um teste');
  TranslateUI;
end;

procedure TfMain.FormResize(Sender: TObject);
begin
  RestrictScreenSize;

  ScreensLayoutChange;

  AppBar.ShowTitleBar(fMain.Width > MobileSizeWidth);
  TitleBar.Resize(fMain.Width);

  if(Assigned(Teste))then
   Teste.Resize(fMain.Width);
end;

procedure TfMain.OpenAvatarMenu(sender: TObject);
begin
  AvatarMenu.OpenMenu;
end;

procedure TfMain.OpenMenu(sender: TObject);
begin
  fMain.MainMenu.OpenMenu;
end;

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
     if(Assigned(Teste))then
     if(ScreensLayout.ContainsObject(Teste.Layout))then
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

procedure TfMain.SetLanguage(sender : TObject);
begin
  if(eTranslate.GetLanguage = 'pt-BR')then
   eTranslate.SetLanguage('en-US')
  else
   eTranslate.SetLanguage('pt-BR');

  TranslateUI;
end;

procedure TfMain.SetTheme(sender: TObject);
begin
  fDarkMode := not fDarkMode;
  AppBar.isDarkMode(fDarkMode);
  TitleBar.isDarkMode(fDarkMode);
  MainMenu.isDarkMode(fDarkMode);
  AvatarMenu.isDarkMode(fDarkMode);
  ActionButton.isDarkMode(fDarkMode);
  Self.Fill.Color := TColorPallete.GetColor(Background, fDarkMode);
end;

procedure TfMain.TranslateUI;
begin
  TitleBar.SetTitle(eTranslate.Translate('Main.Title'));
  AppBar.SetTitle(eTranslate.Translate('Main.Title'));
  ActionButton.SetHint(eTranslate.Translate('Main.Title'));
end;

end.
