unit eTasks.View.Android.login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Objects, FMX.Effects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  FMX.Edit, eTasks.View.Dialogs.Factory, FMX.MediaLibrary.Actions,
  System.Actions, FMX.ActnList, FMX.StdActns, system.permissions, FMX.Ani;

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
    ListaAcoes: TActionList;
    ActFotoGaleria: TTakePhotoFromLibraryAction;
    ActFotoCamera: TTakePhotoFromCameraAction;
    Img_semfoto: TImage;
    Lay_sem_conexao: TLayout;
    Fundo_sem_cenxao: TRectangle;
    Lay_image_sem_conexao: TLayout;
    Image_sem_conexao: TImage;
    Lay_btn_tentar_novamente: TLayout;
    Btn_Tentar_Novamente: TRoundRect;
    ShadowEffect8: TShadowEffect;
    Label_tentar_novamente: TLabel;
    Image_btn_tentar_novamente: TImage;
    Animar_Tentar_novamente: TFloatAnimation;
    Sai_sem_conexao: TFloatAnimation;
    Lay_splash_screen: TLayout;
    Rec_splash_fundo: TRectangle;
    Logo: TImage;
    Sai_splash_screen: TFloatAnimation;
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
    procedure ActFotoCameraDidFinishTaking(Image: TBitmap);
    procedure ActFotoGaleriaDidFinishTaking(Image: TBitmap);
    procedure Btn_Esqueci_conta_enviarClick(Sender: TObject);
    procedure Btn_criar_conta_criarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Sai_splash_screenFinish(Sender: TObject);
    procedure Sai_sem_conexaoFinish(Sender: TObject);
    procedure Btn_Tentar_NovamenteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Sheet_fotos : iViewDialogsFactory;
    Dialogs     : iViewDialogsFactory;
    Termos      : iViewDialogsFactory;
    Loading     : iViewDialogsFactory;
    FKBBounds: TRectF;
    FNeedOffset: Boolean;
    procedure CalcContentBoundsProc(Sender: TObject;
                                    var ContentBounds: TRectF);
    procedure RestorePosition;
    procedure UpdateKBBounds;
    Procedure CriarConta;
    Procedure EfetuarLogin;
    Procedure EsqueciSenha;
    Procedure TirarFotoCamera;
    Procedure TirarFotoPermissao (sender: TObject; Const APermissions: Tarray<string>;
                                  const AGrantResults: TArray<TPermissionStatus>);
    Procedure GaleriaPermissao (sender: TObject; Const APermissions: Tarray<string>;
                                  const AGrantResults: TArray<TPermissionStatus>);
    Procedure DisplayTirarFoto (Sender: TObject; Const APermissions: TArray<string>;
                                Const APostProc: TProc);
    Procedure DisplayGaleria (Sender: TObject; Const APermissions: TArray<string>;
                                Const APostProc: TProc);
  public
    { Public declarations }
  end;

var
  Form_Android_Login: TForm_Android_Login;

implementation

{$R *.fmx}

Uses
  eTasks.Libraries.Android, eTasks.View.Android.main, System.Math, FMX.VirtualKeyboard, FMX.platform,
  eTasks.View.Dialogs.Messages.Consts, RegularExpressions, eTasks.Controller.Login, eTasks.View.Dialogs.EditarFoto,
  eTasks.libraries.Imagens64, eTasks.libraries, eTasks.View.Dialogs.TirarFoto;

Const
  ValidEmails : string = '[_a-zA-Z\d\-\.]+@([_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+)+)';

procedure TForm_Android_Login.ActFotoCameraDidFinishTaking(Image: TBitmap);
Var
  form_Editar_Foto : TForm_Editar_foto;
begin
     if not Assigned(form_editar_foto) then
      form_Editar_Foto := TForm_Editar_foto.Create(Self);
     try
      form_editar_foto.Editar_foto.Bitmap := Image;
      form_editar_foto.ShowModal(Procedure (ModalResult : TModalResult)
                                 begin
                                  if ModalResult = mrOk then
                                   begin
                                    Foto_usuario.Fill.Bitmap.Bitmap := Form_Editar_foto.Foto;
                                    Foto_usuario.TagString := 'WithPhoto';
                                   end;
                                 end);
     finally
      //form_Editar_Foto.DisposeOf;
     end;
