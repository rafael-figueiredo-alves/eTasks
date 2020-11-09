unit eTasks.View.Android.main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm_Android_main = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Android_main: TForm_Android_main;

implementation

{$R *.fmx}

Uses
  eTasks.libraries.Android, eTasks.Controller.Login, eTasks.View.Android.login;

procedure TForm_Android_main.Button1Click(Sender: TObject);
begin
  if tControllerLogin.New.EfetuarLogout = true then
   begin
      if not Assigned(Form_Android_login) then
       Application.CreateForm(TForm_Android_login, Form_Android_login);
      Application.MainForm := Form_Android_login;
      Form_Android_login.Show;
      Close;
   end;
end;

procedure TForm_Android_main.FormCreate(Sender: TObject);
begin
  tLibraryAndroid.TransparentNavBar;
end;

end.
