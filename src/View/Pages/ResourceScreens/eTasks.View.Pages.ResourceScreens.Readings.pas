unit eTasks.View.Pages.ResourceScreens.Readings;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.ResourceBase, FMX.Layouts, FMX.Controls.Presentation,
  eTasks.View.FormModels;

type
  TResourceReadings = class(TResourceBase)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TResourceReadings;
    function isDarkMode(const Value: Boolean) : iResource; reintroduce;
    function TranslateUI : iResource; reintroduce;
  end;

var
  ResourceReadings: TResourceReadings;

implementation

uses
  eTasks.View.ThemeService, eTasks.Components.ColorPallete;

{$R *.fmx}

{ TResourceReadings }

function TResourceReadings.isDarkMode(const Value: Boolean): iResource;
begin
  inherited;
  Result := Self;
  self.Label1.FontColor := tColorPallete.GetColor(Primary, value);
end;

class function TResourceReadings.New(const Value: TLayout): TResourceReadings;
begin
  Result := TResourceReadings.Create(Value);
  Result.isDarkMode(ThemeService.isDarkTheme);
end;

function TResourceReadings.TranslateUI: iResource;
begin
  inherited;
end;

end.
