unit eTasks.libraries.Android;

interface

Uses System.sysutils;

Type

 tLibraryAndroid = Class
   Class Procedure TransparentNavBar;
   Class Procedure Vibrar (Intervalo : integer);
   Class procedure Permissao;
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
  System.Permissions;

class procedure tLibraryAndroid.Permissao;
Var
  FPermissaoReadStorage   : String;
  FPermissaoCamera       : String;
  FPermissaoWriteStorage : string;
begin
  FPermissaoCamera := JStringToString(TJManifest_permission.JavaClass.CAMERA);
  FPermissaoReadStorage := JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
  FPermissaoWriteStorage := JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
  PermissionsService.RequestPermissions([FPermissaoCamera, FPermissaoReadStorage, FPermissaoWriteStorage], nil, nil)
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
