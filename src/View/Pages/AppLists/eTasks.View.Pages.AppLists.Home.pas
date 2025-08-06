unit eTasks.View.Pages.AppLists.Home;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.AppListBase, FMX.Layouts, FMX.Controls.Presentation,
  eTasks.View.FormModels;

type
  TAppListHome = class(TAppListBase)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TAppListHome;
    function isDarkMode(const Value: Boolean) : iAppList; reintroduce;
    function TranslateUI : iAppList; reintroduce;
  end;

var
  AppListHome: TAppListHome;

implementation

uses
  eTasks.View.ThemeService, eTasks.Components.ColorPallete;

{$R *.fmx}

{ TAppListHome }

function TAppListHome.isDarkMode(const Value: Boolean): iAppList;
begin
  inherited;
  Result := self;
  self.Label1.FontColor := tColorPallete.GetColor(Primary, value);
end;

class function TAppListHome.New(const Value: TLayout): TAppListHome;
begin
  Result := TAppListHome.Create(Value);
  Result.isDarkMode(ThemeService.isDarkTheme);
end;

function TAppListHome.TranslateUI: iAppList;
begin
  inherited;
end;

end.
