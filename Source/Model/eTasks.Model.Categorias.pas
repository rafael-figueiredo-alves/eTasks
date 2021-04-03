unit eTasks.Model.Categorias;

interface

uses
  eTasks.Model.Interfaces,
  System.JSON;

Type
  TModelCategorias = Class(TInterfacedObject, iModelCategorias)
    Private
     FuID   : string;
     FToken : string;
    Public
     Constructor Create(uID,Token:string);
     Destructor Destroy; Override;
     Class function New(uID,Token:string): iModelCategorias;
     Function NovaCategoria (Categoria : TJSONValue; out Erro : string) : iModelCategorias;
     Function EditarCategoria (Categoria : TJSONValue; id : string; out erro : string) : iModelCategorias;
     Function ExcluirCategoria (id : string; out erro : string) : iModelCategorias;
     Function ExibeCategoria (id : string; out erro : string) : string;
     Function ListarCategorias (out erro : string) : string;
  End;

  Const
    BaseUrl = 'https://etasks-d6988.firebaseio.com/etasks/v1/categories/';

implementation

{ TModelCategorias }

Uses
   Firebase.interfaces,
   Firebase.request,
   Firebase.response,
   Firebase.Database,
   System.json.writers,
   eTasks.Model.Consts,
   System.Generics.Collections,
   System.SysUtils;

constructor TModelCategorias.Create(uID,Token:string);
begin
  FuID   := uID;
  FToken := Token;
end;

destructor TModelCategorias.Destroy;
begin

  inherited;
end;

function TModelCategorias.EditarCategoria(Categoria: TJSONValue; id: string;
  out erro: string): iModelCategorias;
var
  ADataBase : IFirebaseDatabase;
  AResponse : iFirebaseResponse;
  Resposta  : TJSONValue;
begin
  Result := self;
  ADatabase := tfirebaseDatabase.Create;
  ADataBase.SetBaseURI(BaseUrl);
  ADataBase.SetToken(FToken);
  AResponse := ADataBase.Patch([FuID+'/' + id + '.json'], Categoria);
  Resposta := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
  if (not Assigned(Resposta)) or (not (Resposta is TJSONObject)) then
   begin
     if Assigned(Resposta) then
      Resposta.DisposeOf;
     exit
   end;

   if Resposta <> Categoria then
    erro := 'Erro'
   else
    erro := '';

   if Assigned(resposta) then
    Resposta.DisposeOf;
end;

function TModelCategorias.ExcluirCategoria(id: string;
  out erro: string): iModelCategorias;
Var
  ADataBase : IFirebaseDatabase;
  AResponse : iFirebaseResponse;
  Resposta  : TJSONValue;
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

   if not Resposta.Null then
    erro := 'Erro'
   else
    erro := '';

   if Assigned(resposta) then
    Resposta.DisposeOf;
end;

function TModelCategorias.ExibeCategoria(id: string; out erro: string): string;
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

function TModelCategorias.ListarCategorias(out erro: string): string;
Var
  ADataBase : IFirebaseDatabase;
  AResponse : iFirebaseResponse;
  Resposta  : TJSONValue;
begin
  ADatabase := tfirebaseDatabase.Create;
  ADataBase.SetBaseURI(BaseUrl);
  ADataBase.SetToken(FToken);
  AResponse := ADataBase.get([FuID+'.json']);
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

class function TModelCategorias.New(uID,Token:string): iModelCategorias;
begin
  Result := Self.Create(uID,Token);
end;

function TModelCategorias.NovaCategoria(Categoria: TJSONValue;
  out Erro: string): iModelCategorias;
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
  AResponse := ADataBase.post([FuID+'.json'], Categoria);
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

end.
