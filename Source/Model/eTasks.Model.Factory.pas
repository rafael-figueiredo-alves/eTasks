unit eTasks.Model.Factory;

interface

uses
  eTasks.Model.Interfaces;

Type
  TModelFactory = Class(TInterfacedObject, iModelFactory)
    Private
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iModelFactory;
     Function LoggedUser : iModelLoggedUser;
     Function Auth       : iModelAuth;
     Function Usuario    : iModelUsuario;
  End;

implementation

uses
  eTasks.Model.Auth, eTasks.Model.LoggedUser;

{ TModelFactory }

function TModelFactory.Auth: iModelAuth;
begin
  Result := tModelAuth.New;
end;

constructor TModelFactory.Create;
begin

end;

destructor TModelFactory.Destroy;
begin

  inherited;
end;

function TModelFactory.LoggedUser: iModelLoggedUser;
begin
  Result := TModelloggeduser.New;
end;

class function TModelFactory.New: iModelFactory;
begin
  Result := Self.Create;
end;

function TModelFactory.Usuario: iModelUsuario;
begin

end;

end.
