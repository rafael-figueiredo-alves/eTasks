unit eTasks.View.Pages.AppLists.Finances;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.AppListBase, FMX.Layouts, FMX.Controls.Presentation,
  eTasks.View.FormModels;

type
  TAppListFinances = class(TAppListBase)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TAppListFinances;
    function isDarkMode(const Value: Boolean) : iAppList; reintroduce;
    function TranslateUI : iAppList; reintroduce;
  end;

var
  AppListFinances: TAppListFinances;

implementation

uses
  eTasks.Components.ColorPallete, eTasks.View.ThemeService;

{$R *.fmx}

{ TAppListFinances }

function TAppListFinances.isDarkMode(const Value: Boolean): iAppList;
begin
  inherited;
  Result := self;
  self.Label1.FontColor := tColorPallete.GetColor(Primary, value);
end;

class function TAppListFinances.New(const Value: TLayout): TAppListFinances;
begin
  Result := TAppListFinances.Create(Value);
  Result.isDarkMode(ThemeService.isDarkTheme);
end;

function TAppListFinances.TranslateUI: iAppList;
begin
  inherited;
end;

end.
