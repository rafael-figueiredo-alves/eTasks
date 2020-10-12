program eTasks;

uses
  System.StartUpCopy,
  {$IFDEF ANDROID}
  eTasks.View.Android.main in 'Source\View\Android\eTasks.View.Android.main.pas' {Form_Android_main},
  eTasks.libraries.Android in 'Source\Libraries\eTasks.libraries.Android.pas',
  eTasks.View.Android.login in 'Source\View\Android\eTasks.View.Android.login.pas' {Form_Android_Login},
  {$ENDIF }
  {$IFDEF MSWINDOWS}
  eTasks.View.Windows.login in 'Source\View\Windows\eTasks.View.Windows.login.pas' {Form_Windows_Login},
  eTasks.View.Windows.main in 'Source\View\Windows\eTasks.View.Windows.main.pas' {Form_Windows_main},
  {$ENDIF }
  FMX.Forms,
  eTasks.View.Dialogs.SheetFotos in 'Source\View\Dialogs\eTasks.View.Dialogs.SheetFotos.pas' {Sheet_fotos},
  eTasks.View.Dialogs.Termos in 'Source\View\Dialogs\eTasks.View.Dialogs.Termos.pas' {Dlg_Termos},
  eTasks.View.Dialogs.Messages in 'Source\View\Dialogs\eTasks.View.Dialogs.Messages.pas' {Dlg_Login_messages},
  eTasks.View.Dialogs.Messages.Consts in 'Source\View\Dialogs\eTasks.View.Dialogs.Messages.Consts.pas',
  eTasks.View.Dialogs.Factory in 'Source\View\Dialogs\eTasks.View.Dialogs.Factory.pas',
  eTasks.Model.LoggedUser in 'Source\Model\eTasks.Model.LoggedUser.pas',
  eTasks.Model.Interfaces in 'Source\Model\eTasks.Model.Interfaces.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  {$IFDEF ANDROID}
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  if not TModelLoggedUser.Verificar then
   Application.CreateForm(TForm_Android_Login, Form_Android_Login)
  else
   Application.CreateForm(TForm_Android_main, Form_Android_Main);
  {$ENDIF}
  {$IFDEF MSWINDOWS}
  if not TModelLoggedUser.Verificar then
   Application.CreateForm(TForm_Windows_Login, Form_Windows_Login)
  else
   Application.CreateForm(TForm_Windows_Main, Form_Windows_Main);
  {$ENDIF}
  Application.Run;
end.

