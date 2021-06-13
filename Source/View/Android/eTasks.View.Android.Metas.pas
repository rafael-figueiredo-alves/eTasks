unit eTasks.View.Android.Metas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Ani, FMX.Objects, FMX.TabControl, FMX.Controls.Presentation, FMX.Edit,
  FMX.Effects, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.StdCtrls, FMX.ScrollBox,
  FMX.Memo, FMX.MultiView;

type
  TAndroid_metas = class(TForm)
    Lay_main: TLayout;
    ToolBar_container: TLayout;
    ToolBar: TLayout;
    Linha_titulo: TLine;
    Botao_voltar: TImage;
    botao_ajuda: TImage;
    title_MinhasMetas: TImage;
    title_EditaMeta: TImage;
    title_NovaMeta: TImage;
    RecStatus: TRectangle;
    AnimaStatus: TFloatAnimation;
    TabMetas: TTabControl;
    TabMetas_lista: TTabItem;
    TabMetas_exibe: TTabItem;
    TabMetas_EditaNovo: TTabItem;
    Lay_Topo_lista: TLayout;
    Lay_search: TLayout;
    Rec_caixa_pesquisa: TRectangle;
    ShadowEffect2: TShadowEffect;
    Img_pesquisar: TImage;
    Ed_pesquisa: TEdit;
    Btn_filtro_metas: TImage;
    ListagemMetas: TListView;
    Btn_Add_Meta: TImage;
    Lay_Lista_vazia: TLayout;
    ListaVaziaFundo: TRectangle;
    Image_sem_Metas: TImage;
    Seta_Sem_Metas: TImage;
    Img_meta_concluida: TImage;
    Img_meta_concluir: TImage;
    Img_prioridade_alta: TImage;
    Img_prioridade_baixa: TImage;
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
    Label_categoria_edit: TLabel;
    Lay_prioridade_container: TLayout;
    Btn_OK: TImage;
    Lay_prioridade_alta: TLayout;
    Btn_prioridade_alta: TRectangle;
    Img_btn_prioridade_alta: TImage;
    Lbl_prioridade_btn_alta: TLabel;
    Img_select_Alta: TImage;
    Lay_prioridade_normal: TLayout;
    btn_prioridade_normal: TRectangle;
    Label2: TLabel;
    Img_select_Normal: TImage;
    Lay_prioridade_baixa: TLayout;
    btn_prioridade_baixa: TRectangle;
    Img_baixa_prioridade: TImage;
    Lbl_prioridade_baixa: TLabel;
    Img_select_Baixa: TImage;
    Menu_filtros: TMultiView;
    fundo_menu_filtro: TRectangle;
    ShadowEffect3: TShadowEffect;
    Menu_sem_filtro: TLayout;
    Menu_Prioridade_Alta: TLayout;
    Menu_Prioridade_normal: TLayout;
    Menu_prioridade_Baixa: TLayout;
    Img_menu_prioridade_alta: TImage;
    lbl_menu_prioridade_alta: TLabel;
    lbl_sem_filtro: TLabel;
    lbl_prioridade_menu_normal: TLabel;
    Seletor_filtro: TImage;
    Img_menu_prioridade_baixa: TImage;
    lbl_enu_prioridade_baixa: TLabel;
    procedure AnimaStatusFinish(Sender: TObject);
    procedure Botao_voltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Menu_sem_filtroClick(Sender: TObject);
    procedure Menu_Prioridade_AltaClick(Sender: TObject);
    procedure Menu_Prioridade_normalClick(Sender: TObject);
    procedure Menu_prioridade_BaixaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Android_metas: TAndroid_metas;

implementation

{$R *.fmx}

procedure TAndroid_metas.AnimaStatusFinish(Sender: TObject);
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

procedure TAndroid_metas.Botao_voltarClick(Sender: TObject);
begin
  AnimaStatus.Start;
end;

procedure TAndroid_metas.FormShow(Sender: TObject);
begin
  AnimaStatus.Start;
end;

procedure TAndroid_metas.Menu_Prioridade_AltaClick(Sender: TObject);
begin
  Seletor_filtro.Parent := Menu_Prioridade_Alta;
  Menu_filtros.HideMaster;
end;

procedure TAndroid_metas.Menu_prioridade_BaixaClick(Sender: TObject);
begin
  Seletor_filtro.Parent := Menu_prioridade_Baixa;
  Menu_filtros.HideMaster;
end;

procedure TAndroid_metas.Menu_Prioridade_normalClick(Sender: TObject);
begin
  Seletor_filtro.Parent := Menu_Prioridade_normal;
  Menu_filtros.HideMaster;
end;

procedure TAndroid_metas.Menu_sem_filtroClick(Sender: TObject);
begin
  Seletor_filtro.Parent := Menu_sem_filtro;
  Menu_filtros.HideMaster;
end;

end.
