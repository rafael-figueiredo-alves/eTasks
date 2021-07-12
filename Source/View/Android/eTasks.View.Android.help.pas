unit eTasks.View.Android.help;

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
  FMX.Objects,
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Ani, FMX.TabControl;

type
  TForm_Android_Ajuda = class(TForm)
    Lay_main: TLayout;
    StyleBook1: TStyleBook;
    ToolBar_container: TLayout;
    ToolBar: TLayout;
    Linha_titulo: TLine;
    Botao_voltar: TImage;
    title_Ajuda: TImage;
    RecStatus: TRectangle;
    AnimaStatus: TFloatAnimation;
    Label_quantidade_edit: TLabel;
    Line1: TLine;
    TabPrincipal: TTabControl;
    TabHome: TTabItem;
    TabTarefas: TTabItem;
    TabMetas: TTabItem;
    TabCategorias: TTabItem;
    TabListas: TTabItem;
    TabContas: TTabItem;
    TabAtualizacao: TTabItem;
    procedure AnimaStatusFinish(Sender: TObject);
    procedure Botao_voltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Android_Ajuda: TForm_Android_Ajuda;

implementation

{$R *.fmx}

procedure TForm_Android_Ajuda.AnimaStatusFinish(Sender: TObject);
begin
  if AnimaStatus.Inverse = False then
  begin
    AnimaStatus.Inverse := true;
  end
  else
  begin
    AnimaStatus.Inverse := False;
    ModalResult := mrOk;
  end;
end;

procedure TForm_Android_Ajuda.Botao_voltarClick(Sender: TObject);
begin
  AnimaStatus.Start;
end;

end.

