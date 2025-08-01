unit eTasks.View.Pages.AppLists.Finances;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.AppListBase, FMX.Layouts, FMX.Controls.Presentation;

type
  TAppListFinances = class(TAppListBase)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TAppListFinances;
  end;

var
  AppListFinances: TAppListFinances;

implementation

{$R *.fmx}

{ TAppListFinances }

class function TAppListFinances.New(const Value: TLayout): TAppListFinances;
begin
  Result := TAppListFinances.Create(Value)
end;

end.
