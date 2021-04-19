unit eTasks.View.Android.categories;

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
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.Ani,
  FMX.ScrollBox,
  FMX.Edit,
  FMX.Effects,
  FMX.Objects,
  FMX.ListView,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.TabControl,
  FMX.Layouts,
  FMX.ListBox,
  FMX.SearchBox,
  eTasks.View.Dialogs.Factory;

type
  tipo_acao = (taSelecionar, taListar);
  Toperacao = (Editar, Inserir);

  TTela_categorias = class(TForm)
    Lay_main: TLayout;
    TabCategorias: TTabControl;
    TabListaCategoria: TTabItem;
    Lay_Topo_lista: TLayout;
    Lay_search: TLayout;
    Btn_Add_tarefa: TImage;
    TabEditaCategoria: TTabItem;
    Btn_OK: TImage;
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
    ToolBar_container: TLayout;
    ToolBar: TLayout;
    Linha_titulo: TLine;
    Botao_voltar: TImage;
    title_Categorias: TImage;
    title_EditaCategoria: TImage;
    title_NovaCategoria: TImage;
    RecStatus: TRectangle;
    AnimaStatus: TFloatAnimation;
    Rec_caixa_pesquisa: TRectangle;
    ShadowEffect2: TShadowEffect;
    Img_btn_pesquisar: TImage;
    Ed_pesquisa: TEdit;
    Btn_Seleciona: TImage;
    ListaImagemCategoria: TListBox;
    Btn_apaga_categoria: TImage;
    StyleBook1: TStyleBook;
    ListaCategorias: TListBox;
    Seletor: TImage;
    Lay_sem_categorias: TLayout;
    Image_sem_categorias: TImage;
    Label_sem_categorias: TLabel;
    SearchBox1: TSearchBox;
    botao_ajuda: TImage;
    ValidaCategoria: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Botao_voltarClick(Sender: TObject);
    procedure AnimaStatusFinish(Sender: TObject);
    Procedure MontaListaExibe;
    Procedure MontaListaSeleciona;
    procedure Ed_pesquisaTyping(Sender: TObject);
    procedure Btn_Add_tarefaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Btn_SelecionaClick(Sender: TObject);
    procedure ListaCategoriasItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure ListaImagemCategoriaItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure Btn_OKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Btn_apaga_categoriaClick(Sender: TObject);
    procedure ValidaCategoriaTimer(Sender: TObject);
  private
    { Private declarations }
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
    Procedure Acao (Acao : tipo_acao); overload;
    Function Acao : tipo_acao; overload;
    Function Cat_id : string;
    Function Categoria : string;
    Function cat_icon : string;
  end;

var
  Tela_categorias: TTela_categorias;

implementation

{$R *.fmx}

{ TTela_categorias }

Uses
  //Required units
  FMX.platform,
  FMX.VirtualKeyboard,
  //Unit para pegar categorias JSON
  eTasks.view.categorias,
  //Units controller
  eTasks.Controller.Interfaces,
  eTasks.Controller.Factory,
  //Units de library
  eTasks.libraries.Imagens64,
  eTasks.libraries,
  eTasks.View.Dialogs.Messages.Consts;

procedure TTela_categorias.Acao(Acao: tipo_acao);
begin
  FTipoAcao := Acao;
end;

function TTela_categorias.Acao: tipo_acao;
begin
   result := fTipoAcao;
end;

procedure TTela_categorias.AnimaStatusFinish(Sender: TObject);
begin
  if AnimaStatus.Inverse = False then
   begin
    AnimaStatus.Inverse := true;
   end
  else
   begin
    AnimaStatus.Inverse := false;
    ModalResult := FModo;
   end;
end;

procedure TTela_categorias.Botao_voltarClick(Sender: TObject);
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
     AnimaStatus.Start;
   end;
end;

procedure TTela_categorias.Btn_Add_tarefaClick(Sender: TObject);
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

procedure TTela_categorias.Btn_apaga_categoriaClick(Sender: TObject);
Var
 Erro      : string;
 FMensagem : tTipoMensagem;
begin
  Dialogs := tviewDialogsMessages.New;
  Tela_categorias.AddObject(
    Dialogs.DialogYesNo
             .Messagem('Tem certeza que deseja apagar esta categoria?')
             .BtnYes(Procedure ()
                     begin
                      Dialogs.DialogYesNo.Fechar;
                      Dialogs := nil;
                      teTasksLibrary.CustomThread(Procedure ()
                                                  begin
                                                   Loading := tviewDialogsMessages.New;
                                                   Tela_categorias.AddObject(Loading.Loading
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
                                                     Tela_categorias.AddObject(
                                                           Dialogs.DialogMessages
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

procedure TTela_categorias.Btn_OKClick(Sender: TObject);
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
                               Tela_categorias.AddObject(Loading.Loading
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
                                 Tela_categorias.AddObject(
                                                           Dialogs.DialogMessages
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

procedure TTela_categorias.Btn_SelecionaClick(Sender: TObject);
begin
  FModo := mrOk;
  AnimaStatus.Start;
end;

function TTela_categorias.Categoria: string;
begin
  Result := FCategoria;
end;

function TTela_categorias.cat_icon: string;
begin
  Result := FCat_icon;
end;

function TTela_categorias.Cat_id: string;
begin
  Result := FCat_id;
end;

procedure TTela_categorias.Ed_pesquisaTyping(Sender: TObject);
begin
  SearchBox1.Text := Ed_pesquisa.Text;
end;

procedure TTela_categorias.FormCreate(Sender: TObject);
begin
  TCategorias.New.MontaListagem(ListaImagemCategoria);
end;

procedure TTela_categorias.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
Var
  FService : iFMXVirtualKeyboardService;
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
         if (Assigned(Dialogs)) or (Assigned(Loading)) then
          begin
            Key := 0;
            if Assigned(dialogs) then
             begin
              dialogs.DialogMessages.Fechar;
             end;
          end
         else
          begin
           if TabCategorias.ActiveTab = TabEditaCategoria then
            begin
             Key := 0;
             Botao_voltarClick(sender);
            end
          else
           AnimaStatus.Start;
          end;
       end;
    end;
end;

procedure TTela_categorias.FormShow(Sender: TObject);
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
  AnimaStatus.Start;
end;

procedure TTela_categorias.ListaCategoriasItemClick(
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

procedure TTela_categorias.ListaImagemCategoriaItemClick(
  const Sender: TCustomListBox; const Item: TListBoxItem);
begin
  Seletor.Parent := Item;
  FCat_icon      := Item.TagString;
end;

procedure TTela_categorias.MontaListaExibe;
Var
 Categorias : iControllerCategorias;
 erro: string;
begin
  teTasksLibrary.CustomThread(Procedure ()
                              begin
                               Loading := tViewDialogsMessages.New;
                               Tela_categorias.AddObject(Loading.Loading
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

procedure TTela_categorias.MontaListaSeleciona;
Var
 Categorias : iControllerCategorias;
 erro: string;
begin
  teTasksLibrary.CustomThread(Procedure ()
                              begin
                               Loading := tViewDialogsMessages.New;
                               Tela_categorias.AddObject(Loading.Loading
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

procedure TTela_categorias.ValidaCategoriaTimer(Sender: TObject);
begin
  Btn_OK.Enabled := not Edit_categoria.Text.IsEmpty;
end;

end.
