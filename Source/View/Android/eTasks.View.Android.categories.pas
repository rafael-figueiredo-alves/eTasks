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
  FMX.ListBox, FMX.SearchBox;

type
  tipo_acao = (taSelecionar, taListar);

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
    botao_ajuda: TImage;
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
    procedure FormShow(Sender: TObject);
    procedure Botao_voltarClick(Sender: TObject);
    procedure AnimaStatusFinish(Sender: TObject);
    Procedure MontaListaExibe;
    Procedure MontaListaSeleciona;
    procedure Ed_pesquisaTyping(Sender: TObject);
    procedure Btn_Add_tarefaClick(Sender: TObject);
  private
    { Private declarations }
    fTipoAcao : tipo_acao;
  public
    { Public declarations }
    Procedure Acao (Acao : tipo_acao);
  end;

var
  Tela_categorias: TTela_categorias;

implementation

{$R *.fmx}

{ TTela_categorias }

Uses
  eTasks.view.categorias,
  eTasks.Controller.Interfaces,
  eTasks.Controller.Factory,
  eTasks.libraries.Imagens64;

procedure TTela_categorias.Acao(Acao: tipo_acao);
begin
  FTipoAcao := Acao;
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
    ModalResult := mrOk;
   end;
end;

procedure TTela_categorias.Botao_voltarClick(Sender: TObject);
begin
  AnimaStatus.Start;
end;

procedure TTela_categorias.Btn_Add_tarefaClick(Sender: TObject);
begin
  TCategorias.New.MontaListagem(ListaImagemCategoria);
  Edit_categoria.Text := '';
  ListaImagemCategoria.ItemIndex := 0;
  Seletor.Parent := ListaImagemCategoria.Selected;
  Seletor.Visible := True;
  Seletor.BringToFront;
  TabCategorias.GotoVisibleTab(1);
end;

procedure TTela_categorias.Ed_pesquisaTyping(Sender: TObject);
begin
  SearchBox1.Text := Ed_pesquisa.Text;
end;

procedure TTela_categorias.FormShow(Sender: TObject);
begin
  Seletor.Parent := Self;
  Seletor.Visible := False;
  case FTipoAcao of
    taSelecionar : begin
                    title_Categorias.Visible := True;
                    title_EditaCategoria.Visible   := False;
                    title_NovaCategoria.Visible    := False;
                    TabCategorias.ActiveTab        := TabListaCategoria;
                    MontaListaSeleciona;
                   end;
    taListar     : begin
                    title_Categorias.Visible := True;
                    title_EditaCategoria.Visible   := False;
                    title_NovaCategoria.Visible    := False;
                    TabCategorias.ActiveTab        := TabListaCategoria;
                    MontaListaExibe;
                   end;
  end;
  AnimaStatus.Start;
end;

procedure TTela_categorias.MontaListaExibe;
Var
 lbitem     : TListBoxItem;
 Bitmap     : tbitmap;
 Categorias : iControllerCategorias;
 Categoria  : TCategoria;
 erro: string;
begin
  ListaCategorias.BeginUpdate;
  Lay_sem_categorias.Visible := False;
  ListaCategorias.Clear;
  Categorias := tcontrollerfactory.New.Categorias.ListarCategorias(erro);
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
end;

procedure TTela_categorias.MontaListaSeleciona;
Var
 lbitem     : TListBoxItem;
 Bitmap     : tbitmap;
 Categorias : iControllerCategorias;
 Categoria  : TCategoria;
 erro: string;
begin
  ListaCategorias.BeginUpdate;
  Lay_sem_categorias.Visible := False;
  ListaCategorias.Clear;
  Categorias := tcontrollerfactory.New.Categorias.ListarCategorias(erro);
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
       Btn_Seleciona.Visible := True;
     end;
   end
  else
   begin
     Lay_sem_categorias.Visible := True;
     Btn_Seleciona.Visible := False;
   end;
  ListaCategorias.EndUpdate;
end;

end.
