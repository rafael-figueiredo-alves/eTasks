unit eTasks.View.Android.Metas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Ani, FMX.Objects, FMX.TabControl, FMX.Controls.Presentation, FMX.Edit,
  FMX.Effects, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView;

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
    procedure AnimaStatusFinish(Sender: TObject);
    procedure Botao_voltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

end.
