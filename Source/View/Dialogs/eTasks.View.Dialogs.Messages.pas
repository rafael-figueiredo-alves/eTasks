unit eTasks.View.Dialogs.Messages;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, eTasks.View.Dialogs.Messages.Consts,
  FMX.Ani;

type
  TipoAcao = (taBotao, taFundo);

  TDlg_Login_messages = class(TForm)
    Lay_dlg_messages: TLayout;
    RecEscurecer: TRectangle;
    Lay_caixa_msg: TLayout;
    RecDesignCaixa: TRectangle;
    Container_Img: TLayout;
    Container_principal: TLayout;
    Container_botao: TLayout;
    Img_message: TImage;
    Button_message: TImage;
    Text_message: TLabel;
    Img_erro: TImage;
    Img_email: TImage;
    Img_sucesso: TImage;
    Btn_comecar: TImage;
    btn_entendi: TImage;
    AnimaFundo: TFloatAnimation;
    AnimaDialogo: TFloatAnimation;
    procedure Button_messageClick(Sender: TObject);
    procedure RecEscurecerClick(Sender: TObject);
    procedure AnimaFundoFinish(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FTipoMensagem : tTipoMensagem;
    FAcaoBotao    : TProc;
    FAcaoFundo    : TProc;
    FTipoAcao     : TipoAcao;
  public
    { Public declarations }
    Function Exibe : TLayout;
    Function AcaoBotao (Value : TProc) : TDlg_Login_messages;
    Function AcaoFundo (Value : TProc) : TDlg_Login_messages;
    Function TipoMensagem (Value : tTipoMensagem) : TDlg_Login_messages;
    Procedure Fechar;
  end;

var
  Dlg_Login_messages: TDlg_Login_messages;

implementation

{$R *.fmx}

{ TDlg_Login_messages }

function TDlg_Login_messages.AcaoBotao(Value: TProc): TDlg_Login_messages;
begin
  Result := Self;
  FAcaoBotao := value;
end;

function TDlg_Login_messages.AcaoFundo(Value: TProc): TDlg_Login_messages;
begin
   Result := Self;
   FAcaoFundo := value;
end;

procedure TDlg_Login_messages.AnimaFundoFinish(Sender: TObject);
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

procedure TDlg_Login_messages.Button_messageClick(Sender: TObject);
begin
  FTipoAcao := taBotao;
  AnimaDialogo.Inverse := True;
  AnimaFundo.Inverse := True;
  AnimaDialogo.Start;
  AnimaFundo.Start;
end;

function TDlg_Login_messages.Exibe: TLayout;
{$ifdef MSWindows}
var
  FMargem : single;
{$endif}
begin
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

procedure TDlg_Login_messages.Fechar;
begin
  Self.RecEscurecerClick(self);
end;

procedure TDlg_Login_messages.FormCreate(Sender: TObject);
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

procedure TDlg_Login_messages.RecEscurecerClick(Sender: TObject);
begin
  FTipoAcao := taFundo;
  AnimaDialogo.Inverse := True;
  AnimaFundo.Inverse := True;
  AnimaDialogo.Start;
  AnimaFundo.Start;
end;

function TDlg_Login_messages.TipoMensagem(
  Value: tTipoMensagem): TDlg_Login_messages;
begin
  Result := Self;
  FTipoMensagem := Value;
  case FTipoMensagem of
    tpmErro_senha: Begin
                    Img_message.Bitmap    := Img_erro.Bitmap;
                    Button_message.Bitmap := btn_entendi.Bitmap;
                    Text_message.Text     := ErroSenhaLogin;
                   end;
    tpmErro_email: Begin
                    Img_message.Bitmap    := Img_erro.Bitmap;
                    Button_message.Bitmap := btn_entendi.Bitmap;
                    Text_message.Text     := ErroEmailLogin;
                   end;
    tpmErro_brancologin: Begin
                          Img_message.Bitmap    := Img_erro.Bitmap;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                          Text_message.Text     := ErroBrancoLogin;
                         end;
    tpmErro_senha_cad: Begin
                        Img_message.Bitmap    := Img_erro.Bitmap;
                        Button_message.Bitmap := btn_entendi.Bitmap;
                        Text_message.Text     := ErroSenhaCad;
                       end;
    tpmErro_email_cad: Begin
                        Img_message.Bitmap    := Img_erro.Bitmap;
                        Button_message.Bitmap := btn_entendi.Bitmap;
                        Text_message.Text     := ErroEmailCad;
                       end;
    tpm_branco_cad: Begin
                      Img_message.Bitmap    := Img_erro.Bitmap;
                      Button_message.Bitmap := btn_entendi.Bitmap;
                      Text_message.Text     := ErroBrancoCad;
                    end;
    tpmEnvioEmail: Begin
                    Img_message.Bitmap    := Img_email.Bitmap;
                    Button_message.Bitmap := btn_entendi.Bitmap;
                    Text_message.Text     := EnvioEmail;
                   end;
    tpmSucessoConta: Begin
                      Img_message.Bitmap    := Img_sucesso.Bitmap;
                      Button_message.Bitmap := Btn_comecar.Bitmap;
                      Text_message.Text     := SucessoConta;
                     end;
  end;
end;

end.
