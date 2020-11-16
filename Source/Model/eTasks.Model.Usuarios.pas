unit eTasks.Model.Usuarios;

interface

uses
  eTasks.Model.Interfaces;

Type
  TModelUsuarios = Class(TInterfacedObject, iModelUsuario)
    Private
     FuID   : String;
     FNome  : String;
     FEmail : String;
     FFoto  : string;
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iModelUsuario;
     Function uID (value : String) : iModelUsuario; overload;
     Function uID : string; overload;
     Function Nome (Value : string) : iModelUsuario; overload;
     Function Nome : string; overload;
     Function Email (Value : string) : iModelUsuario; overload;
     Function email : string; overload;
     Function Foto (Value : string) : iModelUsuario; Overload;
     Function Foto : string; overload;
     Function Gravar (Token : string; out erro : string) : iModelUsuario;
     Function Ler (Token : string; out erro : string) : iModelUsuario;
  End;

  Const
   BaseUrl = 'https://etasks-d6988.firebaseio.com/etasks/v1/users/';

implementation

{ TModelUsuarios }

Uses
   Firebase.interfaces,
   Firebase.request,
   Firebase.response,
   Firebase.Database,
   System.json,
   System.json.writers,
   eTasks.Model.Consts;

constructor TModelUsuarios.Create;
begin

end;

destructor TModelUsuarios.Destroy;
begin

  inherited;
end;

function TModelUsuarios.Email(Value: string): iModelUsuario;
begin
  Result := Self;
  FEmail := Value;
end;

function TModelUsuarios.Email: string;
begin
  Result := FEmail;
end;

function TModelUsuarios.Foto(Value: string): iModelUsuario;
begin
   Result := Self;
   FFoto  := Value;
end;

function TModelUsuarios.Foto: string;
begin
  Result := FFoto;
end;

function TModelUsuarios.Gravar(Token: string; out erro: string): iModelUsuario;
Var
  ADataBase : IFirebaseDatabase;
  AResponse : iFirebaseResponse;
  Dados     : TJSONValue;
  JsonStr   : string;
  Resposta     : TJSONValue;
begin
  Result := Self;
  ADatabase := tfirebaseDatabase.Create;
  ADataBase.SetBaseURI(BaseUrl);
  ADataBase.SetToken(Token);
  JsonStr := '{"nome" : "' + FNome + '", "email" : "' + FEmail + '", "foto" : "' + FFoto + '"}';
  Dados := TJSONObject.ParseJSONValue(JsonStr);
  AResponse := ADataBase.Put([FuID+'.json'], Dados);
  Resposta := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
  if (not Assigned(Resposta)) or (not (Resposta is TJSONObject)) then
   begin
     if Assigned(Resposta) then
      Resposta.DisposeOf;
     exit
   end;

   if Resposta <> Dados then
    erro := 'Erro';

    if Assigned(resposta) then
     Resposta.DisposeOf;
end;

function TModelUsuarios.Ler(Token: string; out erro: string): iModelUsuario;
Var
  ADataBase : IFirebaseDatabase;
  AResponse : iFirebaseResponse;
  Resposta     : TJSONValue;
begin
  Result := Self;
  ADatabase := tfirebaseDatabase.Create;
  ADataBase.SetBaseURI(BaseUrl);
  ADataBase.SetToken(Token);
  AResponse := ADataBase.get([FuID+'.json']);
  Resposta := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
  if (not Assigned(Resposta)) or (not (Resposta is TJSONObject)) then
   begin
     if Assigned(Resposta) then
      Resposta.DisposeOf;
     exit
   end;

   FNome := Resposta.GetValue<string>('nome');

    if Assigned(resposta) then
     Resposta.DisposeOf;
end;

class function TModelUsuarios.New: iModelUsuario;
begin
  Result := Self.Create;
end;

function TModelUsuarios.Nome(Value: string): iModelUsuario;
begin
  Result := Self;
  FNome  := Value;
end;

function TModelUsuarios.Nome: string;
begin
  Result := FNome;
end;

function TModelUsuarios.uID(value: String): iModelUsuario;
begin
  Result := Self;
  FuID   := value;
end;

function TModelUsuarios.uID: string;
begin
  Result := FuID;
end;

end.
