unit eTasks.View.Dialogs.TirarFoto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Media, FMX.Effects, FMX.Layouts, fmx.platform;

type
  TForm_Camera = class(TForm)
    Camera: TCameraComponent;
    Btn_voltar: TImage;
    Imagem_camera: TImage;
    Barra_inferior: TLayout;
    Btn_TirarFoto: TCircle;
    ShadowEffect1: TShadowEffect;
    Btn_trocaCamera: TImage;
    Btn_flash: TImage;
    FlashOn: TImage;
    FlashOff: TImage;
    FlashAuto: TImage;
    procedure Btn_voltarClick(Sender: TObject);
    procedure CameraSampleBufferReady(Sender: TObject; const ATime: TMediaTime);
    procedure FormCreate(Sender: TObject);
    procedure Btn_TirarFotoClick(Sender: TObject);
    procedure Btn_flashClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_trocaCameraClick(Sender: TObject);
  private
    { Private declarations }
    Procedure DesligarCamera;
    Procedure LigarCamera;
    Procedure TirarFoto;
    function AppEvent(AAppEvent: TApplicationEvent; AContext: TObject): Boolean;
  public
    { Public declarations }
    Imagem : TBitmap;
  end;

var
  Form_Camera: TForm_Camera;

implementation

{$R *.fmx}

{$ifdef Android}
 uses eTasks.libraries.Android;
{$Endif}

function TForm_Camera.AppEvent(AAppEvent: TApplicationEvent;
  AContext: TObject): Boolean;
begin
  Result := True;

  case AAppEvent of
    TApplicationEvent.WillBecomeInactive:
      TThread.Synchronize(tthread.Current, DesligarCamera);
    TApplicationEvent.EnteredBackground:
      TThread.Synchronize(tthread.Current, DesligarCamera);
    TApplicationEvent.WillTerminate:
      TThread.Synchronize(tthread.Current, DesligarCamera);
    TApplicationEvent.WillBecomeForeground:
      TThread.Synchronize(tthread.Current, LigarCamera);
    TApplicationEvent.BecameActive:
      TThread.Synchronize(tthread.Current, LigarCamera);
  end;
end;

procedure TForm_Camera.Btn_flashClick(Sender: TObject);
begin
  case Camera.FlashMode of
    TFlashMode.AutoFlash: begin
                           Camera.FlashMode := TFlashMode.FlashOff;
                           Btn_flash.Bitmap := FlashOff.Bitmap;
                          end;
    TFlashMode.FlashOff: begin
                           Camera.FlashMode := TFlashMode.FlashOn;
                           Btn_flash.Bitmap := FlashOn.Bitmap;
                          end;
    TFlashMode.FlashOn: begin
                           Camera.FlashMode := TFlashMode.AutoFlash;
                           Btn_flash.Bitmap := FlashAuto.Bitmap;
                        end;
  end;
end;

procedure TForm_Camera.Btn_TirarFotoClick(Sender: TObject);
begin
  Imagem := Imagem_camera.Bitmap;
  TThread.Synchronize(tthread.Current, DesligarCamera);
  ModalResult := mrOk;
  //Close;
end;

procedure TForm_Camera.Btn_trocaCameraClick(Sender: TObject);
begin
   case Camera.Kind of
     TCameraKind.FrontCamera: Camera.Kind := TCameraKind.BackCamera;
     TCameraKind.BackCamera:  Camera.Kind := TCameraKind.FrontCamera;
   end;
  if Camera.HasFlash = true then
   begin
    Camera.FlashMode := TFlashMode.AutoFlash;
    Btn_flash.Bitmap := FlashAuto.Bitmap;
    Btn_flash.Visible := true;
   end
  else
   Btn_flash.Visible       := false;
end;

procedure TForm_Camera.Btn_voltarClick(Sender: TObject);
begin
  TThread.Synchronize(tthread.Current, DesligarCamera);
  ModalResult := mrCancel;
end;

procedure TForm_Camera.CameraSampleBufferReady(Sender: TObject;
  const ATime: TMediaTime);
begin
  TThread.Synchronize(tthread.Current, TirarFoto);
end;

procedure TForm_Camera.DesligarCamera;
begin
  Camera.Active := False;
end;

procedure TForm_Camera.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   {$ifdef Android}
   TThread.Synchronize(tthread.Current, DesligarCamera);
   Action := TCloseAction.caFree;
   {$endif}
end;

procedure TForm_Camera.FormCreate(Sender: TObject);
var AppEventSvc: IFMXApplicationEventService;
begin
  {$ifdef Android}
  Imagem_camera.WrapMode := TImageWrapMode.Stretch;
  tlibraryAndroid.TransparentNavBar;
  Btn_trocaCamera.Visible := true;
  Camera.Kind := TCameraKind.FrontCamera;
  if Camera.HasFlash = true then
   begin
    Camera.FlashMode := TFlashMode.AutoFlash;
    Btn_flash.Bitmap := FlashAuto.Bitmap;
    Btn_flash.Visible := true;
   end
  else
   Btn_flash.Visible       := false;
  {$endif}
  {$ifdef MSWindows}
  Imagem_camera.WrapMode := TImageWrapMode.Fit;
  Btn_trocaCamera.Visible := False;
  Btn_flash.Visible       := False;
  {$endif}

  if TPlatformServices.Current.SupportsPlatformService(IFMXApplicationEventService, AppEventSvc) then
    AppEventSvc.SetApplicationEventHandler(AppEvent);

  TThread.Synchronize(tthread.Current, LigarCamera);
end;

procedure TForm_Camera.LigarCamera;
begin
  Camera.Active := True;
end;

procedure TForm_Camera.TirarFoto;
begin
  Camera.SampleBufferToBitmap(Imagem_camera.Bitmap, true);
end;

end.
