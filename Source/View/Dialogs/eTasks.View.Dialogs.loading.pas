unit eTasks.View.Dialogs.loading;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm_loading = class(TForm)
    Lay_loading: TLayout;
    RecEscurecer: TRectangle;
    AnimaFundo: TFloatAnimation;
    Lay_centro: TLayout;
    LabelMensagem: TLabel;
    ArcoAzul: TArc;
    AnimaArcoAzul: TFloatAnimation;
    ArcoAmarelo: TArc;
    AnimaArcoAmarelo: TFloatAnimation;
    procedure AnimaFundoFinish(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FMensagem  : string;
    FAcaoLimpa : TProc;
  public
    { Public declarations }
    Function Exibe : TLayout;
    Function Mensagem (Value: String) : tform_loading;
    Function AcaoLimpa (Value: TProc) : tform_loading;
    procedure Fechar;
  end;

var
  Form_loading: TForm_loading;

implementation

{$R *.fmx}

{ TForm_loading }

function TForm_loading.AcaoLimpa(Value: TProc): tform_loading;
begin
   Result := Self;
   FAcaoLimpa := value;
end;

procedure TForm_loading.AnimaFundoFinish(Sender: TObject);
begin
  if AnimaFundo.Inverse = true then
  begin
   FAcaoLimpa;
   Self.DisposeOf;
  end;
end;

function TForm_loading.Exibe: TLayout;
begin
  Result := Lay_loading;
  LabelMensagem.Text := FMensagem;
  AnimaFundo.Start;
  AnimaArcoAzul.Start;
  AnimaArcoAmarelo.Start;
end;

procedure TForm_loading.Fechar;
begin
   AnimaFundo.Inverse := True;
   AnimaFundo.Start;
end;

procedure TForm_loading.FormCreate(Sender: TObject);
begin
   AnimaFundo.Inverse := False;
end;

function TForm_loading.Mensagem(Value: String): tform_loading;
begin
  Result := Self;
  FMensagem := Value;
end;

end.
