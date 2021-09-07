unit eTasks.View.Windows.categories;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Objects,
  FMX.SearchBox, FMX.ListBox, FMX.Edit, FMX.Effects, FMX.TabControl,
  eTasks.View.Dialogs.Factory;

type
  tipo_acao = (taSelecionar, taListar);
  Toperacao = (Editar, Inserir);

  TWindows_Categories = class(TForm)
    Lay_main: TLayout;
    TabCategorias: TTabControl;
    TabListaCategoria: TTabItem;
    Lay_Topo_lista: TLayout;
    Lay_search: TLayout;
    Rec_caixa_pesquisa: TRectangle;
    ShadowEffect2: TShadowEffect;
    Img_btn_pesquisar: TImage;
    Ed_pesquisa: TEdit;
    ListaCategorias: TListBox;
    Lay_sem_categorias: TLayout;
    Image_sem_categorias: TImage;
    Label_sem_categorias: TLabel;
    SearchBox1: TSearchBox;
    Btn_Add_tarefa: TImage;
    Btn_Seleciona: TImage;
    TabEditaCategoria: TTabItem;
    Lay_tarefa: TLayout;
    Lay_tarefa_container: TLayout;
    Rec_tarefa: TRectangle;
    ShadowEffect1: TShadowEffect;
    Edit_categoria: TEdit;
    Lay_descricao_edit: TLayout;
    Linha_descricao_edit: TLine;
    Label_descricao_edit: TLabel;
    Lay_categoria_edit: TLayout;
    Linha_categoria_edit: TLine;
    Label_categoria_edit: TLabel;
    ListaImagemCategoria: TListBox;
    Btn_apaga_categoria: TImage;
    Btn_OK: TImage;
    ToolBar_container: TLayout;
    ToolBar: TLayout;
    Linha_titulo: TLine;
    Botao_voltar: TImage;
    title_Categorias: TImage;
    title_EditaCategoria: TImage;
    title_NovaCategoria: TImage;
    Seletor: TImage;
    StyleBook1: TStyleBook;
    ValidaCategoria: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Botao_voltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Btn_SelecionaClick(Sender: TObject);
    procedure Ed_pesquisaTyping(Sender: TObject);
    Procedure MontaListaExibe;
    Procedure MontaListaSeleciona;
    procedure Btn_Add_tarefaClick(Sender: TObject);
    procedure Btn_apaga_categoriaClick(Sender: TObject);
    procedure Btn_OKClick(Sender: TObject);
    procedure ListaCategoriasItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure ListaImagemCategoriaItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure ValidaCategoriaTimer(Sender: TObject);
  private
    { Private declarations }
    FBtnVoltarClick : TProc;
    fTipoAcao  : tipo_acao;
    FCat_id    : string;
    FCategoria : string;
    FCat_icon  : string;
    FModo      : TModalResult;
    FOperacao  : Toperacao;
    Dialogs     : iViewDialogsFactory;
    Loading     : iViewDialogsFactory;
  public
    { Public declarations }
    Function Exibir : TLayout;
    Function BtnVoltarClick (value: tproc): twindows_categories;
    Procedure Acao (Acao : tipo_acao); overload;
    Function Acao : tipo_acao; overload;
    Function Cat_id : string;
    Function Categoria : string;
    Function cat_icon : string;
    Function Modo : TModalResult;
  end;

var
  Windows_Categories: TWindows_Categories;

implementation

uses
  eTasks.view.categorias, eTasks.Controller.Interfaces, eTasks.libraries,
  eTasks.View.Windows.main, eTasks.Controller.Factory,
  eTasks.libraries.Imagens64, eTasks.View.Dialogs.Messages.Consts;

{$R *.fmx}

{ TWindows_Categories }

function TWindows_Categories.Acao: tipo_acao;
begin
  result := fTipoAcao;
end;

procedure TWindows_Categories.Acao(Acao: tipo_acao);
begin
  FTipoAcao := Acao;
end;

