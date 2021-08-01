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
    Class Function DownloadUpdate (out erro: string) : boolean;
  end;

implementation

uses
  System.Classes,
  System.IOUtils,
  System.Net.URLClient,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,
  IdHTTP,
  rest.json,
  {$ifdef MSWINDOWS}
  Winapi.Windows,
  {$endif}
  System.JSON;

{ teTasksLibrary }

class function teTasksLibrary.CheckInternet: Boolean;
var
  Net : THTTPClient;
begin
  Result := false;

  try
    net := THTTPClient.Create;
    try
      Result := Net.Head('https://google.com').StatusCode < 400;
    except
    end;
  finally
    net.DisposeOf;
  end;

 { //Codigo usado anteriormente (será removido assim que testado)
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
  }
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

class function teTasksLibrary.DownloadUpdate(out erro: string): boolean;
var
   Net                  : THTTPClient;
   eTasksFile           : TFileStream;
   Arquivo_temp_install : string;
begin
  Result := false;

  {$ifdef Android}
  Arquivo_temp_install := TPath.Combine(TPath.GetTempPath, 'eTasks.apk');
  {$endif}

  {$ifdef MSWINDOWS}
  Arquivo_temp_install := TPath.Combine(ExtractFilePath(ParamStr(0)) , 'eTasks.exe');
  RenameFile(TPath.Combine(ExtractFilePath(ParamStr(0)) , 'eTasks.exe'), TPath.Combine(ExtractFilePath(ParamStr(0)) , 'eTasks_old.exe'));
  try
   eTasksFile := TFileStream.Create(arquivo_temp_install, fmCreate);
   try
     net := THTTPClient.Create;
     try
       Result := Net.Get('https://github.com/rafael-figueiredo-alves/eTasks/releases/download/v1.0.1-beta/eTasks.exe', eTasksFile).StatusCode < 400;
     except
      erro := 'Ocorreu um erro!'
     end;
   finally
     net.DisposeOf;
   end;
  finally
    eTasksFile.DisposeOf;
  end;
  {$endif}


end;

end.
