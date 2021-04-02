unit eTasks.View.Windows.main;

interface

uses
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
  FMX.Objects,
  FMX.Layouts,
  FMX.ListBox,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.Edit,
  FMX.TabControl,
  FMX.MultiView,
  System.Actions,
  FMX.ActnList,
  FMX.StdActns,
  FMX.MediaLibrary.Actions,
  FMX.ListView,
  FMX.Effects,
  FMX.Ani,
  //eTasks - View specific function units
  eTasks.View.Dialogs.Factory,
  eTasks.View.Windows.telas;

type
  Telas = (TelaTarefas, TelaTarefas_Novo, TelaTarefas_Editar,
           TelaCategorias, TelaObjetivos, TelaListas, TelaAjuda);

  TForm_Windows_Main = class(TForm)
    Img_Afazer: TImage;
    Img_Concluido: TImage;
    Img_perfil_grande: TImage;
    Img_user_sem_photo: TImage;
    Lay_main: TLayout;
    Estilos_Login: TStyleBook;
    Lay_barra_superior: TLayout;
    LogoTipo_eTasks: TImage;
    Btn_Menu: TCircle;
    ShadowEffect1: TShadowEffect;
    RecListaPrincipal: TRectangle;
    ShadowEffect2: TShadowEffect;
    Lay_Topo_lista: TLayout;
    Lay_data_select: TLayout;
    Btn_Volta_data: TImage;
    Btn_Avanca_data: TImage;
    Label_Data: TLabel;
    ListaTarefas: TListView;
    Lay_Lista_vazia: TLayout;
    ListaVaziaFundo: TRectangle;
    Image_sem_tarefas: TImage;
    Label_sem_tarefas: TLabel;
    Btn_Add_tarefa: TImage;
    ListaAcoes: TActionList;
    ActFotoGaleria: TTakePhotoFromLibraryAction;
    MainMenu: TMultiView;
    FundoMenu: TRectangle;
    Tab_menu: TTabControl;
    Tab_menu_principal: TTabItem;
    Fundo_menu_principal: TRectangle;
    Lay_Perfil: TLayout;
    Lay_perfil_foto: TLayout;
    Perfil_menu: TCircle;
    ShadowEffect3: TShadowEffect;
    btn_perfil: TRectangle;
    ShadowEffect4: TShadowEffect;
    Label_btn_editar_perfil: TLabel;
    Perfil_nome: TLabel;
    Perfil_email: TLabel;
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
    Menu_Tarefas: TLayout;
    Img_menu_tarefas: TImage;
    txtTarefas: TLabel;
    Tab_menu_edit_perfil: TTabItem;
    Fundo_perfil_edit: TRectangle;
    Lay_perfil_edit: TLayout;
    Lay_foto_perfil: TLayout;
    Perfil_edit_foto: TCircle;
    ShadowEffect5: TShadowEffect;
    Layout_edt_nome: TLayout;
    Rect_criar_conta_nome: TRoundRect;
    ShadowEffect6: TShadowEffect;
    Img_criar_conta_nome: TImage;
    Edit_perfil_nome: TEdit;
    btn_salvar_perfil: TImage;
    Tab_menu_sobre: TTabItem;
    Fundo_Sobre: TRectangle;
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
    Lay_site_programador: TLayout;
    Btn_fecha_main_menu: TImage;
    SelecionaFoto: TOpenDialog;
    StyleBook1: TStyleBook;
    Lay_sem_conexao: TLayout;
    Fundo_sem_cenxao: TRectangle;
    Lay_image_sem_conexao: TLayout;
    Image_sem_conexao: TImage;
    Lay_btn_tentar_novamente: TLayout;
    Btn_Tentar_Novamente: TRoundRect;
    ShadowEffect7: TShadowEffect;
    Label_tentar_novamente: TLabel;
    Image_btn_tentar_novamente: TImage;
    Animar_Tentar_novamente: TFloatAnimation;
    Lay_splash_screen: TLayout;
    Rec_splash_fundo: TRectangle;
    Logo: TImage;
    Sai_splash_screen: TFloatAnimation;
    Sai_sem_conexao: TFloatAnimation;
    RecAniForms: TRectangle;
    ShadowEffect8: TShadowEffect;
    AniAberturaFechaForm: TFloatAnimation;
    Lay_container: TLayout;
    btn_atualizar: TRoundRect;
    ShadowEffect9: TShadowEffect;
    Btn_atualizar_label: TLabel;
    btn_atualizar_img: TImage;
    Ani_btn_atualizar: TFloatAnimation;
    procedure FormResize(Sender: TObject);
    procedure Btn_MenuClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Menu_sobreClick(Sender: TObject);
    procedure menu_logoutClick(Sender: TObject);
    procedure ListaTarefasItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure Btn_Avanca_dataClick(Sender: TObject);
    procedure Btn_fecha_main_menuClick(Sender: TObject);
    procedure Tab_menuChange(Sender: TObject);
    procedure Btn_Volta_dataClick(Sender: TObject);
    procedure ListaTarefasUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Lay_email_programadorClick(Sender: TObject);
    procedure Lay_site_programadorClick(Sender: TObject);
    procedure Lay_githubClick(Sender: TObject);
    procedure btn_perfilClick(Sender: TObject);
    procedure Perfil_edit_fotoClick(Sender: TObject);
    procedure btn_salvar_perfilClick(Sender: TObject);
    procedure Label_DataClick(Sender: TObject);
    procedure Btn_Tentar_NovamenteClick(Sender: TObject);
    procedure Sai_splash_screenFinish(Sender: TObject);
    procedure Sai_sem_conexaoFinish(Sender: TObject);
    procedure Btn_Add_tarefaClick(Sender: TObject);
    procedure AniAberturaFechaFormFinish(Sender: TObject);
    procedure Menu_TarefasClick(Sender: TObject);
    procedure Menu_categoriasClick(Sender: TObject);
    procedure Menu_metasClick(Sender: TObject);
    procedure Menu_comprasClick(Sender: TObject);
    procedure menu_ajudaClick(Sender: TObject);
    procedure btn_atualizarClick(Sender: TObject);
  private
    { Private declarations }
    Sheet_fotos : iViewDialogsFactory;
    //Dialogs     : iViewDialogsFactory;
    Loading     : iViewDialogsFactory;
    FCalendar   : iViewDialogsFactory;

    FTela       : Telas;

    FTelaAjuda : iWindowsTelas;

    Procedure TirarFotoCamera;
    Procedure PegarFotoGaleria;

    Procedure AtualizaInfoUsuarioLogado;
    Procedure AtualizaListaTarefas(data: string);

    Procedure AbreTela(Tela : Telas);

    Procedure Add_tarefa (id, Status, tarefa, descricao: string; categoria: string);
  public
    { Public declarations }
    Procedure AberturaFormPrincipal;
    Procedure ListarTarefas(Data: string);
  end;

