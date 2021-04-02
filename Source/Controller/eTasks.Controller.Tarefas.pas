unit eTasks.Controller.Tarefas;

interface

uses
  eTasks.Controller.Interfaces,
  FMX.ListView,
  System.Generics.Collections,
  System.JSON;

Type
  TControllerTarefas = Class(TInterfacedObject, iControllerTarefas)
    Private
     FuID       : string;
     FToken     : string;
     Fid        : string;
     FTarefa    : string;
     Fdescricao : string;
     Fdata      : string;
     Fstatus    : string;
     Fcategoria : string;
     Fcat_id    : string;
     FCat_icon  : string;
     FListagemTarefas : TDictionary<string, tTarefa>;
     Function MontaJSONTarefa : tjsonvalue;
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iControllerTarefas;
     function ListarTarefas(out erro: string): iControllerTarefas;
     Function NovaTarefa(out erro : string) : icontrollerTarefas;
     Function EditarTarefa(out erro : string) : iControllerTarefas;
     Function DeletarTarefa(out erro : string) : iControllerTarefas;
     Function ExibeTarefa(out erro : string) : iControllerTarefas;
     Function MudaStatus(out Erro : string) : iControllerTarefas;
     Function id(value : string) : iControllerTarefas; overload;
     Function id : string; overload;
     Function tarefa(value : string) : iControllerTarefas; overload;
     Function tarefa : string; overload;
     Function descricao(value : string) : iControllerTarefas; overload;
     Function descricao : string; overload;
     Function data(value : string) : iControllerTarefas; overload;
     Function data : string; overload;
     function Status(Value : string) : iControllerTarefas; overload;
     Function status : string; overload;
     Function categoria(value : string) : iControllerTarefas; overload;
     Function categoria : string; overload;
     Function Cat_icon(value : string) : iControllerTarefas; overload;
     Function cat_icon : string; overload;
     function cat_id(value : string) : iControllerTarefas; overload;
     Function cat_id : string; overload;
     Function ListagemdeTarefas : TDictionary<string,TTarefa>;
  End;

implementation

uses
  eTasks.Model.Factory,
  System.SysUtils;

{ TControllerTarefas }

function TControllerTarefas.categoria(value: string): iControllerTarefas;
begin
  Result := self;
  Fcategoria := value;
end;

function TControllerTarefas.categoria: string;
begin
  Result := Fcategoria;
end;

function TControllerTarefas.Cat_icon: string;
begin
  Result := FCat_icon;
end;

function TControllerTarefas.Cat_icon(value: string): iControllerTarefas;
begin
  Result := self;
  FCat_icon := value;
end;

function TControllerTarefas.cat_id: string;
begin
  Result := Fcat_id;
end;

function TControllerTarefas.cat_id(value: string): iControllerTarefas;
begin
  Result := self;
  FCat_id := value;
end;

constructor TControllerTarefas.Create;
begin
  FuID := TModelFactory.New.LoggedUser.uID;
  FToken := TModelFactory.New.LoggedUser.Token;
end;

function TControllerTarefas.data: string;
begin
  Result := Fdata;
end;

function TControllerTarefas.data(value: string): iControllerTarefas;
begin
  Result := self;
  Fdata  := value;
end;

function TControllerTarefas.DeletarTarefa(out erro: string): iControllerTarefas;
var
  Error : string;
begin
  Result := self;
  TModelFactory.New.Tarefas(FuID, FToken).ExcluirTarefa(Fid, error);
  erro := Error;
end;

function TControllerTarefas.descricao: string;
begin
  Result := Fdescricao;
end;

function TControllerTarefas.descricao(value: string): iControllerTarefas;
begin
  Result := self;
  Fdescricao := value;
end;

destructor TControllerTarefas.Destroy;
begin
  if Assigned(FListagemTarefas) then
   FListagemTarefas.DisposeOf;
  inherited;
end;

function TControllerTarefas.EditarTarefa(out erro: string): iControllerTarefas;
Var
  Error : string;
begin
  Result := self;
  TModelFactory.New.Tarefas(FuID, FToken).EditarTarefa(MontaJSONTarefa, Fid, error);
  erro := Error;
