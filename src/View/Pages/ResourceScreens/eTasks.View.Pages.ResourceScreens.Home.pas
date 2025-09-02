unit eTasks.View.Pages.ResourceScreens.Home;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.ResourceBase, FMX.Layouts, FMX.Controls.Presentation,
  eTasks.View.FormModels;

type
  TResourceHome = class(TResourceBase)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TResourceHome;
    function isDarkMode(const Value: Boolean) : iResource; reintroduce;
    procedure TranslateUI; reintroduce;
  end;

var
  ResourceHome: TResourceHome;

implementation

uses
  eTasks.View.ThemeService, eTasks.Components.ColorPallete,
  eTasks.View.LanguageService;

{$R *.fmx}

{ TResourceHome }

function TResourceHome.isDarkMode(const Value: Boolean): iResource;
begin
  inherited;
  Result := Self;
  self.Label1.FontColor := tColorPallete.GetColor(Primary, value);
end;

class function TResourceHome.New(const Value: TLayout): TResourceHome;
begin
  Result := TResourceHome.Create(Value);
  Result.isDarkMode(ThemeService.isDarkTheme);
  Result.TranslateUI;
  languageService.SubscribeMethod('ResourceHome',Result.TranslateUI);
end;

procedure TResourceHome.TranslateUI;
begin
  inherited;
end;

end.
