unit eTasks.View.Android.login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Objects, FMX.Effects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  FMX.Edit;

type
  TForm_Android_Login = class(TForm)
    Nav_Tela_Login: TTabControl;
    TabInicio: TTabItem;
    TabLogin: TTabItem;
    TabCriarConta: TTabItem;
    TabEsqueciSenha: TTabItem;
    Img_Banner_top_TabInicio: TImage;
    Img_TabInicio_texto_titulo: TImage;
    Img_TabInicio_textoPrincipal: TImage;
    Btn_efetuar_login: TRoundRect;
    Sombra_btn_efetuar_login: TShadowEffect;
    Label_btn_efetuar_login: TLabel;
    Btn_criar_conta: TRoundRect;
    Sombra_Criar_conta: TShadowEffect;
    Label_btn_criar_conta: TLabel;
    Img_Logo_login: TImage;
    Login_rect_user: TRoundRect;
    Sombra_login_rect_user: TShadowEffect;
    Img_UI_user_login: TImage;
    Layout_Edt_Login_user: TLayout;
    Edit_Login_email: TEdit;
    Estilos_Login: TStyleBook;
    Layout_edt_Login_password: TLayout;
    Rect_login_password: TRoundRect;
    Sombra_edt_login_password: TShadowEffect;
    Img_login_password: TImage;
    Edit_Login_Password: TEdit;
    Btn_Login_mostrar_senha: TImage;
    Btn_esqueci_conta: TLabel;
    Btn_Entrar: TRoundRect;
    ShadowEffect1: TShadowEffect;
    Label_entrar: TLabel;
    Link_criar_conta: TImage;
    Foto_usuario: TCircle;
    Layout_edt_criar_nome: TLayout;
    Rect_criar_conta_nome: TRoundRect;
    ShadowEffect2: TShadowEffect;
    Img_criar_conta_nome: TImage;
    Edit_criar_conta_nome: TEdit;
    Layout_criar_conta_email: TLayout;
    Rect_criar_conta_email: TRoundRect;
    ShadowEffect3: TShadowEffect;
    Img_criar_conta_email: TImage;
    Edit_Criar_conta_email: TEdit;
    Layout_criar_conta_senha: TLayout;
    Rect_criar_conta_senha: TRoundRect;
    ShadowEffect4: TShadowEffect;
    Img_criar_conta_senha: TImage;
    Edit_criar_conta_senha: TEdit;
    Btn_Criar_conta_mostar_senha: TImage;
    Btn_criar_conta_criar: TRoundRect;
    ShadowEffect5: TShadowEffect;
    Label_criar_conta: TLabel;
    Btn_Termos_privacidade: TImage;
    Banner_esqueci_conta: TImage;
    Img_texto_esqueci_conta: TImage;
    Layout_esqueci_conta_email: TLayout;
    Rect_esqueci_conta_email: TRoundRect;
    ShadowEffect6: TShadowEffect;
    Img_esqueci_conta_email: TImage;
    Edit_esqueci_conta_email: TEdit;
    Btn_Esqueci_conta_enviar: TRoundRect;
    ShadowEffect7: TShadowEffect;
    Label_esqueci_conta_enviar: TLabel;
    Scroll_Esqueci_conta: TVertScrollBox;
    Btn_Esqueci_senha_Voltar: TImage;
    Scroll_criar_conta: TVertScrollBox;
    Img_CriarConta_voltar: TImage;
    Scroll_login: TVertScrollBox;
    procedure FormCreate(Sender: TObject);
    procedure Btn_efetuar_loginClick(Sender: TObject);
    procedure TabInicioClick(Sender: TObject);
    procedure Link_criar_contaClick(Sender: TObject);
    procedure Btn_Login_mostrar_senhaClick(Sender: TObject);
    procedure Img_CriarConta_voltarClick(Sender: TObject);
    procedure Btn_Criar_conta_mostar_senhaClick(Sender: TObject);
    procedure Btn_Esqueci_senha_VoltarClick(Sender: TObject);
    procedure Btn_esqueci_contaClick(Sender: TObject);
    procedure Edit_esqueci_conta_emailEnter(Sender: TObject);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure Btn_criar_conta_criarClick(Sender: TObject);
    procedure Foto_usuarioClick(Sender: TObject);
    procedure Edit_criar_conta_nomeEnter(Sender: TObject);
    procedure Edit_Criar_conta_emailEnter(Sender: TObject);
    procedure Edit_criar_conta_senhaEnter(Sender: TObject);
    procedure Edit_Login_emailEnter(Sender: TObject);
    procedure Edit_Login_PasswordEnter(Sender: TObject);
    procedure Btn_criar_contaClick(Sender: TObject);
    procedure Btn_EntrarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure AjustarScroll (controle: TLayout);
  public
    { Public declarations }
  end;

var
  Form_Android_Login: TForm_Android_Login;

implementation

{$R *.fmx}

Uses
  eTasks.Libraries.Android, eTasks.View.Android.main;

