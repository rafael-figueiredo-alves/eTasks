unit eTasks.View.Dialogs.SheetFotos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Ani;

type
  TipoAcao = (taCamera, taGaleria, taFundo);

  TSheet_fotos = class(TForm)
    Lay_sheet_fotos: TLayout;
    RecEscurecer: TRectangle;
    Lay_caixa_msg: TLayout;
    RecDesignCaixa: TRectangle;
    Container_principal: TLayout;
    Layout1: TLayout;
    Image1: TImage;
    GridPanelLayout1: TGridPanelLayout;
    Btn_Galeria: TImage;
    Btn_foto: TImage;
    AnimaSheet: TFloatAnimation;
    AnimaFundo: TFloatAnimation;
    procedure FormCreate(Sender: TObject);
    procedure AnimaSheetFinish(Sender: TObject);
    procedure RecEscurecerClick(Sender: TObject);
    procedure Btn_GaleriaClick(Sender: TObject);
    procedure Btn_fotoClick(Sender: TObject);
  private
    { Private declarations }
    FAcaoFoto    : TProc;
    FAcaoGaleria : TProc;
    FAcaoFundo   : TProc;
    FTipoAcao    : TipoAcao;
  public
    { Public declarations }
    Function Exibe : TLayout;
    Function AcaoFoto (Value : TProc) :tsheet_fotos;
    Function AcaoGaleria (Value : TProc) :tsheet_fotos;
    Function AcaoFundo (Value : TProc) : Tsheet_Fotos;
    Procedure Fechar;
  end;

var
  Sheet_fotos: TSheet_fotos;

implementation

{$R *.fmx}

{ TSheet_fotos }

function TSheet_fotos.AcaoFoto(Value: TProc): tsheet_fotos;
begin
  Result := Self;
  FAcaoFoto := value;
end;

function TSheet_fotos.AcaoFundo(Value: TProc): Tsheet_Fotos;
begin
   Result := Self;
   FAcaoFundo := value;
end;

function TSheet_fotos.AcaoGaleria(Value: TProc): tsheet_fotos;
begin
 Result := Self;
 FAcaoGaleria := value;
end;

procedure TSheet_fotos.AnimaSheetFinish(Sender: TObject);
begin
   if AnimaSheet.Inverse = true then
    begin
     case FTipoAcao of
       taCamera: Begin
                  if Assigned(FAcaoFoto) then
                   FAcaoFoto;
                 End;
       taGaleria: Begin
                   if Assigned(FAcaoGaleria) then
                    FAcaoGaleria;
                  End;
       taFundo: Begin
                  if Assigned(FAcaoFundo) then
                   FAcaoFundo;
                End;
     end;
     Self.DisposeOf;
    end;
end;

procedure TSheet_fotos.Btn_fotoClick(Sender: TObject);
begin
  FTipoAcao := taCamera;
  AnimaSheet.Inverse := True;
  AnimaFundo.Inverse := True;
  AnimaSheet.Start;
  AnimaFundo.Start;
end;

procedure TSheet_fotos.Btn_GaleriaClick(Sender: TObject);
begin
  FTipoAcao := taGaleria;
  AnimaSheet.Inverse := True;
  AnimaFundo.Inverse := True;
  AnimaSheet.Start;
  AnimaFundo.Start;
end;

function TSheet_fotos.Exibe: TLayout;
begin
   {$ifdef MSWINDOWS}
   Lay_caixa_msg.Width := (TForm(Self.Parent)).Width;
   Lay_caixa_msg.Position.Y := (TForm(Self.Parent)).Height + 260;
   AnimaSheet.StartValue := Lay_caixa_msg.Position.Y;
   AnimaSheet.StopValue  := (TForm(Self.Parent)).Height - 260;
   {$Endif}
   Result := Lay_sheet_fotos;
   AnimaFundo.Start;
   AnimaSheet.Start;
end;

procedure TSheet_fotos.Fechar;
begin
   Self.RecEscurecerClick(self);
end;

procedure TSheet_fotos.FormCreate(Sender: TObject);
begin
    {$ifdef Android}
    Lay_caixa_msg.Width := Screen.Width;
    Lay_caixa_msg.Position.Y := Screen.Height + 240;
    AnimaSheet.StartValue := Lay_caixa_msg.Position.Y;
    AnimaSheet.StopValue  := Screen.Height - 240;
    {$endif}
    AnimaSheet.Inverse := False;
    AnimaFundo.Inverse := False;
    FTipoAcao := taFundo;
    Lay_caixa_msg.Align := TAlignLayout.None;
end;

procedure TSheet_fotos.RecEscurecerClick(Sender: TObject);
begin
  FTipoAcao := taFundo;
  AnimaSheet.Inverse := True;
  AnimaFundo.Inverse := True;
  AnimaSheet.Start;
  AnimaFundo.Start;
end;

end.
