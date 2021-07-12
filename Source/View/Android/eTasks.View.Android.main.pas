unit eTasks.View.Android.main;

interface

uses
  //eTasks - Required units
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Effects,
  FMX.Objects,
  FMX.MultiView,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.ListView,
  FMX.TabControl,
  FMX.Edit,
  system.permissions,
  FMX.MediaLibrary.Actions,
  System.Actions,
  FMX.ActnList,
  FMX.StdActns,
  FMX.Ani,
  //eTasks - View dialogs factory
  eTasks.View.Dialogs.Factory;

type
  Telas = (TelaTarefas, TelaTarefas_Novo, TelaTarefas_Editar, TelaTarefas_exibe,
           TelaCategorias, TelaObjetivos, TelaListas, TelaAjuda);

  TForm_Android_main = class(TForm)
    Lay_main: TLayout;
    Estilos_Login: TStyleBook;
    Lay_barra_superior: TLayout;
    LogoTipo_eTasks: TImage;
    Btn_Menu: TCircle;
    ShadowEffect1: TShadowEffect;
    RecListaPrincipal: TRectangle;
    ShadowEffect2: TShadowEffect;
    Img_user_sem_photo: TImage;
    MainMenu: TMultiView;
    Btn_fecha_main_menu: TImage;
    FundoMenu: TRectangle;
    Lay_Topo_lista: TLayout;
    Lay_data_select: TLayout;
    Btn_Volta_data: TImage;
    Btn_Avanca_data: TImage;
    Label_Data: TLabel;
    Img_Concluido: TImage;
    Img_Afazer: TImage;
    Btn_Add_tarefa: TImage;
    ListaTarefas: TListView;
    Lay_Perfil: TLayout;
    Lay_perfil_foto: TLayout;
    Perfil_menu: TCircle;
    ShadowEffect3: TShadowEffect;
    btn_perfil: TRectangle;
    ShadowEffect4: TShadowEffect;
    Perfil_nome: TLabel;
    Perfil_email: TLabel;
    Label_btn_editar_perfil: TLabel;
    Img_perfil_grande: TImage;
    Tab_menu: TTabControl;
    Tab_menu_principal: TTabItem;
    Tab_menu_edit_perfil: TTabItem;
    Fundo_menu_principal: TRectangle;
    lay_container_opcoes: TLayout;
    lay_opcoes: TLayout;
    Menu_categorias: TLayout;
    Img_categorias: TImage;
    txtCategorias: TLabel;
    Menu_metas: TLayout;
    Img_metas: TImage;
    txtMetas: TLabel;
    Menu_compras: TLayout;
    img_compras: TImage;
    txtCompras: TLabel;
    menu_ajuda: TLayout;
    Img_ajuda: TImage;
    TxtAjuda: TLabel;
    Menu_sobre: TLayout;
    img_Sobre: TImage;
    txtSobre: TLabel;
    menu_logout: TLayout;
    img_logout: TImage;
    txtLogout: TLabel;
    Tab_menu_sobre: TTabItem;
    Fundo_Sobre: TRectangle;
    Fundo_perfil_edit: TRectangle;
    Lay_perfil_edit: TLayout;
    Lay_foto_perfil: TLayout;
    Perfil_edit_foto: TCircle;
    ShadowEffect5: TShadowEffect;
    btn_salvar_perfil: TImage;
    Layout_edt_nome: TLayout;
    Rect_criar_conta_nome: TRoundRect;
    ShadowEffect6: TShadowEffect;
    Img_criar_conta_nome: TImage;
    Edit_perfil_nome: TEdit;
    Lay_logo_main: TLayout;
    Lay_logo_centro: TLayout;
    Logo_eTasks: TImage;
    Lay_btn_atuatlizações: TLayout;
    Lay_copyright: TLayout;
    Img_copyright: TImage;
    Lay_contatos_sobre: TLayout;
    Img_sobre_contatos: TImage;
    Lay_email_programador: TLayout;
    Lay_github: TLayout;
    ListaAcoes: TActionList;
    ActFotoGaleria: TTakePhotoFromLibraryAction;
    Lay_site_programador: TLayout;
    Menu_Tarefas: TLayout;
    Img_menu_tarefas: TImage;
    txtTarefas: TLabel;
    Lay_Lista_vazia: TLayout;
    ListaVaziaFundo: TRectangle;
    Image_sem_tarefas: TImage;
    RecAniForms: TRectangle;
    ShadowEffect7: TShadowEffect;
    AniAberturaFechaForm: TFloatAnimation;
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
    Lay_splash_screen: TLayout;
    Rec_splash_fundo: TRectangle;
    Logo: TImage;
    Sai_splash_screen: TFloatAnimation;
    Sai_sem_conexao: TFloatAnimation;
    btn_atualizar: TRoundRect;
    ShadowEffect9: TShadowEffect;
    Btn_atualizar_label: TLabel;
    btn_atualizar_img: TImage;
    Ani_btn_atualizar: TFloatAnimation;
    Seta_Sem_Tasks: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Btn_MenuClick(Sender: TObject);
    procedure Btn_fecha_main_menuClick(Sender: TObject);
    procedure Btn_Volta_dataClick(Sender: TObject);
    procedure Btn_Avanca_dataClick(Sender: TObject);
    procedure menu_logoutClick(Sender: TObject);
    procedure btn_perfilClick(Sender: TObject);
    procedure Menu_sobreClick(Sender: TObject);
    procedure Perfil_edit_fotoClick(Sender: TObject);
    procedure ActFotoGaleriaDidFinishTaking(Image: TBitmap);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure ListaTarefasItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure FormShow(Sender: TObject);
    procedure ListaTarefasPullRefresh(Sender: TObject);
    procedure Lay_email_programadorClick(Sender: TObject);
    procedure Lay_site_programadorClick(Sender: TObject);
    procedure Lay_githubClick(Sender: TObject);
    procedure Menu_TarefasClick(Sender: TObject);
    procedure Menu_categoriasClick(Sender: TObject);
    procedure Menu_metasClick(Sender: TObject);
    procedure Menu_comprasClick(Sender: TObject);
    procedure menu_ajudaClick(Sender: TObject);
    procedure Btn_Add_tarefaClick(Sender: TObject);
    procedure AniAberturaFechaFormFinish(Sender: TObject);
    procedure btn_salvar_perfilClick(Sender: TObject);
    procedure Label_DataClick(Sender: TObject);
    procedure Btn_Tentar_NovamenteClick(Sender: TObject);
    procedure Sai_sem_conexaoFinish(Sender: TObject);
    procedure Sai_splash_screenFinish(Sender: TObject);
    procedure btn_atualizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Sheet_fotos : iViewDialogsFactory;
    Dialogs     : iViewDialogsFactory;
    Loading     : iViewDialogsFactory;
    FCalendar   : iViewDialogsFactory;
    FTela       : Telas;
    FId_tarefa  : string;
    {FKBBounds: TRectF;
    FNeedOffset: Boolean;
    procedure CalcContentBoundsProc(Sender: TObject;
                                    var ContentBounds: TRectF);
    procedure RestorePosition;
    procedure UpdateKBBounds;}
    Procedure TirarFotoCamera;
    Procedure TirarFotoPermissao (sender: TObject; Const APermissions: Tarray<string>;
                                  const AGrantResults: TArray<TPermissionStatus>);
    Procedure GaleriaPermissao (sender: TObject; Const APermissions: Tarray<string>;
                                  const AGrantResults: TArray<TPermissionStatus>);
    Procedure DisplayTirarFoto (Sender: TObject; Const APermissions: TArray<string>;
                                Const APostProc: TProc);
    Procedure DisplayGaleria (Sender: TObject; Const APermissions: TArray<string>;
                                Const APostProc: TProc);

    Procedure AtualizaInfoUsuarioLogado;
    Procedure AtualizaListaTarefas(data: string);

    Procedure AbreTela (Tela : Telas);

    Procedure Add_tarefa (id, Status, tarefa, descricao: string; categoria: string);
  public
    { Public declarations }
    Procedure AberturaFormPrincipal;
    Procedure ListarTarefas(Data: string);
  end;