procedure TForm_Android_Login.AjustarScroll (controle: TLayout);
begin
   case Nav_Tela_Login.ActiveTab.Index of
   1: Begin
      Scroll_login.Margins.Bottom := 230;
      Scroll_login.ViewportPosition := PointF(Scroll_login.ViewportPosition.X,
                                                      Controle.Position.Y-40);
      End;
   2: Begin
      Scroll_criar_conta.Margins.Bottom := 230;
      Scroll_criar_conta.ViewportPosition := PointF(Scroll_criar_conta.ViewportPosition.X,
                                                      Controle.Position.Y-40);
      End;
   3: Begin
      Scroll_Esqueci_conta.Margins.Bottom := 250;
      Scroll_Esqueci_conta.ViewportPosition := PointF(Scroll_Esqueci_conta.ViewportPosition.X,
                                                      Controle.Position.Y-90);
      End;
   end;
end;

procedure TForm_Android_Login.Btn_criar_contaClick(Sender: TObject);
begin
  Nav_Tela_Login.GotoVisibleTab(2);
end;

procedure TForm_Android_Login.Btn_criar_conta_criarClick(Sender: TObject);
begin
    FormVirtualKeyboardHidden(sender, false, bounds);
end;

procedure TForm_Android_Login.Btn_Criar_conta_mostar_senhaClick(
  Sender: TObject);
begin
    Edit_criar_conta_senha.Password := not Edit_criar_conta_senha.Password;
end;

procedure TForm_Android_Login.Btn_efetuar_loginClick(Sender: TObject);
begin
    FormVirtualKeyboardHidden(sender, false, Bounds);
    Nav_Tela_Login.GotoVisibleTab(1);
end;

procedure TForm_Android_Login.Btn_EntrarClick(Sender: TObject);
begin
     FormVirtualKeyboardHidden(sender, false, bounds);
     Application.CreateForm(TForm_Android_main, Form_Android_Main);
     Application.MainForm := Form_Android_main;
     Form_Android_main.Show;
     Close;
end;

procedure TForm_Android_Login.Btn_esqueci_contaClick(Sender: TObject);
begin
   FormVirtualKeyboardHidden(sender, false, bounds);
   Nav_Tela_Login.GotoVisibleTab(3);
end;

procedure TForm_Android_Login.Btn_Esqueci_senha_VoltarClick(Sender: TObject);
begin
   FormVirtualKeyboardHidden(sender, false, Bounds);
   Nav_Tela_Login.GotoVisibleTab(1);
end;

procedure TForm_Android_Login.Btn_Login_mostrar_senhaClick(Sender: TObject);
begin
   Edit_Login_Password.Password := not Edit_Login_Password.Password;
end;

procedure TForm_Android_Login.Edit_Criar_conta_emailEnter(Sender: TObject);
begin
    AjustarScroll(Layout_criar_conta_email);
end;

procedure TForm_Android_Login.Edit_criar_conta_nomeEnter(Sender: TObject);
begin
    AjustarScroll(Layout_edt_criar_nome);
end;

procedure TForm_Android_Login.Edit_criar_conta_senhaEnter(Sender: TObject);
begin
   AjustarScroll(Layout_criar_conta_senha);
end;

procedure TForm_Android_Login.Edit_esqueci_conta_emailEnter(Sender: TObject);
begin
    AjustarScroll (Layout_esqueci_conta_email);
end;

procedure TForm_Android_Login.Edit_Login_emailEnter(Sender: TObject);
begin
    AjustarScroll(Layout_Edt_Login_user);
end;

procedure TForm_Android_Login.Edit_Login_PasswordEnter(Sender: TObject);
begin
   AjustarScroll(Layout_edt_Login_password);
end;

procedure TForm_Android_Login.FormCreate(Sender: TObject);
begin
   tLibraryAndroid.TransparentNavBar;
   Nav_Tela_Login.ActiveTab := TabInicio;
end;

procedure TForm_Android_Login.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
   case Nav_Tela_Login.ActiveTab.Index of
   1: begin
        Scroll_Login.Margins.Bottom := 0;
        Scroll_Login.ViewportPosition := PointF(Scroll_Login.ViewportPosition.X,
                                                        0);
      end;
   2: begin
        Scroll_criar_conta.Margins.Bottom := 0;
        Scroll_criar_conta.ViewportPosition := PointF(Scroll_criar_conta.ViewportPosition.X,
                                                        0);
      end;
   3: begin
        Scroll_Esqueci_conta.Margins.Bottom := 0;
        Scroll_Esqueci_conta.ViewportPosition := PointF(Scroll_Esqueci_conta.ViewportPosition.X,
                                                        0);
      end;
   end;
end;

procedure TForm_Android_Login.Foto_usuarioClick(Sender: TObject);
begin
   FormVirtualKeyboardHidden(sender, false, bounds);
end;

procedure TForm_Android_Login.Link_criar_contaClick(Sender: TObject);
begin
   Nav_Tela_Login.GotoVisibleTab(2);
end;

procedure TForm_Android_Login.Img_CriarConta_voltarClick(Sender: TObject);
begin
   FormVirtualKeyboardHidden(sender, false, bounds);
   Nav_Tela_Login.GotoVisibleTab(1);
end;

procedure TForm_Android_Login.TabInicioClick(Sender: TObject);
begin
    Nav_Tela_Login.GotoVisibleTab(2);
end;

end.
