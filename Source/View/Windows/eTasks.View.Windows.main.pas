unit eTasks.View.Windows.main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.ListBox,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Edit, FMX.TabControl, FMX.MultiView, System.Actions, FMX.ActnList,
  FMX.StdActns, FMX.MediaLibrary.Actions, FMX.ListView, FMX.Effects,
  eTasks.View.Dialogs.Factory;

type
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
    Btn_busca_atualizacao: TImage;
    Lay_copyright: TLayout;
    Img_copyright: TImage;
    Lay_contatos_sobre: TLayout;
    Img_sobre_contatos: TImage;
    Lay_email_programador: TLayout;
    Lay_github: TLayout;
    Lay_site_programador: TLayout;
    Btn_fecha_main_menu: TImage;
    SelecionaFoto: TOpenDialog;
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
  private
    { Private declarations }
    Sheet_fotos : iViewDialogsFactory;
    Dialogs     : iViewDialogsFactory;
    Loading     : iViewDialogsFactory;

    Procedure TirarFotoCamera;
    Procedure PegarFotoGaleria;

    Procedure AtualizaInfoUsuarioLogado;
    Procedure AtualizaListaTarefas(data: string);

    Procedure Add_tarefa (Status, tarefa, descricao: string; categoria: string);
  public
    { Public declarations }
    Procedure AberturaFormPrincipal;
    Procedure ListarTarefas(Data: string);
  end;

var
  Form_Windows_Main: TForm_Windows_Main;

implementation

uses
  eTasks.Controller.Usuario, eTasks.Controller.Interfaces,
  eTasks.libraries.Imagens64, eTasks.view.categorias,
  eTasks.View.Dialogs.TirarFoto, eTasks.View.Dialogs.EditarFoto,
  eTasks.Controller.Login, eTasks.View.Windows.login;

{$R *.fmx}


procedure TForm_Windows_Main.AberturaFormPrincipal;
begin
  AtualizaInfoUsuarioLogado;
  ListarTarefas(DateToStr(Now));
end;

procedure TForm_Windows_Main.Add_tarefa(Status, tarefa, descricao,
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

    TagString := status;
  end;
end;

procedure TForm_Windows_Main.AtualizaInfoUsuarioLogado;
var
 AUsuario : iControllerUsuario;
 BitMap : TBitmap;
begin
  AUsuario := tControllerUsuario.New.Ler;
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
begin
  ListaTarefas.Items.Clear;
  Lay_Lista_vazia.Visible := False;
  if data = '04/01/2021' then
   Lay_Lista_vazia.Visible := true
  else
   begin
     Lay_Lista_vazia.Visible := false;
     Add_tarefa('fazer', 'Teste 0001', 'Este é um teste', 'Cat_001');
     Add_tarefa('feito', 'Teste 0002', 'Este é um teste 2', 'Cat_061');
     Add_tarefa('fazer', 'Teste 0003', 'Este é um teste 3', 'Cat_010');
     Add_tarefa('fazer', 'Teste 0004', 'Este é um teste 4', 'Cat_078');
     Add_tarefa('feito', 'Teste 0005', 'Este é um teste 5', 'Cat_025');
   end;
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
     Btn_Menu.Visible := False;
     Btn_fecha_main_menu.Visible := False;
   end
  else
   begin
     MainMenu.Mode := TMultiViewMode.Drawer;
     Btn_Menu.Visible := True;
     Btn_fecha_main_menu.Visible := True;
   end;
end;

procedure TForm_Windows_Main.FormShow(Sender: TObject);
begin
   AberturaFormPrincipal;
end;

procedure TForm_Windows_Main.ListarTarefas(Data: string);
begin
  Label_Data.Text := Data;
  AtualizaListaTarefas(data);
end;

procedure TForm_Windows_Main.ListaTarefasItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  if TListView(sender).Selected <> nil then
   begin
     if ItemObject is TListItemImage then
      begin
        if ItemObject.Name = 'img_status' then
         begin
           if ItemObject.TagString = 'fazer' then
            begin
             TListItemImage(ItemObject).Bitmap := Img_Concluido.Bitmap;
             ItemObject.TagString := 'concluido';
            end
           else
            begin
             TListItemImage(ItemObject).Bitmap := Img_Afazer.Bitmap;
             ItemObject.TagString := 'fazer';
            end;
         end;

      end
     else
      ShowMessage('Você clicou no item nº '+TListView(sender).Items[ItemIndex].TagString);

   end;
end;

procedure TForm_Windows_Main.menu_logoutClick(Sender: TObject);
begin
  if tControllerLogin.New.EfetuarLogout = true then
   begin
      if not Assigned(Form_windows_login) then
       Application.CreateForm(TForm_windows_login, Form_windows_login);
      Application.MainForm := Form_Windows_login;
      Form_Windows_login.Show;
      MainMenu.HideMaster;
      Close;
   end;
end;

procedure TForm_Windows_Main.Menu_sobreClick(Sender: TObject);
begin
  Tab_menu.GotoVisibleTab(2);
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
