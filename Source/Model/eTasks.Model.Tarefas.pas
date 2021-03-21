unit eTasks.Model.Tarefas;

interface

uses
  eTasks.Model.Interfaces, System.JSON;

Type
  TModelTarefas = Class(TInterfacedObject, iModelTarefas)
    Private
     FuID   : string;
     FToken : string;
    Public
     Constructor Create(uID,Token: string);
     Destructor Destroy; Override;
     Class function New(uID,Token: string): iModelTarefas;
     Function CriarTarefa (Tarefa: tJSONObject; out erro : string) : iModelTarefas;
     Function EditarTarefa (Tarefa: TJSONObject; id : string; out erro : string) : iModelTarefas;
     Function ExcluirTarefa (id : string; out erro : string) : iModelTarefas;
     Function MudarStatusTarefa (id, status : string; out erro : string) : iModelTarefas;
     Function ExibeTarefa (id : string; out erro : string) : TJSONObject;
     Function ListarTarefas (data : string; out erro : string) : TJSONObject;
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
   eTasks.Model.Consts, System.Generics.Collections;

constructor TModelTarefas.Create(uID,Token: string);
begin
  FuID   := uID;
  FToken := Token;
end;

function TModelTarefas.CriarTarefa(Tarefa: tJSONObject;
  out erro: string): iModelTarefas;
begin
  Result := Self;
end;

destructor TModelTarefas.Destroy;
begin

  inherited;
end;

function TModelTarefas.EditarTarefa(Tarefa: TJSONObject; id: string;
  out erro: string): iModelTarefas;
begin
  Result := Self;
end;

function TModelTarefas.ExcluirTarefa(id: string;
  out erro: string): iModelTarefas;
begin
  Result := Self;
end;

function TModelTarefas.ExibeTarefa(id: string; out erro: string): TJSONObject;
begin
  Result := nil;
end;

function TModelTarefas.ListarTarefas(data: string;
  out erro: string): TJSONObject;
Var
  ADataBase : IFirebaseDatabase;
  AResponse : iFirebaseResponse;
  Resposta  : TJSONValue;
  Query     : tdictionary<string, string>;
begin
  ADatabase := tfirebaseDatabase.Create;
  ADataBase.SetBaseURI(BaseUrl);
  ADataBase.SetToken(FToken);
  Query := TDictionary<string, string>.create;
  query.Add('orderBy', 'data');
  query.Add('equalTo', data);
  AResponse := ADataBase.get([FuID+'.json'], query);
  query.DisposeOf;
  Resposta := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
  if (not Assigned(Resposta)) or (not (Resposta is TJSONObject)) then
   begin
     if Assigned(Resposta) then
      Resposta.DisposeOf;
     Result := nil;
     exit
   end;

   Result := Resposta as TJSONObject;

   if Assigned(resposta) then
     Resposta.DisposeOf;
end;

function TModelTarefas.MudarStatusTarefa(id, status: string;
  out erro: string): iModelTarefas;
begin
  Result := Self;
end;

class function TModelTarefas.New(uID,Token: string): iModelTarefas;
begin
  Result := Self.Create(uID, Token);
end;

end.
