unit eTasks.Model.LoggedUser;

interface

Uses eTasks.Model.Interfaces;

Type
  TModelLoggedUser = Class(TInterfacedObject, iModelLoggedUser)
    Private
     FNome : String;
     FEmail : String;
     FPassword : String;
     FToken : String;
     FRefreshToken : string;
     FuID : String;
     FFoto : String;
     FLogged : string;
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iModelLoggedUser;
     Class Function Verificar : Boolean;
     Function Nome : String; Overload;
     Function Nome (Value : String) : iModelLoggedUser; Overload;
     Function Email : string; Overload;
     Function Email (Value : String) : iModelLoggedUser; Overload;
     Function Password : String; Overload;
     Function Password (Value : String) : iModelLoggedUser; Overload;
     Function Token : String; Overload;
     Function Token (Value : String) : iModelLoggedUser; Overload;
     Function RefreshToken : String; Overload;
     Function RefreshToken (Value : String) : iModelLoggedUser; Overload;
     Function uID : string; Overload;
     Function uID (Value : String) : iModelLoggedUser; Overload;
     Function Foto : String; Overload;
     Function Foto (Value : String) : iModelLoggedUser; Overload;
     Function Logged : string; Overload;
     Function Logged (Value : string) : iModelLoggedUser; Overload;
     Function Conectar : Boolean;
     Function Logout : Boolean;
  End;

  Const
   File_User : String = 'eTasks.loggeduser.ini';

implementation

{ TModelLoggedUser }

Uses
  System.IOUtils, System.SysUtils, inifiles, IdCoder,
  IdCoder3to4, IdCoder00E, IdCoderXXE, IdBaseComponent, System.DateUtils, eTasks.Model.Factory {$ifdef Android}, Posix.Unistd {$endif} ;

function TModelLoggedUser.Conectar: Boolean;
Var
  UserInfo : TIniFile;
  arq_ini  : String;
begin
  {$ifdef Android}
  arq_ini := TPath.Combine(TPath.GetDocumentsPath, File_User);
  {$endif}
  {$ifdef MSWINDOWS}
  arq_ini := TPath.Combine(ExtractFilePath(ParamStr(0)) , File_User);
  {$endif}
  UserInfo := TIniFile.Create(arq_ini);
  Try
    UserInfo.WriteString('LoggedUser', 'Nome', FNome);
    UserInfo.WriteString('LoggedUser', 'Email', FEmail);
    UserInfo.WriteString('LoggedUser', 'Password', FPassword);
    UserInfo.WriteString('LoggedUser', 'uID', FuID);
    UserInfo.WriteString('LoggedUser', 'Token', FToken);
    UserInfo.WriteString('LoggedUser', 'RefreshToken', FRefreshToken);
    UserInfo.WriteString('LoggedUser', 'Foto', FFoto);
    UserInfo.WriteString('LoggedUser', 'Logged', FLogged);
    Result := True;
  Finally
    UserInfo.DisposeOf;
  End;
end;

constructor TModelLoggedUser.Create;
Var
  UserInfo : TIniFile;
  arq_ini  : String;
begin
  {$ifdef Android}
  arq_ini := TPath.Combine(TPath.GetDocumentsPath, File_User);
  {$endif}
  {$ifdef MSWINDOWS}
  arq_ini := TPath.Combine(ExtractFilePath(ParamStr(0)) , File_User);
  {$endif}
  UserInfo := TIniFile.Create(arq_ini);
  Try
    FNome := UserInfo.ReadString('LoggedUser', 'Nome', '');
    FEmail := UserInfo.ReadString('LoggedUser', 'Email', '');
    FPassword := UserInfo.ReadString('LoggedUser', 'Password', '');
    FuID := UserInfo.ReadString('LoggedUser', 'uID', '');
    FToken := UserInfo.ReadString('LoggedUser', 'Token', '');
    FRefreshToken := UserInfo.ReadString('LoggedUser', 'RefreshToken', '');
    FFoto := UserInfo.ReadString('LoggedUser', 'Foto', '');
    FLogged := UserInfo.ReadString('LoggedUser', 'Logged', '');
  Finally
    UserInfo.DisposeOf;
  End;
end;

destructor TModelLoggedUser.Destroy;
begin

  inherited;
