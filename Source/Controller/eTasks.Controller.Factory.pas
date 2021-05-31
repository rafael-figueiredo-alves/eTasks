unit eTasks.Controller.Factory;

interface

uses
  eTasks.Controller.Interfaces;

Type
  TControllerFactory = Class(TInterfacedObject, iControllerFactory)
    Private
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iControllerFactory;
     Function Usuario : iControllerUsuario;
     Function Login   : iControllerLogin;
     Function Tarefas : iControllerTarefas;
     Function Categorias : iControllerCategorias;
     Function Metas      : iControllerMetas;
     Function ItemLista  : iControllerItemLista;
  End;

implementation

uses
  eTasks.Controller.Login,
  eTasks.Controller.Tarefas,
  eTasks.Controller.Usuario,
  eTasks.Controller.Categorias,
  eTasks.Controller.Listas,
  eTasks.Controller.Metas;

{ TControllerFactory }

function TControllerFactory.Categorias: iControllerCategorias;
begin
  Result := tControllerCategorias.new;
end;

constructor TControllerFactory.Create;
begin

end;

destructor TControllerFactory.Destroy;
begin

  inherited;
end;

function TControllerFactory.ItemLista: iControllerItemLista;
begin
  Result := tcontrollerItemLista.new;
end;

function TControllerFactory.Login: iControllerLogin;
begin
  Result := tControllerLogin.New;
end;

function TControllerFactory.Metas: iControllerMetas;
begin
  Result := tcontrollerMetas.new;
end;

class function TControllerFactory.New: iControllerFactory;
begin
  Result := Self.Create;
end;

function TControllerFactory.Tarefas: iControllerTarefas;
begin
  Result := TControllerTarefas.New;
end;

function TControllerFactory.Usuario: iControllerUsuario;
begin
  Result := tcontrollerUsuario.New;
end;

end.
