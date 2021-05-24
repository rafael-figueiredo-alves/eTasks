unit eTasks.Model.Listas;

interface

uses
  eTasks.Model.Interfaces,
  System.JSON;

Type
  TModelListas = Class(TInterfacedObject, iModelListas)
    Private
     FuID   : string;
     FToken : string;
     FData  : string;
    Public
     Constructor Create(uID,Token: string);
     Destructor Destroy; Override;
     Class function New(uID,Token: string): iModelListas;
     Function Data(Value: string) : iModelListas;
     Function CriarItem (Item: tJSONValue; out erro : string) : iModelListas;
     Function EditarItem (Item: TJSONValue; id : string; out erro : string) : iModelListas;
     Function ExcluirItem (id : string; out erro : string) : iModelListas;
     Function MudarStatusItem (id, status : string; out erro : string) : iModelListas;
     Function ExibeItem (id : string; out erro : string) : string;
     Function ListarItens (out erro : string) : String;
  End;

  Const
    BaseUrl = 'https://etasks-d6988.firebaseio.com/etasks/v1/shoppinglists/';

implementation

{ TModelListas }

Uses
   Firebase.interfaces,
   Firebase.request,
   Firebase.response,
   Firebase.Database,
   System.json.writers,
   eTasks.Model.Consts,
   System.SysUtils;

constructor TModelListas.Create(uID,Token: string);
begin
  FuID   := uID;
  FToken := Token;
end;

function TModelListas.CriarItem(Item: tJSONValue;
  out erro: string): iModelListas;
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
  AResponse := ADataBase.post([FuID + '/' + FData +'.json'], Item);
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

function TModelListas.Data(Value: string): iModelListas;
begin
  Result := Self;
  Fdata  := Value;
end;

destructor TModelListas.Destroy;
begin

  inherited;
end;

function TModelListas.EditarItem(Item: TJSONValue; id: string;
  out erro: string): iModelListas;
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
  AResponse := ADataBase.Patch([FuID+'/' + FData + '/' + id + '.json'], Item);
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

function TModelListas.ExcluirItem(id: string; out erro: string): iModelListas;
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
  AResponse := ADataBase.Delete([FuID+'/' + FData + '/' + id + '.json']);
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

function TModelListas.ExibeItem(id: string; out erro: string): string;
var
  ADataBase : IFirebaseDatabase;
  AResponse : iFirebaseResponse;
  Resposta  : TJSONValue;
begin
  ADatabase := tfirebaseDatabase.Create;
  ADataBase.SetBaseURI(BaseUrl);
  ADataBase.SetToken(FToken);
  AResponse := ADataBase.get([FuID+'/' + FData + '/' + id +'.json']);
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

function TModelListas.ListarItens(out erro: string): String;
Var
  ADataBase : IFirebaseDatabase;
  AResponse : iFirebaseResponse;
  Resposta  : TJSONValue;
begin
  ADatabase := tfirebaseDatabase.Create;
  ADataBase.SetBaseURI(BaseUrl);
  ADataBase.SetToken(FToken);
  AResponse := ADataBase.get([FuID + '/' + FData + '.json']);
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

function TModelListas.MudarStatusItem(id, status: string;
  out erro: string): iModelListas;
var
  ADataBase : IFirebaseDatabase;
  AResponse : iFirebaseResponse;
  Resposta  : TJSONValue;
  ItemStatus : TJsonValue;
  JsonTarefaStatus : string;
begin
  Result := self;
  ADatabase := tfirebaseDatabase.Create;
  ADataBase.SetBaseURI(BaseUrl);
  ADataBase.SetToken(FToken);
  JsonTarefaStatus := '{"status":"' + status + '"}';
  ItemStatus := TJSONObject.ParseJSONValue(JsonTarefaStatus);
  AResponse := ADataBase.Patch([FuID+'/' + FData + '/' + id +'.json'], ItemStatus);
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

class function TModelListas.New(uID,Token: string): iModelListas;
begin
  Result := Self.Create(uID, Token);
end;

end.
