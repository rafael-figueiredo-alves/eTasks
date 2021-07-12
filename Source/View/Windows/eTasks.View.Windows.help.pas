unit eTasks.View.Windows.help;

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
  FMX.Layouts,
  FMX.Objects,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Effects,
  FMX.TabControl;

type
  TForm_Windows_Ajuda = class(TForm)
    Lay_main: TLayout;
    StyleBook1: TStyleBook;
    TabPrincipal: TTabControl;
    TabHome: TTabItem;
    TabTarefas: TTabItem;
    TabMetas: TTabItem;
    TabCategorias: TTabItem;
    TabListas: TTabItem;
    TabContas: TTabItem;
    TabAtualizacao: TTabItem;
    ToolBar_container: TLayout;
    ToolBar: TLayout;
    Linha_titulo: TLine;
    Botao_voltar: TImage;
    title_Ajuda: TImage;
    Label_quantidade_edit: TLabel;
    Line1: TLine;
    procedure Btn_voltarClick(Sender: TObject);
  private
    { Private declarations }
    FBtnVoltarClick : TProc;
  public
    { Public declarations }
    Function Exibir : TLayout;
    Function BtnVoltarClick (Value: TProc) : TForm_windows_ajuda;
  end;

var
  Form_Windows_Ajuda: TForm_Windows_Ajuda;

implementation

{$R *.fmx}

{ TForm_Windows_Ajuda }

function TForm_Windows_Ajuda.BtnVoltarClick(Value: TProc): TForm_windows_ajuda;
begin
  Result := Self;
  FBtnVoltarClick := value;
end;

procedure TForm_Windows_Ajuda.Btn_voltarClick(Sender: TObject);
begin
  FBtnVoltarClick;
end;

function TForm_Windows_Ajuda.Exibir: TLayout;
begin
  Result := Lay_main;
end;

end.
