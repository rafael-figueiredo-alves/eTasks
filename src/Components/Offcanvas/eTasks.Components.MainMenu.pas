unit eTasks.Components.MainMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.Components.Offcanvas, System.ImageList, FMX.ImgList, FMX.Layouts,
  FMX.Effects, FMX.Objects, FMX.Controls.Presentation, FMX.MultiView,
  eTasks.Components.Interfaces, eTasks.Components.TranslationEnums,
  System.Generics.Collections, eTasks.Components.MenuEnums;

type
  TMainMenu = class(TOffcanvas, iMainMenu)
    LayItemHome: TLayout;
    ImgHome: TImage;
    lblHome: TLabel;
    LineHome: TLine;
    LayItemTasks: TLayout;
    ImgTasks: TImage;
    lblTasks: TLabel;
    LineTasks: TLine;
    LayItemGoals: TLayout;
    ImgGoals: TImage;
    lblGoals: TLabel;
    LineGoals: TLine;
    Layout3: TLayout;
    ImgShopping: TImage;
    lblShopping: TLabel;
    LineShopping: TLine;
    LayItemReadings: TLayout;
    ImgReadings: TImage;
    lblReadings: TLabel;
    LineReadings: TLine;
    LayItemNotes: TLayout;
    ImgNotes: TImage;
    lblNotes: TLabel;
    LineNotes: TLine;
    LayItemFinances: TLayout;
    ImgFinances: TImage;
    lblFinances: TLabel;
    LineFinances: TLine;
    procedure LayItemHomeClick(Sender: TObject);
    procedure LayItemTasksClick(Sender: TObject);
    procedure LayItemGoalsClick(Sender: TObject);
    procedure Layout3Click(Sender: TObject);
    procedure LayItemReadingsClick(Sender: TObject);
    procedure LayItemNotesClick(Sender: TObject);
    procedure LayItemFinancesClick(Sender: TObject);
  private
    { Private declarations }
    EventoAoClicarEmItemMenu : TEventoMainMenuClick;
    SelectedMainMenuItem     : TMainMenuButtons;
    function OnChangeSelectedMainMenuItem(const value: TMainMenuButtons): iMainMenu;
    function MainMenuItemClick(const value: TMainMenuButtons): iMainMenu;
  public
    { Public declarations }
    function ChangeLanguage(const Translations: TDictionary<TMainMenuTexts, string> = nil): iMainMenu;
    function isDarkMode(const value: boolean): iOffcanvas; override;
    function OnMainMenuItemClick(const Event: TEventoMainMenuClick): iMainMenu;
    function Selected(const SelectedMenu: TMainMenuButtons) : iMainMenu;

    class function New(const Form: TForm; isDarkMode: Boolean = false; Translations: TDictionary<TMainMenuTexts, string> = nil): iMainMenu;
  end;

var
  MainMenu: TMainMenu;

implementation

uses
  eTasks.Shared.Utils, eTasks.Components.ColorPallete;

{$R *.fmx}

{ TMainMenu }

function TMainMenu.ChangeLanguage(const Translations: TDictionary<TMainMenuTexts, string>): iMainMenu;
begin
  if(Assigned(Translations))then
   LblTitle.Text := Translations[TMainMenuTexts.Home];
end;

function TMainMenu.isDarkMode(const value: boolean): iOffcanvas;
begin
  inherited;

  LineHome.Stroke.Color := tColorPallete.GetColor(Primary, value);
  LineTasks.Stroke.Color := tColorPallete.GetColor(Primary, value);
  LineGoals.Stroke.Color := tColorPallete.GetColor(Primary, value);
  LineShopping.Stroke.Color := tColorPallete.GetColor(Primary, value);
  LineReadings.Stroke.Color := tColorPallete.GetColor(Primary, value);
  LineNotes.Stroke.Color := tColorPallete.GetColor(Primary, value);
  LineFinances.Stroke.Color := tColorPallete.GetColor(Primary, value);

  LblHome.FontColor   := tColorPallete.GetColor(Primary, value);
  LblTasks.FontColor   := tColorPallete.GetColor(Primary, value);
  LblGoals.FontColor   := tColorPallete.GetColor(Primary, value);
  lblShopping.FontColor   := tColorPallete.GetColor(Primary, value);
  lblReadings.FontColor   := tColorPallete.GetColor(Primary, value);
  lblNotes.FontColor   := tColorPallete.GetColor(Primary, value);
  lblFinances.FontColor   := tColorPallete.GetColor(Primary, value);

  ImgHome.Bitmap      := ImgSource(TSizeF.Create(30, 30), 1, value);
  ImgTasks.Bitmap      := ImgSource(TSizeF.Create(30, 30), 2, value);
  ImgGoals.Bitmap      := ImgSource(TSizeF.Create(30, 30), 3, value);
  ImgShopping.Bitmap      := ImgSource(TSizeF.Create(30, 30), 4, value);
  ImgReadings.Bitmap      := ImgSource(TSizeF.Create(30, 30), 5, value);
  ImgNotes.Bitmap      := ImgSource(TSizeF.Create(30, 30), 6, value);
  ImgFinances.Bitmap      := ImgSource(TSizeF.Create(30, 30), 7, value);
