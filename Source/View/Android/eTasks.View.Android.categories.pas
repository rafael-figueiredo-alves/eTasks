unit eTasks.View.Android.categories;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Ani, FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.Effects, FMX.Objects,
  FMX.ListView, FMX.Controls.Presentation, FMX.StdCtrls, FMX.TabControl,
  FMX.Layouts, FMX.ListBox;

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
    Edit_tarefa: TEdit;
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
    Rectangle1: TRectangle;
    ShadowEffect2: TShadowEffect;
    Image1: TImage;
    Edit1: TEdit;
    Image2: TImage;
    ListBox1: TListBox;
    StyleBook1: TStyleBook;
    procedure FormShow(Sender: TObject);
    procedure Botao_voltarClick(Sender: TObject);
    procedure AnimaStatusFinish(Sender: TObject);
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
  eTasks.view.categorias;

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

procedure TTela_categorias.FormShow(Sender: TObject);
begin
  case FTipoAcao of
    taSelecionar : begin
                    title_Categorias.Visible := True;
                    title_EditaCategoria.Visible   := False;
                    title_NovaCategoria.Visible    := False;
                    TabCategorias.ActiveTab        := TabListaCategoria;
                   end;
    taListar     : begin
                    title_Categorias.Visible := True;
                    title_EditaCategoria.Visible   := False;
                    title_NovaCategoria.Visible    := False;
                    TabCategorias.ActiveTab        := TabEditaCategoria;
                    TCategorias.New.MontaListagem(ListBox1);
                   end;
  end;
  AnimaStatus.Start;
end;

end.
