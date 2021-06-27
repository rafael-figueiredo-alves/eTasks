unit eTasks.View.Android.listas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Ani, FMX.Objects, FMX.TabControl, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Edit, FMX.EditBox, FMX.NumberBox, FMX.Effects, FMX.ListBox,
  FMX.SearchBox;

type
  Tandroid_listas = class(TForm)
    Lay_main: TLayout;
    ToolBar_container: TLayout;
    ToolBar: TLayout;
    Linha_titulo: TLine;
    Botao_voltar: TImage;
    botao_ajuda: TImage;
    title_MinhasListas: TImage;
    title_EditaItemLista: TImage;
    title_NovoItemLista: TImage;
    RecStatus: TRectangle;
    AnimaStatus: TFloatAnimation;
    TabListas: TTabControl;
    TabListasListagem: TTabItem;
    TabListasEditaNovo: TTabItem;
    Btn_Add_Meta: TImage;
    Seta_Sem_Metas: TImage;
    Lay_Topo_lista: TLayout;
    Lay_data_select: TLayout;
    Btn_Volta_data: TImage;
    Btn_Avanca_data: TImage;
    Label_Data: TLabel;
    ListaMercado: TListView;
    Lay_Lista_vazia: TLayout;
    ListaVaziaFundo: TRectangle;
    Image_sem_Metas: TImage;
    Img_item_comprado: TImage;
    Img_item_comprar: TImage;
    Btn_apaga_categoria: TImage;
    Btn_OK: TImage;
    Lay_Quantidade_edit: TLayout;
    Linha_quantidade_edit: TLine;
    Label_quantidade_edit: TLabel;
    Layout1: TLayout;
    Line1: TLine;
    Label1: TLabel;
    Lay_quantidade_box: TLayout;
    Diminuir_quantidade: TImage;
    Aumentar_quantidade: TImage;
    Ed_quantidade: TNumberBox;
    StyleBook1: TStyleBook;
    Layout2: TLayout;
    Image1: TImage;
    Edit1: TEdit;
    Lay_meta: TLayout;
    Lay_tarefa_container: TLayout;
    Rec_tarefa: TRectangle;
    ShadowEffect1: TShadowEffect;
    Img_tarefa: TImage;
    Edit_meta: TEdit;
    ListBox1: TListBox;
    SearchBox1: TSearchBox;
    procedure AnimaStatusFinish(Sender: TObject);
    procedure Botao_voltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  android_listas: Tandroid_listas;

implementation

{$R *.fmx}

procedure Tandroid_listas.AnimaStatusFinish(Sender: TObject);
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

procedure Tandroid_listas.Botao_voltarClick(Sender: TObject);
begin
  AnimaStatus.Start;
end;

procedure Tandroid_listas.FormShow(Sender: TObject);
begin
  AnimaStatus.Start;
end;

end.