var
  Form_Android_main: TForm_Android_main;

implementation

{$R *.fmx}

Uses
  //eTasks - Libraries
  eTasks.libraries.Android,
  eTasks.libraries.Imagens64,
  eTasks.libraries,
  //eTasks - Form Units
  eTasks.View.Android.login,
  eTasks.View.Android.help,
  eTasks.View.Android.tasks,
  eTasks.View.Android.categories,
  //eTasks - Controller units
  eTasks.Controller.Interfaces,
  eTasks.Controller.Factory,
  //Required units
  FMX.platform,
  FMX.VirtualKeyboard,
  //eTasks - View function and dialog units
  eTasks.View.Dialogs.EditarFoto,
  eTasks.View.Dialogs.TirarFoto,
  eTasks.View.Dialogs.Messages.Consts,
  eTasks.view.categorias, eTasks.View.Android.Metas,
  eTasks.View.Android.listas;

procedure TForm_Android_main.AberturaFormPrincipal;
begin
  AtualizaInfoUsuarioLogado;
  ListarTarefas(DateToStr(Now));
end;

procedure TForm_Android_main.AbreTela(Tela: Telas);
begin
  FTela := Tela;
  AniAberturaFechaForm.Start;
end;

procedure TForm_Android_main.ActFotoGaleriaDidFinishTaking(Image: TBitmap);
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
                                    Perfil_edit_foto.Fill.Bitmap.Bitmap := Form_Editar_foto.Foto;
                                    Perfil_edit_foto.TagString := 'WithPhoto';
                                   end;
                                 end);

     finally

     end;
