unit eTasks.View.Windows.Metas;

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
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.MultiView, FMX.ScrollBox, FMX.Memo, FMX.StdCtrls, FMX.ListView,
  FMX.Controls.Presentation, FMX.Edit, FMX.Effects, FMX.Objects, FMX.TabControl,
  FMX.Layouts;

type
  TWindows_Metas = class(TForm)
    Img_meta_concluida: TImage;
    Img_meta_concluir: TImage;
    Img_prioridade_alta: TImage;
    Img_prioridade_baixa: TImage;
    Lay_main: TLayout;
    ToolBar_container: TLayout;
    ToolBar: TLayout;
    Linha_titulo: TLine;
    Botao_voltar: TImage;
    botao_ajuda: TImage;
    title_MinhasMetas: TImage;
    title_EditaMeta: TImage;
    title_NovaMeta: TImage;
    TabMetas: TTabControl;
    TabMetas_lista: TTabItem;
    Lay_Topo_lista: TLayout;
    Lay_search: TLayout;
    Rec_caixa_pesquisa: TRectangle;
    ShadowEffect2: TShadowEffect;
    Img_pesquisar: TImage;
    Ed_pesquisa: TEdit;
    Btn_filtro_metas: TImage;
    ListagemMetas: TListView;
    Lay_Lista_vazia: TLayout;
    ListaVaziaFundo: TRectangle;
    Image_sem_Metas: TImage;
    Btn_Add_Meta: TImage;
    Seta_Sem_Metas: TImage;
    TabMetas_exibe: TTabItem;
    Lay_container_meta: TLayout;
    Lay_container_status: TLayout;
    Btn_status: TImage;
    Label_meta: TLabel;
    Lay_descricao_exibe: TLayout;
    Linha_descricao_exibe: TLine;
    Lbl_descricao_title_exibe: TLabel;
    Lay_container_descricao_exibe: TLayout;
    Label_descricao: TLabel;
    Lay_prioridade_exibe: TLayout;
    Linha_categoria_title_exibe: TLine;
    Lbl_prioridade_exibe: TLabel;
    Lay_container_prioridade: TLayout;
    Lay_prioridade_btn: TLayout;
    Fundo_btn_prioridade: TRectangle;
    img_prioridade_btn: TImage;
    Lbl_prioridade_btn: TLabel;
    Btn_apaga_meta: TImage;
    Btn_edita_meta: TImage;
    TabMetas_EditaNovo: TTabItem;
    Lay_meta: TLayout;
    Lay_tarefa_container: TLayout;
    Rec_tarefa: TRectangle;
    ShadowEffect1: TShadowEffect;
    Img_tarefa: TImage;
    Edit_meta: TEdit;
    Lay_descricao_edit: TLayout;
    Linha_descricao_edit: TLine;
    Label_descricao_edit: TLabel;
    Lay_descricao_container: TLayout;
    Lay_descricao_edit_cont: TLayout;
    Rect_descricao: TRectangle;
    sombra_descrcao_container: TShadowEffect;
    Ed_descricao: TMemo;
    Lay_prioridade_edit: TLayout;
    Linha_categoria_edit: TLine;
    Label_prioridade_edit: TLabel;
    Lay_prioridade_container: TLayout;
    Lay_prioridade_alta: TLayout;
    Btn_prioridade_alta: TRectangle;
    Img_btn_prioridade_alta: TImage;
    Lbl_prioridade_btn_alta: TLabel;
    Lay_prioridade_normal: TLayout;
    btn_prioridade_normal: TRectangle;
    Lbl_prioridade_normal_btn: TLabel;
    seletor_Prioridade: TImage;
    Lay_prioridade_baixa: TLayout;
    btn_prioridade_baixa: TRectangle;
    Img_baixa_prioridade: TImage;
    Lbl_prioridade_baixa: TLabel;
    Btn_OK: TImage;
    Menu_filtros: TMultiView;
    Menu_sem_filtro: TLayout;
    lbl_sem_filtro: TLabel;
    Seletor_filtro: TImage;
    Menu_Prioridade_Alta: TLayout;
    Img_menu_prioridade_alta: TImage;
    lbl_menu_prioridade_alta: TLabel;
    Menu_Prioridade_normal: TLayout;
    lbl_prioridade_menu_normal: TLabel;
    Menu_prioridade_Baixa: TLayout;
    Img_menu_prioridade_baixa: TImage;
    lbl_enu_prioridade_baixa: TLabel;
    StyleBook1: TStyleBook;
    ValidaMeta: TTimer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Windows_Metas: TWindows_Metas;

implementation

{$R *.fmx}

end.
