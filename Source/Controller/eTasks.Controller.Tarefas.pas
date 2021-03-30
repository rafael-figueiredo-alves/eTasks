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
     function ListarTarefas(Listagem : TDictionary<string,tTarefaLista>;data: string; out erro: string): iControllerTarefas;
     Function NovaTarefa(Tarefa: TTarefa; out erro : string) : icontrollerTarefas;
     Function EditarTarefa(Tarefa: TTarefa; id: string; out erro : string) : iControllerTarefas;
     Function DeletarTarefa(id : string; out erro : string) : iControllerTarefas;
     Function ExibeTarefa(id : string; out erro : string) : iControllerTarefas;
     Function MudaStatus(id, status : string; out Erro : string) : iControllerTarefas;
  End;

implementation

uses
  eTasks.Model.LoggedUser, System.JSON, eTasks.Model.Factory, System.SysUtils;

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

function TControllerTarefas.ListarTarefas(Listagem : TDictionary<string,tTarefaLista>;data: string;
  out erro: string): iControllerTarefas;
var
  Json          : string;
  ListaJson     : tjsonobject;
  JsonValores   : TJSONObject;
  jsonCategoria : TJSONObject;
  Error         : string;
  tasks         : integer;
  Tarefa        : tTarefaLista;
begin
  Result := self;
  Json := tmodelFactory.New.Tarefas(FuID, FToken).ListarTarefas(data, error);
  ListaJson := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(Json), 0) as tJsonObject;
  if Error <> '' then
   begin
     if ListaJson <> nil then
      begin
        for tasks := 0 to ListaJson.Count-1 do
         begin
           JsonValores :=  ListaJson.Pairs[tasks].JsonValue as TJSONObject;
           Tarefa.id := ListaJson.Pairs[tasks].JsonString.Value;
           Tarefa.tarefa    := JsonValores.GetValue('tarefa').Value;
           Tarefa.descricao := JsonValores.GetValue('descricao').Value;
           Tarefa.status    := JsonValores.GetValue('status').Value;
           jsonCategoria := JsonValores.GetValue('categoria') as TJSONObject;
           Tarefa.Cat_icon := jsonCategoria.GetValue('cat_icon').Value;
           Listagem.Add(tarefa.id, tarefa);
         end;
      end;
   end;
  erro := Error;
  ListaJson.DisposeOf;
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
