unit InternetChecker;

interface

type
  TProc<boolean> = reference to procedure(Const AValue: Boolean);
  TProc          = reference to procedure;

  TInternetChecker = class
  public
    /// <summary>
    /// Verifica conexão de internet de forma assíncrona, com eventos opcionais.
    /// </summary>
    /// <param name="OnFinished">Obrigatório. Retorna True/False ao final.</param>
    /// <param name="OnCheckingNetwork">Opcional. Chamado ao iniciar verificação de rede.</param>
    /// <param name="OnTestingServer">Opcional. Chamado ao iniciar teste com servidor.</param>
    /// <param name="TestURL">URL de teste. Padrão: https://www.google.com</param>
    /// <param name="TimeoutMS">Tempo máximo (ms). Padrão: 5000</param>
    class procedure CheckConnectionAsync(
      const OnFinished: TProc<Boolean>;
      const OnCheckingNetwork: TProc = nil;
      const OnTestingServer: TProc = nil;
      const TestURL: string = 'https://www.google.com';
      const TimeoutMS: Integer = 5000);

    class function HasInternetConnection : boolean;
  end;

implementation

uses
  System.SysUtils,
  System.Classes,
  System.Threading,
  System.Net.HttpClient,
  System.Net.Socket,
  {$IFDEF ANDROID}
  Androidapi.Helpers,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Net,
  Androidapi.JNI.Os,
  FMX.Helpers.Android;
  {$ENDIF}
  {$IFDEF MSWINDOWS}
  Winapi.WinInet;
  {$ENDIF}

{ TInternetChecker }

function HasNetworkConnection: Boolean;
{$IFDEF ANDROID}
var
  ConnectivityManager: JConnectivityManager;
  NetworkInfo: JNetworkInfo;
{$ENDIF}
begin
{$IFDEF ANDROID}
  ConnectivityManager := TJConnectivityManager.Wrap(
    TAndroidHelper.Context.getSystemService(
      TJContext.JavaClass.CONNECTIVITY_SERVICE
    )
  );

  NetworkInfo := ConnectivityManager.getActiveNetworkInfo;
  Result := (NetworkInfo <> nil) and NetworkInfo.isConnected;

{$ELSEIF Defined(MSWINDOWS)}
  Result := InternetGetConnectedState(nil, 0);
{$ELSE}
  Result := False; // outras plataformas não tratadas
{$ENDIF}
end;

class procedure TInternetChecker.CheckConnectionAsync(
  const OnFinished: TProc<Boolean>; const OnCheckingNetwork,
  OnTestingServer: TProc; const TestURL: string; const TimeoutMS: Integer);
begin
  if not Assigned(OnFinished) then
    raise Exception.Create('O evento OnFinished é obrigatório.');

  TTask.Run(
    procedure
    var
      Http: THTTPClient;
      Response: IHTTPResponse;
      Connected: Boolean;
    begin
      Connected := False;

      try
        //Evento 1: checando rede
        if Assigned(OnCheckingNetwork) then
          TThread.Queue(nil,
                        procedure
                        begin
                          OnCheckingNetwork;
                        end);

        if HasInternetConnection then
        begin
          //Evento 2: testando servidor
          if Assigned(OnTestingServer) then
            TThread.Queue(nil,
                          procedure
                          begin
                            OnTestingServer;
                          end);

          Http := THTTPClient.Create;
          try
            Http.ConnectionTimeout := TimeoutMS;
            Http.ResponseTimeout := TimeoutMS;

            try
              Response := Http.Head(TestURL);
              Connected := (Response.StatusCode >= 200) and (Response.StatusCode < 400);
            except
              Connected := False;
            end;
          finally
            Http.Free;
          end;
        end;
      except
        Connected := False;
      end;

      //Evento final (obrigatório)
      TThread.Queue(nil,
        procedure
        begin
          OnFinished(Connected);
        end);
    end);
end;

class function TInternetChecker.HasInternetConnection: boolean;
begin
  Result := HasNetworkConnection;
end;

end.