end;

function TControllerTarefas.ExibeTarefa(out erro: string): iControllerTarefas;
var
  json  : string;
  error : string;
  JsonTarefa: TJSONObject;
  jsonCategoria: TJSONObject;
begin
  Result := self;
  json := TModelFactory.New.Tarefas(FuID, FToken).ExibeTarefa(Fid, error);
  JsonTarefa := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Json), 0) as tJsonObject;
  if Error = '' then
   begin
     if JsonTarefa <> nil then
      begin
        Ftarefa       := JsonTarefa.GetValue('tarefa').Value;
        Fdescricao    := JsonTarefa.GetValue('descricao').Value;
        Fstatus       := JsonTarefa.GetValue('status').Value;
        Fdata         := JsonTarefa.GetValue('data').Value;
        jsonCategoria := JsonTarefa.GetValue('categoria') as TJSONObject;
        FCat_icon     := jsonCategoria.GetValue('cat_icon').Value;
        Fcategoria    := jsonCategoria.GetValue('categoria').Value;
        FCat_id       := jsonCategoria.GetValue('cat_id').Value;
      end;
   end;
   erro := error;
   JsonTarefa.DisposeOf;
end;

function TControllerTarefas.id: string;
begin
  Fid := Fid;
end;

function TControllerTarefas.id(value: string): iControllerTarefas;
begin
  Result := self;
  Fid := value;
end;

function TControllerTarefas.ListagemdeTarefas: TDictionary<string, TTarefa>;
begin
  Result := FListagemTarefas;
end;

function TControllerTarefas.ListarTarefas(out erro: string): iControllerTarefas;
var
  Json          : string;
  ListaJson     : tjsonobject;
  JsonValores   : TJSONObject;
  jsonCategoria : TJSONObject;
  Error         : string;
  tasks         : integer;
  Tarefa        : tTarefa;
begin
  Result := self;
  FListagemTarefas := TDictionary<string,TTarefa>.create;
  Json := tmodelFactory.New.Tarefas(FuID, FToken).ListarTarefas(Fdata, error);
  ListaJson := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Json), 0) as tJsonObject;
  if Error = '' then
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
           FListagemTarefas.Add(tarefa.id, tarefa);
         end;
      end;
   end;
  erro := Error;
  ListaJson.DisposeOf;
end;

function TControllerTarefas.MontaJSONTarefa: tjsonvalue;
var
 JsonString : string;
begin
  JsonString := '{' +
                  '"tarefa" : "' + FTarefa + '" ,' +
                  '"descricao" : "' + Fdescricao + '" ,' +
                  '"data" : "'      + Fdata + '" ,' +
                  '"status" : "' + Fstatus + '" ,' +
                  '"categoria" : {' +
                                  '"categoria" : "' + Fcategoria + '" ,'+
                                  '"cat_icon" : "' + FCat_icon + '" ,'+
                                  '"cat_id" : "' + Fcat_id + '"}'+
                '}';
  Result := TJSONObject.ParseJSONValue(JsonString);
end;

function TControllerTarefas.MudaStatus(out Erro: string): iControllerTarefas;
Var
  error : String;
begin
  Result := self;
  TModelFactory.New.Tarefas(FuID, FToken).MudarStatusTarefa(Fid, Fstatus, error);
  Erro := error;
end;

class function TControllerTarefas.New: iControllerTarefas;
begin
  Result := Self.Create;
end;

function TControllerTarefas.NovaTarefa(out erro: string): icontrollerTarefas;
var
  error : string;
begin
  Result := self;
  TModelFactory.New.Tarefas(FuID, FToken).CriarTarefa(MontaJSONTarefa, error);
  Erro := error;
end;

function TControllerTarefas.Status: string;
begin
  Result := Fstatus;
end;

function TControllerTarefas.Status(Value: string): iControllerTarefas;
begin
  Result := self;
  Fstatus := value;
end;

function TControllerTarefas.tarefa(value: string): iControllerTarefas;
begin
  Result := self;
  FTarefa := value;
end;

function TControllerTarefas.tarefa: string;
begin
  Result := FTarefa;
end;

end.