procedure TWindows_Categories.Botao_voltarClick(Sender: TObject);
begin
  if TabCategorias.ActiveTab = TabEditaCategoria then
   begin
     Seletor.Parent := Self;
     Seletor.Visible := False;
     TabCategorias.Previous();
     case fTipoAcao of
       taSelecionar : MontaListaSeleciona;
       taListar     : MontaListaExibe;
     end;
     Ed_pesquisa.Text := '';
     SearchBox1.Text  := '';
   end
  else
   begin
     FModo := mrCancel;
     FBtnVoltarClick;
   end;
end;

function TWindows_Categories.BtnVoltarClick(value: tproc): twindows_categories;
begin
  Result := Self;
  FBtnVoltarClick := value;
end;

procedure TWindows_Categories.Btn_Add_tarefaClick(Sender: TObject);
begin
  ValidaCategoria.Enabled := True;;
  Edit_categoria.Text := '';
  ListaImagemCategoria.ItemIndex := 0;
  Seletor.Parent := ListaImagemCategoria.Selected;
  Seletor.Visible := True;
  Seletor.BringToFront;
  Btn_apaga_categoria.Visible := false;
  FOperacao := Inserir;
  ListaImagemCategoria.ScrollToItem(ListaImagemCategoria.ListItems[0]);
  TabCategorias.GotoVisibleTab(1);
end;

procedure TWindows_Categories.Btn_apaga_categoriaClick(Sender: TObject);
Var
 Erro      : string;
 FMensagem : tTipoMensagem;
begin
  Dialogs := tviewDialogsMessages.New;
  Form_windows_main.AddObject(
    Dialogs.Pai(Form_Windows_Main)
      .DialogYesNo
             .Messagem('Tem certeza que deseja apagar esta categoria?')
             .BtnYes(Procedure ()
                     begin
                      Dialogs.DialogYesNo.Fechar;
                      Dialogs := nil;
                      teTasksLibrary.CustomThread(Procedure ()
                                                  begin
                                                   Loading := tviewDialogsMessages.New;
                                                   Form_Windows_Main.AddObject(Loading.Pai(Form_Windows_Main)
                                                                               .Loading
                                                                             .Mensagem('Aguarde ... Apagando categoria ...')
                                                                             .AcaoLimpa(Procedure ()
                                                                                        begin
                                                                                         Loading := nil;
                                                                                        end)
                                                                             .Exibe
                                                                           );
                                                  end,
                                                  Procedure ()
                                                  begin
                                                    TControllerFactory.New.Categorias
                                                                            .Cat_id(FCat_id)
                                                                            .DeletarCategoria(Erro);
                                                    FMensagem := tpmCategoria_apagada;
                                                  end,
                                                  Procedure ()
                                                  begin
                                                   Loading.Loading.Fechar;
                                                   if erro = '' then
                                                    begin
                                                     Dialogs := tviewdialogsmessages.New;
                                                     Form_Windows_Main.AddObject(
                                                           Dialogs.Pai(Form_Windows_Main)
                                                             .DialogMessages
                                                                    .TipoMensagem(FMensagem)
                                                                    .AcaoBotao(Procedure ()
                                                                               begin
                                                                                Dialogs := nil;
                                                                                Seletor.Parent := Self;
                                                                                Seletor.Visible := False;
                                                                                TabCategorias.Previous();
                                                                                case fTipoAcao of
                                                                                 taSelecionar : MontaListaSeleciona;
                                                                                 taListar     : MontaListaExibe;
                                                                                end;
                                                                                Ed_pesquisa.Text := '';
                                                                                SearchBox1.Text  := '';
                                                                               end)
                                                                    .AcaoFundo(Procedure ()
                                                                               begin
                                                                                Dialogs := nil;
                                                                                Seletor.Parent := Self;
                                                                                Seletor.Visible := False;
                                                                                TabCategorias.Previous();
                                                                                case fTipoAcao of
                                                                                 taSelecionar : MontaListaSeleciona;
                                                                                 taListar     : MontaListaExibe;
                                                                                end;
                                                                                Ed_pesquisa.Text := '';
                                                                                SearchBox1.Text  := '';
                                                                               end)
                                                                    .Exibe
                                                                      );
                                                    end;
                                                  end);
                     end)
             .BtnNo(Procedure ()
                    begin
                     Dialogs := nil;
                    end)
             .Fundo(procedure ()
                    begin
                     Dialogs := nil;
                    end)
             .Exibe
  );