end;

procedure TMainMenu.LayItemFinancesClick(Sender: TObject);
begin
  inherited;

  MainMenuItemClick(TMainMenuButtons.Finance);
end;

procedure TMainMenu.LayItemGoalsClick(Sender: TObject);
begin
  inherited;

  MainMenuItemClick(TMainMenuButtons.Goals);
end;

procedure TMainMenu.LayItemHomeClick(Sender: TObject);
begin
  inherited;

  MainMenuItemClick(TMainMenuButtons.Home);
end;

procedure TMainMenu.LayItemNotesClick(Sender: TObject);
begin
  inherited;

  MainMenuItemClick(TMainMenuButtons.Notes);
end;

procedure TMainMenu.LayItemReadingsClick(Sender: TObject);
begin
  inherited;

  MainMenuItemClick(TMainMenuButtons.Readings);
end;

procedure TMainMenu.LayItemTasksClick(Sender: TObject);
begin
  inherited;

  MainMenuItemClick(TMainMenuButtons.Tasks);
end;

procedure TMainMenu.Layout3Click(Sender: TObject);
begin
  inherited;

  MainMenuItemClick(TMainMenuButtons.Shopping);
end;

function TMainMenu.MainMenuItemClick(const value: TMainMenuButtons): iMainMenu;
begin
  if(Assigned(EventoAoClicarEmItemMenu))then
   EventoAoClicarEmItemMenu(value);

  Selected(value);

  Multiview.HideMaster;
end;

class function TMainMenu.New(const Form: TForm; isDarkMode: Boolean; Translations: TDictionary<TMainMenuTexts, string>): iMainMenu;
begin
  Result := Self.Create(Form);
  TMainMenu(Result).Multiview.Size.Width := 0;
  TMainMenu(Result).SetDirection(ocdRight);
  TMainMenu(Result).LytBtnFilters.Visible := false;

  Result.isDarkMode(isDarkMode);
  Result.ChangeLanguage(Translations);
  Result.Selected(TMainMenuButtons.Home);
  Form.AddObject(TMainMenu(Result).Multiview);
end;

function TMainMenu.OnChangeSelectedMainMenuItem(
  const value: TMainMenuButtons): iMainMenu;
begin
  Result := Self;
  LineHome.Stroke.Thickness := TUtils.Iif(value = TMainMenuButtons.Home, 10, 0);
  LineTasks.Stroke.Thickness := TUtils.Iif(value = TMainMenuButtons.Tasks, 10, 0);
  LineGoals.Stroke.Thickness := TUtils.Iif(value = TMainMenuButtons.Goals, 10, 0);
  LineShopping.Stroke.Thickness := TUtils.Iif(value = TMainMenuButtons.Shopping, 10, 0);
  LineReadings.Stroke.Thickness := TUtils.Iif(value = TMainMenuButtons.Readings, 10, 0);
  LineNotes.Stroke.Thickness := TUtils.Iif(value = TMainMenuButtons.Notes, 10, 0);
  LineFinances.Stroke.Thickness := TUtils.Iif(value = TMainMenuButtons.Finance, 10, 0);
end;

function TMainMenu.OnMainMenuItemClick(const Event: TEventoMainMenuClick): iMainMenu;
begin
  Result := Self;
  EventoAoClicarEmItemMenu := Event;
end;

function TMainMenu.Selected(const SelectedMenu: TMainMenuButtons): iMainMenu;
begin
  Result := Self;
  SelectedMainMenuItem := SelectedMenu;
  OnChangeSelectedMainMenuItem(SelectedMenu);
end;

end.
