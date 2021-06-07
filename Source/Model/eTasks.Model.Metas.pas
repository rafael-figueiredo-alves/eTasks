unit eTasks.Model.Metas;

interface

uses
  eTasks.Model.Interfaces,
  System.JSON;

Type
  TModelMetas = Class(TInterfacedObject, iModelMetas)
    Private
     FuID   : string;
     FToken : string;
    Public
     Constructor Create(uID,Token: string);
     Destructor Destroy; Override;
     Class function New(uID,Token: string): iModelMetas;
     Function CriarMeta (Meta: tJSONValue; out erro : string) : iModelMetas;
     Function EditarMeta (Meta: TJSONValue; id : string; out erro : string) : iModelMetas;
     Function ExcluirMeta (id : string; out erro : string) : iModelMetas;
     Function MudarStatusMeta (id, status : string; out erro : string) : iModelMetas;
     Function ExibeMeta (id : string; out erro : string) : string;
     Function ListarMetas (Prioridade: string; out erro : string) : String;
  End;

  Const
    BaseUrl = 'https://etasks-d6988.firebaseio.com/etasks/v1/goals/';

implementation

{ TModelMetas }

Uses
   Firebase.interfaces,
   Firebase.request,
   Firebase.response,
   Firebase.Database,
   System.json.writers,
   eTasks.Model.Consts,
   System.SysUtils, System.Generics.Collections;

constructor TModelMetas.Create(uID,Token: string);
begin
  FuID   := uID;
  FToken := Token;
end;

function TModelMetas.CriarMeta(Meta: tJSONValue; out erro: string): iModelMetas;
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
  AResponse := ADataBase.post([FuID+'.json'], Meta);
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

destructor TModelMetas.Destroy;
begin

  inherited;
end;

function TModelMetas.EditarMeta(Meta: TJSONValue; id: string;
  out erro: string): iModelMetas;
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
  AResponse := ADataBase.Patch([FuID+'/' + id + '.json'], Meta);
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

function TModelMetas.ExcluirMeta(id: string; out erro: string): iModelMetas;
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

function TModelMetas.ExibeMeta(id: string; out erro: string): string;
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

function TModelMetas.ListarMetas(Prioridade: string; out erro: string): String;
Var
  ADataBase : IFirebaseDatabase;
  AResponse : iFirebaseResponse;
  Resposta  : TJSONValue;
  Query     : tdictionary<string, string>;
begin
  ADatabase := tfirebaseDatabase.Create;
  ADataBase.SetBaseURI(BaseUrl);
  ADataBase.SetToken(FToken);
  if prioridade <> '' then
   begin
    Query := TDictionary<string, string>.create;
    query.Add('orderBy', '"prioridade"');
    query.Add('equalTo', '"'+prioridade+'"');
    Query.TrimExcess;
    AResponse := ADataBase.get([FuID+'.json'], query);
    query.DisposeOf;
   end
  else
   AResponse := ADataBase.get([FuID+'.json']);
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

   Result := resposta.ToString;

   if Assigned(resposta) then
     Resposta.DisposeOf;
end;

function TModelMetas.MudarStatusMeta(id, status: string;
  out erro: string): iModelMetas;
var
  ADataBase : IFirebaseDatabase;
  AResponse : iFirebaseResponse;
  Resposta  : TJSONValue;
  MetaStatus : TJsonValue;
  JsonTarefaStatus : string;
begin
  Result := self;
  ADatabase := tfirebaseDatabase.Create;
  ADataBase.SetBaseURI(BaseUrl);
  ADataBase.SetToken(FToken);
  JsonTarefaStatus := '{"status":"' + status + '"}';
  MetaStatus := TJSONObject.ParseJSONValue(JsonTarefaStatus);
  AResponse := ADataBase.Patch([FuID+'/' + id +'.json'], MetaStatus);
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

class function TModelMetas.New(uID,Token: string): iModelMetas;
begin
  Result := Self.Create(uID, Token);
end;

end.
