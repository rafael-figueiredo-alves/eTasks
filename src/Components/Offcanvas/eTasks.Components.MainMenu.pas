unit eTasks.Components.MainMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.Components.Offcanvas, System.ImageList, FMX.ImgList, FMX.Layouts,
  FMX.Effects, FMX.Objects, FMX.Controls.Presentation, FMX.MultiView,
  eTasks.Components.Interfaces, eTasks.Components.TranslationEnums,
  System.Generics.Collections;

type
  TMainMenu = class(TOffcanvas, iMainMenu)
  private
    { Private declarations }
  public
    { Public declarations }
    function ChangeLanguage(Translations: TDictionary<TMainMenuTexts, string> = nil): iMainMenu;
    class function New(const Form: TForm; isDarkMode: Boolean = false; Translations: TDictionary<TMainMenuTexts, string> = nil): iMainMenu;
  end;

var
  MainMenu: TMainMenu;

implementation

{$R *.fmx}

{ TMainMenu }

function TMainMenu.ChangeLanguage(Translations: TDictionary<TMainMenuTexts, string>): iMainMenu;
begin

end;

class function TMainMenu.New(const Form: TForm; isDarkMode: Boolean; Translations: TDictionary<TMainMenuTexts, string>): iMainMenu;
begin
  Result := Self.Create(Form);
  TMainMenu(Result).Multiview.Size.Width := 0;
  TMainMenu(Result).SetDirection(ocdRight);
  TMainMenu(Result).LytBtnFilters.Visible := false;

  Result.isDarkMode(isDarkMode);
  Form.AddObject(TMainMenu(Result).Multiview);
end;

end.
