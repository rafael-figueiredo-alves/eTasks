unit eTasks.View.Pages.AppLists.Home;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.AppListBase, FMX.Layouts, FMX.Controls.Presentation;

type
  TAppListHome = class(TAppListBase)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TAppListHome;
  end;

var
  AppListHome: TAppListHome;

implementation

{$R *.fmx}

{ TAppListHome }

class function TAppListHome.New(const Value: TLayout): TAppListHome;
begin
  Result := TAppListHome.Create(Value);
end;

end.