var
  Form_Windows_Main: TForm_Windows_Main;

implementation

uses
  //eTasks - Unit with Controller Interfaces and factory
  eTasks.Controller.Interfaces,
  eTasks.Controller.factory,
  //eTasks - Library units
  eTasks.libraries.Imagens64,
  eTasks.Libraries.Windows,
  eTasks.libraries,
  //eTasks - View units
  eTasks.view.categorias,
  eTasks.View.Dialogs.TirarFoto,
  eTasks.View.Dialogs.EditarFoto,
  eTasks.View.Dialogs.Messages.Consts,
  //eTasks - Form units
  eTasks.View.Windows.login;

{$R *.fmx}


procedure TForm_Windows_Main.AberturaFormPrincipal;
begin
  AtualizaInfoUsuarioLogado;
  ListarTarefas(DateToStr(Now));
end;

procedure TForm_Windows_Main.AbreTela(Tela: Telas);
begin
  FTela := Tela;
  AniAberturaFechaForm.Start;
end;

procedure TForm_Windows_Main.Add_tarefa(id, Status, tarefa, descricao,
  categoria: string);
Var
 img : TBitmap;
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

    try
     TListItemImage(Objects.FindDrawable('img_category')).OwnsBitmap := True;

     TListItemImage(Objects.FindDrawable('img_category')).Bitmap := img;

    finally

    end;

    TagString := id;
  end;
