unit eTasks.Model.Interfaces;

interface

Type
  TAuthUser = Record
    uID : string;
    idToken : string;
    RefreshToken : string;
  End;

  iModelLoggedUser = interface
    ['{B2E7F7D2-A4AF-42F6-AFF6-54D45618D4E0}']
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
    Function Logged : string; Overload;
    Function Logged (Value : string) : iModelLoggedUser; Overload;
    Function Conectar : Boolean;
    Function Logout : Boolean;
  end;

  iModelAuth = interface
    ['{6A0B042C-6618-466F-96F9-8A8BE85DBFEA}']
    Function Nome (Value : String) : iModelAuth;
    Function Email (Value : String) : iModelAuth;
    Function Password (Value : String) : iModelAuth;
    Function Foto (Value : String) : iModelAuth;
    Function Token (Value : string) : iModelAuth;
    Function EfetuarLogin (out Erro : String) : TAuthUser;
    Function CriarConta (out Erro : String) : TAuthUser;
    Function EsqueciConta (out Erro : String) : Boolean;
    Function RefreshToken (out Erro : String) : TAuthUser;
  end;

  iModelUsuario = interface
    ['{4829378C-2184-4C7E-95B9-104E2BE286B7}']
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
    Function Editar (Token : string; out erro : string) : iModelUsuario;
  end;

  iModelFactory = Interface
    ['{73B16EAC-77A3-44F6-B656-BB1512B8EE57}']
    Function LoggedUser : iModelLoggedUser;
    Function Auth       : iModelAuth;
    Function Usuario    : iModelUsuario;
  End;

implementation

end.
