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
  End;

implementation

uses
  eTasks.Model.Interfaces, eTasks.Model.Factory;

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
   Erro := -1;
end;

destructor TControllerLogin.Destroy;
begin

  inherited;
end;

function TControllerLogin.Email(Value: String): iControllerLogin;
begin
   Result := Self;
   FEmail := Value;
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
