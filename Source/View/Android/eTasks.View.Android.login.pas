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
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure Btn_criar_contaClick(Sender: TObject);
    procedure Btn_EntrarClick(Sender: TObject);
    procedure FormFocusChanged(Sender: TObject);
    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure Nav_Tela_LoginChange(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Btn_Termos_privacidadeClick(Sender: TObject);
    procedure Foto_usuarioClick(Sender: TObject);
  private
    { Private declarations }
    FKBBounds: TRectF;
    FNeedOffset: Boolean;
    procedure CalcContentBoundsProc(Sender: TObject;
                                    var ContentBounds: TRectF);
    procedure RestorePosition;
    procedure UpdateKBBounds;
  public
    { Public declarations }
  end;

var
  Form_Android_Login: TForm_Android_Login;

implementation

{$R *.fmx}

Uses
  eTasks.Libraries.Android, eTasks.View.Android.main, System.Math, FMX.VirtualKeyboard, FMX.platform,
  eTasks.View.Dialogs.Factory, eTasks.View.Dialogs.Messages.Consts;

procedure TForm_Android_Login.Btn_criar_contaClick(Sender: TObject);
begin
  Nav_Tela_Login.GotoVisibleTab(2);
end;

procedure TForm_Android_Login.Btn_Criar_conta_mostar_senhaClick(
  Sender: TObject);
begin
    Edit_criar_conta_senha.Password := not Edit_criar_conta_senha.Password;
end;

procedure TForm_Android_Login.Btn_efetuar_loginClick(Sender: TObject);
begin
    Nav_Tela_Login.GotoVisibleTab(1);
end;

procedure TForm_Android_Login.Btn_EntrarClick(Sender: TObject);
begin
     {Application.CreateForm(TForm_Android_main, Form_Android_Main);
     Application.MainForm := Form_Android_main;
     Form_Android_main.Show;
     Close;}
     Form_Android_Login.AddObject(TViewDialogsMessages.New.DialogMessages.TipoMensagem(tpmSucessoConta).Exibe);
end;

procedure TForm_Android_Login.Btn_esqueci_contaClick(Sender: TObject);
begin
   Nav_Tela_Login.GotoVisibleTab(3);
end;

procedure TForm_Android_Login.Btn_Esqueci_senha_VoltarClick(Sender: TObject);
begin
   Nav_Tela_Login.GotoVisibleTab(1);
end;

procedure TForm_Android_Login.Btn_Login_mostrar_senhaClick(Sender: TObject);
begin
   Edit_Login_Password.Password := not Edit_Login_Password.Password;
end;

procedure TForm_Android_Login.Btn_Termos_privacidadeClick(Sender: TObject);
begin
  Form_Android_Login.AddObject(TViewDialogsMessages.New.DialogTermos.Exibe);
end;

procedure TForm_Android_Login.CalcContentBoundsProc(Sender: TObject;
  var ContentBounds: TRectF);
begin
  if FNeedOffset and (FKBBounds.Top > 0) then
  begin
    ContentBounds.Bottom := Max(ContentBounds.Bottom,
                                2 * ClientHeight - FKBBounds.Top);
  end;
end;

procedure TForm_Android_Login.FormCreate(Sender: TObject);
begin
   tLibraryAndroid.TransparentNavBar;
   Nav_Tela_Login.ActiveTab := TabInicio;
end;

procedure TForm_Android_Login.FormFocusChanged(Sender: TObject);
begin
    UpdateKBBounds;
end;

procedure TForm_Android_Login.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
Var FService : iFMXVirtualKeyboardService;
begin
   if (Key = vkHardwareBack) then
    begin
      TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
      if (FService <> Nil) and (TVirtualKeyboardState.Visible in FService.VirtualKeyboardState) then
       begin
         // Botão BACK pressionado e teclado vísivel, apenas fecha o teclad/o
       end
      else
       begin
         if (Nav_Tela_Login.ActiveTab = TabCriarConta) or (Nav_Tela_Login.ActiveTab = TabEsqueciSenha) then
          begin
            Key := 0;
            Nav_Tela_Login.GotoVisibleTab(1);
          end;
         end;
    end;
end;

procedure TForm_Android_Login.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
  FKBBounds.Create(0, 0, 0, 0);
  FNeedOffset := False;
  RestorePosition;
end;

procedure TForm_Android_Login.FormVirtualKeyboardShown(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
  FKBBounds := TRectF.Create(Bounds);
  FKBBounds.TopLeft := ScreenToClient(FKBBounds.TopLeft);
  FKBBounds.BottomRight := ScreenToClient(FKBBounds.BottomRight);
  UpdateKBBounds;
end;

procedure TForm_Android_Login.Foto_usuarioClick(Sender: TObject);
begin
  Form_Android_Login.AddObject(TViewDialogsMessages.New.SheetFotos.Exibe);
end;

procedure TForm_Android_Login.Link_criar_contaClick(Sender: TObject);
begin
   Nav_Tela_Login.GotoVisibleTab(2);
end;

procedure TForm_Android_Login.Nav_Tela_LoginChange(Sender: TObject);
var
  FScroll : TVertScrollBox;
begin

  case Nav_Tela_Login.TabIndex of
  1: FScroll := Scroll_login;
  2: FScroll := Scroll_criar_conta;
  3: FScroll := Scroll_Esqueci_conta;
  end;

  if Assigned(FScroll) then
   FScroll.OnCalcContentBounds := CalcContentBoundsProc;
end;

procedure TForm_Android_Login.RestorePosition;
Var FScroll : TVertScrollBox;
begin
  case Nav_Tela_Login.TabIndex of
  1: FScroll := Scroll_login;
  2: FScroll := Scroll_criar_conta;
  3: FScroll := Scroll_Esqueci_conta;
  end;

  FScroll.ViewportPosition := PointF(FScroll.ViewportPosition.X, 0);
  FScroll.RealignContent;
end;

procedure TForm_Android_Login.Img_CriarConta_voltarClick(Sender: TObject);
begin

   Nav_Tela_Login.GotoVisibleTab(1);
end;

procedure TForm_Android_Login.TabInicioClick(Sender: TObject);
begin
    Nav_Tela_Login.GotoVisibleTab(2);
end;

procedure TForm_Android_Login.UpdateKBBounds;
var
  LFocused : TControl;
  LFocusRect: TRectF;
  FScroll : TVertScrollBox;
begin
  case Nav_Tela_Login.TabIndex of
  1: FScroll := Scroll_login;
  2: FScroll := Scroll_criar_conta;
  3: FScroll := Scroll_Esqueci_conta;
  end;

  FNeedOffset := False;
  if Assigned(Focused) then
  begin
    LFocused := TControl(Focused.GetObject);
    LFocusRect := LFocused.AbsoluteRect;
    LFocusRect.Offset(FScroll.ViewportPosition);
    if (LFocusRect.IntersectsWith(TRectF.Create(FKBBounds))) and
       (LFocusRect.Bottom > FKBBounds.Top) then
    begin
      FNeedOffset := True;
      FScroll.RealignContent;
      Application.ProcessMessages;
      FScroll.ViewportPosition :=
        PointF(FScroll.ViewportPosition.X,
               LFocusRect.Bottom - FKBBounds.Top);
    end;
  end;
  if not FNeedOffset then
    RestorePosition;
end;

end.
