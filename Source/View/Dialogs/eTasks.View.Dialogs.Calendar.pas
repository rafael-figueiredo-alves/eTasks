unit eTasks.View.Dialogs.Calendar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Objects, FMX.Ani, FMX.Layouts;

type
 TipoAcao = (taBotao, taFundo);

  TDlg_Calendar = class(TForm)
    Lay_dlg_calendar: TLayout;
    RecEscurecer: TRectangle;
    AnimaFundo: TFloatAnimation;
    Lay_caixa_msg: TLayout;
    RecDesignCaixa: TRectangle;
    Container_principal: TLayout;
    Container_botao: TLayout;
    Button_message_selecionar: TImage;
    AnimaDialogo: TFloatAnimation;
    Button_message_cancelar: TImage;
    Layout_calendario: TLayout;
    procedure RecEscurecerClick(Sender: TObject);
    procedure AnimaFundoFinish(Sender: TObject);
    procedure Button_message_selecionarClick(Sender: TObject);
    procedure Button_message_cancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FAcaoBotao    : TProc;
    FAcaoFundo    : TProc;
    FTipoAcao     : TipoAcao;
    FData         : TDate;
    Procedure PegaData(value: TDate);
  public
    { Public declarations }
    Function Exibe : TLayout;
    Function AcaoBotao (Value : TProc) : TDlg_Calendar;
    Function AcaoFundo (Value : TProc) : TDlg_Calendar;
    Function Data (Value : TDate) : TDlg_calendar; overload;
    Function Data : TDate; overload;
    Procedure Fechar;
  end;

var
  Dlg_Calendar: TDlg_Calendar;

implementation

{$R *.fmx}

{ TDlg_Calendar }

Uses
 eTasks.View.Components.Calendario;

function TDlg_Calendar.AcaoBotao(Value: TProc): TDlg_Calendar;
begin
  Result := Self;
  FAcaoBotao := value;
end;

function TDlg_Calendar.AcaoFundo(Value: TProc): TDlg_Calendar;
begin
   Result := Self;
   FAcaoFundo := value;
end;

procedure TDlg_Calendar.AnimaFundoFinish(Sender: TObject);
begin
   if AnimaFundo.Inverse = True then
    begin
     case FTipoAcao of
       taBotao: begin
                 if Assigned(FAcaoBotao) then
                  FAcaoBotao;
                end;
       taFundo: begin
                 if Assigned(FAcaoFundo) then
                  FAcaoFundo;
                end;
     end;
     Self.DisposeOf;
    end;
end;

procedure TDlg_Calendar.Button_message_cancelarClick(Sender: TObject);
begin
  FTipoAcao := taFundo;
  AnimaDialogo.Inverse := True;
  AnimaFundo.Inverse := True;
  AnimaDialogo.Start;
  AnimaFundo.Start;
end;

procedure TDlg_Calendar.Button_message_selecionarClick(Sender: TObject);
begin
  FTipoAcao := taBotao;
  AnimaDialogo.Inverse := True;
  AnimaFundo.Inverse := True;
  AnimaDialogo.Start;
  AnimaFundo.Start;
end;

function TDlg_Calendar.Data: TDate;
begin
  Result := FData;
end;

function TDlg_Calendar.Data(Value: TDate): TDlg_calendar;
begin
  Result := Self;
  FData := Value;
end;

function TDlg_Calendar.Exibe: TLayout;
{$ifdef MSWindows}
var
  FMargem : single;
{$endif}
begin
  Result := Lay_dlg_calendar;
  {$ifdef Mswindows}
  FMargem := (TForm(Self.Parent).Width - 320)/2;
  RecDesignCaixa.Margins.Left := FMargem;
  RecDesignCaixa.Margins.Right := FMargem;
  {$Endif}
  AnimaFundo.Start;
  tCalendario.Create(Layout_calendario).EvSelecionaData(PegaData).Iniciar(FData, Layout_calendario);
  AnimaDialogo.Start;
end;

procedure TDlg_Calendar.Fechar;
begin
  Self.RecEscurecerClick(self);
end;

procedure TDlg_Calendar.FormCreate(Sender: TObject);
{$ifdef Android}
var
 FMargem : single;
{$endif}
begin
  {$ifdef ANdroid}
  FMargem := (Screen.Width - 320)/2;
  RecDesignCaixa.Margins.Left := FMargem;
  RecDesignCaixa.Margins.Right := FMargem;
  {$endif}
  AnimaDialogo.Inverse := False;
  AnimaFundo.Inverse := False;
  FTipoAcao := taFundo;
end;

procedure TDlg_Calendar.PegaData(value: TDate);
begin
  FData := value;
end;

procedure TDlg_Calendar.RecEscurecerClick(Sender: TObject);
begin
  FTipoAcao := taFundo;
  AnimaDialogo.Inverse := True;
  AnimaFundo.Inverse := True;
  AnimaDialogo.Start;
  AnimaFundo.Start;
end;

end.