end;

procedure TForm_Android_main.Add_tarefa(id, Status, tarefa, descricao: string;
  categoria: string);
Var
 img : TBitmap;
 picture : TImage;
begin
  with ListaTarefas.Items.Add do
  begin
    TListItemText(Objects.FindDrawable('txt_titulo')).Text := tarefa;

    if Status = 'fazer' then
     begin
      TListItemImage(Objects.FindDrawable('img_status')).Bitmap := Img_Afazer.Bitmap;
      TListItemImage(Objects.FindDrawable('img_status')).TagString := 'fazer';
     end
    else
     begin
      TListItemImage(Objects.FindDrawable('img_status')).Bitmap := Img_Concluido.Bitmap;
      TListItemImage(Objects.FindDrawable('img_status')).TagString := 'concluido';
     end;

    TListItemText(Objects.FindDrawable('txt_description')).Text := descricao;

    img := TImagens64.fromBase64(tcategorias.New.PegaImagem(categoria));
    picture := TImage.Create(nil);
    try
     TListItemImage(Objects.FindDrawable('img_category')).OwnsBitmap := True;
     picture.Bitmap := img;
     TListItemImage(Objects.FindDrawable('img_category')).Bitmap := picture.Bitmap;
     img.disposeof;
    finally
     picture.DisposeOf;
    end;

    TagString := id;
  end;
end;

