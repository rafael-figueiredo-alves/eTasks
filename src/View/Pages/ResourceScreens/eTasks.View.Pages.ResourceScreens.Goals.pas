unit eTasks.View.Pages.ResourceScreens.Goals;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.ResourceBase, FMX.Layouts, FMX.Controls.Presentation;

type
  TResourceGoals = class(TResourceBase)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TResourceGoals;
  end;

var
  ResourceGoals: TResourceGoals;

implementation

{$R *.fmx}

{ TResourceGoals }

class function TResourceGoals.New(const Value: TLayout): TResourceGoals;
begin
  Result := TResourceGoals.Create(Value);
end;

end.
