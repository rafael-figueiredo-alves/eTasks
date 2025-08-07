unit eTasks.View.Pages.ResourceScreens.Finances;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.ResourceBase, FMX.Layouts, FMX.Controls.Presentation,
  eTasks.View.FormModels;

type
  TResourceFinances = class(TResourceBase)
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TResourceFinances;
    function isDarkMode(const Value: Boolean) : iResource; reintroduce;
    function TranslateUI : iResource; reintroduce;
  end;

var
  ResourceFinances: TResourceFinances;

implementation

uses
  eTasks.Components.ColorPallete, eTasks.View.ThemeService;

{$R *.fmx}

{ TResourceFinances }

procedure TResourceFinances.Button1Click(Sender: TObject);
begin
  inherited;
  ResourceManager.OpenHomePage;
end;

function TResourceFinances.isDarkMode(const Value: Boolean): iResource;
begin
  inherited;
  Result := Self;
  self.Label1.FontColor := tColorPallete.GetColor(Primary, value);
end;

class function TResourceFinances.New(const Value: TLayout): TResourceFinances;
begin
  Result := TResourceFinances.Create(Value);
  Result.isDarkMode(ThemeService.isDarkTheme);
end;

function TResourceFinances.TranslateUI: iResource;
begin
  inherited;
end;

end.