end;

procedure TWindows_Categories.Btn_OKClick(Sender: TObject);
Var
 Erro      : string;
 FMensagem : tTipoMensagem;
begin
  teTasksLibrary.CustomThread(Procedure ()
                              var
                               msg : string;
                              begin
                               Loading := tviewDialogsMessages.New;
                               case FOperacao of
                                 Editar : msg := 'Aguarde ... Salvando modificações ...';
                                 Inserir: msg := 'Aguarde ... Criando categoria ...' ;
                               end;
                               Form_Windows_Main.AddObject(Loading.Pai(Form_Windows_Main)
                                                              .Loading
                                                                  .Mensagem(msg)
                                                                  .AcaoLimpa(Procedure ()
                                                                             begin
                                                                               Loading := nil;
                                                                             end)
                                                                  .Exibe
                                                          );
                              end,
                              Procedure ()
                              begin
                               case FOperacao of
                                Editar  : begin
                                           TControllerFactory.New.Categorias
                                                                   .Cat_id(FCat_id)
                                                                   .Categoria(Edit_categoria.Text)
                                                                   .Cat_icon(FCat_icon)
                                                                   .EditarCategoria(Erro);
                                           FMensagem := tpmCategoria_editada;
                                          end;
                                Inserir : begin
                                           TControllerFactory.New.Categorias
                                                                   .Categoria(Edit_categoria.Text)
                                                                   .Cat_icon(FCat_icon)
                                                                   .CriarCategoria(erro);
                                           FMensagem := tpmCategoria_inserida;
                                          end;
                               end;
                              end,
                              Procedure ()
                              begin
                               Loading.Loading.Fechar;
                               if erro = '' then
                                begin
                                 Dialogs := tviewdialogsmessages.New;
                                 Form_windows_main.AddObject(
                                                           Dialogs.Pai(Form_Windows_Main)
                                                              .DialogMessages
                                                                    .TipoMensagem(FMensagem)
                                                                    .AcaoBotao(Procedure ()
                                                                               begin
                                                                                Dialogs := nil;
                                                                                Seletor.Parent := Self;
                                                                                Seletor.Visible := False;
                                                                                ValidaCategoria.Enabled := False;
                                                                                TabCategorias.Previous();
                                                                                case fTipoAcao of
                                                                                 taSelecionar : MontaListaSeleciona;
                                                                                 taListar     : MontaListaExibe;
                                                                                end;
                                                                                Ed_pesquisa.Text := '';
                                                                                SearchBox1.Text  := '';
                                                                               end)
                                                                    .AcaoFundo(Procedure ()
                                                                               begin
                                                                                Dialogs := nil;
                                                                                Seletor.Parent := Self;
                                                                                Seletor.Visible := False;
                                                                                ValidaCategoria.Enabled := False;
                                                                                TabCategorias.Previous();
                                                                                case fTipoAcao of
                                                                                 taSelecionar : MontaListaSeleciona;
                                                                                 taListar     : MontaListaExibe;
                                                                                end;
                                                                                Ed_pesquisa.Text := '';
                                                                                SearchBox1.Text  := '';
                                                                               end)
                                                                    .Exibe
                                                           );
                                end;
                              end);
end;

procedure TWindows_Categories.Btn_SelecionaClick(Sender: TObject);
begin
  FModo := mrOk;
  FBtnVoltarClick;
end;

procedure TWindows_Categories.Button1Click(Sender: TObject);
begin
  FBtnVoltarClick;
end;

function TWindows_Categories.Categoria: string;
begin
  Result := FCategoria;
end;