end;

procedure TForm_Windows_Main.AniAberturaFechaFormFinish(Sender: TObject);
begin
  if (AniAberturaFechaForm.Inverse = false) then
   begin
     AniAberturaFechaForm.Inverse := True;
     case FTela of
      TelaTarefas      : Showmessage('b');
      TelaTarefas_Novo : showmessage('c');
      TelaCategorias   : showmessage('a');
      TelaObjetivos    : showmessage('a');
      TelaListas       : showmessage('a');
      TelaAjuda        : begin
                           FTelaAjuda := tWindowsTelas.New;
                           Lay_container.AddObject(FTelaAjuda.Tela_Ajuda
                                                                 .BtnVoltarClick(Procedure ()
                                                                                 begin
                                                                                   AniAberturaFechaForm.Start;
                                                                                   FTelaAjuda := nil;
                                                                                 end)
                                                                  .Exibir
                                                   );
                         end;
     end;
   end
  else
   AniAberturaFechaForm.Inverse := False;
end;

procedure TForm_Windows_Main.AtualizaInfoUsuarioLogado;
var
 AUsuario : iControllerUsuario;
 BitMap : TBitmap;
begin
  AUsuario := tControllerFactory.New.Usuario.Ler;
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
end;

procedure TForm_Windows_Main.AtualizaListaTarefas(data: string);
Var
  erro : string;
  Tarefas : iControllerTarefas;
  Loading :  iViewDialogsFactory;
