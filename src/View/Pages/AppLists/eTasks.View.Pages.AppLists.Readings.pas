unit eTasks.View.Pages.AppLists.Readings;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.AppListBase, FMX.Layouts, FMX.Controls.Presentation,
  eTasks.View.FormModels;

type
  TAppListReadings = class(TAppListBase)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TAppListReadings;
    function isDarkMode(const Value: Boolean) : iAppList; reintroduce;
    function TranslateUI : iAppList; reintroduce;
  end;

var
  AppListReadings: TAppListReadings;

implementation

uses
  eTasks.View.ThemeService, eTasks.Components.ColorPallete;

{$R *.fmx}

{ TAppListReadings }

function TAppListReadings.isDarkMode(const Value: Boolean): iAppList;
begin
  inherited;
  Result := self;
  self.Label1.FontColor := tColorPallete.GetColor(Primary, value);
end;

class function TAppListReadings.New(const Value: TLayout): TAppListReadings;
begin
  Result := TAppListReadings.Create(Value);
  Result.isDarkMode(ThemeService.isDarkTheme);
end;

function TAppListReadings.TranslateUI: iAppList;
begin
  inherited;
end;

end.