end;

procedure TForm_Android_Login.ActFotoGaleriaDidFinishTaking(Image: TBitmap);
Var
  form_Editar_Foto : TForm_Editar_foto;
begin
     if not Assigned(form_editar_foto) then
      Application.CreateForm(TForm_Editar_foto, form_Editar_Foto);
     try
      form_editar_foto.Editar_foto.Bitmap := Image;
      form_editar_foto.ShowModal(Procedure (ModalResult : TModalResult)
                                 begin
                                  if ModalResult = mrOk then
                                   begin
                                    Foto_usuario.Fill.Bitmap.Bitmap := Form_Editar_foto.Foto;
                                    Foto_usuario.TagString := 'WithPhoto';
                                   end;
                                  //form_Editar_Foto.DisposeOf;
                                 end);

     finally
      //form_Editar_Foto.DisposeOf;
     end;
end;

procedure TForm_Android_Login.Btn_criar_contaClick(Sender: TObject);
begin
  CriarConta;
end;

procedure TForm_Android_Login.Btn_criar_conta_criarClick(Sender: TObject);
Var
  Erro : Integer;
  FService : IFMXVirtualKeyboardService;
  FFotoPerfil : string;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
  if (FService <> Nil) and (TVirtualKeyboardState.Visible in FService.VirtualKeyboardState) then
   begin
    FService.HideVirtualKeyboard;
   end;
  if (Edit_criar_conta_nome.Text.IsEmpty) then
   begin
     Dialogs := TViewDialogsMessages.New;
     Form_Android_Login.AddObject(
                                  Dialogs.DialogMessages
                                                     .TipoMensagem(tpmBranco_criar_nome)
                                                     .AcaoBotao(Procedure ()
                                                                begin
                                                                 Dialogs := nil;
                                                                 Edit_criar_conta_nome.SetFocus;
                                                                end)
                                                     .AcaoFundo(Procedure ()
                                                                begin
                                                                 Dialogs := nil;
                                                                end)
                                                     .Exibe
                                 );
     exit
   end;
  if (Edit_Criar_conta_email.Text.IsEmpty) then
   begin
     Dialogs := TViewDialogsMessages.New;
     Form_Android_Login.AddObject(
                                  Dialogs.DialogMessages
                                                     .TipoMensagem(tpmBranco_criar_email)
                                                     .AcaoBotao(Procedure ()
                                                                begin
                                                                 Dialogs := nil;
                                                                 Edit_criar_conta_email.SetFocus;
                                                                end)
                                                     .AcaoFundo(Procedure ()
                                                                begin
                                                                 Dialogs := nil;
                                                                end)
                                                     .Exibe
                                 );
     exit
   end;
  if (Edit_criar_conta_senha.Text.IsEmpty) then
   begin
     Dialogs := TViewDialogsMessages.New;
     Form_Android_Login.AddObject(
                                  Dialogs.DialogMessages
                                                     .TipoMensagem(tpmBranco_criar_senha)
                                                     .AcaoBotao(Procedure ()
                                                                begin
                                                                 Dialogs := nil;
                                                                 Edit_criar_conta_senha.SetFocus;
                                                                end)
                                                     .AcaoFundo(Procedure ()
                                                                begin
                                                                 Dialogs := nil;
                                                                end)
                                                     .Exibe
                                 );
     exit
   end;
  if not TRegEx.IsMatch(Edit_Criar_conta_email.Text, ValidEmails) then
   begin
     Dialogs := TViewDialogsMessages.New;
     Form_Android_Login.AddObject(
                                  Dialogs.DialogMessages
                                                     .TipoMensagem(tpmInvalido_criar_email)
                                                     .AcaoBotao(Procedure ()
                                                                begin
                                                                 Dialogs := nil;
                                                                 Edit_criar_conta_email.SetFocus;
                                                                end)
                                                     .AcaoFundo(Procedure ()
                                                                begin
                                                                 Dialogs := nil;
                                                                end)
                                                     .Exibe
                                 );
     exit
   end;
  if Length(Edit_criar_conta_senha.Text) < 6 then
   begin
     Dialogs := TViewDialogsMessages.New;
     Form_Android_Login.AddObject(
                                  Dialogs.DialogMessages
                                                     .TipoMensagem(tpmInvalido_criar_senha)
                                                     .AcaoBotao(Procedure ()
                                                                begin
                                                                 Dialogs := nil;
                                                                 Edit_criar_conta_senha.SetFocus;
                                                                end)
                                                     .AcaoFundo(Procedure ()
                                                                begin
                                                                 Dialogs := nil;
                                                                end)
                                                     .Exibe
                                 );
     exit
   end;
   teTasksLibrary.CustomThread(
                               Procedure ()
                               begin
                                Loading := tviewdialogsmessages.New;
                                Form_Android_Login.AddObject(
                                                             Loading.Loading
                                                                      .Mensagem('Criando conta. Aguarde ... ')
                                                                      .AcaoLimpa(Procedure()
                                                                                 begin
                                                                                  Loading := nil;
                                                                                 end)
                                                                      .Exibe
                                                            );
                               end,
                               Procedure ()
                               begin
                                if Foto_usuario.TagString = 'WithPhoto' then
                                 FFotoPerfil := timagens64.toBase64(Foto_usuario.Fill.Bitmap.Bitmap)
                                else
                                 FFotoPerfil := '';
                                tControllerLogin.New
                                                 .Email(Edit_Criar_conta_email.Text)
                                                 .Password(Edit_criar_conta_senha.Text)
                                                 .Foto(FFotoPerfil)
                                                 .Nome(Edit_criar_conta_nome.Text)
                                                 .CriarConta(erro);
                               end,
                               Procedure ()
                               begin
                                Loading.Loading.Fechar;
                                if erro = -1 then
                                 begin
                                  if not Assigned(Form_android_main) then
                                   Application.CreateForm(TForm_Android_main, Form_Android_main);
                                  Application.MainForm := Form_Android_main;
                                  Form_Android_main.Show;
                                  Close;
                                 end
                                else
                                 begin
                                  Dialogs := TViewDialogsMessages.New;
                                  Form_Android_Login.AddObject(
                                                               Dialogs.DialogMessages
                                                                        .TipoMensagem(tTipoMensagem(erro))
                                                                        .AcaoBotao(Procedure ()
                                                                                   begin
                                                                                    Dialogs := nil;
                                                                                   end)
                                                                        .AcaoFundo(Procedure ()
                                                                                   begin
                                                                                    Dialogs := nil;
                                                                                   end)
                                                                        .Exibe
                                                                );
                                 end;
                               end
                              );
