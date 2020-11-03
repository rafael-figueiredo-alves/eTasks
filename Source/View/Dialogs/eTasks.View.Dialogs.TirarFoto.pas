unit eTasks.View.Dialogs.TirarFoto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Media, FMX.Effects, FMX.Layouts;

type
  TForm_Camera = class(TForm)
    Camera: TCameraComponent;
    Btn_voltar: TImage;
    Imagem_camera: TImage;
    Barra_inferior: TLayout;
    Btn_TirarFoto: TCircle;
    ShadowEffect1: TShadowEffect;
    procedure Btn_voltarClick(Sender: TObject);
    procedure CameraSampleBufferReady(Sender: TObject; const ATime: TMediaTime);
    procedure FormCreate(Sender: TObject);
    procedure Btn_TirarFotoClick(Sender: TObject);
  private
    { Private declarations }
    Procedure DesligarCamera;
    Procedure LigarCamera;
    Procedure TirarFoto;
  public
    { Public declarations }
    Imagem : TBitmap;
  end;

var
  Form_Camera: TForm_Camera;

implementation

{$R *.fmx}

procedure TForm_Camera.Btn_TirarFotoClick(Sender: TObject);
begin
  ModalResult := mrOk;
  Imagem := Imagem_camera.Bitmap;
  TThread.Synchronize(tthread.Current, DesligarCamera);
  //Close;
end;

procedure TForm_Camera.Btn_voltarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  TThread.Synchronize(tthread.Current, DesligarCamera);
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

procedure TForm_Camera.FormCreate(Sender: TObject);
begin
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
