unit eTasks.View.Android.tasks;

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
  FMX.StdCtrls, FMX.Layouts, FMX.TabControl, FMX.Objects, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, FMX.Ani;

type
  tipo_acao = (taNovo, taEditar, taExibe, taLista);

  TTela_Tarefas = class(TForm)
    Lay_main: TLayout;
    TabTarefas: TTabControl;
    TabListaTarefa: TTabItem;
    TabExibeTarefa: TTabItem;
    TabNovoEditaTarefa: TTabItem;
    ToolBar_container: TLayout;
    ToolBar: TLayout;
    Line1: TLine;
    Botao_voltar: TImage;
    botao_ajuda: TImage;
    title_MinhasTarefas: TImage;
    title_EditaTarefa: TImage;
    title_NovaTarefa: TImage;
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
    Img_Afazer: TImage;
    Img_Concluido: TImage;
    RecStatus: TRectangle;
    AnimaStatus: TFloatAnimation;
    procedure FormShow(Sender: TObject);
    procedure Botao_voltarClick(Sender: TObject);
    procedure AnimaStatusFinish(Sender: TObject);
  private
    { Private declarations }
    {FKBBounds: TRectF;
    FNeedOffset: Boolean;
    procedure CalcContentBoundsProc(Sender: TObject;
                                    var ContentBounds: TRectF);
    procedure RestorePosition;
    procedure UpdateKBBounds;}
    FTipoAcao : tipo_acao;
    Procedure Add_tarefa (id, Status, tarefa, descricao: string; categoria: string);
  public
    { Public declarations }
    Procedure Acao (Acao : tipo_acao);
  end;

var
  Tela_Tarefas: TTela_Tarefas;

implementation

uses
  eTasks.libraries.Imagens64, eTasks.view.categorias;

{$R *.fmx}

procedure TTela_Tarefas.Acao(Acao: tipo_acao);
begin
  FTipoAcao := Acao;
end;

procedure TTela_Tarefas.Add_tarefa(id, Status, tarefa, descricao,
  categoria: string);
Var
 img : TBitmap;
 picture : TImage;
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
    picture := TImage.Create(nil);
    try
     TListItemImage(Objects.FindDrawable('img_category')).OwnsBitmap := True;
     picture.Bitmap := img;
     TListItemImage(Objects.FindDrawable('img_category')).Bitmap := picture.Bitmap;
     img.disposeof;
    finally
     picture.DisposeOf;
    end;

    TagString := id;
  end;
end;

procedure TTela_Tarefas.AnimaStatusFinish(Sender: TObject);
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

procedure TTela_Tarefas.Botao_voltarClick(Sender: TObject);
begin
  //ModalResult := mrOk;
  AnimaStatus.Start;
end;

procedure TTela_Tarefas.FormShow(Sender: TObject);
begin
  case FTipoAcao of
    taNovo: begin
              title_MinhasTarefas.Visible := False;
              title_EditaTarefa.Visible   := False;
              title_NovaTarefa.Visible    := True;
              TabTarefas.ActiveTab        := TabNovoEditaTarefa;
            end;
    taEditar: begin
              title_MinhasTarefas.Visible := False;
              title_EditaTarefa.Visible   := True;
              title_NovaTarefa.Visible    := False;
              TabTarefas.ActiveTab        := TabNovoEditaTarefa;
              end;
    taExibe: begin
              title_MinhasTarefas.Visible := True;
              title_EditaTarefa.Visible   := False;
              title_NovaTarefa.Visible    := False;
              TabTarefas.ActiveTab        := TabExibeTarefa;
             end;
    taLista: begin
              title_MinhasTarefas.Visible := True;
              title_EditaTarefa.Visible   := False;
              title_NovaTarefa.Visible    := False;
              TabTarefas.ActiveTab        := TabListaTarefa;
             end;
  end;
  AnimaStatus.Start;
end;

end.