function TWindows_Categories.cat_icon: string;
begin
  Result := FCat_icon;
end;

function TWindows_Categories.Cat_id: string;
begin
  Result := FCat_id;
end;

procedure TWindows_Categories.Ed_pesquisaTyping(Sender: TObject);
begin
  SearchBox1.Text := Ed_pesquisa.Text;
end;

function TWindows_Categories.Exibir: TLayout;
begin
  Seletor.Parent   := Self;
  Seletor.Visible  := False;
  Ed_pesquisa.Text := '';
  SearchBox1.Text  := '';
  ListaCategorias.Clear;
  title_EditaCategoria.Visible   := False;
  title_NovaCategoria.Visible    := False;
  title_Categorias.Visible := True;
  TabCategorias.ActiveTab := TabListaCategoria;
  case FTipoAcao of
    taSelecionar : MontaListaSeleciona;
    taListar     : MontaListaExibe;
  end;
  Result := Lay_main;
end;

procedure TWindows_Categories.FormCreate(Sender: TObject);
begin
  TCategorias.New.MontaListagem(ListaImagemCategoria);
end;

procedure TWindows_Categories.ListaCategoriasItemClick(
  const Sender: TCustomListBox; const Item: TListBoxItem);
Var
  I : integer;
begin
 case fTipoAcao of
  taSelecionar: begin
                 FModo      := mrOk;
                 FCat_id    := Item.TagString;
                 FCategoria := Item.Text;
                 FCat_icon  := Item.ItemData.Detail;
                end;
  taListar: begin
             Edit_categoria.Text := Item.Text;
             FCat_id             := Item.TagString;
             for I := 1 to ListaImagemCategoria.Count-1 do
              begin
               if ListaImagemCategoria.ListItems[i].TagString = Item.ItemData.Detail then
                begin
                 FCat_icon := Item.ItemData.Detail;
                 Seletor.Parent := ListaImagemCategoria.ListItems[i];
                 Seletor.Visible := true;
                 Seletor.BringToFront;
                 ListaImagemCategoria.ScrollToItem(TListBoxItem(Seletor.Parent));
                end;
              end;
             Btn_apaga_categoria.Visible := True;
             FOperacao := Editar;
             ValidaCategoria.Enabled := True;
             TabCategorias.GotoVisibleTab(1);
            End;
 end;
end;

procedure TWindows_Categories.ListaImagemCategoriaItemClick(
  const Sender: TCustomListBox; const Item: TListBoxItem);
begin
  Seletor.Parent := Item;
  FCat_icon      := Item.TagString;
end;

function TWindows_Categories.Modo: TModalResult;
begin
 Result := FModo;
end;

procedure TWindows_Categories.MontaListaExibe;
Var
 Categorias : iControllerCategorias;
 erro: string;
begin
  teTasksLibrary.CustomThread(Procedure ()
                              begin
                               Loading := tViewDialogsMessages.New;
                               form_windows_main.AddObject(Loading.Pai(form_windows_main).Loading
                                                                  .Mensagem('Buscando categorias ...')
                                                                  .AcaoLimpa(Procedure ()
                                                                             begin
                                                                               Loading := nil;
                                                                             end)
                                                                  .Exibe
                                                         );
                              end,
                              Procedure ()
                              begin
                               Categorias := tcontrollerfactory.New.Categorias.ListarCategorias(erro);
                              end,
                              Procedure ()
                              var
                               Categoria  : TCategoria;
                               lbitem     : TListBoxItem;
                               Bitmap     : tbitmap;
                              begin
                               Loading.Loading.Fechar;
                               if Erro = '' then
                                begin
                                 ListaCategorias.BeginUpdate;
                                 Lay_sem_categorias.Visible := False;
                                 ListaCategorias.Clear;
                                 if Categorias.ListagemCategorias.Count <> 0 then
                                  begin
                                   for Categoria in Categorias.ListagemCategorias.Values do
                                    begin
                                     lbitem             := TListBoxItem.Create(nil);
                                     lbitem.Parent      := ListaCategorias;
                                     lbitem.StyleLookup := 'ListBoxItem_Exibe';
                                     lbitem.TagString   := Categoria.cat_id;
                                     lbitem.ItemData.Detail := Categoria.cat_icon;
                                     lbitem.Text        := Categoria.categoria;
                                     Bitmap             := timagens64.fromBase64(TCategorias.New.PegaImagem(Categoria.cat_icon));
                                     lbitem.ItemData.Bitmap := Bitmap;
                                     lbitem.Selectable := false;
                                     Bitmap.DisposeOf;
                                    end;
                                  end
                                 else
                                  Lay_sem_categorias.Visible := True;
                                 ListaCategorias.EndUpdate;
                                 Btn_Seleciona.Visible := False;
                                end
                               else
                                begin
                                  if Erro = 'vazio' then
                                   begin
                                    Listacategorias.Clear;
                                    Lay_sem_categorias.Visible := True;
                                    Btn_Seleciona.Visible := False;
                                   end;
                                end;
                              end);
