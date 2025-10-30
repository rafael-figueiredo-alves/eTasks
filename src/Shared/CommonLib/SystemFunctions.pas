unit SystemFunctions;

interface

  Procedure SendEmail(destinatario, assunto, texto : string);
  Procedure OpenLink(Link : string);
  Procedure UpdateApp(const DownloadURL, AppName: string);

implementation

uses
 {$ifdef MSWINDOWS}
 winapi.shellapi,
 Winapi.Windows;
 {$endif}

 {$ifdef ANDROID}
  AndroidApi.helpers,
  AndroidApi.JNI.OS,
  AndroidApi.JNI.Widget,
  AndroidApi.JNI.JavaTypes,
  AndroidApi.JNIBridge,
  AndroidApi.JNI.App,
  AndroidApi.JNI.GraphicsContentViewText,
  FMX.Helpers.Android,
  Androidapi.Jni.Net;
 {$endif}

Procedure SendEmail(destinatario, assunto, texto : string);
var
  {$ifdef MSWINDOWS}
  StringShellExecute: String;
  {$endif}

  {$ifdef ANDROID}
  Intent : JIntent;
  Destinatarios: TJavaObjectArray<JString>;
  {$endif}
begin
  {$ifdef MSWINDOWS}
  StringShellExecute := StringShellExecute +
   'mailto:' + destinatario +
   '?subject=' + assunto +
   '&amp;body=' + texto;

  ShellExecute(GetDesktopWindow, 'open', PChar(StringShellExecute), '', '',
     SW_SHOWNORMAL);
  {$endif}

  {$ifdef ANDROID}
  if Destinatario <> EmptyStr then
    begin
            Destinatarios := TJavaObjectArray<JString>.Create(1);

            Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND);
            Destinatarios.Items[0] := StringToJString(Destinatario);
            Intent.putExtra(TJIntent.JavaClass.EXTRA_EMAIL, Destinatarios);
            Intent.putExtra(TJIntent.JavaClass.EXTRA_SUBJECT, StringToJString(Assunto));
            Intent.putExtra(TJIntent.JavaClass.EXTRA_TEXT, StringToJString(texto));
            Intent.setType(StringToJString('plain/text'));
            TAndroidHelper.Activity.startActivity(TJIntent.JavaClass.createChooser(Intent,
              StrToJCharSequence('Qual aplicativo deseja usar para enviar um e-mail?')));
    end;
  {$endif}
end;

Procedure OpenLink(Link : string);
{$ifdef ANDROID}
var
  Intent: JIntent;
{$endif}
begin
  {$ifdef MSWINDOWS}
  ShellExecute(GetDesktopWindow,
               'open',
               PChar(link),
               nil,
               nil,
               SW_SHOWMAXIMIZED);
  {$endif}

  {$ifdef ANDROID}
  Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW,
                                    TJnet_Uri.JavaClass.parse(StringToJString(TIdURI.URLEncode(link))));
  TAndroidHelper.Activity.startActivity(Intent);
  {$endif}
end;

end.
