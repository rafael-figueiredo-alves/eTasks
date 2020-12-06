unit eTasks.View.Dialogs.dialogYesNo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Ani, FMX.Layouts;

type
  TipoAcao = (taBotaoYes, taBotaoNo, taFundo);

  TDialogYesNo = class(TForm)
    Lay_dlg_messages: TLayout;
    RecEscurecer: TRectangle;
    AnimaFundo: TFloatAnimation;
    Lay_caixa_msg: TLayout;
    RecDesignCaixa: TRectangle;
    Container_Img: TLayout;
    Img_message: TImage;
    Container_principal: TLayout;
    Container_botao: TLayout;
    Button_message_no: TImage;
    Text_message: TLabel;
    AnimaDialogo: TFloatAnimation;
    button_message_yes: TImage;
    procedure RecEscurecerClick(Sender: TObject);
    procedure Button_message_noClick(Sender: TObject);
    procedure button_message_yesClick(Sender: TObject);
    procedure AnimaFundoFinish(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FBtnYes   : TProc;
    FBtnNo    : TProc;
    FFundo    : TProc;
    FTipoAcao : TipoAcao;
  public
    { Public declarations }
    Function Exibe : TLayout;
    Function Messagem (Value : string) : TDialogYesNo;
    Function BtnYes   (Value : TProc ) : TDialogYesNo;
    Function BtnNo    (Value : TProc ) : TDialogYesNo;
    Function Fundo    (Value : TProc ) : TDialogYesNo;
    Procedure Fechar;
  end;

var
  DialogYesNo: TDialogYesNo;

implementation

{$R *.fmx}

{ TDialogYesNo }

procedure TDialogYesNo.AnimaFundoFinish(Sender: TObject);
begin
   if AnimaFundo.Inverse = True then
    begin
     case FTipoAcao of
       taBotaoYes: begin
                    if Assigned(FBtnYes) then
                     FBtnYes;
                   end;
       taBotaoNo: begin
                    if Assigned(FBtnNo) then
                     FBtnNo;
                   end;
       taFundo: begin
                 if Assigned(FFundo) then
                  FFundo;
                end;
     end;
     Self.DisposeOf;
    end;
end;

function TDialogYesNo.BtnNo(Value: TProc): TDialogYesNo;
begin
   Result := Self;
   FBtnNo := value;
end;

function TDialogYesNo.BtnYes(Value: TProc): TDialogYesNo;
begin
   Result  := Self;
   FBtnYes := value;
end;

procedure TDialogYesNo.Button_message_noClick(Sender: TObject);
begin
  FTipoAcao := taBotaoNo;
  AnimaDialogo.Inverse := True;
  AnimaFundo.Inverse := True;
  AnimaDialogo.Start;
  AnimaFundo.Start;
end;

procedure TDialogYesNo.button_message_yesClick(Sender: TObject);
begin
  FTipoAcao := taBotaoYes;
  AnimaDialogo.Inverse := True;
  AnimaFundo.Inverse := True;
  AnimaDialogo.Start;
  AnimaFundo.Start;
end;

function TDialogYesNo.Exibe: TLayout;
{$ifdef MSWindows}
var
  FMargem : single;
{$endif}
begin
  if (Length(Text_message.Text) < 90) then
   Lay_caixa_msg.Height := 110
  else
   if (Length(Text_message.Text) >= 90) and (Length(Text_message.Text) <= 200) then
    Lay_caixa_msg.Height := 150
   else
    Lay_caixa_msg.Height := 200;
  Result := Lay_dlg_messages;
  {$ifdef Mswindows}
  FMargem := (TForm(Self.Parent).Width - 320)/2;
  RecDesignCaixa.Margins.Left := FMargem;
  RecDesignCaixa.Margins.Right := FMargem;
  Text_message.TextSettings.Font.Size := 14;
  {$Endif}
  AnimaFundo.Start;
  AnimaDialogo.Start;
end;

procedure TDialogYesNo.Fechar;
begin
   Self.RecEscurecerClick(self);
end;

procedure TDialogYesNo.FormCreate(Sender: TObject);
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

function TDialogYesNo.Fundo(Value: TProc): TDialogYesNo;
begin
   Result := Self;
   FFundo := value;
end;

function TDialogYesNo.Messagem(Value: string): TDialogYesNo;
begin
   Result            := Self;
   Text_message.Text := Value;
end;

procedure TDialogYesNo.RecEscurecerClick(Sender: TObject);
begin
  FTipoAcao := taFundo;
  AnimaDialogo.Inverse := True;
  AnimaFundo.Inverse := True;
  AnimaDialogo.Start;
  AnimaFundo.Start;
end;

end.