end;

procedure TWindows_Categories.MontaListaSeleciona;
Var
 Categorias : iControllerCategorias;
 erro: string;
begin
  teTasksLibrary.CustomThread(Procedure ()
                              begin
                               Loading := tViewDialogsMessages.New;
                               Form_windows_main.AddObject(Loading.Pai(form_windows_main).Loading
                                                                  .Mensagem('Buscando categorias ...')
                                                                  .AcaoLimpa(Procedure ()
                                                                             begin
                                                                               Loading := nil;
                                                                             end)
                                                                  .Exibe
                                                         );
                              end,
                              Procedure ()
                              begin
                               Categorias := tcontrollerfactory.New.Categorias.ListarCategorias(erro);
                              end,
                              Procedure ()
                              Var
                               Categoria  : TCategoria;
                               lbitem     : TListBoxItem;
                               Bitmap     : tbitmap;
                              begin
                               Loading.Loading.Fechar;
                               if Erro = '' then
                                begin
                                 ListaCategorias.BeginUpdate;
                                 Lay_sem_categorias.Visible := False;
                                 ListaCategorias.Clear;
                                 if Categorias.ListagemCategorias.Count <> 0 then
                                  begin
                                   for Categoria in Categorias.ListagemCategorias.Values do
                                    begin
                                     lbitem             := TListBoxItem.Create(nil);
                                     lbitem.Parent      := ListaCategorias;
                                     lbitem.StyleLookup := 'ListBoxItem_Seleciona';
                                     lbitem.TagString   := Categoria.cat_id;
                                     lbitem.Text        := Categoria.categoria;
                                     lbitem.ItemData.Detail := Categoria.cat_icon;
                                     Bitmap             := timagens64.fromBase64(TCategorias.New.PegaImagem(Categoria.cat_icon));
                                     lbitem.ItemData.Bitmap := Bitmap;
                                     lbitem.Selectable := true;
                                     Bitmap.DisposeOf;
                                     ListaCategorias.ItemIndex := 0;
                                     FCat_id := ListaCategorias.Selected.TagString;
                                     FCategoria := ListaCategorias.Selected.Text;
                                     FCat_icon := ListaCategorias.Selected.ItemData.Detail;
                                     Btn_Seleciona.Visible := True;
                                    end;
                                  end
                                 else
                                  begin
                                   Lay_sem_categorias.Visible := True;
                                   Btn_Seleciona.Visible := False;
                                  end;
                                 ListaCategorias.EndUpdate;
                                end
                               else
                                begin
                                  if Erro = 'vazio' then
                                   begin
                                    ListaCategorias.Clear;
                                    Lay_sem_categorias.Visible := True;
                                    Btn_Seleciona.Visible := False;
                                   end;
                                end;
                              end);
end;

procedure TWindows_Categories.ValidaCategoriaTimer(Sender: TObject);
begin
  Btn_OK.Enabled := not Edit_categoria.Text.IsEmpty;
end;

end.
