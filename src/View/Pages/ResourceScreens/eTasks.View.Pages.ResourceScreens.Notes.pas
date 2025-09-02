unit eTasks.View.Pages.ResourceScreens.Notes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.ResourceBase, FMX.Layouts, FMX.Controls.Presentation,
  eTasks.View.FormModels, FMX.Objects;

type
  TResourceNotes = class(TResourceBase)
    LayCentro: TLayout;
    LayTexto: TLayout;
    lblTexto: TLabel;
    imgAnotacoes: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TResourceNotes;
    function isDarkMode(const Value: Boolean) : iResource; reintroduce;
    procedure TranslateUI; reintroduce;
  end;

var
  ResourceNotes: TResourceNotes;

implementation

uses
  eTasks.View.ThemeService, eTasks.Components.ColorPallete,
  eTasks.View.LanguageService, eTasks.Shared.TranslateKeyConsts,
  eTranslate4Pascal;

{$R *.fmx}

{ TResourceNotes }

function TResourceNotes.isDarkMode(const Value: Boolean): iResource;
begin
  inherited;
  Result := Self;
  self.lblTexto.FontColor := tColorPallete.GetColor(Primary, value);
end;

class function TResourceNotes.New(const Value: TLayout): TResourceNotes;
begin
  Result := TResourceNotes.Create(Value);
  Result.isDarkMode(ThemeService.isDarkTheme);
  Result.TranslateUI;
  languageService.SubscribeMethod('ResourceNotes',Result.TranslateUI);
end;

procedure TResourceNotes.TranslateUI;
begin
  inherited;
  lblTexto.Text := eTranslate.Translate(ResourcePages_Notes_ResourcePage, 'Tome nota de aulas ou do trabalho usando o botão Mais abaixo. É simples e você vai ter suas anotações sempre por perto e não precisará mais andar com caderno ou monte de papéis.');
end;

end.
