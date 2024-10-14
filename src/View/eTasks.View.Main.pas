unit eTasks.View.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  eTasks.Components.Interfaces, FMX.MultiView;

type
  TTeste = procedure of Object;

  TfMain = class(TForm)
    MainLayout: TLayout;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    AppBar   : iAppBar;
    TitleBar : iTitleBar;
    MainMenu : iOffcanvas;
    fDarkMode : Boolean;
    procedure SetTheme(sender : TObject);
    procedure TranslateUI;
    procedure SetLanguage(sender : TObject);
    procedure OpenMenu(sender : TObject);
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
  eTranslate4Pascal;

{$R *.fmx}

procedure TfMain.FormCreate(Sender: TObject);
begin
  fDarkMode := False;
  AppBar := TComponentBars.AppBar(fMain, MainLayout).isDarkMode(fDarkMode);
  TitleBar := TComponentBars.TitleBar(fMain, MainLayout);
  MainMenu := TComponentOffcanvas.MainMenu(fMain);
  AppBar.SetButtonAppBarAction(ThemeBtn, SetTheme);
  AppBar.SetButtonAppBarAction(MenuBtn, OpenMenu);
  TranslateUI;
end;

procedure TfMain.FormResize(Sender: TObject);
begin
  if(fMain.Width < MinimumWidth)then
   fMain.Width := MinimumWidth;

  if(fmain.Height < MinimumHeight)then
   fMain.Height := MinimumHeight;

  AppBar.ShowTitleBar(fMain.Width > MobileSizeWidth);
  TitleBar.Resize(fMain.Width);
end;

procedure TfMain.OpenMenu(sender: TObject);
begin
  MainMenu.OpenMenu;
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
  Self.Fill.Color := TColorPallete.GetColor(Background, fDarkMode);
end;

procedure TfMain.TranslateUI;
begin
  TitleBar.SetTitle(eTranslate.Translate('Main.Title'));
  AppBar.SetTitle(eTranslate.Translate('Main.Title'));
end;

end.