end;

procedure TForm_Android_Login.Btn_Criar_conta_mostar_senhaClick(
  Sender: TObject);
begin
    Edit_criar_conta_senha.Password := not Edit_criar_conta_senha.Password;
end;

procedure TForm_Android_Login.Btn_efetuar_loginClick(Sender: TObject);
begin
    EfetuarLogin;
end;

procedure TForm_Android_Login.Btn_EntrarClick(Sender: TObject);
Var
 FService : IFMXVirtualKeyboardService;
 Erro     : integer;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
  if (FService <> Nil) and (TVirtualKeyboardState.Visible in FService.VirtualKeyboardState) then
   begin
    FService.HideVirtualKeyboard;
   end;
   if (Edit_Login_email.Text.IsEmpty) Or (Edit_Login_Password.Text.IsEmpty) then
    begin
     if Edit_Login_email.Text.IsEmpty then
      begin
       Dialogs := TViewDialogsMessages.New;
       Form_Android_Login.AddObject(
                                    Dialogs.DialogMessages
                                                     .TipoMensagem(tpmBranco_login_email)
                                                     .AcaoBotao(Procedure ()
                                                                begin
                                                                 Dialogs := nil;
                                                                 Edit_Login_email.SetFocus;
                                                                end)
                                                     .AcaoFundo(Procedure ()
                                                                begin
                                                                  Dialogs := nil;
                                                                end)
                                                     .Exibe);
      end
     else
      begin
       if Edit_Login_Password.Text.IsEmpty then
        begin
         Dialogs := TViewDialogsMessages.New;
         Form_Android_Login.AddObject(
                                      Dialogs.DialogMessages
                                                     .TipoMensagem(tpmBranco_login_Senha)
                                                     .AcaoBotao(Procedure ()
                                                                begin
                                                                 Dialogs := nil;
                                                                 Edit_Login_password.SetFocus;
                                                                end)
                                                     .AcaoFundo(Procedure ()
                                                                begin
                                                                  Dialogs := nil;
                                                                end)
                                                     .Exibe);
        end;
      end;
    end
   else
    begin
      if (not TRegEx.IsMatch(Edit_Login_email.Text, ValidEmails)) or (Length(Edit_Login_Password.Text) < 6) then
       begin
        if not TRegEx.IsMatch(Edit_Login_email.Text, ValidEmails) then
         begin
          Dialogs := TViewDialogsMessages.New;
          Form_Android_Login.AddObject(
                                       Dialogs.DialogMessages
                                                     .TipoMensagem(tpmInvalido_login_email)
                                                     .AcaoBotao(Procedure ()
                                                                begin
                                                                 Dialogs := nil;
                                                                 Edit_Login_email.SetFocus;
                                                                end)
                                                     .AcaoFundo(Procedure ()
                                                                begin
                                                                  Dialogs := nil;
                                                                end)
                                                     .Exibe);
         end
        else
         begin
          if Length(Edit_Login_Password.Text) < 6 then
           begin
            Dialogs := TViewDialogsMessages.New;
            Form_Android_Login.AddObject(
                                         Dialogs.DialogMessages
                                                     .TipoMensagem(tpmInvalido_login_senha)
                                                     .AcaoBotao(Procedure ()
                                                                begin
                                                                 Dialogs := nil;
                                                                 Edit_Login_password.SetFocus;
                                                                end)
                                                     .AcaoFundo(Procedure ()
                                                                begin
                                                                  Dialogs := nil;
                                                                end)
                                                     .Exibe);
           end;
         end;
       end
      else
       begin
         teTasksLibrary.CustomThread(
                                     procedure ()
                                     begin
                                      Loading := tViewDialogsMessages.New;
                                      Form_Android_Login.AddObject(
                                                                   Loading.Loading
                                                                             .Mensagem('Entrando ... ')
                                                                             .AcaoLimpa(Procedure ()
                                                                                        begin
                                                                                         Loading := nil;
                                                                                        end)
                                                                             .Exibe
                                                                  );
                                     end,
                                     procedure ()
                                     begin
                                      tControllerLogin.New
                                                       .Password(Edit_Login_Password.Text)
                                                       .Email(Edit_Login_email.Text)
                                                       .EfetuarLogin(Erro);
                                     end,
                                     procedure ()
                                     begin
                                      Loading.Loading.Fechar;
                                      if erro = -1 then
                                       begin
                                        if not Assigned(Form_Android_main) then
                                         Application.CreateForm(TForm_Android_main, Form_Android_main);
                                        Application.MainForm := Form_Android_main;
                                        Form_Android_main.Show;
                                        Close;
                                       end
                                      else
                                       begin
                                        Dialogs := TViewDialogsMessages.New;
                                        Form_Android_Login.AddObject(
                                                                     Dialogs.DialogMessages
                                                                              .TipoMensagem(tTipoMensagem(erro))
                                                                              .AcaoBotao(Procedure ()
                                                                                         begin
                                                                                          Dialogs := nil;
                                                                                         end)
                                                                              .AcaoFundo(Procedure ()
                                                                                         begin
                                                                                          Dialogs := nil;
                                                                                          end)
                                                                              .Exibe
                                                                     );
                                        exit
                                       end;
                                     end
                                    );
       end;
    end;
