unit eTasks.Model.Tarefas;

interface

uses
  eTasks.Model.Interfaces,
  System.JSON;

Type
  TModelTarefas = Class(TInterfacedObject, iModelTarefas)
    Private
     FuID   : string;
     FToken : string;
    Public
     Constructor Create(uID,Token: string);
     Destructor Destroy; Override;
     Class function New(uID,Token: string): iModelTarefas;
     Function CriarTarefa (Tarefa: tJSONValue; out erro : string) : iModelTarefas;
     Function EditarTarefa (Tarefa: TJSONValue; id : string; out erro : string) : iModelTarefas;
     Function ExcluirTarefa (id : string; out erro : string) : iModelTarefas;
     Function MudarStatusTarefa (id, status : string; out erro : string) : iModelTarefas;
     Function ExibeTarefa (id : string; out erro : string) : string;
     Function ListarTarefas (data : string; out erro : string) : string;
  End;

  Const
    BaseUrl = 'https://etasks-d6988.firebaseio.com/etasks/v1/tasks/';

implementation

{ TModelTarefas }

Uses
   Firebase.interfaces,
   Firebase.request,
   Firebase.response,
   Firebase.Database,
   System.json.writers,
   eTasks.Model.Consts,
   System.Generics.Collections,
   System.SysUtils;

constructor TModelTarefas.Create(uID,Token: string);
begin
  FuID   := uID;
  FToken := Token;
end;

function TModelTarefas.CriarTarefa(Tarefa: tJSONValue;
  out erro: string): iModelTarefas;
var
  ADataBase : IFirebaseDatabase;
  AResponse : iFirebaseResponse;
  Resposta  : TJSONValue;
  PegaErro  : TJSONValue;
begin
  Result := self;
  ADatabase := tfirebaseDatabase.Create;
  ADataBase.SetBaseURI(BaseUrl);
  ADataBase.SetToken(FToken);
  AResponse := ADataBase.post([FuID+'.json'], Tarefa);
  Resposta := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
  if (not Assigned(Resposta)) or (not (Resposta is TJSONObject)) then
   begin
     if Assigned(Resposta) then
      Resposta.DisposeOf;
     exit
   end;

   if Resposta.TryGetValue('Error', pegaErro) then
    erro := 'Erro'
   else
    erro := '';

   if Assigned(resposta) then
    Resposta.DisposeOf;
end;

destructor TModelTarefas.Destroy;
begin

  inherited;
end;

function TModelTarefas.EditarTarefa(Tarefa: TJSONValue; id: string;
  out erro: string): iModelTarefas;
var
  ADataBase : IFirebaseDatabase;
  AResponse : iFirebaseResponse;
  Resposta  : TJSONValue;
  pegaErro: TJSONValue;
begin
  Result := self;
  ADatabase := tfirebaseDatabase.Create;
  ADataBase.SetBaseURI(BaseUrl);
  ADataBase.SetToken(FToken);
  AResponse := ADataBase.Patch([FuID+'/' + id + '.json'], Tarefa);
  Resposta := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
  if (not Assigned(Resposta)) or (not (Resposta is TJSONObject)) then
   begin
     if Assigned(Resposta) then
      Resposta.DisposeOf;
     exit
   end;

   if Resposta.TryGetValue('Error', pegaErro) then
    erro := 'Erro'
   else
    erro := '';

   if Assigned(resposta) then
    Resposta.DisposeOf;
end;

function TModelTarefas.ExcluirTarefa(id: string;
  out erro: string): iModelTarefas;
Var
  ADataBase : IFirebaseDatabase;
  AResponse : iFirebaseResponse;
  Resposta  : TJSONValue;
  pegaErro: TJSONValue;
