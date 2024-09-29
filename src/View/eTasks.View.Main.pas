unit eTasks.View.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  eTasks.Components.AppBar, eTasks.Components.TitleBar;

type
  TfMain = class(TForm)
    Button1: TButton;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    AppBar   : iAppBar;
    AppBar2  : iAppBar;
    TitleBar : iTitleBar;
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.fmx}

procedure TfMain.Button1Click(Sender: TObject);
begin
  TitleBar.ChangeTitle('Meu Teste');
  AppBar.ChangeTitle('Outro teste');
  Self.Fill.Color := $ff212529;
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  AppBar   := tAppBar.New(fMain);
  AppBar2  := tAppBar.New(fMain);
  TitleBar := TTitleBar.New(fMain);
  AppBar.ThemeChangerClick(Button1Click);
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
     TitleBar.Layout.Visible := true;
   end
  else
   begin
     AppBar.ShowTitleBar(True);
     TitleBar.Layout.Visible := false;
   end;
end;

end.
