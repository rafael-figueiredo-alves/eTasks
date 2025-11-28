unit SystemFunctions;

interface

  Procedure SendEmail(destinatario, assunto, texto : string);
  Procedure OpenLink(Link : string);
  Procedure UpdateApp(const DownloadURL, AppName: string);

implementation

uses
 {$ifdef MSWINDOWS}
 winapi.shellapi,
 Winapi.Windows,
 System.Net.HttpClient,
 System.Classes, System.SysUtils, System.IOUtils;
 {$endif}

 {$ifdef ANDROID}
  IdURI,
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
  if Destinatario <> '' then
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

procedure CleanUpdate(AppName: string);
begin
  if FileExists(TPath.Combine(ExtractFilePath(ParamStr(0)) , AppName + '_old.exe')) then
   TFile.Delete(TPath.Combine(ExtractFilePath(ParamStr(0)) , AppName + '_old.exe'));
end;

Procedure UpdateApp(const DownloadURL, AppName: string);
//{$IFDEF WINDOWS}
var
 Net                  : THTTPClient;
 eTasksFile           : TFileStream;
 Arquivo_temp_install : string;
//{$ENDIF}
begin
//  {$IFDEF ANDROID}
//  OpenLink(DownloadURL);
//  {$ENDIF}
//  {$IFDEF WINDOWS}
  Arquivo_temp_install := TPath.Combine(ExtractFilePath(ParamStr(0)) , AppName + '.exe');
  RenameFile(TPath.Combine(ExtractFilePath(ParamStr(0)) , 'eTasks.exe'), TPath.Combine(ExtractFilePath(ParamStr(0)) , AppName + '_old.exe'));
  try
   eTasksFile := TFileStream.Create(arquivo_temp_install, fmCreate);
   try
     net := THTTPClient.Create;
     try
       if (Net.Get(DownloadURL, eTasksFile).StatusCode < 400)then begin
        OpenLink(Arquivo_temp_install);
       end;
     except

     end;
   finally
     net.DisposeOf;
   end;
  finally
    eTasksFile.DisposeOf;
  end;
//  {$ENDIF}
end;

end.
