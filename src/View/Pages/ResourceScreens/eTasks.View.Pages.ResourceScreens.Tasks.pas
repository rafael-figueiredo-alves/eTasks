unit eTasks.View.Pages.ResourceScreens.Tasks;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.ResourceBase, FMX.Layouts, FMX.Controls.Presentation,
  eTasks.View.FormModels;

type
  TResourceTasks = class(TResourceBase)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TResourceTasks;
    function isDarkMode(const Value: Boolean) : iResource; reintroduce;
    function TranslateUI : iResource; reintroduce;
  end;

var
  ResourceTasks: TResourceTasks;

implementation

uses
  eTasks.Components.ColorPallete, eTasks.View.ThemeService;

{$R *.fmx}

{ TResourceTasks }

function TResourceTasks.isDarkMode(const Value: Boolean): iResource;
begin
  inherited;
  Result := self;
  self.Label1.FontColor := tColorPallete.GetColor(Primary, value);
end;

class function TResourceTasks.New(const Value: TLayout): TResourceTasks;
begin
  Result := TResourceTasks.Create(Value);
  Result.isDarkMode(ThemeService.isDarkTheme);
end;

function TResourceTasks.TranslateUI: iResource;
begin
  inherited;
end;

end.
