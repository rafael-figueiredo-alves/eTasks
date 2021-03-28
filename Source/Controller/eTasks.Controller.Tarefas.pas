unit eTasks.Controller.Tarefas;

interface

uses
  eTasks.Controller.Interfaces, FMX.ListView, System.Generics.Collections;

Type
  TControllerTarefas = Class(TInterfacedObject, iControllerTarefas)
    Private
     FuID   : string;
     FToken : string;
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iControllerTarefas;
     Function ListarTarefas(data: string; out erro : string) : tdictionary<string, TTarefaLista>;
     Function NovaTarefa(Tarefa: TTarefa; out erro : string) : icontrollerTarefas;
     Function EditarTarefa(Tarefa: TTarefa; id: string; out erro : string) : iControllerTarefas;
     Function DeletarTarefa(id : string; out erro : string) : iControllerTarefas;
     Function ExibeTarefa(id : string; out erro : string) : iControllerTarefas;
     Function MudaStatus(id, status : string; out Erro : string) : iControllerTarefas;
  End;

implementation

uses
  eTasks.Model.LoggedUser;

{ TControllerTarefas }

constructor TControllerTarefas.Create;
begin
  FuID := TModelLoggeduser.New.uID;
  FToken := TModelLoggedUser.New.Token;
end;

function TControllerTarefas.DeletarTarefa(id: string;
  out erro: string): iControllerTarefas;
begin
  Result := self;
end;

destructor TControllerTarefas.Destroy;
begin

  inherited;
end;

function TControllerTarefas.EditarTarefa(Tarefa: TTarefa; id: string;
  out erro: string): iControllerTarefas;
begin
  Result := self;
end;

function TControllerTarefas.ExibeTarefa(id: string;
  out erro: string): iControllerTarefas;
begin
  Result := self;
end;

function TControllerTarefas.ListarTarefas(data: string;
  out erro: string): tdictionary<string, TTarefaLista>;
begin

end;

function TControllerTarefas.MudaStatus(id, status: string;
  out Erro: string): iControllerTarefas;
begin
  Result := self;
end;

class function TControllerTarefas.New: iControllerTarefas;
begin
  Result := Self.Create;
end;

function TControllerTarefas.NovaTarefa(Tarefa: TTarefa;
  out erro: string): icontrollerTarefas;
begin
  Result := self;
end;

end.
