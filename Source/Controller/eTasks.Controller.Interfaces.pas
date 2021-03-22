unit eTasks.Controller.Interfaces;

interface

uses
  FMX.ListView;

type
  iControllerLogin = interface
    ['{FA71F17B-8A6F-403D-B16A-2A1209C1FA0F}']
    Function Nome (Value : string) : iControllerLogin;
    Function Password (Value : string) : iControllerLogin;
    Function Email (Value : String) : iControllerLogin;
    Function Foto (value : string) : iControllerLogin;
    Function CriarConta (out Erro : integer) : iControllerLogin;
    Function EfetuarLogin (Out Erro : integer) : iControllerLogin;
    Function EfetuarLogout : Boolean;
    Function EsqueciConta (out erro : integer) : boolean;
  end;

  iControllerUsuario = interface
    ['{55101E59-30B7-4A9E-8E88-507C4D8B0E24}']
    Function Nome  : String; overload;
    Function Email : string; overload;
    Function Foto  : string; overload;
    Function Nome (Value : String) : iControllerUsuario; overload;
    Function Email (Value : String) : iControllerUsuario; overload;
    Function Foto (Value : String) : iControllerUsuario; overload;
    Function Ler : iControllerUsuario;
    function Salvar : iControllerUsuario;
    Function Alterar : iControllerUsuario;
  end;

  iControllerTarefas = interface
    ['{F31D8E0D-49A3-4F5F-8F1A-1669F279F576}']
    Function ListarTarefas(Lista: tlistview; data: string; out erro : string) : iControllerTarefas;
  end;

implementation

end.
