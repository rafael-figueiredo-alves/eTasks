unit eTasks.Shared.Android.Utils;

interface

{$IFDEF ANDROID}

type

  tAndroidUtils = class
    Class Procedure TransparentNavBar;
  end;

{$endif}

implementation

{ tAndroidUtils }

{$IFDEF ANDROID}

uses
  AndroidApi.helpers,
  AndroidApi.JNI.App,
  AndroidApi.JNI.GraphicsContentViewText;

class procedure tAndroidUtils.TransparentNavBar;
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

{$endif ANDROID}

end.