end;

procedure TForm_Android_Login.Btn_esqueci_contaClick(Sender: TObject);
Var
 FService : IFMXVirtualKeyboardService;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
  if (FService <> Nil) and (TVirtualKeyboardState.Visible in FService.VirtualKeyboardState) then
   begin
    FService.HideVirtualKeyboard;
   end;
  EsqueciSenha;
end;

procedure TForm_Android_Login.Btn_Esqueci_conta_enviarClick(Sender: TObject);
Var
 FService : IFMXVirtualKeyboardService;
 Erro : integer;
 EsqueciSenha : Boolean;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
  if (FService <> Nil) and (TVirtualKeyboardState.Visible in FService.VirtualKeyboardState) then
   begin
    FService.HideVirtualKeyboard;
   end;
  if (Edit_esqueci_conta_email.Text.IsEmpty) then
   begin
     Dialogs := tViewDialogsMessages.New;
     Form_Android_Login.AddObject(
                                  Dialogs.DialogMessages
                                                    .TipoMensagem(tpmBranco_resetar_email)
                                                    .AcaoBotao(Procedure()
                                                               begin
                                                                Dialogs := nil;
                                                                Edit_esqueci_conta_email.SetFocus;
                                                               end)
                                                    .AcaoFundo(Procedure ()
                                                               begin
                                                                Dialogs := nil;
                                                               end)
                                                    .Exibe
                                 );
   end
  else
   begin
    if not TRegEx.IsMatch(Edit_esqueci_conta_email.Text, ValidEmails) then
     begin
       Dialogs := tViewDialogsMessages.New;
       Form_Android_Login.AddObject(
                                    Dialogs.DialogMessages
                                                     .TipoMensagem(tpmInvalido_resetar_email)
                                                     .AcaoBotao(Procedure()
                                                                begin
                                                                 Dialogs := nil;
                                                                end)
                                                     .AcaoFundo(Procedure ()
                                                                begin
                                                                 Dialogs := nil;
                                                                end)
                                                     .Exibe
                                   );
     end
    else
     begin
      teTasksLibrary.CustomThread(
                                  procedure ()
                                  begin
                                    Loading := tviewdialogsmessages.New;
                                    Form_Android_Login.AddObject(Loading.Loading
                                                                          .Mensagem('Enviando solicitação ... ')
                                                                          .AcaoLimpa(Procedure ()
                                                                                     begin
                                                                                      Loading := nil;
                                                                                     end)
                                                                          .Exibe
                                                                );
                                  end,
                                  procedure ()
                                  begin
                                   EsqueciSenha := tControllerLogin.New.Email(Edit_esqueci_conta_email.Text).EsqueciConta(erro);
                                  end,
                                  procedure ()
                                  begin
                                    Loading.Loading.Fechar;
                                    if EsqueciSenha then
                                     begin
                                      Dialogs := TViewDialogsMessages.New;
                                      Form_Android_Login.AddObject(
                                                                   Dialogs.DialogMessages
                                                                            .TipoMensagem(tpmSucesso_resetar)
                                                                            .AcaoBotao(Procedure ()
                                                                                       begin
                                                                                        Dialogs := nil;
                                                                                        EfetuarLogin;
                                                                                       end)
                                                                            .AcaoFundo(Procedure ()
                                                                                       begin
                                                                                        Dialogs := nil;
                                                                                        EfetuarLogin
                                                                                       end)
                                                                            .Exibe
                                                                  );
                                     end
                                    else
                                     begin
                                      Dialogs := TViewDialogsMessages.New;
                                      Form_Android_Login.AddObject(
                                                                   Dialogs.DialogMessages
                                                                             .TipoMensagem(tTipoMensagem(erro))
                                                                             .AcaoBotao(Procedure ()
                                                                                        begin
                                                                                         Dialogs := nil;
                                                                                        end)
                                                                             .AcaoFundo(Procedure ()
                                                                                        begin
                                                                                         Dialogs := nil;
                                                                                        end)
                                                                             .Exibe
                                                                   );
                                     end;
                                  end
                                 );
    end;
   end;
