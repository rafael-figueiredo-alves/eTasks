unit eTasks.View.Windows.login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.TabControl,
  FMX.Layouts, FMX.Edit, FMX.Effects, eTasks.View.Dialogs.Factory, FMX.Media,
  FMX.Ani, FMX.Menus;

type
  TForm_Windows_Login = class(TForm)
    TabPrincipal: TTabControl;
    TabSplash: TTabItem;
    TabEntrada: TTabItem;
    Logo: TImage;
    StyleBook1: TStyleBook;
    ImagemLado: TImage;
    LaySuporte_central: TLayout;
    Layout2: TLayout;
    Nav_Tela_Login: TTabControl;
    TabInicio: TTabItem;
    Img_Banner_top_TabInicio: TImage;
    Img_TabInicio_texto_titulo: TImage;
    Img_TabInicio_textoPrincipal: TImage;
    Btn_efetuar_login: TRoundRect;
    Sombra_btn_efetuar_login: TShadowEffect;
    Label_btn_efetuar_login: TLabel;
    Btn_criar_conta: TRoundRect;
    Sombra_Criar_conta: TShadowEffect;
    Label_btn_criar_conta: TLabel;
    TabLogin: TTabItem;
    Link_criar_conta: TImage;
    Scroll_login: TVertScrollBox;
    Img_Logo_login: TImage;
    Btn_Entrar: TRoundRect;
    ShadowEffect1: TShadowEffect;
    Label_entrar: TLabel;
    Btn_esqueci_conta: TLabel;
    Layout_edt_Login_password: TLayout;
    Rect_login_password: TRoundRect;
    Sombra_edt_login_password: TShadowEffect;
    Img_login_password: TImage;
    Edit_Login_Password: TEdit;
    Btn_Login_mostrar_senha: TImage;
    Layout_Edt_Login_user: TLayout;
    Login_rect_user: TRoundRect;
    Sombra_login_rect_user: TShadowEffect;
    Img_UI_user_login: TImage;
    Edit_Login_email: TEdit;
    TabCriarConta: TTabItem;
    Btn_Termos_privacidade: TImage;
    Scroll_criar_conta: TVertScrollBox;
    Foto_usuario: TCircle;
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
    Layout_edt_criar_nome: TLayout;
    Rect_criar_conta_nome: TRoundRect;
    ShadowEffect2: TShadowEffect;
    Img_criar_conta_nome: TImage;
    Edit_criar_conta_nome: TEdit;
    Img_semfoto: TImage;
    Img_CriarConta_voltar: TImage;
    TabEsqueciSenha: TTabItem;
    Scroll_Esqueci_conta: TVertScrollBox;
    Banner_esqueci_conta: TImage;
    Layout_esqueci_conta_email: TLayout;
    Rect_esqueci_conta_email: TRoundRect;
    ShadowEffect6: TShadowEffect;
    Img_esqueci_conta_email: TImage;
    Edit_esqueci_conta_email: TEdit;
    Img_texto_esqueci_conta: TImage;
    Btn_Esqueci_conta_enviar: TRoundRect;
    ShadowEffect7: TShadowEffect;
    Label_esqueci_conta_enviar: TLabel;
    Btn_Esqueci_senha_Voltar: TImage;
    Lay_suporte_1: TLayout;
    Lay_suporte_central: TLayout;
    TimerSplash: TTimer;
    SelecionaFoto: TOpenDialog;
    procedure FormResize(Sender: TObject);
    procedure TimerSplashTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Btn_Login_mostrar_senhaClick(Sender: TObject);
    procedure Btn_Criar_conta_mostar_senhaClick(Sender: TObject);
    procedure Btn_efetuar_loginClick(Sender: TObject);
    procedure Btn_criar_contaClick(Sender: TObject);
    procedure Btn_esqueci_contaClick(Sender: TObject);
    procedure Link_criar_contaClick(Sender: TObject);
    procedure Btn_Esqueci_senha_VoltarClick(Sender: TObject);
    procedure Img_CriarConta_voltarClick(Sender: TObject);
    procedure Btn_Termos_privacidadeClick(Sender: TObject);
    procedure Foto_usuarioClick(Sender: TObject);
    procedure Btn_EntrarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Btn_Esqueci_conta_enviarClick(Sender: TObject);
    procedure Btn_criar_conta_criarClick(Sender: TObject);
  private
    { Private declarations }
    Dialogs     : iViewDialogsFactory;
    Termos      : iViewDialogsFactory;
    sheet_fotos : iViewDialogsFactory;
    loading     : iViewDialogsFactory;
    Procedure EfetuarLogin;
    Procedure CriarConta;
    Procedure EsqueciSenha;
    Procedure TirarFotoCamera;
    Procedure PegarFotoGaleria;
  public
    { Public declarations }
  end;

