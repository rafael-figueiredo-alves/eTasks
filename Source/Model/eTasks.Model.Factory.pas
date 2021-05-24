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
     Class function New                       : iModelFactory;
     Function LoggedUser                      : iModelLoggedUser;
     Function Auth                            : iModelAuth;
     Function Usuario                         : iModelUsuario;
     Function Tarefas(uID, Token : string)    : iModelTarefas;
     Function Categorias(uID, Token: string)  : iModelCategorias;
     Function Metas(uID, Token: string)       : iModelMetas;
     Function Listas(uID, Token: string)      : iModelListas;
  End;

implementation

uses
  eTasks.Model.Auth,
  eTasks.Model.LoggedUser,
  eTasks.Model.Usuarios,
  eTasks.Model.Tarefas,
  eTasks.Model.Categorias,
  eTasks.Model.Metas,
  eTasks.Model.Listas;

{ TModelFactory }

function TModelFactory.Auth: iModelAuth;
begin
  Result := tModelAuth.New;
end;

function TModelFactory.Categorias(uID, Token: string) : iModelCategorias;
begin
  Result := tModelCategorias.new(uID, Token);
end;

constructor TModelFactory.Create;
begin

end;

destructor TModelFactory.Destroy;
begin

  inherited;
end;

function TModelFactory.Listas(uID, Token: string): iModelListas;
begin
  Result := tModelListas.new(uID, Token);
end;

function TModelFactory.LoggedUser: iModelLoggedUser;
begin
  Result := TModelloggeduser.New;
end;

function TModelFactory.Metas(uID, Token: string): iModelMetas;
begin
  Result := tModelMetas.new(uID, Token);
end;

class function TModelFactory.New: iModelFactory;
begin
  Result := Self.Create;
end;

function TModelFactory.Tarefas(uID, Token : string): iModelTarefas;
begin
  Result := tModelTarefas.new(uID, Token);
end;

function TModelFactory.Usuario: iModelUsuario;
begin
  Result := tModelUsuarios.New;
end;

end.
