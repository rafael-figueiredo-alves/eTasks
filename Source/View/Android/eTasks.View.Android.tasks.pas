unit eTasks.View.Android.tasks;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  tipo_acao = (taNovo, taEditar, taExibe, taLista);

  TTela_Tarefas = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FTipoAcao : tipo_acao;
    { Private declarations }
  public
    { Public declarations }
    Procedure Acao (Acao : tipo_acao);
  end;

var
  Tela_Tarefas: TTela_Tarefas;

implementation

{$R *.fmx}

procedure TTela_Tarefas.Acao(Acao: tipo_acao);
begin
  FTipoAcao := Acao;
end;

procedure TTela_Tarefas.FormCreate(Sender: TObject);
begin
  ShowMessage('Criando...');
end;

procedure TTela_Tarefas.FormDestroy(Sender: TObject);
begin
  ShowMessage('Liberando da memória...');
end;

procedure TTela_Tarefas.FormShow(Sender: TObject);
begin
  case FTipoAcao of
    taNovo: Label1.Text := 'Novo';
    taEditar: Label1.Text := 'Editar';
    taExibe: Label1.Text := 'Exibir';
    taLista: Label1.Text := 'Listagem';
  end;
end;

end.
