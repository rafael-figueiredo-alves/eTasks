unit eTasks.View.Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfLogin = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLogin: TfLogin;

implementation

uses
  eTasks.View.Main;

{$R *.fmx}

procedure TfLogin.Button1Click(Sender: TObject);
begin
  if(not Assigned(fMain))then
   Application.CreateForm(tfmain, fMain);
  fMain.Show;
  Application.MainForm := fMain;
  self.Visible := false;
end;

end.
