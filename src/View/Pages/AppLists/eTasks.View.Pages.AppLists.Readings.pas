unit eTasks.View.Pages.AppLists.Readings;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.AppListBase, FMX.Layouts, FMX.Controls.Presentation;

type
  TAppListReadings = class(TAppListBase)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TAppListReadings;
  end;

var
  AppListReadings: TAppListReadings;

implementation

{$R *.fmx}

{ TAppListReadings }

class function TAppListReadings.New(const Value: TLayout): TAppListReadings;
begin
  Result := TAppListReadings.Create(Value);
end;

end.
