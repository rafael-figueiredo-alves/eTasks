unit eTasks.View.Pages.AppLists.Goals;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.AppListBase, FMX.Layouts, FMX.Controls.Presentation;

type
  TAppListGoals = class(TAppListBase)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TAppListGoals;
  end;

var
  AppListGoals: TAppListGoals;

implementation

{$R *.fmx}

{ TAppListGoals }

class function TAppListGoals.New(const Value: TLayout): TAppListGoals;
begin
  Result := TAppListGoals.Create(Value);
end;

end.
