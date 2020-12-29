unit eTasks.libraries.Android;

interface

Uses System.sysutils;

Type

 tLibraryAndroid = Class
   Class Procedure TransparentNavBar;
   Class Procedure Vibrar (Intervalo : integer);
   Class function PermissaoCamera  : TArray<string>;
   Class Function PermissaoGaleria : TArray<string>;
   Class Procedure EnviarEmail(destinatario, assunto, texto : string);
   Class Procedure AbrirLink(Link : string);
 End;

implementation

{ tLibraryAndroid }

Uses
  AndroidApi.helpers,
  AndroidApi.JNI.OS,
  AndroidApi.JNI.Widget,
  AndroidApi.JNI.JavaTypes,
  AndroidApi.JNIBridge,
  AndroidApi.JNI.App,
  AndroidApi.JNI.GraphicsContentViewText,
  FMX.Helpers.Android,
  idURI,
  Androidapi.Jni.Net;

class procedure tLibraryAndroid.AbrirLink(Link: string);
var
  Intent: JIntent;
begin
   Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW, TJnet_Uri.JavaClass.parse(StringToJString(TIdURI.URLEncode(link))));
   TAndroidHelper.Activity.startActivity(Intent);
end;

class procedure tLibraryAndroid.EnviarEmail(destinatario, assunto,
  texto: string);
var
  Intent : JIntent;
  Destinatarios: TJavaObjectArray<JString>;
begin
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

end;

class function tLibraryAndroid.PermissaoCamera: TArray<string>;
Var
  FPermissaoReadStorage   : String;
  FPermissaoCamera       : String;
  FPermissaoWriteStorage : string;
begin
  FPermissaoCamera := JStringToString(TJManifest_permission.JavaClass.CAMERA);
  FPermissaoReadStorage := JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
  FPermissaoWriteStorage := JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
  Result := [FPermissaoCamera, FPermissaoReadStorage, FPermissaoWriteStorage];
end;

class function tLibraryAndroid.PermissaoGaleria: TArray<string>;
Var
  FPermissaoReadStorage   : String;
  FPermissaoWriteStorage : string;
begin
  FPermissaoReadStorage := JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
  FPermissaoWriteStorage := JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
  Result := [FPermissaoReadStorage, FPermissaoWriteStorage];
end;

class procedure tLibraryAndroid.TransparentNavBar;
Var
  LActivity : JActivity;
  LWindow   : JWindow;
begin
  LActivity := TAndroidHelper.Activity;
  LWindow   := LActivity.getWindow;

  LWindow.setFlags(TJWindowManager_LayoutParams.JavaClass.FLAG_TRANSLUCENT_STATUS,
                   TJWindowManager_LayoutParams.JavaClass.FLAG_TRANSLUCENT_STATUS);

  LWindow.setFlags(TJWindowManager_LayoutParams.JavaClass.FLAG_LAYOUT_NO_LIMITS,
                   TJWindowManager_LayoutParams.JavaClass.FLAG_LAYOUT_NO_LIMITS);
end;

class procedure tLibraryAndroid.Vibrar (Intervalo : integer);
Var
  Vibrar : JVibrator;
begin
  vibrar := TJVibrator.Wrap((TAndroidHelper.Context.getSystemService(TJContext.JavaClass.VIBRATOR_SERVICE) as ILocalObject).GetObjectID);
  Vibrar.vibrate(Intervalo);
end;

end.
