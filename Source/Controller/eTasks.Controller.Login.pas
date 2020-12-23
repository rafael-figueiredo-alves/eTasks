unit eTasks.Controller.Login;

interface

uses
  eTasks.Controller.Interfaces, eTasks.View.Dialogs.Messages.Consts;

Type
  TControllerLogin = Class(TInterfacedObject, iControllerLogin)
    Private
     FNome     : string;
     FPassword : string;
     FEmail    : string;
     FFoto     : string;
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iControllerLogin;
     Function Nome (Value : string) : iControllerLogin;
     Function Password (Value : string) : iControllerLogin;
     Function Email (Value : String) : iControllerLogin;
     Function Foto (value : string) : iControllerLogin;
     Function CriarConta (out Erro : integer) : iControllerLogin;
     Function EfetuarLogin (Out Erro : integer) : iControllerLogin;
     Function EfetuarLogout : Boolean;
     Function EsqueciConta (out erro : integer) : boolean;
  End;

implementation

uses
  eTasks.Model.Interfaces, eTasks.Model.Factory, System.SysUtils;

{ TControllerLogin }

constructor TControllerLogin.Create;
begin

end;

function TControllerLogin.CriarConta(out Erro: integer): iControllerLogin;
Var
 auth_credentials : TAuthUser;
 error : string;
begin
  Result := self;
  Erro := -1;
  auth_credentials := TModelFactory.New.Auth
                                        .Email(FEmail)
                                        .Password(FPassword)
                                        .CriarConta(error);

  if (error <> '') then
   begin
     if error = 'Email existe' then
      Erro := integer(tpmErro_criar_conta);
     if error = 'Email invalido' then
      Erro := integer(tpmInvalido_criar_email);
     if error = 'Senha fraca' then
      erro := integer(tpmInvalido_criar_senha);
   end
  else
   begin
    TModelFactory.New.LoggedUser
                       .Email(FEmail)
                       .Password(FPassword)
                       .Token(auth_credentials.idToken)
                       .RefreshToken(auth_credentials.RefreshToken)
                       .uID(auth_credentials.uID)
                       .Logged(DateTimeToStr(now))
                       .Conectar;
    TModelFactory.New.Usuario
                       .uID(auth_credentials.uID)
                       .Foto(FFoto)
                       .Email(FEmail)
                       .Nome(FNome)
                       .Gravar(auth_credentials.idToken, error);
    Erro := -1;
   end;
end;

destructor TControllerLogin.Destroy;
begin

  inherited;
end;

function TControllerLogin.EfetuarLogin(out Erro: integer): iControllerLogin;
Var
 auth_credentials : TAuthUser;
 error : string;
 Erro1  : string;
begin
  Result := self;
  Erro := -1;
  auth_credentials := TModelFactory.New.Auth
                                        .Email(FEmail)
                                        .Password(FPassword)
                                        .EfetuarLogin(error);

  if (error <> '') then
   begin
     if error = 'Email não existe' then
      Erro := integer(tpmErro_login_Email);
     if error = 'Senha invalida' then
      Erro := integer(tpmErro_login_senha);
     if error = 'Usuário desativado' then
      erro := integer(tpmUsuario_desativado_login);
   end
  else
   begin

    TModelFactory.New.LoggedUser
                       .Email(FEmail)
                       .Password(FPassword)
                       .Token(auth_credentials.idToken)
                       .RefreshToken(auth_credentials.RefreshToken)
                       .uID(auth_credentials.uID)
                       .Logged(DateTimeToStr(now))
                       .Conectar;
    Erro := -1;
   end;
end;

function TControllerLogin.EfetuarLogout: Boolean;
begin
  Result := TModelFactory.New.LoggedUser.Logout;
end;

function TControllerLogin.Email(Value: String): iControllerLogin;
begin
   Result := Self;
   FEmail := Value;
end;

function TControllerLogin.EsqueciConta(out erro: integer): boolean;
Var
 error : string;
begin
  Erro := -1;
  Result := TModelFactory.New.Auth.Email(FEmail).EsqueciConta(error);

  if (error <> '') then
   begin
     if error = 'Email não existe' then
      Erro := integer(tpmErro_resetar_email);
   end;
end;

function TControllerLogin.Foto(value: string): iControllerLogin;
begin
  Result := Self;
  FFoto  := value;
end;

class function TControllerLogin.New: iControllerLogin;
begin
  Result := Self.Create;
end;

function TControllerLogin.Nome(Value: string): iControllerLogin;
begin
   Result := Self;
   FNome  := Value;
end;

function TControllerLogin.Password(Value: string): iControllerLogin;
begin
   Result    := Self;
   FPassword := Value;
end;

end.
