unit eTasks.Controller.Usuario;

interface

Uses eTasks.Controller.Interfaces;

Type
  TControllerUsuario = Class(TInterfacedObject, iControllerUsuario)
    Private
     FuID   : String;
     FToken : string;
     FNome  : String;
     FEmail : String;
     FFoto  : string;
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iControllerUsuario;
     Function Nome  : String; overload;
     Function Email : string; overload;
     Function Foto  : string; overload;
     Function Nome (Value : String) : iControllerUsuario; overload;
     Function Email (Value : String) : iControllerUsuario; overload;
     Function Foto (Value : String) : iControllerUsuario; overload;
     Function Ler : iControllerUsuario;
     function Salvar : iControllerUsuario;
  End;

implementation

uses
  eTasks.Model.Interfaces, eTasks.Model.Usuarios, eTasks.Model.LoggedUser;

{ TControllerUsuario }

constructor TControllerUsuario.Create;
begin
  FuID := TModelLoggeduser.New.uID;
  FToken := TModelLoggedUser.New.Token;
end;

destructor TControllerUsuario.Destroy;
begin

  inherited;
end;

function TControllerUsuario.Email: string;
begin
  Result := FEmail;
end;

function TControllerUsuario.Email(Value: String): iControllerUsuario;
begin
  Result := Self;
  FEmail := Value;
end;

function TControllerUsuario.Foto: string;
begin
  Result := FFoto;
end;

function TControllerUsuario.Foto(Value: String): iControllerUsuario;
begin
  Result := Self;
  FFoto := Value;
end;

function TControllerUsuario.Ler: iControllerUsuario;
Var
 AModelUsuario : iModelUsuario;
 Error : string;
begin
  Result := Self;
  AModelUsuario := tModelUsuarios.New.uID(FuID).Ler(FToken, error);
  FNome  := AModelUsuario.Nome;
  FEmail := AModelUsuario.Email;
  FFoto  := AModelUsuario.Foto;
end;

class function TControllerUsuario.New: iControllerUsuario;
begin
  Result := Self.Create;
end;

function TControllerUsuario.Nome(Value: String): iControllerUsuario;
begin
  Result := Self;
  FNome := Value;
end;

function TControllerUsuario.Nome: String;
begin
  Result := FNome;
end;

function TControllerUsuario.Salvar: iControllerUsuario;
Var
 Error : String;
begin
  Result := Self;
  TModelUsuarios.New
                  .uID(FuID)
                  .Nome(FNome)
                  .Email(FEmail)
                  .Foto(FFoto)
                  .Gravar(FToken, error);
end;

end.
