unit eTasks.Controller.Interfaces;

interface

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

implementation

end.
