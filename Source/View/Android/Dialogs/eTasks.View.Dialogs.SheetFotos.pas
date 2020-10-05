unit eTasks.View.Dialogs.SheetFotos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Ani;

type
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
    procedure FormCreate(Sender: TObject);
    procedure AnimaSheetFinish(Sender: TObject);
    procedure RecEscurecerClick(Sender: TObject);
    procedure Btn_GaleriaClick(Sender: TObject);
    procedure Btn_fotoClick(Sender: TObject);
  private
    { Private declarations }
    FAcaoFoto    : TProc;
    FAcaoGaleria : TProc;
  public
    { Public declarations }
    Function Exibe : TLayout;
    Function AcaoFoto (Value : TProc) :tsheet_fotos;
    Function AcaoGaleria (Value : TProc) :tsheet_fotos;
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

function TSheet_fotos.AcaoGaleria(Value: TProc): tsheet_fotos;
begin
 Result := Self;
 FAcaoGaleria := value;
end;

procedure TSheet_fotos.AnimaSheetFinish(Sender: TObject);
begin
   if AnimaSheet.Inverse = true then
    Self.DisposeOf;
end;

procedure TSheet_fotos.Btn_fotoClick(Sender: TObject);
begin
  if Assigned(FAcaoFoto) then
   FAcaoFoto;
  AnimaSheet.Inverse := True;
  AnimaSheet.Start;
end;

procedure TSheet_fotos.Btn_GaleriaClick(Sender: TObject);
begin
  if Assigned(FAcaoGaleria) then
   FAcaoGaleria;
  AnimaSheet.Inverse := True;
  AnimaSheet.Start;
end;

function TSheet_fotos.Exibe: TLayout;
begin
   Result := Lay_sheet_fotos;
   AnimaSheet.Start;
end;

procedure TSheet_fotos.FormCreate(Sender: TObject);
begin
    Lay_caixa_msg.Position.Y := Screen.Height + 240;
    AnimaSheet.StartValue := Lay_caixa_msg.Position.Y;
    AnimaSheet.StopValue  := Screen.Height - 240;
    AnimaSheet.Inverse := False;
    Lay_caixa_msg.Align := TAlignLayout.None;
end;

procedure TSheet_fotos.RecEscurecerClick(Sender: TObject);
begin
    AnimaSheet.Inverse := True;
    AnimaSheet.Start;
end;

end.
