unit eTasks.View.Pages.ResourceScreens.Shopping;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.ResourceBase, FMX.Layouts, FMX.Controls.Presentation,
  eTasks.View.FormModels, FMX.Objects;

type
  TResourceShopping = class(TResourceBase)
    LayCentro: TLayout;
    LayTexto: TLayout;
    lblTexto: TLabel;
    imgCompras: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TResourceShopping;
    function isDarkMode(const Value: Boolean) : iResource; reintroduce;
    procedure TranslateUI; reintroduce;
  end;

var
  ResourceShopping: TResourceShopping;

implementation

uses
  eTasks.View.ThemeService, eTasks.Components.ColorPallete, eTranslate4Pascal,
  eTasks.Shared.TranslateKeyConsts, eTasks.View.LanguageService;

{$R *.fmx}

{ TResourceShopping }

function TResourceShopping.isDarkMode(const Value: Boolean): iResource;
begin
  inherited;
  Result := Self;
  self.lblTexto.FontColor := tColorPallete.GetColor(Primary, value);
end;

class function TResourceShopping.New(const Value: TLayout): TResourceShopping;
begin
  Result := TResourceShopping.Create(Value);
  Result.isDarkMode(ThemeService.isDarkTheme);
  Result.TranslateUI;
  languageService.SubscribeMethod('ResourceShopping',Result.TranslateUI);
end;

procedure TResourceShopping.TranslateUI;
begin
  inherited;
  lblTexto.Text := eTranslate.Translate(ResourcePages_Shopping_ResourcePage, 'Nunca mais esqueça aquele ingrediente. Monte suas listas de compras com o eTasks. É fácil, basta pressionar o botão Mais para incluir listas e itens de Compras.');
end;

end.