end;

function TModelLoggedUser.Email: string;
begin
  Result := FEmail;
end;

function TModelLoggedUser.Email(Value: String): iModelLoggedUser;
begin
  Result := Self;
  FEmail := Value;
end;

function TModelLoggedUser.Foto(Value: String): iModelLoggedUser;
begin
  Result := Self;
  FFoto := Value;
end;

function TModelLoggedUser.Foto: String;
begin
  Result := FFoto;
end;

function TModelLoggedUser.Logged: string;
begin
  Result := FLogged;
end;

function TModelLoggedUser.Logged(Value: string): iModelLoggedUser;
begin
  Result := Self;
  FLogged := Value;
end;

function TModelLoggedUser.Logout: Boolean;
begin
  {$ifdef Android}
  Result := DeleteFile(TPath.Combine(TPath.GetDocumentsPath, File_User));
  {$endif}
  {$ifdef MSWindows}
  Result := DeleteFile(TPath.Combine(ExtractFilePath(ParamStr(0)), File_User));
  {$endif}
end;

class function TModelLoggedUser.New: iModelLoggedUser;
begin
  Result := Self.Create;
end;

function TModelLoggedUser.Nome(Value: String): iModelLoggedUser;
begin
  Result := Self;
  FNome := Value;
end;

function TModelLoggedUser.Nome: String;
begin
  Result := FNome;
end;

function TModelLoggedUser.Password: String;
Var
  FDecoder : TIdDecoderXXE;
begin
  FDecoder := TIdDecoderXXE.Create(nil);
  Try
   Result := FDecoder.DecodeString(FPassword);
  Finally
    FDecoder.DisposeOf;
  End;
end;

function TModelLoggedUser.Password(Value: String): iModelLoggedUser;
Var
  FEncoder : TIdEncoderXXE;
begin
  Result := Self;
  FEncoder := TIdEncoderXXE.Create(nil);
  try
   FPassword := FEncoder.EncodeString(Value);
  finally
    FEncoder.DisposeOf;
  end;
end;

function TModelLoggedUser.RefreshToken(Value: String): iModelLoggedUser;
begin
  Result := Self;
  FRefreshToken := Value;
end;

function TModelLoggedUser.RefreshToken: String;
Var auth_credentials : TAuthUser;
    error : string;
begin
  if Now >= IncHour(StrToDateTime(FLogged))  then
   begin
    auth_credentials := TModelFactory.New.Auth
                                           .Email(FEmail)
                                           .Password(Password)
                                           .EfetuarLogin(error);
    if Error = '' then
     begin
      FToken := auth_credentials.idToken;
      FRefreshToken := auth_credentials.RefreshToken;
      FLogged := DateTimeToStr(now);
      Conectar;
     end;
   end;
  Result := FRefreshToken;
end;

function TModelLoggedUser.Token(Value: String): iModelLoggedUser;
begin
  Result := Self;
  FToken := Value;
end;

function TModelLoggedUser.Token: String;
Var auth_credentials : TAuthUser;
    error : string;
begin
  if Now >= IncHour(StrToDateTime(FLogged))  then
   begin
    auth_credentials := TModelFactory.New.Auth
                                           .Email(FEmail)
                                           .Password(Password)
                                           .EfetuarLogin(error);
    if Error = '' then
     begin
      FToken := auth_credentials.idToken;
      FRefreshToken := auth_credentials.RefreshToken;
      FLogged := DateTimeToStr(now);
      Conectar;
     end;
   end;
  Result := FToken;
end;

function TModelLoggedUser.uID(Value: String): iModelLoggedUser;
begin
  Result := Self;
  FuID := Value;
end;

function TModelLoggedUser.uID: string;
begin
  Result := FuID;
end;

class function TModelLoggedUser.Verificar: boolean;
Var
  Arq_ini : string;
begin
  {$ifdef Android}
  arq_ini := TPath.Combine(TPath.GetDocumentsPath, File_User);
  {$endif}
  {$ifdef MSWINDOWS}
  arq_ini := TPath.Combine(ExtractFilePath(ParamStr(0)) , File_User);
  {$endif}
  if not FileExists(Arq_ini) then
   Result := False
  else
   Result := True;
end;

end.