end;

procedure TForm_Android_Login.Btn_Esqueci_senha_VoltarClick(Sender: TObject);
begin
   EfetuarLogin;
end;

procedure TForm_Android_Login.Btn_Login_mostrar_senhaClick(Sender: TObject);
begin
   Edit_Login_Password.Password := not Edit_Login_Password.Password;
end;

procedure TForm_Android_Login.Btn_Tentar_NovamenteClick(Sender: TObject);
Var
 TemConexao : Boolean;
begin
 teTasksLibrary.CustomThread(Procedure ()
                             begin
                               Animar_Tentar_novamente.Start;
                             end,
                             Procedure ()
                             Begin
                              TemConexao := teTasksLibrary.CheckInternet;
                             End,
                             Procedure ()
                             begin
                              if TemConexao = true then
                               begin
                                teTasksLibrary.CustomThread(Procedure ()
                                                            Begin

                                                            End,
                                                            Procedure ()
                                                            Begin
                                                              Nav_Tela_Login.ActiveTab := TabInicio;
                                                              Foto_usuario.Fill.Bitmap.Bitmap := Img_semfoto.Bitmap;
                                                              Foto_usuario.TagString := 'WithoutPhoto';
                                                              Edit_criar_conta_nome.Text  := '';
                                                              Edit_Criar_conta_email.Text := '';
                                                              Edit_criar_conta_senha.Text := '';
                                                              Edit_esqueci_conta_email.Text := '';
                                                              Edit_Login_Password.Text := '';
                                                              Edit_Login_email.Text    := '';
                                                            End,
                                                            Procedure ()
                                                            Begin
                                                             if Animar_Tentar_novamente.Running = true then
                                                              Animar_Tentar_novamente.Stop;
                                                             Sai_sem_conexao.Start;
                                                            End);
                               end
                              else
                               begin
                                if Animar_Tentar_novamente.Running = true then
                                 Animar_Tentar_novamente.Stop;
                               end;
                             end);
