unit eTasks.libraries;

interface

uses
  System.SysUtils;

Type
  TProcedureExcept = reference to procedure (const AExcpetion : string);

  teTasksLibrary = class
    class procedure CustomThread(
                                 AOnStart,                           //Procedimento de entrada      = nil
                                 AOnProcess,                         //Procedimento principal       = nil
                                 AOnComplete                : TProc; //Procedimento de finalização  = nil
                                 AOnError                   : TProcedureExcept = nil;
                                 const ADoCompleteWithError : Boolean = True
                                );
    Class Function CheckInternet                         : Boolean;
    Class Function CheckUpdate (out nome_versao: string) : Boolean;
  end;

implementation

uses
  System.Classes,
  System.Net.URLClient,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,
  IdHTTP,
  rest.json,
  System.JSON;

{ teTasksLibrary }

class function teTasksLibrary.CheckInternet: Boolean;
var
  Net : TNetHTTPClient;
begin
  Net := TNetHTTPClient.Create(nil);
  try
   try
    Net.Get('https://etasks-d6988.firebaseio.com/etasks/v1/version.json');
   except
    on E: Exception do begin
      if not (E is EIdHTTPProtocolException) then begin
        Result := False;
        Net.DisposeOf;
        Exit;
      end;
    end;
   end;
  finally
    Net.DisposeOf;
  end;
  Result := True;
end;

class function teTasksLibrary.CheckUpdate(out nome_versao: string): Boolean;
Var
 Rest   : TNetHTTPClient;
 Resp   : IHTTPResponse;
 Obj    : tjsonObject;
 Versao : integer;
Const
 Versao_eTasks = 1; 
begin
  Result := False;
  Rest := TNetHTTPClient.Create(nil);
  try
    try
     Resp := rest.Get('https://etasks-d6988.firebaseio.com/etasks/v1/version.json');
     Obj := TJSONObject.ParseJSONValue(Resp.ContentAsString()) as TJSONObject;
     Versao := Obj.GetValue('version').Value.ToInteger;
     nome_versao := Obj.GetValue('versionname').Value; 
     if Versao > Versao_eTasks then
      Result := True
     else
      Result := false;
     Obj.DisposeOf;
    except
     on E: Exception do begin
      if not (E is EIdHTTPProtocolException) then begin
        Result := False;
        Rest.DisposeOf;
        Exit;     
     end;
     end;
    end;
  finally
    Rest.DisposeOf;
  end;
end;

class procedure teTasksLibrary.CustomThread(AOnStart, AOnProcess,
  AOnComplete: TProc; AOnError: TProcedureExcept;
  const ADoCompleteWithError: Boolean);
var
  LThread : TThread;
begin
  LThread :=
    TThread.CreateAnonymousThread(
      procedure()
      var
        LDoComplete : Boolean;
      begin
        try
        {$Region 'Processo completo'}
          {$Region 'Start'}
          try
            LDoComplete := True;
            //Processo Inicial
            if (Assigned(AOnStart)) then
            begin
              TThread.Synchronize(
                TThread.CurrentThread,
                procedure ()
                begin
                  AOnStart;
                end
              );
            end;
          {$EndRegion}

          {$Region 'Process'}
            //Processo Principal
            if Assigned(AOnProcess) then
              AOnProcess;
          {$EndRegion}

          except on E:Exception do
            begin
              LDoComplete := ADoCompleteWithError;
              //Processo de Erro
              if Assigned(AOnError) then
              begin
                TThread.Synchronize(
                  TThread.CurrentThread,
                  procedure ()
                  begin
                    AOnError(E.Message);
                  end
                );
              end;
            end;
          end;

        finally
          {$Region 'Complete'}
          //Processo de Finalização
          if Assigned(AOnComplete) then
          begin
            TThread.Synchronize(
              TThread.CurrentThread,
              procedure ()
              begin
                AOnComplete;
              end
            );
          end;
          {$EndRegion}
          {$EndRegion}
        end;
      end
    );

  LThread.FreeOnTerminate := True;
  LThread.Start;
end;

end.
