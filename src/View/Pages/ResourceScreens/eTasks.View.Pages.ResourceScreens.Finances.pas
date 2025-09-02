unit eTasks.View.Pages.ResourceScreens.Finances;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.ResourceBase, FMX.Layouts, FMX.Controls.Presentation,
  eTasks.View.FormModels, FMX.Objects;

type
  TResourceFinances = class(TResourceBase)
    LayCentro: TLayout;
    LayTexto: TLayout;
    lblTexto: TLabel;
    imgFinancas: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TResourceFinances;
    function isDarkMode(const Value: Boolean) : iResource; reintroduce;
    procedure TranslateUI; reintroduce;
  end;

var
  ResourceFinances: TResourceFinances;

implementation

uses
  eTasks.Components.ColorPallete,
  eTasks.View.ThemeService,
  eTasks.View.LanguageService,
  eTasks.Shared.TranslateKeyConsts,
  eTranslate4Pascal;

{$R *.fmx}

{ TResourceFinances }

function TResourceFinances.isDarkMode(const Value: Boolean): iResource;
begin
  inherited;
  Result := Self;
  self.lblTexto.FontColor := tColorPallete.GetColor(Primary, value);
end;

class function TResourceFinances.New(const Value: TLayout): TResourceFinances;
begin
  Result := TResourceFinances.Create(Value);
  Result.isDarkMode(ThemeService.isDarkTheme);
  Result.TranslateUI;
  languageService.SubscribeMethod('ResourceFinances',Result.TranslateUI);
end;

procedure TResourceFinances.TranslateUI;
begin
  inherited;
  lblTexto.Text := eTranslate.Translate(ResourcePages_Finances_ResourcePage, 'Sua carteira com mais dinheiro o mês inteiro? O eTasks te ajuda. Adicione um lançamento financeiro pressionando o botão Mais.');
end;

end.
