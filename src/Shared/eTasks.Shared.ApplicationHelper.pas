unit eTasks.Shared.ApplicationHelper;

interface

uses
  FMX.Forms;

type
 TApplicationHelper = class helper for TApplication
   public
    procedure StartAppFromSplashScreen;
    procedure StartApp;
    function OpenMainForm(Form: TForm = nil): TForm;

    function OpenLoginForm(Form: TForm = nil): TForm;
 end;

// procedure OpenMainForm(var loginForm: TForm = nil);
// procedure OpenLoginForm(var mainForm: TForm = nil);

implementation

uses
  eTasks.View.Main, eTasks.View.Login;

{ TApplicationHelper }

function TApplicationHelper.OpenLoginForm(Form: TForm): TForm;
begin
  // Cria o LoginForm apenas uma vez
  if not Assigned(fLogin) then
    Application.CreateForm(tfLogin, fLogin);

  //Application.MainForm := fMain;

  // Exibe o formulário de login
  fLogin.Show;

  // Oculta o formulário principal (se informado)
  if Assigned(Form) then
    Form.Visible := false;

  Result := fLogin;
end;

function TApplicationHelper.OpenMainForm(Form: TForm): TForm;
begin
  // Cria o MainForm apenas uma vez
  if not Assigned(fMain) then
    Application.CreateForm(tfmain, fMain);

  // Define como MainForm apenas se ainda não houver
  Application.MainForm := fMain;

  // Exibe o formulário principal
  fMain.Show;

  // Oculta o formulário de login (se informado)
  if Assigned(Form) then
    Form.Visible := false;

  Result := fMain;
end;

procedure TApplicationHelper.StartApp;
begin

end;

procedure TApplicationHelper.StartAppFromSplashScreen;
begin

end;

end.
