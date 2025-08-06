unit eTasks.View.Pages.AppLists.Shopping;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.AppListBase, FMX.Layouts, FMX.Controls.Presentation,
  eTasks.View.FormModels;

type
  TAppListShopping = class(TAppListBase)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TAppListShopping;
    function isDarkMode(const Value: Boolean) : iAppList; reintroduce;
    function TranslateUI : iAppList; reintroduce;
  end;

var
  AppListShopping: TAppListShopping;

implementation

uses
  eTasks.View.ThemeService, eTasks.Components.ColorPallete;

{$R *.fmx}

{ TAppListShopping }

function TAppListShopping.isDarkMode(const Value: Boolean): iAppList;
begin
  inherited;
  Result := self;
  self.Label1.FontColor := tColorPallete.GetColor(Primary, value);
end;

class function TAppListShopping.New(const Value: TLayout): TAppListShopping;
begin
  Result := TAppListShopping.Create(Value);
  Result.isDarkMode(ThemeService.isDarkTheme);
end;

function TAppListShopping.TranslateUI: iAppList;
begin
  inherited;
end;

end.
