unit eTasks.View.SplashScreen;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfSplashScreen = class(TForm)
    imgSplashScreen: TImage;
    TimerSplash: TTimer;
    procedure TimerSplashTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSplashScreen: TfSplashScreen;

implementation

uses
  eTasks.View.Main;

{$R *.fmx}

procedure TfSplashScreen.FormShow(Sender: TObject);
begin
  TimerSplash.Enabled := true;
end;

procedure TfSplashScreen.TimerSplashTimer(Sender: TObject);
begin
  if(not Assigned(fMain))then
   Application.CreateForm(tfmain, fMain);
  fMain.Show;
  Application.MainForm := fMain;
  self.Close;
end;

end.
