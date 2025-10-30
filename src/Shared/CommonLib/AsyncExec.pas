unit AsyncExec;

interface

uses
  System.SysUtils;

type

  TProcedureExcept = reference to procedure (const AExcpetion : Exception);

  TAsyncExec = class
    class Procedure Run(
                        OnStart,              //Procedimento de entrada      = nil
                        OnProcess,            //Procedimento principal       = nil
                        OnFinish   : TProc;   //Procedimento de finalização  = nil
                        OnError    : TProcedureExcept = nil
                       );
  end;

implementation

uses
  System.Classes;

{ TAsyncExec }

class procedure TAsyncExec.Run(OnStart, OnProcess, OnFinish : TProc;
                               OnError                      : TProcedureExcept);
var
  CustomThread : TThread;
begin
  CustomThread :=
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
            if (Assigned(OnStart)) then
            begin
              TThread.Synchronize(
                TThread.CurrentThread,
                procedure ()
                begin
                  OnStart;
                end
              );
            end;
          {$EndRegion}

          {$Region 'Process'}
            //Processo Principal
            if Assigned(OnProcess) then
              OnProcess;
          {$EndRegion}

          except on CapturedException:Exception do
            begin
              //Processo de Erro
              if Assigned(OnError) then
              begin
                TThread.Synchronize(
                  TThread.CurrentThread,
                  procedure ()
                  begin
                    OnError(CapturedException);
                  end
                );
              end;
            end;
          end;

        finally
          {$Region 'Complete'}
          //Processo de Finalização
          if Assigned(OnFinish) then
          begin
            TThread.Synchronize(
              TThread.CurrentThread,
              procedure ()
              begin
                OnFinish;
              end
            );
          end;
          {$EndRegion}
          {$EndRegion}
        end;
      end
    );

  CustomThread.FreeOnTerminate := True;
  CustomThread.Start;
end;

end.
