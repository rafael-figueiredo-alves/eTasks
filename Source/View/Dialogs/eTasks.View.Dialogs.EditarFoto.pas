unit eTasks.View.Dialogs.EditarFoto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm_Editar_foto = class(TForm)
    BarraInferior: TLayout;
    Btn_Girar_esquerda: TImage;
    Btn_Cancelar: TImage;
    Btn_aceitar: TImage;
    Btn_girar_direita: TImage;
    Editar_foto: TImage;
    Layout_visualiza: TLayout;
    Visualiza_circle: TCircle;
    Label_visualiza: TLabel;
    Corte_foto: TSelection;
    SombraInferior: TRectangle;
    SombraSuperior: TRectangle;
    SombraEsquerda: TRectangle;
    SombraDireita: TRectangle;
    procedure Btn_Girar_esquerdaClick(Sender: TObject);
    procedure Btn_girar_direitaClick(Sender: TObject);
    procedure Btn_CancelarClick(Sender: TObject);
    procedure Btn_aceitarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Corte_fotoChange(Sender: TObject);
    procedure Corte_fotoResize(Sender: TObject);
    procedure Corte_fotoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure Captura;
    Procedure SombraAjuste;
  public
    { Public declarations }
    Foto : TBitmap;
  end;

var
  Form_Editar_foto: TForm_Editar_foto;

implementation

{$R *.fmx}

{$IfDEF Android}
Uses
  eTasks.libraries.Android;
{$endif}

procedure TForm_Editar_foto.Btn_aceitarClick(Sender: TObject);
begin
   Foto := Visualiza_circle.Fill.Bitmap.Bitmap;
   ModalResult := mrOk;
end;

procedure TForm_Editar_foto.Btn_CancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TForm_Editar_foto.Btn_girar_direitaClick(Sender: TObject);
begin
   Editar_foto.Bitmap.Rotate(90);
   Captura;
end;

procedure TForm_Editar_foto.Btn_Girar_esquerdaClick(Sender: TObject);
begin
   Editar_foto.Bitmap.Rotate(-90);
   Captura;
end;

procedure TForm_Editar_foto.Captura;
Var
 bmp : TBitmap;
 xScale, yScale : Extended;
 Corte : TRect;
begin
  bmp := TBitmap.Create;
  xScale := Editar_foto.Bitmap.Width / Editar_foto.Width;
  yScale := Editar_foto.Bitmap.Height / Editar_foto.Height;
  try
    bmp.Width    := Round(Corte_foto.Width * xScale);
    bmp.Height   := Round(Corte_foto.Height * yScale);
    Corte.Left   := Round(Corte_foto.Position.X * xScale);
    Corte.Top    := Round(Corte_foto.Position.y * yScale);
    Corte.Width  := Round(Corte_foto.Width * xScale);
    Corte.Height := Round(Corte_foto.Height * yScale);
    bmp.CopyFromBitmap(Editar_foto.Bitmap, Corte, 0, 0);
    Visualiza_circle.Fill.Bitmap.Bitmap := bmp;
  finally
    bmp.DisposeOf;
  end;
end;

procedure TForm_Editar_foto.Corte_fotoChange(Sender: TObject);
begin
  Captura;
  SombraAjuste;
end;

procedure TForm_Editar_foto.Corte_fotoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Single);
begin
  SombraAjuste;
end;

procedure TForm_Editar_foto.Corte_fotoResize(Sender: TObject);
begin
   SombraAjuste;
end;

procedure TForm_Editar_foto.FormCreate(Sender: TObject);
begin
   {$Ifdef Android}
   tlibraryAndroid.TransparentNavBar;
   {$endif}
end;

procedure TForm_Editar_foto.FormShow(Sender: TObject);
begin
   Captura;
   SombraAjuste;
end;

procedure TForm_Editar_foto.SombraAjuste;
begin
   //Sombra superior
   SombraSuperior.Width      := Editar_foto.Width;
   SombraSuperior.Position.X := 0;
   SombraSuperior.Position.Y := 0;
   SombraSuperior.Height     := Corte_foto.Position.Y;

   //Sombra Inferior
   SombraInferior.Width      := Editar_foto.Width;
   SombraInferior.Position.X := 0;
   SombraInferior.Position.Y := Corte_foto.Position.Y + Corte_foto.Height;
   SombraInferior.Height     := Editar_foto.Height - SombraInferior.Position.y;

   //Sombra esquerda
   SombraEsquerda.Width      := Corte_foto.Position.X;
   SombraEsquerda.Position.X := 0;
   SombraEsquerda.Position.Y := SombraSuperior.Height;
   SombraEsquerda.Height     := Corte_foto.Height;

   //Sombra direita
   SombraDireita.Width      := Editar_foto.Width - (Corte_foto.Position.x + Corte_foto.Width);
   SombraDireita.Position.X := Corte_foto.Position.x + Corte_foto.Width;
   SombraDireita.Position.Y := SombraSuperior.Height;
   SombraDireita.Height     := Corte_foto.Height;
end;

end.
