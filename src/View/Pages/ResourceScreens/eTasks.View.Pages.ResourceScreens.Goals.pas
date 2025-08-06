unit eTasks.View.Pages.ResourceScreens.Goals;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.ResourceBase, FMX.Layouts, FMX.Controls.Presentation,
  eTasks.View.FormModels;

type
  TResourceGoals = class(TResourceBase)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TResourceGoals;
    function isDarkMode(const Value: Boolean) : iResource; reintroduce;
    function TranslateUI : iResource; reintroduce;
  end;

var
  ResourceGoals: TResourceGoals;

implementation

uses
  eTasks.View.ThemeService, eTasks.Components.ColorPallete;

{$R *.fmx}

{ TResourceGoals }

function TResourceGoals.isDarkMode(const Value: Boolean): iResource;
begin
  inherited;
  Result := Self;
  self.Label1.FontColor := tColorPallete.GetColor(Primary, value);
end;

class function TResourceGoals.New(const Value: TLayout): TResourceGoals;
begin
  Result := TResourceGoals.Create(Value);
  Result.isDarkMode(ThemeService.isDarkTheme);
end;

function TResourceGoals.TranslateUI: iResource;
begin
  inherited;
end;

end.
