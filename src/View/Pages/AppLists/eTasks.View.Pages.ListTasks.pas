unit eTasks.View.Pages.ListTasks;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  eTasks.View.Services.Interfaces, eTasks.View.Layouts.Interfaces,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TListTask = class(TForm)
    LayLista: TLayout;
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    NavManagerService : iNavigationManagerService;
    MainLayout        : iMainLayout;
  end;

var
  ListTask: TListTask;

implementation

{$R *.fmx}

procedure TListTask.Button1Click(Sender: TObject);
begin
  NavManagerService.GoToTasks(MainLayout);
end;

end.