begin
  teTasksLibrary.CustomThread(Procedure()
                              begin
                                Loading := tviewdialogsmessages.New;
                                Form_windows_main.AddObject(
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
                                listaTarefas.Items.Clear;
                                Lay_Lista_vazia.Visible := False;
                                if Tarefas.ListagemdeTarefas.Count <> 0 then
                                 begin
                                   ListaTarefas.BeginUpdate;
                                   for Tarefa in Tarefas.ListagemdeTarefas.Values do
                                    Add_tarefa(Tarefa.id, Tarefa.status, Tarefa.tarefa, Tarefa.descricao, Tarefa.Cat_icon);
                                   ListaTarefas.EndUpdate;
                                 end
                                else
                                 Lay_Lista_vazia.Visible := True;
                              end);
end;

procedure TForm_Windows_Main.Btn_Add_tarefaClick(Sender: TObject);
begin
  AbreTela(TelaTarefas_Novo);
end;

procedure TForm_Windows_Main.btn_atualizarClick(Sender: TObject);
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

procedure TForm_Windows_Main.Btn_Avanca_dataClick(Sender: TObject);
begin
  ListarTarefas(DateToStr(StrToDate(Label_Data.Text) + 1));
end;

procedure TForm_Windows_Main.Btn_fecha_main_menuClick(Sender: TObject);
begin
  case Tab_menu.TabIndex of
   0: MainMenu.HideMaster;
   1: Tab_menu.First();
   2: Tab_menu.First();
  end;
end;

procedure TForm_Windows_Main.Btn_MenuClick(Sender: TObject);
begin
  if MainMenu.Mode = TMultiViewMode.Drawer then
   begin
    Tab_menu.ActiveTab := Tab_menu_principal;
    MainMenu.ShowMaster;
   end;
end;

procedure TForm_Windows_Main.btn_perfilClick(Sender: TObject);
begin
  Perfil_edit_foto.Fill.Bitmap.Bitmap := Perfil_menu.Fill.Bitmap.Bitmap;
  Perfil_edit_foto.TagString := Perfil_menu.TagString;
  Edit_perfil_nome.Text := Perfil_nome.Text;
  Tab_menu.GotoVisibleTab(1);
end;

procedure TForm_Windows_Main.btn_salvar_perfilClick(Sender: TObject);
Var
 FFotoPerfil : string;
begin
   teTasksLibrary.CustomThread(
                               procedure ()
                               begin
                                 loading := tviewDialogsMessages.New;
                                 Form_Windows_main.AddObject(loading.Loading
                                                                        .Mensagem('Alterando conta. Aguarde ...')
                                                                        .AcaoLimpa(Procedure ()
                                                                                   begin
                                                                                    loading := nil;
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
                                  TControllerFactory.New.Usuario
                                                  .Nome(Edit_perfil_nome.Text)
                                                  .Foto(FFotoPerfil)
                                                  .Alterar;
                               end,
                               Procedure ()
                               begin
                                loading.Loading.Fechar;
                                   Perfil_menu.Fill.Bitmap.Bitmap := Perfil_edit_foto.Fill.Bitmap.Bitmap;
                                   Btn_Menu.Fill.Bitmap.Bitmap := Perfil_edit_foto.Fill.Bitmap.Bitmap;
                                   Perfil_nome.Text := Edit_perfil_nome.Text;
                                   Tab_menu.GotoVisibleTab(0);
                               end
                              );
end;

procedure TForm_Windows_Main.Btn_Tentar_NovamenteClick(Sender: TObject);
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

procedure TForm_Windows_Main.Btn_Volta_dataClick(Sender: TObject);
begin
  ListarTarefas(DateToStr(StrToDate(Label_Data.Text) - 1));
end;

procedure TForm_Windows_Main.FormResize(Sender: TObject);
begin
  if Self.Width <= 380 then
   Self.Width := 380;
  if self.Height <= 660 then
   Self.Height := 660;
  if self.Width >= 740 then
   begin
     MainMenu.Mode := TMultiViewMode.Panel;
     Tab_menu.ActiveTab := Tab_menu_principal;
     Btn_Menu.Visible := False;
     Btn_fecha_main_menu.Visible := False;
   end
  else
   begin
     MainMenu.Mode := TMultiViewMode.Drawer;
     Btn_Menu.Visible := True;
     Btn_fecha_main_menu.Visible := True;
   end;
   RecAniForms.Height := Self.Height + 50;
   RecAniForms.Width := Lay_main.Width;
   RecAniForms.Position.X := 0;
   AniAberturaFechaForm.StartValue := Self.Height +50;
   if RecAniForms.Position.Y <> -50 then
    RecAniForms.Position.Y := Self.Height +50;
end;

procedure TForm_Windows_Main.FormShow(Sender: TObject);
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

procedure TForm_Windows_Main.Label_DataClick(Sender: TObject);
begin
  FCalendar := TViewDialogsMessages.New;
  Form_Windows_Main.AddObject(
                               FCalendar.Pai(Form_Windows_Main).Calendar
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

procedure TForm_Windows_Main.Lay_email_programadorClick(Sender: TObject);
begin
  tLibraryWindows.EnviarEmail('rafael.figueiredo.alves@gmail.com', 'Mais informações sobre o eTasks', 'Olá, Rafael, eu estou interessado em mais informações do projeto eTasks.');
end;

procedure TForm_Windows_Main.Lay_githubClick(Sender: TObject);
begin
  tLibraryWindows.AbrirLink('https://github.com/rafael-figueiredo-alves');
end;

procedure TForm_Windows_Main.Lay_site_programadorClick(Sender: TObject);
begin
  tLibraryWindows.AbrirLink('https://rafael-figueiredo-alves.github.io');
end;

procedure TForm_Windows_Main.ListarTarefas(Data: string);
begin
  Label_Data.Text := Data;
  AtualizaListaTarefas(data);
end;

procedure TForm_Windows_Main.ListaTarefasItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
var
 tarefa : iControllerTarefas;
 erro   : string;
 ErroStatus  : string;
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
         end;

      end
     else
      begin
       tarefa := tControllerFactory.New.Tarefas.id(TListView(sender).Items[ItemIndex].TagString).ExibeTarefa(Erro);
       ShowMessage('Você clicou no item nº '+TListView(sender).Items[ItemIndex].TagString + #13
                   +'Tarefa: '+ tarefa.tarefa + #13
                   +'Descrição: '+ tarefa.descricao + #13
                   +'Categoria: '+ tarefa.categoria
                  );
      end;
   end;
end;

procedure TForm_Windows_Main.ListaTarefasUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
Var
  txt : TListItemText;
begin
  txt := TListItemText(AItem.Objects.FindDrawable('txt_titulo'));
  txt.Width := ListaTarefas.Width - txt.PlaceOffset.X - 68;
  txt := TListItemText(AItem.Objects.FindDrawable('txt_description'));
  txt.Width := ListaTarefas.Width - txt.PlaceOffset.X - 68;
end;

procedure TForm_Windows_Main.menu_ajudaClick(Sender: TObject);
begin
  if MainMenu.Mode = TMultiViewMode.Drawer then
   MainMenu.HideMaster;
  if RecAniForms.Position.Y = -50 then
   AniAberturaFechaForm.Inverse := False;
  AbreTela(TelaAjuda);
end;

procedure TForm_Windows_Main.Menu_categoriasClick(Sender: TObject);
begin
  if MainMenu.Mode = TMultiViewMode.Drawer then
   MainMenu.HideMaster;
  if RecAniForms.Position.Y = -50 then
   AniAberturaFechaForm.Inverse := False;
 AbreTela(TelaCategorias);
end;

procedure TForm_Windows_Main.Menu_comprasClick(Sender: TObject);
begin
  if MainMenu.Mode = TMultiViewMode.Drawer then
   MainMenu.HideMaster;
  if RecAniForms.Position.Y = -50 then
   AniAberturaFechaForm.Inverse := False;
  AbreTela(TelaListas);
end;

procedure TForm_Windows_Main.menu_logoutClick(Sender: TObject);
begin
  if TControllerFactory.New.Login.EfetuarLogout = true then
   begin
      if not Assigned(Form_windows_login) then
       Application.CreateForm(TForm_windows_login, Form_windows_login);
      Application.MainForm := Form_Windows_login;
      Form_Windows_login.Show;
      MainMenu.HideMaster;
      Close;
   end;
end;

procedure TForm_Windows_Main.Menu_metasClick(Sender: TObject);
begin
  if MainMenu.Mode = TMultiViewMode.Drawer then
   MainMenu.HideMaster;
  if RecAniForms.Position.Y = -50 then
   AniAberturaFechaForm.Inverse := False;
 AbreTela(TelaObjetivos);
end;

procedure TForm_Windows_Main.Menu_sobreClick(Sender: TObject);
begin
  Tab_menu.GotoVisibleTab(2);
end;

procedure TForm_Windows_Main.Menu_TarefasClick(Sender: TObject);
begin
  if MainMenu.Mode = TMultiViewMode.Drawer then
   MainMenu.HideMaster;
  if RecAniForms.Position.Y = -50 then
   AniAberturaFechaForm.Inverse := False;
  AbreTela(TelaTarefas);
end;

procedure TForm_Windows_Main.PegarFotoGaleria;
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
                                   begin
                                    Perfil_edit_foto.Fill.Bitmap.Bitmap := Form_Editar_foto.Foto;
                                    Perfil_edit_foto.TagString := 'WithPhoto';
                                   end;
                                 end);

     finally
      form_Editar_Foto.DisposeOf;
     end;
    end;
end;

procedure TForm_Windows_Main.Perfil_edit_fotoClick(Sender: TObject);
begin
  Sheet_fotos := TViewDialogsMessages.New;
  Form_windows_main.AddObject(
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

procedure TForm_Windows_Main.Sai_sem_conexaoFinish(Sender: TObject);
begin
  Lay_sem_conexao.Visible := False;
end;

procedure TForm_Windows_Main.Sai_splash_screenFinish(Sender: TObject);
begin
  Lay_splash_screen.Visible := False;
end;

procedure TForm_Windows_Main.Tab_menuChange(Sender: TObject);
begin
  if MainMenu.Mode = TMultiViewMode.Panel then
   begin
     if Tab_menu.ActiveTab = Tab_menu_principal then
      Btn_fecha_main_menu.Visible := False
     else
      Btn_fecha_main_menu.Visible := True;
   end
  else
   Btn_fecha_main_menu.Visible := True;
end;

procedure TForm_Windows_Main.TirarFotoCamera;
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
                            form_Editar_Foto.DisposeOf;
                           end;
                          end;
                         end);

  finally
   form_camera.DisposeOf;
  end;
end;

end.
