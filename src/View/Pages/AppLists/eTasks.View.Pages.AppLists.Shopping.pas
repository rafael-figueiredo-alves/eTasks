unit eTasks.View.Pages.AppLists.Shopping;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.AppListBase, FMX.Layouts, FMX.Controls.Presentation;

type
  TAppListShopping = class(TAppListBase)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TAppListShopping;
  end;

var
  AppListShopping: TAppListShopping;

implementation

{$R *.fmx}

{ TAppListShopping }

class function TAppListShopping.New(const Value: TLayout): TAppListShopping;
begin
  Result := TAppListShopping.Create(Value);
end;

end.
