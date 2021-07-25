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
    Img_conta_invalida: TImage;
    Img_Permissao_solicita: TImage;
    Img_Permissao_negada: TImage;
    Img_Email_invalido: TImage;
    Img_senha_invalida: TImage;
    Img_Tasks_OK: TImage;
    Img_Task_Delete: TImage;
    Img_Goals_Delete: TImage;
    Img_Goals_OK: TImage;
    Img_Lists_delete: TImage;
    Img_lists_OK: TImage;
    Img_Categorias_Delete: TImage;
    Img_Categorias_OK: TImage;
    Img_No_updates: TImage;
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
    //Mensagens referentes ao Login
    tpmErro_login_Senha:
                        begin
                          Img_message.Bitmap    := Img_conta_invalida.Bitmap;
                          Text_message.Text     := Erro_Senha_Login;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmErro_login_Email:
                        begin
                          Img_message.Bitmap    := Img_conta_invalida.Bitmap;
                          Text_message.Text     := Erro_Email_Login;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmBranco_login_email:
                        begin
                          Img_message.Bitmap    := Img_erro.Bitmap;
                          Text_message.Text     := Branco_Email_Login;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmBranco_login_senha:
                        begin
                          Img_message.Bitmap    := Img_erro.Bitmap;
                          Text_message.Text     := Branco_Senha_Login;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmInvalido_login_email:
                        begin
                          Img_message.Bitmap    := Img_Email_invalido.Bitmap;
                          Text_message.Text     := Invalido_email_login;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmInvalido_login_senha:
                        begin
                          Img_message.Bitmap    := Img_senha_invalida.Bitmap;
                          Text_message.Text     := Invalido_senha_login;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmUsuario_desativado_login:
                        begin
                          Img_message.Bitmap    := Img_erro.Bitmap;
                          Text_message.Text     := Usuario_desativado;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;

    //Mensagens referentes ao resetamento de senha
    tpmErro_resetar_email:
                        begin
                          Img_message.Bitmap    := Img_erro.Bitmap;
                          Text_message.Text     := Erro_resetar_senha;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmInvalido_resetar_email:
                        begin
                          Img_message.Bitmap    := Img_Email_invalido.Bitmap;
                          Text_message.Text     := Invalido_email_resetar;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmBranco_resetar_email:
                        begin
                          Img_message.Bitmap    := Img_erro.Bitmap;
                          Text_message.Text     := Branco_email_resetar;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmSucesso_resetar:
                        begin
                          Img_message.Bitmap    := Img_email.Bitmap;
                          Text_message.Text     := Sucesso_resetar_senha;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;

    //Mensagens referentes as permissões de acesso a câmera e galeria
    tpmPermissao_solicitar_camera:
                        begin
                          Img_message.Bitmap    := Img_Permissao_solicita.Bitmap;
                          Text_message.Text     := Permissao_solicitar_camera;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmPermissao_negada_camera:
                          begin
                          Img_message.Bitmap    := Img_Permissao_negada.Bitmap;
                          Text_message.Text     := Permissao_negada_camera;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmPermissao_solicitar_galeria:
                        begin
                          Img_message.Bitmap    := Img_Permissao_solicita.Bitmap;
                          Text_message.Text     := Permissao_solicitar_galeria;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmPermissao_negada_galeria:
                        begin
                          Img_message.Bitmap    := Img_Permissao_negada.Bitmap;
                          Text_message.Text     := Permissao_negada_galeria;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;

    //Mensagens referentes a criação de conta de usuário
    tpmErro_criar_conta:
                        begin
                          Img_message.Bitmap    := Img_erro.Bitmap;
                          Text_message.Text     := Erro_criar_conta;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmBranco_criar_nome:
                        begin
                          Img_message.Bitmap    := Img_erro.Bitmap;
                          Text_message.Text     := Branco_nome_criar_conta;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmBranco_criar_email:
                        begin
                          Img_message.Bitmap    := Img_erro.Bitmap;
                          Text_message.Text     := Branco_email_criar_conta;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmBranco_criar_senha:
                        begin
                          Img_message.Bitmap    := Img_erro.Bitmap;
                          Text_message.Text     := Branco_senha_criar_conta;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmInvalido_criar_email:
                        begin
                          Img_message.Bitmap    := Img_Email_invalido.Bitmap;
                          Text_message.Text     := Invalido_email_criar_conta;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmInvalido_criar_senha:
                        begin
                          Img_message.Bitmap    := Img_senha_invalida.Bitmap;
                          Text_message.Text     := Invalido_senha_criar_conta;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmSucesso_criar_conta:
                        begin
                          Img_message.Bitmap    := Img_sucesso.Bitmap;
                          Text_message.Text     := Sucesso_criar_conta;
                          Button_message.Bitmap := Btn_comecar.Bitmap;
                        end;

    //Mensagens referentes a categorias
    tpmCategoria_Inserida:
                        begin
                          Img_message.Bitmap    := Img_Categorias_OK.Bitmap;
                          Text_message.Text     := categoria_Inserida;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmCategoria_editada:
                        begin
                          Img_message.Bitmap    := Img_Categorias_OK.Bitmap;
                          Text_message.Text     := categoria_editada;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmCategoria_apagada:
                        begin
                          Img_message.Bitmap    := Img_Categorias_Delete.Bitmap;
                          Text_message.Text     := categoria_apagada;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;

    //Mensagens referentes a Tasks
    tpmTasks_Inserida:
                        begin
                          Img_message.Bitmap    := Img_Tasks_OK.Bitmap;
                          Text_message.Text     := Tasks_Inserida;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmTasks_editada:
                        begin
                          Img_message.Bitmap    := Img_Tasks_OK.Bitmap;
                          Text_message.Text     := Tasks_editada;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmTasks_apagada:
                        begin
                          Img_message.Bitmap    := Img_Task_Delete.Bitmap;
                          Text_message.Text     := Tasks_apagada;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;

    //Mensagens referentes a Goals
    tpmGoals_Inserida:
                        begin
                          Img_message.Bitmap    := Img_Goals_OK.Bitmap;
                          Text_message.Text     := Goals_Inserida;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmGoals_editada:
                        begin
                          Img_message.Bitmap    := Img_Goals_OK.Bitmap;
                          Text_message.Text     := Goals_editada;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmGoals_apagada:
                        begin
                          Img_message.Bitmap    := Img_Goals_Delete.Bitmap;
                          Text_message.Text     := Goals_apagada;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;

    //Mensagens referentes a Lists
    tpmLists_Inserida:
                        begin
                          Img_message.Bitmap    := Img_lists_OK.Bitmap;
                          Text_message.Text     := Lists_Inserida;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmLists_editada:
                        begin
                          Img_message.Bitmap    := Img_lists_OK.Bitmap;
                          Text_message.Text     := Lists_editada;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
    tpmLists_apagada:
                        begin
                          Img_message.Bitmap    := Img_Lists_delete.Bitmap;
                          Text_message.Text     := Lists_apagada;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;

    tpmNo_Updates:
                        begin
                          Img_message.Bitmap    := Img_No_updates.Bitmap;
                          Text_message.Text     := No_updates;
                          Button_message.Bitmap := btn_entendi.Bitmap;
                        end;
  end;
end;

end.