begin
  Result := self;
  ADatabase := tfirebaseDatabase.Create;
  ADataBase.SetBaseURI(BaseUrl);
  ADataBase.SetToken(FToken);
  AResponse := ADataBase.Delete([FuID+'/' + id + '.json']);
  Resposta := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
  if (not Assigned(Resposta)) or (not (Resposta is TJSONObject)) then
   begin
     if Assigned(Resposta) then
      Resposta.DisposeOf;
     exit
   end;

   if Resposta.TryGetValue('Error', pegaErro) then
    erro := 'Erro'
   else
    erro := '';

   if Assigned(resposta) then
    Resposta.DisposeOf;
end;

function TModelTarefas.ExibeTarefa(id: string; out erro: string): string;
var
  ADataBase : IFirebaseDatabase;
  AResponse : iFirebaseResponse;
  Resposta  : TJSONValue;
begin
  ADatabase := tfirebaseDatabase.Create;
  ADataBase.SetBaseURI(BaseUrl);
  ADataBase.SetToken(FToken);
  AResponse := ADataBase.get([FuID+'/'+id+'.json']);
  Resposta := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(AResponse.ContentAsString),0);
  if (not Assigned(Resposta)) or (not (Resposta is TJSONObject)) then
   begin
     if Assigned(Resposta) then
      Resposta.DisposeOf;
     erro := 'Erro_001';
     Result := '';
     exit
   end;

   Result := resposta.ToString;

   if Assigned(resposta) then
     Resposta.DisposeOf;
end;

function TModelTarefas.ListarTarefas(data: string;
  out erro: string): string;
Var
  ADataBase : IFirebaseDatabase;
  AResponse : iFirebaseResponse;
  Resposta  : TJSONValue;
  Query     : tdictionary<string, string>;
  pegaErro: TJSONValue;
begin
  ADatabase := tfirebaseDatabase.Create;
  ADataBase.SetBaseURI(BaseUrl);
  ADataBase.SetToken(FToken);
  Query := TDictionary<string, string>.create;
  query.Add('orderBy', '"data"');
  query.Add('equalTo', '"'+data+'"');
  Query.TrimExcess;
  AResponse := ADataBase.get([FuID+'.json'], query);
  query.DisposeOf;
  Resposta := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(AResponse.ContentAsString),0);
  if (not Assigned(Resposta)) or (not (Resposta is TJSONObject)) then
   begin
     if Assigned(Resposta) then
      Resposta.DisposeOf;
     if Resposta.Null then
      erro := 'vazio'
     else
      erro := 'Erro_001';
     Result := '';
     exit
   end;

   if Resposta.TryGetValue('Error', pegaErro) then
    erro := 'Erro'
   else
    erro := '';

   Result := resposta.ToString;

   if Assigned(resposta) then
     Resposta.DisposeOf;
end;

function TModelTarefas.MudarStatusTarefa(id, status: string;
  out erro: string): iModelTarefas;
var
  ADataBase : IFirebaseDatabase;
  AResponse : iFirebaseResponse;
  Resposta  : TJSONValue;
  TarefaStatus : TJsonValue;
  JsonTarefaStatus : string;
begin
  Result := self;
  ADatabase := tfirebaseDatabase.Create;
  ADataBase.SetBaseURI(BaseUrl);
  ADataBase.SetToken(FToken);
  JsonTarefaStatus := '{"status":"' + status + '"}';
  TarefaStatus := TJSONObject.ParseJSONValue(JsonTarefaStatus);
  AResponse := ADataBase.Patch([FuID+'/' + id +'.json'], TarefaStatus);
  Resposta := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
  if (not Assigned(Resposta)) or (not (Resposta is TJSONObject)) then
   begin
     if Assigned(Resposta) then
      Resposta.DisposeOf;
     exit
   end;

   if (Resposta.ToString <> JsonTarefaStatus) then
    erro := 'Erro'
   else
    erro := '';

   if Assigned(resposta) then
    Resposta.DisposeOf;
end;

class function TModelTarefas.New(uID,Token: string): iModelTarefas;
begin
  Result := Self.Create(uID, Token);
end;

end.
