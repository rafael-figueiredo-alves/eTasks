unit eTasks.Model.Auth;

interface

uses
  eTasks.Model.Interfaces;

Type
  TModelAuth = Class(TInterfacedObject, iModelAuth)
    Private
     FNome     : String;
     FEmail    : string;
     FPassword : string;
     FFoto     : string;
     FToken    : string;
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iModelAuth;
     Function Nome (Value : String) : iModelAuth;
     Function Email (Value : String) : iModelAuth;
     Function Password (Value : String) : iModelAuth;
     Function Foto (Value : String) : iModelAuth;
     Function Token (Value : string) : iModelAuth;
     Function EfetuarLogin (out Erro : String) : TAuthUser;
     Function CriarConta (out Erro : String) : TAuthUser;
     Function EsqueciConta (out Erro : String) : Boolean;
     Function RefreshToken (out Erro : String) : TAuthUser;
  End;

implementation

{ TModelAuth }

Uses
   Firebase.Auth,
   Firebase.interfaces,
   Firebase.request,
   Firebase.response,
   System.json,
   System.json.writers,
   eTasks.Model.Consts;

constructor TModelAuth.Create;
begin

end;

function TModelAuth.CriarConta(out Erro: String): TAuthUser;
Var
 Auth         : iFirebaseAuth;
 AResponse    : IFirebaseResponse;
 Resposta     : TJSONValue;
 LToken       : string;
 LRefresh     : string;
 LuID         : string;
 Obj          : TJSONObject;
 ObjError     : TJSONObject;
 ErrorMessage : string;
begin
  Auth := TFirebaseAuth.Create;
  Auth.SetApiKey(Firebase_api_key);
  AResponse := Auth.CreateUserWithEmailAndPassword(FEmail, FPassword);
  Resposta := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
  if (not Assigned(Resposta)) or (not (Resposta is TJSONObject)) then
   begin
     if Assigned(Resposta) then
      Resposta.DisposeOf;
     exit
   end;

   Obj := Resposta as TJSONObject;

   Erro := '';

   if Obj.TryGetValue('idToken', ltoken) then
    Result.idToken := LToken;

   if Obj.TryGetValue('refreshToken', LRefresh) then
    Result.RefreshToken := LRefresh;

   if Obj.TryGetValue('localId', LuID) then
    Result.uID := LuID;

   if Obj.TryGetValue('error', ObjError) then
    begin
      ObjError.TryGetValue('message', ErrorMessage);
      if ErrorMessage = 'EMAIL_EXISTS' then
       Erro := 'Email existe'
      else if ErrorMessage = 'INVALID_EMAIL' then
       erro := 'Email invalido'
      else if (Pos('WEAK_PASSWORD', ErrorMessage) > 0) then
       erro :=  'Senha fraca';
    end;

    if Assigned(resposta) then
     Resposta.DisposeOf;
end;

destructor TModelAuth.Destroy;
begin

  inherited;
end;

function TModelAuth.EfetuarLogin(out Erro: String): TAuthUser;
Var
 Auth         : iFirebaseAuth;
 AResponse    : IFirebaseResponse;
 Resposta     : TJSONValue;
 LToken       : string;
 LRefresh     : string;
 LuID         : string;
 Obj          : TJSONObject;
 ObjError     : TJSONObject;
 ErrorMessage : string;
begin
  Auth := TFirebaseAuth.Create;
  Auth.SetApiKey(Firebase_api_key);
  AResponse := Auth.SignInWithEmailAndPassword(FEmail, FPassword);
  Resposta := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
  if (not Assigned(Resposta)) or (not (Resposta is TJSONObject)) then
   begin
     if Assigned(Resposta) then
      Resposta.DisposeOf;
     exit
   end;

   Obj := Resposta as TJSONObject;

   Erro := '';

   if Obj.TryGetValue('idToken', ltoken) then
    Result.idToken := LToken;

   if Obj.TryGetValue('refreshToken', LRefresh) then
    Result.RefreshToken := LRefresh;

   if Obj.TryGetValue('localId', LuID) then
    Result.uID := LuID;

   if Obj.TryGetValue('error', ObjError) then
    begin
      ObjError.TryGetValue('message', ErrorMessage);
      if ErrorMessage = 'EMAIL_NOT_FOUND' then
       Erro := 'Email não existe'
      else if ErrorMessage = 'INVALID_PASSWORD' then
       erro := 'Senha invalida'
      else if (Pos('USER_DISABLED', ErrorMessage) > 0) then
       erro :=  'Usuário desativado';
    end;

    if Assigned(resposta) then
     Resposta.DisposeOf;
end;

function TModelAuth.Email(Value: String): iModelAuth;
begin
  Result := Self;
  FEmail := Value;
end;

function TModelAuth.EsqueciConta(out Erro: String): Boolean;
Var
 Auth         : iFirebaseAuth;
 AResponse    : IFirebaseResponse;
 Resposta     : TJSONValue;
 Obj          : TJSONObject;
 ObjError     : TJSONObject;
 ErrorMessage : string;
begin
  Auth := TFirebaseAuth.Create;
  Auth.SetApiKey(Firebase_api_key);
  AResponse := Auth.SendResetPassword(FEmail);
  Resposta := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
  if (not Assigned(Resposta)) or (not (Resposta is TJSONObject)) then
   begin
     if Assigned(Resposta) then
      Resposta.DisposeOf;
     Result := false;
     exit
   end;

   Obj := Resposta as TJSONObject;

   Erro := '';

   if Obj.TryGetValue('error', ObjError) then
    begin
      ObjError.TryGetValue('message', ErrorMessage);
      if ErrorMessage = 'EMAIL_NOT_FOUND' then
       Erro := 'Email não existe';
    end;

    if Erro = '' then
     Result := True
    else
     Result := false;

    if Assigned(resposta) then
     Resposta.DisposeOf;
end;

function TModelAuth.Foto(Value: String): iModelAuth;
begin
  Result := Self;
  FFoto  := Value;
end;

class function TModelAuth.New: iModelAuth;
begin
  Result := Self.Create;
end;

function TModelAuth.Nome(Value: String): iModelAuth;
begin
  Result := Self;
  FNome  := Value;
end;

function TModelAuth.Password(Value: String): iModelAuth;
begin
  Result    := Self;
  FPassword := Value;
end;

function TModelAuth.RefreshToken(out Erro: String): TAuthUser;
begin

end;

function TModelAuth.Token(Value: string): iModelAuth;
begin
  Result := self;
  FToken := Value;
end;

end.