procedure TForm_Android_main.AniAberturaFechaFormFinish(Sender: TObject);
begin
  if AniAberturaFechaForm.Inverse = false then
   begin
     AniAberturaFechaForm.Inverse := True;
     case FTela of
      TelaTarefas      : begin
                          if not Assigned(Tela_tarefas) then
                            Application.CreateForm(Ttela_tarefas, Tela_Tarefas);
                          Tela_Tarefas.Acao(taLista);
                          Tela_Tarefas.ShowModal(Procedure (ModalResult: TModalResult)
                                                 Begin
                                                   AniAberturaFechaForm.Start;
                                                   ListarTarefas(Label_Data.Text);
                                                 End);
                         end;
      TelaTarefas_Novo : begin
                          if not Assigned(Tela_tarefas) then
                            Application.CreateForm(Ttela_tarefas, Tela_Tarefas);
                          Tela_Tarefas.Acao(taNovo);
                          Tela_Tarefas.ShowModal(Procedure (ModalResult: TModalResult)
                                                       Begin
                                                         AniAberturaFechaForm.Start;
                                                         ListarTarefas(Label_Data.Text);
                                                       End);
                         end;
      TelaTarefas_Exibe : begin
                          if not Assigned(Tela_tarefas) then
                            Application.CreateForm(Ttela_tarefas, Tela_Tarefas);
                          Tela_Tarefas.Acao(taExibe);
                          Tela_Tarefas.ID(FId_tarefa);
                          Tela_Tarefas.ShowModal(Procedure (ModalResult: TModalResult)
                                                       Begin
                                                         AniAberturaFechaForm.Start;
                                                         ListarTarefas(Label_Data.Text);
                                                       End);
                         end;
      TelaCategorias   : begin
                          if not Assigned(Tela_categorias) then
                            Application.CreateForm(TTela_categorias, Tela_categorias);
                          Tela_categorias.Acao(taListar);
                          Tela_categorias.ShowModal(Procedure (ModalResult: TModalResult)
                                                       Begin
                                                         AniAberturaFechaForm.Start;
                                                       End);
                         end;
      TelaObjetivos    : begin
                          if not Assigned(Android_Metas) then
                            Application.CreateForm(TAndroid_Metas, Android_Metas);
                          Android_Metas.ShowModal(Procedure (ModalResult: TModalResult)
                                                  Begin
                                                    AniAberturaFechaForm.Start;
                                                  End);
                         end;
      TelaListas       : begin
                          if not Assigned(Android_listas) then
                            Application.CreateForm(TAndroid_listas, Android_Listas);
                          Android_Listas.ShowModal(Procedure (ModalResult: TModalResult)
                                                  Begin
                                                    AniAberturaFechaForm.Start;
                                                  End);
                         end;
      TelaAjuda        : begin
                          if not Assigned(Form_Android_Ajuda) then
                            Application.CreateForm(TForm_Android_Ajuda, Form_Android_Ajuda);
                          Form_Android_Ajuda.ShowModal(Procedure (ModalResult: TModalResult)
                                                       Begin
                                                        AniAberturaFechaForm.Start;
                                                       End);
                         end;
     end;
   end
  else
   AniAberturaFechaForm.Inverse := False;
end;

procedure TForm_Android_main.AtualizaInfoUsuarioLogado;
var
 AUsuario : iControllerUsuario;
 BitMap : TBitmap;
begin
  teTasksLibrary.CustomThread(nil, Procedure ()
                                   begin
                                    AUsuario := tControllerFactory.New.Usuario.Ler;
                                   end,
                                   Procedure ()
                                   begin
                                    Perfil_nome.Text := AUsuario.Nome;
                                    Perfil_email.Text := AUsuario.Email;
                                    if AUsuario.Foto <> '' then
                                      begin
                                        BitMap := TImagens64.fromBase64(AUsuario.Foto);
                                        Btn_Menu.Fill.Bitmap.Bitmap := BitMap;
                                        Perfil_menu.Fill.Bitmap.Bitmap := BitMap;
                                        Perfil_menu.TagString := 'WithPhoto';
                                        BitMap.DisposeOf;
                                      end
                                    else
                                     begin
                                       Btn_Menu.Fill.Bitmap.Bitmap := Img_user_sem_photo.Bitmap;
                                       Perfil_menu.Fill.Bitmap.Bitmap := Img_perfil_grande.Bitmap;
                                       Perfil_menu.TagString := 'WithoutPhoto';
                                     end;
                                   end);
end;

procedure TForm_Android_main.AtualizaListaTarefas(Data: string);
Var
  erro : string;
  Tarefas : iControllerTarefas;
  Loading :  iViewDialogsFactory;
begin
  teTasksLibrary.CustomThread(Procedure()
                              begin
                                Loading := tviewdialogsmessages.New;
                                Form_Android_main.AddObject(
                                                             Loading.Loading
                                                                      .Mensagem('Buscando tarefas. Aguarde, por favor... ')
                                                                      .AcaoLimpa(Procedure()
                                                                                 begin
                                                                                  Loading := nil;
                                                                                 end)
                                                                      .Exibe
                                                            );
                              end,
                              Procedure ()
                              begin
                                Tarefas := tcontrollerFactory.New.Tarefas.data(data).ListarTarefas(erro);
                              end,
                              Procedure ()
                              Var
                               tarefa : TTarefa;
                              begin
                                loading.Loading.Fechar;
                                if erro = '' then
                                 begin
                                  listaTarefas.Items.Clear;
                                  Lay_Lista_vazia.Visible := False;
                                  Seta_Sem_tasks.Visible  := False;
                                  if Tarefas.ListagemdeTarefas.Count <> 0 then
                                   begin
                                    ListaTarefas.BeginUpdate;
                                    for Tarefa in Tarefas.ListagemdeTarefas.Values do
                                     Add_tarefa(Tarefa.id, Tarefa.status, Tarefa.tarefa, Tarefa.descricao, Tarefa.Cat_icon);
                                    ListaTarefas.EndUpdate;
                                   end
                                  else
                                   begin
                                    Lay_Lista_vazia.Visible := True;
                                    Seta_Sem_Tasks.Visible  := True;
                                   end;
                                 end
                                else
                                 begin
                                   if erro = 'vazio' then
                                    begin
                                      ListaTarefas.Items.Clear;
                                      Lay_Lista_vazia.Visible := true;
                                    end;
                                 end;
                              end);