end;

procedure TForm_Android_Login.Btn_Termos_privacidadeClick(Sender: TObject);
Var
 FService : IFMXVirtualKeyboardService;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
  if (FService <> Nil) and (TVirtualKeyboardState.Visible in FService.VirtualKeyboardState) then
   begin
    FService.HideVirtualKeyboard;
   end;
  Termos := TViewDialogsMessages.New;
  Form_Android_Login.AddObject(
                               Termos.DialogTermos
                                               .AcaoFundo(Procedure ()
                                                          Begin
                                                           Termos := nil;
                                                          end)
                                               .Exibe);
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

procedure TForm_Android_Login.CriarConta;
begin
  Foto_usuario.Fill.Bitmap.Bitmap := Img_semfoto.Bitmap;
  Foto_usuario.TagString := 'WithoutPhoto';
  Edit_criar_conta_nome.Text  := '';
  Edit_Criar_conta_email.Text := '';
  Edit_criar_conta_senha.Text := '';
  Nav_Tela_Login.GotoVisibleTab(2);
end;

procedure TForm_Android_Login.DisplayGaleria(Sender: TObject;
  const APermissions: TArray<string>; const APostProc: TProc);
begin
  Dialogs := TViewDialogsMessages.New;
  Form_Android_Login.AddObject(
                               Dialogs.DialogMessages
                                          .AcaoBotao(Procedure ()
                                                     begin
                                                      Dialogs := nil;
                                                      APostProc;
                                                     end)
                                          .AcaoFundo(Procedure ()
                                                     begin
                                                      Dialogs := nil;
                                                     end)
                                          .TipoMensagem(tpmPermissao_solicitar_galeria)
                                          .Exibe
                               );

end;

procedure TForm_Android_Login.DisplayTirarFoto(Sender: TObject;
  const APermissions: TArray<string>; const APostProc: TProc);