var
  Form_Windows_Login: TForm_Windows_Login;

implementation

uses
  eTasks.View.Dialogs.Messages.Consts, System.RegularExpressions,
  eTasks.View.Dialogs.TirarFoto, eTasks.Controller.Login, eTasks.View.Windows.main,
  eTasks.libraries.Imagens64, eTasks.View.Dialogs.EditarFoto, eTasks.libraries;

Const
  ValidEmails : string = '[_a-zA-Z\d\-\.]+@([_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+)+)';

{$R *.fmx}

procedure TForm_Windows_Login.Btn_criar_contaClick(Sender: TObject);
begin
  CriarConta;
end;

procedure TForm_Windows_Login.Btn_criar_conta_criarClick(Sender: TObject);
Var
 Erro : integer;
begin
  if (Edit_criar_conta_nome.Text.IsEmpty) then
   begin
     Dialogs := TViewDialogsMessages.New;
     Form_Windows_Login.AddObject(
                                  Dialogs.Pai(self).DialogMessages
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
     Form_Windows_Login.AddObject(
                                  Dialogs.Pai(self).DialogMessages
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
     Form_Windows_Login.AddObject(
                                  Dialogs.Pai(self).DialogMessages
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
     Form_Windows_Login.AddObject(
                                  Dialogs.Pai(self).DialogMessages
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
     Form_Windows_Login.AddObject(
                                  Dialogs.Pai(self).DialogMessages
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
                               procedure ()
                               begin
                                 loading := tviewDialogsMessages.New;
                                 Form_Windows_Login.AddObject(loading.Loading
                                                                        .Mensagem('Criando conta. Aguarde ...')
                                                                        .AcaoLimpa(Procedure ()
                                                                                   begin
                                                                                    loading := nil;
                                                                                   end)
                                                                        .Exibe
                                                             );
                               end,
                               Procedure ()
                               begin
                                 tControllerLogin.New
                                                  .Nome(Edit_criar_conta_nome.Text)
                                                  .Password(Edit_criar_conta_senha.Text)
                                                  .Foto(timagens64.toBase64(Foto_usuario.Fill.Bitmap.Bitmap))
                                                  .Email(Edit_Criar_conta_email.Text)
                                                  .CriarConta(Erro);
                               end,
                               Procedure ()
                               begin
                                loading.Loading.Fechar;
                                if erro = -1 then
                                 begin
                                  if not Assigned(Form_windows_main) then
                                   Application.CreateForm(TForm_windows_main, Form_windows_main);
                                  Application.MainForm := Form_windows_main;
                                  Form_windows_main.Show;
                                  Close;
                                 end
                                else
                                 begin
                                  Dialogs := TViewDialogsMessages.New;
                                  Form_Windows_Login.AddObject(
                                                               Dialogs.Pai(self).DialogMessages
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

procedure TForm_Windows_Login.Btn_Criar_conta_mostar_senhaClick(
  Sender: TObject);
begin
  Edit_criar_conta_senha.Password := not Edit_criar_conta_senha.Password;
end;

procedure TForm_Windows_Login.Btn_efetuar_loginClick(Sender: TObject);
begin
  EfetuarLogin;
end;

procedure TForm_Windows_Login.Btn_EntrarClick(Sender: TObject);
Var
  Erro : integer;
begin
   if (Edit_Login_email.Text.IsEmpty) Or (Edit_Login_Password.Text.IsEmpty) then
    begin
     if Edit_Login_email.Text.IsEmpty then
      begin
       Dialogs := TViewDialogsMessages.New;
       Form_Windows_Login.AddObject(
                                    Dialogs.Pai(self).DialogMessages
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
         Form_Windows_Login.AddObject(
                                      Dialogs.Pai(self).DialogMessages
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
          Form_Windows_Login.AddObject(
                                       Dialogs.Pai(self).DialogMessages
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
            Form_Windows_Login.AddObject(
                                         Dialogs.Pai(self).DialogMessages
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
                                     loading := tViewDialogsMessages.New;
                                     Form_Windows_Login.AddObject(
                                                                  loading.Loading
                                                                           .Mensagem('Entrando ...')
                                                                           .AcaoLimpa(Procedure ()
                                                                                      begin
                                                                                       loading := nil;
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
                                    Procedure ()
                                    begin
                                     loading.Loading.Fechar;
                                     if erro = -1 then
                                      begin
                                       if not Assigned(Form_windows_main) then
                                        Application.CreateForm(TForm_windows_main, Form_windows_main);
                                       Application.MainForm := Form_windows_main;
                                       Form_windows_main.Show;
                                       Close;
                                      end
                                     else
                                      begin
                                       Dialogs := TViewDialogsMessages.New;
                                       Form_Windows_Login.AddObject(
                                                                    Dialogs.Pai(self).DialogMessages
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

procedure TForm_Windows_Login.Btn_esqueci_contaClick(Sender: TObject);
begin
   EsqueciSenha;
end;

procedure TForm_Windows_Login.Btn_Esqueci_conta_enviarClick(Sender: TObject);
var
  Erro : integer;
  EsqueciSenha : Boolean;
begin
  if (Edit_esqueci_conta_email.Text.IsEmpty) then
   begin
     Dialogs := tViewDialogsMessages.New;
     Form_Windows_Login.AddObject(
                                  Dialogs.Pai(self).DialogMessages
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
       Form_Windows_Login.AddObject(
                                    Dialogs.Pai(self).DialogMessages
                                                     .TipoMensagem(tpmInvalido_resetar_email)
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
     begin
       teTasksLibrary.CustomThread(
                                   procedure ()
                                   begin
                                     loading := tViewDialogsMessages.New;
                                     Form_Windows_Login.AddObject(
                                                                  loading.Loading
                                                                           .Mensagem('Enviando solicitação ...')
                                                                           .AcaoLimpa(Procedure ()
                                                                                      begin
                                                                                       loading := nil;
                                                                                      end)
                                                                           .Exibe
                                                                 );
                                   end,
                                   procedure ()
                                   begin
                                    EsqueciSenha := tControllerLogin.New.Email(Edit_esqueci_conta_email.Text).EsqueciConta(erro);
                                   end,
                                   Procedure ()
                                   begin
                                     loading.Loading.Fechar;
                                     if EsqueciSenha then
                                      begin
                                       Dialogs := TViewDialogsMessages.New;
                                       Form_Windows_Login.AddObject(
                                                                    Dialogs.Pai(self).DialogMessages
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
                                       Form_windows_Login.AddObject(
                                                                    Dialogs.Pai(self).DialogMessages
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
end;

procedure TForm_Windows_Login.Btn_Esqueci_senha_VoltarClick(Sender: TObject);
begin
  EfetuarLogin;
end;

procedure TForm_Windows_Login.Btn_Login_mostrar_senhaClick(Sender: TObject);
begin
   Edit_Login_Password.Password := not Edit_Login_Password.Password;
end;


procedure TForm_Windows_Login.Btn_Termos_privacidadeClick(Sender: TObject);
begin
  Termos := TViewDialogsMessages.New;
  Form_Windows_Login.AddObject(
                               Termos.Pai(self).DialogTermos
                                               .AcaoFundo(Procedure ()
                                                          Begin
                                                           Termos := nil;
                                                          end)
                                               .Exibe);
end;

procedure TForm_Windows_Login.CriarConta;
begin
  Foto_usuario.Fill.Bitmap.Bitmap := Img_semfoto.Bitmap;
  Edit_criar_conta_nome.Text  := '';
  Edit_Criar_conta_email.Text := '';
  Edit_criar_conta_senha.Text := '';
  Nav_Tela_Login.GotoVisibleTab(2);
  Edit_criar_conta_nome.SetFocus;
end;

procedure TForm_Windows_Login.EfetuarLogin;
begin
   Edit_Login_Password.Text := '';
   Edit_Login_email.Text    := '';
   Nav_Tela_Login.GotoVisibleTab(1);
   Edit_Login_email.SetFocus;
end;

procedure TForm_Windows_Login.EsqueciSenha;
begin
  Edit_esqueci_conta_email.Text := '';
  Nav_Tela_Login.GotoVisibleTab(3);
  Edit_esqueci_conta_email.SetFocus;
end;

procedure TForm_Windows_Login.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkEscape then
   begin
    if (Assigned(Dialogs)) or (Assigned(Termos)) then
     begin
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
     Application.Terminate;
   end;
end;

procedure TForm_Windows_Login.FormResize(Sender: TObject);
begin
  if Self.Height <= 660 then
   Self.Height := 660;
  if Self.Width <= 370 then
   Self.Width  := 370;
  if Self.Width > 1280 then
   begin
     ImagemLado.Visible := true;
     Img_Banner_top_TabInicio.Visible := False;
     ImagemLado.Width := 640;
   end;
   begin
    if (Self.Width >= 720) and (Self.Width <= 1280) then
     begin
      imagemLado.Width := Self.Width / 2;
      Img_Banner_top_TabInicio.Visible := False;
      ImagemLado.Visible := True;
     end
    else
     if Self.Width < 720 then
      begin
       Img_Banner_top_TabInicio.Visible := True;
       ImagemLado.Visible := False;
      end;
   end;
end;

procedure TForm_Windows_Login.FormShow(Sender: TObject);
begin
   TabPrincipal.ActiveTab := TabSplash;
   TimerSplash.Enabled := True;
end;

procedure TForm_Windows_Login.Foto_usuarioClick(Sender: TObject);
begin
  Sheet_fotos := TViewDialogsMessages.New;
  Form_windows_Login.AddObject(
                               Sheet_fotos.Pai(self).SheetFotos
                                                   .AcaoFundo(Procedure ()
                                                              Begin
                                                               Sheet_fotos := nil;
                                                              end)
                                                   .AcaoFoto(Procedure ()
                                                             begin
                                                              Sheet_fotos := nil;
                                                              TirarFotoCamera;
                                                             end)
                                                   .AcaoGaleria(Procedure ()
                                                             begin
                                                              Sheet_fotos := nil;
                                                              PegarFotoGaleria;
                                                             end)
                                                   .Exibe);
end;

procedure TForm_Windows_Login.Img_CriarConta_voltarClick(Sender: TObject);
begin
  EfetuarLogin;
end;

procedure TForm_Windows_Login.Link_criar_contaClick(Sender: TObject);
begin
  CriarConta;
end;

procedure TForm_Windows_Login.PegarFotoGaleria;
Var
  form_Editar_Foto : TForm_Editar_foto;
begin
   if SelecionaFoto.Execute = true then
    begin
     if not Assigned(form_editar_foto) then
      Application.CreateForm(TForm_Editar_foto, form_Editar_Foto);
     try
      form_editar_foto.Editar_foto.Bitmap.LoadFromFile(SelecionaFoto.FileName);
      form_editar_foto.ShowModal(Procedure (ModalResult : TModalResult)
                                 begin
                                  if ModalResult = mrOk then
                                   Foto_usuario.Fill.Bitmap.Bitmap := Form_Editar_foto.Foto;
                                 end);

     finally
      form_Editar_Foto.DisposeOf;
     end;
    end;
end;

procedure TForm_Windows_Login.TimerSplashTimer(Sender: TObject);
begin
  TabPrincipal.Next();
  Nav_Tela_Login.ActiveTab := TabInicio;
  TimerSplash.Enabled := False;
end;

procedure TForm_Windows_Login.TirarFotoCamera;
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
                                                                    Foto_usuario.Fill.Bitmap.Bitmap := Form_Editar_foto.Foto;
                                                                   end);
                           finally
                            form_Editar_Foto.DisposeOf;
                           end;
                          end;
                         end);

  finally
   form_camera.DisposeOf;
  end;
end;

end.
