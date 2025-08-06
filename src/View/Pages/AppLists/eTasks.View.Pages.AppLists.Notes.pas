unit eTasks.View.Pages.AppLists.Notes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.AppListBase, FMX.Layouts, FMX.Controls.Presentation,
  eTasks.View.FormModels;

type
  TAppListNotes = class(TAppListBase)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TAppListNotes;
    function isDarkMode(const Value: Boolean) : iAppList; reintroduce;
    function TranslateUI : iAppList; reintroduce;
  end;

var
  AppListNotes: TAppListNotes;

implementation

uses
  eTasks.View.ThemeService, eTasks.Components.ColorPallete;

{$R *.fmx}

{ TAppListNotes }

function TAppListNotes.isDarkMode(const Value: Boolean): iAppList;
begin
  inherited;
  Result := self;
  self.Label1.FontColor := tColorPallete.GetColor(Primary, value);
end;

class function TAppListNotes.New(const Value: TLayout): TAppListNotes;
begin
  Result := TAppListNotes.Create(Value);
  Result.isDarkMode(ThemeService.isDarkTheme);
end;

function TAppListNotes.TranslateUI: iAppList;
begin
  inherited;
end;

end.