begin
  Dialogs := TViewDialogsMessages.New;
  Form_Android_Login.AddObject(
                               Dialogs.DialogMessages
                                         .AcaoBotao(Procedure ()
                                                    begin
                                                     Dialogs := nil;
                                                     APostProc;
                                                    end)
                                         .AcaoFundo(Procedure ()
                                                    begin
                                                     Dialogs := nil;
                                                    end)
                                         .TipoMensagem(tpmPermissao_solicitar_camera)
                                         .Exibe
                              );
end;

procedure TForm_Android_Login.EfetuarLogin;
begin
   Edit_Login_Password.Text := '';
   Edit_Login_email.Text    := '';
   Nav_Tela_Login.GotoVisibleTab(1);
end;

procedure TForm_Android_Login.EsqueciSenha;
begin
  Edit_esqueci_conta_email.Text := '';
  Nav_Tela_Login.GotoVisibleTab(3);
end;

procedure TForm_Android_Login.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  Form_Android_Login := nil;
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
         // Botão BACK pressionado e teclado vísivel, apenas fecha o teclado
       end
      else
       begin
         if (Assigned(Sheet_fotos)) or (Assigned(Dialogs)) or (Assigned(Termos)) or (Assigned(Loading)) then
          begin
            Key := 0;
            if Assigned(sheet_fotos) then
             begin
              Sheet_fotos.SheetFotos.Fechar;
             end;
            if Assigned(dialogs) then
             begin
              dialogs.DialogMessages.Fechar;
             end;
            if Assigned(Termos) then
             begin
              Termos.DialogTermos.Fechar;
             end;
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
end;

procedure TForm_Android_Login.FormShow(Sender: TObject);
Var
 TemConexao : Boolean;
begin
 teTasksLibrary.CustomThread(Procedure ()
                             begin
                               Lay_splash_screen.Visible := True;
                             end,
                             Procedure ()
                             Begin
                              TemConexao := teTasksLibrary.CheckInternet;
                             End,
                             Procedure ()
                             begin
                              if TemConexao = true then
                               begin
                                teTasksLibrary.CustomThread(Procedure ()
                                                            Begin

                                                            End,
                                                            Procedure ()
                                                            Begin
                                                              Nav_Tela_Login.ActiveTab := TabInicio;
                                                              Foto_usuario.Fill.Bitmap.Bitmap := Img_semfoto.Bitmap;
                                                              Foto_usuario.TagString := 'WithoutPhoto';
                                                              Edit_criar_conta_nome.Text  := '';
                                                              Edit_Criar_conta_email.Text := '';
                                                              Edit_criar_conta_senha.Text := '';
                                                              Edit_esqueci_conta_email.Text := '';
                                                              Edit_Login_Password.Text := '';
                                                              Edit_Login_email.Text    := '';
                                                            End,
                                                            Procedure ()
                                                            Begin
                                                             Sai_splash_screen.Start;
                                                            End);
                               end
                              else
                               begin
                                 Sai_splash_screen.Start;
                                 Lay_sem_conexao.Visible   := true;
                               end;
                             end);
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
Var
 FService : IFMXVirtualKeyboardService;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
  if (FService <> Nil) and (TVirtualKeyboardState.Visible in FService.VirtualKeyboardState) then
   begin
    FService.HideVirtualKeyboard;
   end;
  Sheet_fotos := TViewDialogsMessages.New;
  Form_Android_Login.AddObject(
                               Sheet_fotos.SheetFotos
                                                   .AcaoFundo(Procedure ()
                                                              Begin
                                                               Sheet_fotos := nil;
                                                              end)
                                                   .AcaoFoto(Procedure ()
                                                             begin
                                                              Sheet_fotos := nil;
                                                              PermissionsService.RequestPermissions(tLibraryAndroid.PermissaoCamera, TirarFotoPermissao, DisplayTirarFoto);
                                                             end)
                                                   .AcaoGaleria(Procedure ()
                                                             begin
                                                              Sheet_fotos := nil;
                                                              PermissionsService.RequestPermissions(tLibraryAndroid.PermissaoGaleria, GaleriaPermissao, DisplayGaleria);
                                                             end)
                                                   .Exibe);
