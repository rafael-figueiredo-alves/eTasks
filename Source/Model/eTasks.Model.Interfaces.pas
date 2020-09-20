unit eTasks.Model.Interfaces;

interface

Type
  iModelLoggedUser = interface
    Function Nome : String; Overload;
    Function Nome (Value : String) : iModelLoggedUser; Overload;
    Function Email : string; Overload;
    Function Email (Value : String) : iModelLoggedUser; Overload;
    Function Password : String; Overload;
    Function Password (Value : String) : iModelLoggedUser; Overload;
    Function Token : String; Overload;
    Function Token (Value : String) : iModelLoggedUser; Overload;
    Function uID : string; Overload;
    Function uID (Value : String) : iModelLoggedUser; Overload;
    Function Foto : String; Overload;
    Function Foto (Value : String) : iModelLoggedUser; Overload;
    Function Logged : string; Overload;
    Function Logged (Value : string) : iModelLoggedUser; Overload;
    Function Conectar : iModelLoggedUser;
    Function Logout : Boolean;
  end;

  iModelLogin = interface
    Function Nome (Value : String) : iModelLogin;
    Function Email (Value : String) : iModelLogin;
    Function Senha (Value : String) : iModelLogin;
    Function Foto (Value : String) : iModelLogin;
    Function EfetuarLogin (out Erro : String) : iModelLoggedUser;
    Function CriarConta (out Erro : String) : iModelLoggedUser;
    Function EsqueciConta (out Erro : String) : iModelLoggedUser;
  end;

implementation

end.
