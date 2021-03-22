unit eTasks.Controller.Tarefas;

interface

uses
  eTasks.Controller.Interfaces, FMX.ListView;

Type
  TControllerTarefas = Class(TInterfacedObject, iControllerTarefas)
    Private
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iControllerTarefas;
     Function ListarTarefas(Lista: tlistview; data: string; out erro : string) : iControllerTarefas;
  End;

implementation

{ TControllerTarefas }

constructor TControllerTarefas.Create;
begin

end;

destructor TControllerTarefas.Destroy;
begin

  inherited;
end;

function TControllerTarefas.ListarTarefas(Lista: tlistview; data: string;
  out erro: string): iControllerTarefas;
begin
  Result := self;
end;

class function TControllerTarefas.New: iControllerTarefas;
begin
  Result := Self.Create;
end;

end.
