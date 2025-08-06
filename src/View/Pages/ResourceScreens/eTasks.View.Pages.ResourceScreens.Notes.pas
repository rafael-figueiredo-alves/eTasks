unit eTasks.View.Pages.ResourceScreens.Notes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.ResourceBase, FMX.Layouts, FMX.Controls.Presentation,
  eTasks.View.FormModels;

type
  TResourceNotes = class(TResourceBase)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TResourceNotes;
    function isDarkMode(const Value: Boolean) : iResource; reintroduce;
    function TranslateUI : iResource; reintroduce;
  end;

var
  ResourceNotes: TResourceNotes;

implementation

uses
  eTasks.View.ThemeService, eTasks.Components.ColorPallete;

{$R *.fmx}

{ TResourceNotes }

function TResourceNotes.isDarkMode(const Value: Boolean): iResource;
begin
  inherited;
  Result := Self;
  self.Label1.FontColor := tColorPallete.GetColor(Primary, value);
end;

class function TResourceNotes.New(const Value: TLayout): TResourceNotes;
begin
  Result := TResourceNotes.Create(Value);
  Result.isDarkMode(ThemeService.isDarkTheme);
end;

function TResourceNotes.TranslateUI: iResource;
begin
  inherited;
end;

end.
