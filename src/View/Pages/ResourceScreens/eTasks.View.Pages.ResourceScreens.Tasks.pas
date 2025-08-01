unit eTasks.View.Pages.ResourceScreens.Tasks;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.ResourceBase, FMX.Layouts, FMX.Controls.Presentation;

type
  TResourceTasks = class(TResourceBase)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TResourceTasks;
  end;

var
  ResourceTasks: TResourceTasks;

implementation

{$R *.fmx}

{ TResourceTasks }

class function TResourceTasks.New(const Value: TLayout): TResourceTasks;
begin
  Result := TResourceTasks.Create(Value);
end;

end.
