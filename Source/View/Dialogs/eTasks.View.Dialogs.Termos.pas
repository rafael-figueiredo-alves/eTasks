unit eTasks.View.Dialogs.Termos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.Ani,
  FMX.Memo.Types;

type
  TDlg_Termos = class(TForm)
    Lay_dlg_termos: TLayout;
    RecEscurecer: TRectangle;
    Lay_caixa_msg: TLayout;
    RecDesignCaixa: TRectangle;
    Container_principal: TLayout;
    Lay_topo: TLayout;
    Img_logo_termos: TImage;
    Img_titulo_termos: TImage;
    Container_botao: TLayout;
    Button_message: TImage;
    Memo1: TMemo;
    AnimaFundo: TFloatAnimation;
    AnimaDialogo: TFloatAnimation;
    StyleBook1: TStyleBook;
    procedure RecEscurecerClick(Sender: TObject);
    procedure Button_messageClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AnimaFundoFinish(Sender: TObject);
  private
    { Private declarations }
    FAcaoBotao : TProc;
    FAcaoFundo : TProc;
  public
    { Public declarations }
    Function Exibe : TLayout;
    Function AcaoBotao (Value : TProc) : TDlg_Termos;
    Function AcaoFundo (Value : TProc) : TDlg_Termos;
    Procedure Fechar;
  end;

var
  Dlg_Termos: TDlg_Termos;

implementation

{$R *.fmx}

function TDlg_Termos.AcaoBotao(Value: TProc): TDlg_Termos;
begin
   Result := Self;
   FAcaoBotao := value;
end;

function TDlg_Termos.AcaoFundo(Value: TProc): TDlg_Termos;
begin
   Result := Self;
   FAcaoFundo := value;
end;

procedure TDlg_Termos.AnimaFundoFinish(Sender: TObject);
begin
   if AnimaFundo.Inverse = True then
    Self.DisposeOf;
end;

procedure TDlg_Termos.Button_messageClick(Sender: TObject);
begin
  if assigned(FAcaoBotao) then
   FAcaoBotao;
  AnimaDialogo.Inverse := True;
  AnimaFundo.Inverse := True;
  AnimaDialogo.Start;
  AnimaFundo.Start;
end;

function TDlg_Termos.Exibe: TLayout;
{$ifdef MSWindows}
var
  FMargem : single;
{$endif}
begin
   Result := Lay_dlg_termos;
  {$ifdef Mswindows}
  FMargem := (TForm(Self.Parent).Width - 320)/2;
  RecDesignCaixa.Margins.Left := FMargem;
  RecDesignCaixa.Margins.Right := FMargem;
  {$Endif}
   AnimaFundo.Start;
   AnimaDialogo.Start;
end;

procedure TDlg_Termos.Fechar;
begin
   Self.RecEscurecerClick(self);
end;

procedure TDlg_Termos.FormCreate(Sender: TObject);
{$ifdef Android}
var
 FMargem : single;
{$endif}
begin
  {$ifdef Android}
  FMargem := (Screen.Width - 320)/2;
  RecDesignCaixa.Margins.Left := FMargem;
  RecDesignCaixa.Margins.Right := FMargem;
  {$endif}
  AnimaDialogo.Inverse := False;
  AnimaFundo.Inverse := False;
end;

procedure TDlg_Termos.RecEscurecerClick(Sender: TObject);
begin
  if assigned(FAcaoFundo) then
   FAcaoFundo;
  AnimaDialogo.Inverse := True;
  AnimaFundo.Inverse := True;
  AnimaDialogo.Start;
  AnimaFundo.Start;
end;

end.
