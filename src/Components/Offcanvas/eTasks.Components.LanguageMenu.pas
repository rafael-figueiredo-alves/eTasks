unit eTasks.Components.LanguageMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.Components.Offcanvas, System.ImageList, FMX.ImgList, FMX.Layouts,
  FMX.Effects, FMX.Objects, FMX.Controls.Presentation, FMX.MultiView,
  eTasks.Components.Interfaces, System.Generics.Collections, eTasks.Components.TranslationEnums,
  eTasks.Components.MenuEnums;

type
  TLanguageMenu = class(TOffcanvas, iLanguageMenu)
    LayPortugues: TLayout;
    ImgPtBR: TImage;
    lblPortugues: TLabel;
    spacingLinePtBR: TLine;
    chkPortugues: TImage;
    LayEnglish: TLayout;
    ImgEn: TImage;
    lblEnglish: TLabel;
    spacingLineEn: TLine;
    chkEnglish: TImage;
    procedure LayPortuguesClick(Sender: TObject);
    procedure LayEnglishClick(Sender: TObject);
  private
    { Private declarations }
    EventoAoClicarEmIdioma   : TEventoStringClick;
    pSelectedLanguage         : TSupportedLanguages;
    function OnChangeSelectedLanguage(const value: TSupportedLanguages): iLanguageMenu;
    function LanguageSelected(const value: TSupportedLanguages): iLanguageMenu;
    function GetLanguageCode(const value: TSupportedLanguages) : string;
    function GetLanguageFromCode(const code: string) : TSupportedLanguages;
  public
    { Public declarations }
    function ChangeLanguage(const Translations: TDictionary<TLanguageMenuTexts, string> = nil): iLanguageMenu;
    function OnLanguageSelected(const Event: TEventoStringClick): iLanguageMenu;
    function Selected(const SelectedLanguage: string) : iLanguageMenu;
    function isDarkMode(const value: boolean): iOffcanvas; override;

    class function New(const Form: TForm; isDarkMode: Boolean = false; Translations: TDictionary<TLanguageMenuTexts, string> = nil): iLanguageMenu;
  end;

var
  LanguageMenu: TLanguageMenu;

implementation

uses
  eTasks.Shared.Utils, eTasks.Components.ColorPallete;

{$R *.fmx}

{ TLanguageMenu }

function TLanguageMenu.ChangeLanguage(const Translations: TDictionary<TLanguageMenuTexts, string>): iLanguageMenu;
begin
  Result := Self;

  if(Assigned(Translations))then
   begin
     LblTitle.Text := TUtils.Iif(Translations.ContainsKey(TLanguageMenuTexts.LanguagesTitle), Translations[TLanguageMenuTexts.LanguagesTitle], 'Idioma');
   end
  else
   LblTitle.Text := 'Idioma';
end;

function TLanguageMenu.GetLanguageCode(const value: TSupportedLanguages): string;
begin
  case Value of
    ptBR: result := 'pt-BR';
    En:   result := 'en-US';
    Es:   result := 'es-ES';
  end;
end;

function TLanguageMenu.GetLanguageFromCode(const code: string): TSupportedLanguages;
begin
  if(code = 'pt-BR')then result := TSupportedLanguages.ptBR;
  if(code = 'en-US')then result := TSupportedLanguages.En;
  if(code = 'es-ES')then result := TSupportedLanguages.Es;
end;

function TLanguageMenu.isDarkMode(const value: boolean): iOffcanvas;
begin
  inherited;

  lblPortugues.FontColor       := tColorPallete.GetColor(Primary, value);
  lblEnglish.FontColor         := tColorPallete.GetColor(Primary, value);

  chkPortugues.Bitmap          := ImgSource(TSizeF.Create(30, 30), 1, value);
  chkEnglish.Bitmap            := ImgSource(TSizeF.Create(30, 30), 1, value);
end;

function TLanguageMenu.LanguageSelected(const value: TSupportedLanguages): iLanguageMenu;
begin
  Result := self;

  Selected(GetLanguageCode(value));

  Multiview.HideMaster;

  if(Assigned(EventoAoClicarEmIdioma))then
   EventoAoClicarEmIdioma(GetLanguageCode(value));
end;

procedure TLanguageMenu.LayEnglishClick(Sender: TObject);
begin
  inherited;
  LanguageSelected(TSupportedLanguages.En);
end;

procedure TLanguageMenu.LayPortuguesClick(Sender: TObject);
begin
  inherited;
  LanguageSelected(TSupportedLanguages.ptBR);
end;

class function TLanguageMenu.New(const Form: TForm;isDarkMode: Boolean; Translations: TDictionary<TLanguageMenuTexts, string>): iLanguageMenu;
begin
  Result := Self.Create(Form);
  TLanguageMenu(Result).Multiview.Size.Width := 0;
  TLanguageMenu(Result).SetDirection(ocdLeft);
  TLanguageMenu(Result).LytBtnFilters.Visible := false;

  Result.isDarkMode(isDarkMode);
  Result.ChangeLanguage(Translations);
  Result.Selected('pt-BR');
  Form.AddObject(TLanguageMenu(Result).Multiview);
end;

function TLanguageMenu.OnChangeSelectedLanguage(const value: TSupportedLanguages): iLanguageMenu;
begin
  Result := Self;

  chkPortugues.Visible := value = TSupportedLanguages.ptBR;
  chkEnglish.Visible   := value = TSupportedLanguages.En;
end;

function TLanguageMenu.OnLanguageSelected(const Event: TEventoStringClick): iLanguageMenu;
begin
  Result := self;
  EventoAoClicarEmIdioma := Event;
end;

function TLanguageMenu.Selected(const SelectedLanguage: string): iLanguageMenu;
begin
  Result := Self;
  pSelectedLanguage := GetLanguageFromCode(SelectedLanguage);
  OnChangeSelectedLanguage(pSelectedLanguage);
end;

end.
