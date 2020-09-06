program eTasks;

uses
  System.StartUpCopy,
  {$IFDEF ANDROID}
  eTasks.View.Android.login in 'Source\View\Android\eTasks.View.Android.login.pas' {Form_Android_Login},
  {$ENDIF }
  {$IFDEF MSWINDOWS}
  eTasks.View.Windows.login in 'Source\View\Windows\eTasks.View.Windows.login.pas' {Form_Windows_Login},
  {$ENDIF }
  FMX.Forms;

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF ANDROID}
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(tForm_Android_Login, Form_Android_Login);
  {$ENDIF}
  {$IFDEF MSWINDOWS}
  Application.CreateForm(TForm_Windows_Login, Form_Windows_Login);
  {$ENDIF}
  Application.Run;
end.
