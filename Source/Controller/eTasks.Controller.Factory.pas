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
  End;

implementation

uses
  eTasks.Controller.Login,
  eTasks.Controller.Tarefas,
  eTasks.Controller.Usuario;

{ TControllerFactory }

constructor TControllerFactory.Create;
begin

end;

destructor TControllerFactory.Destroy;
begin

  inherited;
end;

function TControllerFactory.Login: iControllerLogin;
begin
  Result := tControllerLogin.New;
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
