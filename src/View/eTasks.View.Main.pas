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
    MultiView1: TMultiView;
    MainLayout: TLayout;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    AppBar   : iAppBar;
    TitleBar : iTitleBar;
    fDarkMode : Boolean;
    procedure SetTheme(sender : TObject);
    procedure OpenMenu(sender: TObject);
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

uses
  eTasks.Components.ColorPallete,
  eTasks.Components.Builder;

{$R *.fmx}

procedure TfMain.FormCreate(Sender: TObject);
begin
  fDarkMode := False;
  AppBar := TComponentBars.AppBar(fMain, MainLayout).isDarkMode(fDarkMode);
  TitleBar := TComponentBars.TitleBar(fMain, MainLayout);
  AppBar.SetButtonAppBarAction(ThemeBtn, SetTheme);
  AppBar.SetButtonAppBarAction(MenuBtn, OpenMenu);
end;

procedure TfMain.FormResize(Sender: TObject);
begin
  if(fMain.Width < 360)then
   fMain.Width := 360;

  if(fmain.Height < 640)then
   fMain.Height := 640;

  if(fMain.Width <= 768)then
   begin
     AppBar.ShowTitleBar(false);
     TitleBar.Render.Visible := true;
   end
  else
   begin
     AppBar.ShowTitleBar(True);
     TitleBar.Render.Visible := false;
   end;
end;

procedure TfMain.OpenMenu(sender: TObject);
begin
  MultiView1.ShowMaster;
end;

procedure TfMain.SetTheme(sender: TObject);
begin
  fDarkMode := not fDarkMode;
  AppBar.isDarkMode(fDarkMode);
  TitleBar.isDarkMode(fDarkMode);
  Self.Fill.Color := TColorPallete.GetColor(Background, fDarkMode);
end;

end.
