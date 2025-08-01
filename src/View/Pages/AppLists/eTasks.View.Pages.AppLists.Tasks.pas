unit eTasks.View.Pages.AppLists.Tasks;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.AppListBase, FMX.Layouts, FMX.Controls.Presentation;

type
  TAppListTasks = class(TAppListBase)
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    class function New(const Value: TLayout) : TAppListBase;
  end;

var
  AppListTasks: TAppListTasks;

implementation

{$R *.fmx}

procedure TAppListTasks.Button1Click(Sender: TObject);
begin
  inherited;
  NavManagerService.GoToTasks(MainLayout);
end;

class function TAppListTasks.New(const Value: TLayout): TAppListBase;
begin
  Result := TAppListTasks.Create(Value);
end;

end.
