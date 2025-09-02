unit eTasks.View.Pages.ResourceScreens.Goals;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.ResourceBase, FMX.Layouts, FMX.Controls.Presentation,
  eTasks.View.FormModels, FMX.Objects;

type
  TResourceGoals = class(TResourceBase)
    LayCentro: TLayout;
    LayTexto: TLayout;
    lblTexto: TLabel;
    imgMetas: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TResourceGoals;
    function isDarkMode(const Value: Boolean) : iResource; reintroduce;
    procedure TranslateUI; reintroduce;
  end;

var
  ResourceGoals: TResourceGoals;

implementation

uses
  eTasks.View.ThemeService,
  eTasks.Components.ColorPallete,
  eTasks.View.LanguageService,
  eTasks.Shared.TranslateKeyConsts,
  eTranslate4Pascal;

{$R *.fmx}

{ TResourceGoals }

function TResourceGoals.isDarkMode(const Value: Boolean): iResource;
begin
  inherited;
  Result := Self;
  self.lblTexto.FontColor := tColorPallete.GetColor(Primary, value);
end;

class function TResourceGoals.New(const Value: TLayout): TResourceGoals;
begin
  Result := TResourceGoals.Create(Value);
  Result.isDarkMode(ThemeService.isDarkTheme);
  Result.TranslateUI;
  languageService.SubscribeMethod('ResourceGoals',Result.TranslateUI);
end;

procedure TResourceGoals.TranslateUI;
begin
  inherited;
  lblTexto.Text := eTranslate.Translate(ResourcePages_Goals_ResourcePage, 'Mantenha suas metas organizadas e com gerencimento simplificado para alcançar mais rapidamente seus objetivos. Basta clicar no Mais para adicionar uma nova meta.');
end;

end.