end;

procedure TForm_Android_Login.GaleriaPermissao(sender: TObject;
  const APermissions: Tarray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
begin
  if (length(AGrantResults) = 2) and
     (AGrantResults[0] = TPermissionStatus.Granted) and
     (AGrantResults[1] = TPermissionStatus.Granted) then
    ActFotoGaleria.Execute
   else
    begin
      Dialogs := TViewDialogsMessages.New;
      Form_Android_Login.AddObject(
                                   Dialogs.DialogMessages
                                             .AcaoBotao(Procedure ()
                                                        begin
                                                          Dialogs := nil;
                                                        end)
                                             .AcaoFundo(Procedure ()
                                                        begin
                                                          Dialogs := nil;
                                                        end)
                                             .TipoMensagem(tpmPermissao_negada_galeria)
                                             .Exibe
                                  );
    end;
end;

procedure TForm_Android_Login.Link_criar_contaClick(Sender: TObject);
Var
 FService : IFMXVirtualKeyboardService;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
  if (FService <> Nil) and (TVirtualKeyboardState.Visible in FService.VirtualKeyboardState) then
   begin
    FService.HideVirtualKeyboard;
   end;
  CriarConta;
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

procedure TForm_Android_Login.Sai_sem_conexaoFinish(Sender: TObject);
begin
  Lay_sem_conexao.Visible := False;
end;

procedure TForm_Android_Login.Sai_splash_screenFinish(Sender: TObject);
begin
  Lay_splash_screen.Visible := False;
end;

procedure TForm_Android_Login.Img_CriarConta_voltarClick(Sender: TObject);
begin
   efetuarLogin;
end;

procedure TForm_Android_Login.TabInicioClick(Sender: TObject);
begin
    Nav_Tela_Login.GotoVisibleTab(2);
end;

procedure TForm_Android_Login.TirarFotoCamera;
Var
 form_camera : TForm_camera;
 form_Editar_Foto : TForm_Editar_foto;
begin
  if not Assigned(form_camera) then
   Application.CreateForm(TForm_Camera, form_camera);
  try
   form_camera.ShowModal(Procedure (ModalResult : TModalResult)
                         begin
                          if ModalResult = mrOk then
                          begin
                          if not Assigned(form_editar_foto) then
                           Application.CreateForm(TForm_Editar_foto, form_Editar_Foto);
                           try
                            form_editar_foto.Editar_foto.Bitmap := form_camera.Imagem;
                            form_editar_foto.ShowModal(Procedure (ModalResult : TModalResult)
                                                                  begin
                                                                   if ModalResult = mrOk then
                                                                    begin
                                                                     Foto_usuario.Fill.Bitmap.Bitmap := Form_Editar_foto.Foto;
                                                                     Foto_usuario.TagString := 'WithPhoto';
                                                                    end;
                                                                   end);
                           finally
                            //form_Editar_Foto.DisposeOf;
                           end;
                          end;
                         end);

  finally
   //form_camera.DisposeOf;
  end;
end;

procedure TForm_Android_Login.TirarFotoPermissao(sender: TObject;
  const APermissions: Tarray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
begin
  if (length(AGrantResults) = 3) and
     (AGrantResults[0] = TPermissionStatus.Granted) and
     (AGrantResults[1] = TPermissionStatus.Granted) and
     (AGrantResults[2] = TPermissionStatus.Granted) then
     TirarFotoCamera
    //ActFotoCamera.Execute
   else
    begin
     Dialogs := TViewDialogsMessages.New;
     Form_Android_Login.AddObject(
                                  Dialogs.DialogMessages
                                              .AcaoBotao(Procedure ()
                                                         begin
                                                          Dialogs := nil;
                                                         end)
                                              .AcaoFundo(Procedure ()
                                                         begin
                                                          Dialogs := nil;
                                                         end)
                                              .TipoMensagem(tpmPermissao_negada_camera)
                                              .Exibe
                                   );
    end;
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
