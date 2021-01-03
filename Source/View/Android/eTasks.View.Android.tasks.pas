unit eTasks.View.Android.tasks;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFormTasks = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTasks: TFormTasks;

implementation

{$R *.fmx}

procedure TFormTasks.FormCreate(Sender: TObject);
begin
  ShowMessage('Criando...');
end;

procedure TFormTasks.FormDestroy(Sender: TObject);
begin
  ShowMessage('Liberando da memória...');
end;

end.