end;

procedure TForm_Android_main.Btn_Add_tarefaClick(Sender: TObject);
begin
  AbreTela(TelaTarefas_Novo);
end;

procedure TForm_Android_main.btn_atualizarClick(Sender: TObject);
Var
 Update_available : Boolean;
 Versao           : string;
begin
 teTasksLibrary.CustomThread(
                             Procedure ()
                             begin
                               Ani_btn_atualizar.Start;
                             end,
                             Procedure ()
                             begin
                               Update_available := teTasksLibrary.CheckUpdate(versao);
                             end,
                             Procedure ()
                             Begin
                               ani_btn_atualizar.Stop;
                               if Update_available = true then
                                ShowMessage('Há uma nova versão do eTasks disponível!'+#13+versao)
                               else
                                ShowMessage('Você já está usando a versão mais atual do eTasks!'+#13+versao);
                             End
                            );
end;

procedure TForm_Android_main.Btn_Avanca_dataClick(Sender: TObject);
begin
  ListarTarefas(DateToStr(StrToDate(Label_Data.Text) + 1));
end;

procedure TForm_Android_main.Btn_fecha_main_menuClick(Sender: TObject);
begin
  case Tab_menu.TabIndex of
   0: MainMenu.HideMaster;
   1: Tab_menu.First();
   2: Tab_menu.First();
  end;
end;

procedure TForm_Android_main.Btn_MenuClick(Sender: TObject);
begin
   MainMenu.ShowMaster;
end;

procedure TForm_Android_main.btn_perfilClick(Sender: TObject);
begin
  Perfil_edit_foto.Fill.Bitmap.Bitmap := Perfil_menu.Fill.Bitmap.Bitmap;
  Perfil_edit_foto.TagString := Perfil_menu.TagString;
  Edit_perfil_nome.Text := Perfil_nome.Text;
  Tab_menu.GotoVisibleTab(1);
end;

procedure TForm_Android_main.btn_salvar_perfilClick(Sender: TObject);
var
 FFotoPerfil : string;
 FService : IFMXVirtualKeyboardService;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
  if (FService <> Nil) and (TVirtualKeyboardState.Visible in FService.VirtualKeyboardState) then
   begin
    FService.HideVirtualKeyboard;
   end;
   teTasksLibrary.CustomThread(
                               Procedure ()
                               begin
                                Loading := tviewdialogsmessages.New;
                                Form_Android_main.AddObject(
                                                             Loading.Loading
                                                                      .Mensagem('Alterando conta. Aguarde ... ')
                                                                      .AcaoLimpa(Procedure()
                                                                                 begin
                                                                                  Loading := nil;
                                                                                 end)
                                                                      .Exibe
                                                            );
                               end,
                               Procedure ()
                               begin
                                if Perfil_edit_foto.TagString = 'WithPhoto' then
                                 FFotoPerfil := timagens64.toBase64(Perfil_edit_foto.Fill.Bitmap.Bitmap)
                                else
                                 FFotoPerfil := '';
                                tControllerFactory.New.Usuario
                                                 .Foto(FFotoPerfil)
                                                 .Nome(Edit_perfil_nome.Text)
                                                 .Alterar;
                               end,
                               Procedure ()
                               begin
                                Loading.Loading.Fechar;
                                Perfil_menu.Fill.Bitmap.Bitmap := Perfil_edit_foto.Fill.Bitmap.Bitmap;
                                Btn_Menu.Fill.Bitmap.Bitmap := Perfil_edit_foto.Fill.Bitmap.Bitmap;
                                Perfil_nome.Text := Edit_perfil_nome.Text;
                                Tab_menu.GotoVisibleTab(0);
                               end
                              );
end;

procedure TForm_Android_main.Btn_Tentar_NovamenteClick(Sender: TObject);
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
                                                             AberturaFormPrincipal;
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

procedure TForm_Android_main.Btn_Volta_dataClick(Sender: TObject);
begin
  ListarTarefas(DateToStr(StrToDate(Label_Data.Text) - 1));
end;

procedure TForm_Android_main.DisplayGaleria(Sender: TObject;
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

procedure TForm_Android_main.DisplayTirarFoto(Sender: TObject;
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

procedure TForm_Android_main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  Form_Android_main := nil;
end;

procedure TForm_Android_main.FormCreate(Sender: TObject);
begin
  //Deixar formulário na tela toda e barra de status transparente
  tLibraryAndroid.TransparentNavBar;
  //Ajustar multi-view referente ao menu principal
  MainMenu.Width := Screen.Width + 2;
end;

procedure TForm_Android_main.FormKeyUp(Sender: TObject; var Key: Word;
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
         if (Assigned(Sheet_fotos)) or (Assigned(Dialogs)) or (Assigned(Loading)) or (Assigned(FCalendar)) then
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
            if Assigned(FCalendar) then
             begin
              FCalendar.Calendar.Fechar;
             end;
          end
         else
          begin
           if (MainMenu.IsShowed = true) then
            begin
              case Tab_menu.TabIndex of
              0: begin
                  Key := 0;
                  MainMenu.HideMaster;
                 end;
              1: begin
                  Key := 0;
                  Tab_menu.First();
                 end;
              2: begin
                  Key := 0;
                  Tab_menu.First();
                 end;
              end;
            end;
          end;
       end;
    end;
end;

procedure TForm_Android_main.FormShow(Sender: TObject);
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
                                                             AberturaFormPrincipal;
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

procedure TForm_Android_main.GaleriaPermissao(sender: TObject;
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

procedure TForm_Android_main.Label_DataClick(Sender: TObject);
Var
 FService : IFMXVirtualKeyboardService;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
  if (FService <> Nil) and (TVirtualKeyboardState.Visible in FService.VirtualKeyboardState) then
   begin
    FService.HideVirtualKeyboard;
   end;
  FCalendar := TViewDialogsMessages.New;
  Form_Android_Main.AddObject(
                               FCalendar.Calendar
                                            .Data(StrToDate(Label_Data.Text))
                                            .AcaoBotao(Procedure ()
                                                       begin
                                                         ListarTarefas(DateToStr(FCalendar.Calendar.Data));
                                                         FCalendar := nil;
                                                       end)
                                            .AcaoFundo(Procedure ()
                                                       begin
                                                         FCalendar := nil;
                                                       end)
                                            .Exibe);
end;

procedure TForm_Android_main.Lay_email_programadorClick(Sender: TObject);
begin
  tLibraryAndroid.EnviarEmail('rafael.figueiredo.alves@gmail.com', 'Mais informações sobre o eTasks', 'Olá, Rafael, eu estou interessado em mais informações do projeto eTasks.');
end;

procedure TForm_Android_main.Lay_githubClick(Sender: TObject);
begin
  tLibraryAndroid.AbrirLink('https://github.com/rafael-figueiredo-alves');
end;

procedure TForm_Android_main.Lay_site_programadorClick(Sender: TObject);
begin
  tLibraryAndroid.AbrirLink('https://rafael-figueiredo-alves.github.io');
end;

procedure TForm_Android_main.ListarTarefas(Data: string);
begin
  Label_Data.Text := Data;
  AtualizaListaTarefas(data);
end;

procedure TForm_Android_main.ListaTarefasItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
Var
  ErroStatus : string;
begin
  if TListView(sender).Selected <> nil then
   begin
     if ItemObject is TListItemImage then
      begin
        if ItemObject.Name = 'img_status' then
         begin
           if ItemObject.TagString = 'fazer' then
            begin
             TControllerFactory.New.Tarefas
                                     .id(TListView(sender).Items[ItemIndex].TagString)
                                     .Status('concluido')
                                     .MudaStatus(ErroStatus);
             if ErroStatus = '' then
              begin
                TListItemImage(ItemObject).Bitmap := Img_Concluido.Bitmap;
                ItemObject.TagString := 'concluido';
              end;
            end
           else
            begin
             TControllerFactory.New.Tarefas
                                     .id(TListView(sender).Items[ItemIndex].TagString)
                                     .Status('fazer')
                                     .MudaStatus(ErroStatus);
             if ErroStatus = '' then
              begin
               TListItemImage(ItemObject).Bitmap := Img_Afazer.Bitmap;
               ItemObject.TagString := 'fazer';
              end;
            end;
         end
        else
         begin
          FId_tarefa := TListView(sender).Items[ItemIndex].TagString;
          AbreTela(TelaTarefas_exibe);
         end;
      end
     else
      begin
       FId_tarefa := TListView(sender).Items[ItemIndex].TagString;
       AbreTela(TelaTarefas_exibe);
      end;
   end;
end;

procedure TForm_Android_main.ListaTarefasPullRefresh(Sender: TObject);
begin
  ListarTarefas(Label_Data.Text);
end;

procedure TForm_Android_main.menu_ajudaClick(Sender: TObject);
begin
   {todo 0 -oRafaelAlves -cImplementar: Abrir form de Ajuda}
   MainMenu.HideMaster;
   AbreTela(TelaAjuda);
end;

procedure TForm_Android_main.Menu_categoriasClick(Sender: TObject);
begin
   MainMenu.HideMaster;
   AbreTela(TelaCategorias);
end;

procedure TForm_Android_main.Menu_comprasClick(Sender: TObject);
begin
   MainMenu.HideMaster;
   AbreTela(TelaListas);
end;

procedure TForm_Android_main.menu_logoutClick(Sender: TObject);
begin
  if tControllerFactory.New.Login.EfetuarLogout = true then
   begin
      if not Assigned(Form_Android_login) then
       Application.CreateForm(TForm_Android_login, Form_Android_login);
      Application.MainForm := Form_Android_login;
      Form_Android_login.Show;
      MainMenu.HideMaster;
      Close;
   end;
end;

procedure TForm_Android_main.Menu_metasClick(Sender: TObject);
begin
   MainMenu.HideMaster;
   AbreTela(TelaObjetivos);
end;

procedure TForm_Android_main.Menu_sobreClick(Sender: TObject);
begin
  Tab_menu.GotoVisibleTab(2);
end;

procedure TForm_Android_main.Menu_TarefasClick(Sender: TObject);
begin
   MainMenu.HideMaster;
   AbreTela(TelaTarefas);
end;

procedure TForm_Android_main.Perfil_edit_fotoClick(Sender: TObject);
Var
 FService : IFMXVirtualKeyboardService;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
  if (FService <> Nil) and (TVirtualKeyboardState.Visible in FService.VirtualKeyboardState) then
   begin
    FService.HideVirtualKeyboard;
   end;
  Sheet_fotos := TViewDialogsMessages.New;
  Form_Android_main.AddObject(
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
procedure TForm_Android_main.Sai_sem_conexaoFinish(Sender: TObject);
begin
  Lay_sem_conexao.Visible := False;
end;

procedure TForm_Android_main.Sai_splash_screenFinish(Sender: TObject);
begin
  Lay_splash_screen.Visible := False;
end;

procedure TForm_Android_main.TirarFotoCamera;
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
                                                                     Perfil_edit_foto.Fill.Bitmap.Bitmap := Form_Editar_foto.Foto;
                                                                     Perfil_edit_foto.TagString := 'WithPhoto';
                                                                    end;
                                                                   end);
                           finally

                           end;
                          end;
                         end);

  finally

  end;
end;

procedure TForm_Android_main.TirarFotoPermissao(sender: TObject;
  const APermissions: Tarray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
begin
 if (length(AGrantResults) = 3) and
     (AGrantResults[0] = TPermissionStatus.Granted) and
     (AGrantResults[1] = TPermissionStatus.Granted) and
     (AGrantResults[2] = TPermissionStatus.Granted) then
     TirarFotoCamera
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


end.
