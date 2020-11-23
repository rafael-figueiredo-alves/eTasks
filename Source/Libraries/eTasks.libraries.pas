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
  end;

implementation

uses
  System.Classes;

{ teTasksLibrary }

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
