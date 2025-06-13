unit eTasks.Components.MainMenu;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  eTasks.Components.Offcanvas,
  System.ImageList,
  FMX.ImgList,
  FMX.Layouts,
  FMX.Effects,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.MultiView,
  eTasks.Components.Interfaces,
  eTasks.Components.TranslationEnums,
  System.Generics.Collections,
  eTasks.Components.MenuEnums;

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
    LayShopping: TLayout;
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
    procedure LayShoppingClick(Sender: TObject);
    procedure LayItemReadingsClick(Sender: TObject);
    procedure LayItemNotesClick(Sender: TObject);
    procedure LayItemFinancesClick(Sender: TObject);
  private
    { Private declarations }
    EventoAoClicarEmItemMenu : TEventoMainMenuClick;
    SelectedMainMenuItem     : TMainMenuItems;
    function OnChangeSelectedMainMenuItem(const value: TMainMenuItems): iMainMenu;
    function MainMenuItemClick(const value: TMainMenuItems): iMainMenu;
  public
    { Public declarations }
    function ChangeLanguage(const Translations: TDictionary<TMainMenuTexts, string> = nil): iMainMenu;
    function isDarkMode(const value: boolean): iOffcanvas; override;
    function OnMainMenuItemClick(const Event: TEventoMainMenuClick): iMainMenu;
    function Selected(const SelectedMenu: TMainMenuItems) : iMainMenu;

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
  Result := Self;

  if(Assigned(Translations))then
   begin
     LblTitle.Text    := TUtils.Iif(Translations.ContainsKey(TMainMenuTexts.Title), Translations[TMainMenuTexts.Title].ToUpper, 'MENU');
     lblHome.Text     := TUtils.Iif(Translations.ContainsKey(TMainMenuTexts.Home), Translations[TMainMenuTexts.Home], 'Inicio');
     lblTasks.Text    := TUtils.Iif(Translations.ContainsKey(TMainMenuTexts.Tasks), Translations[TMainMenuTexts.Tasks], 'Tarefas');
     lblGoals.Text    := TUtils.Iif(Translations.ContainsKey(TMainMenuTexts.Goals), Translations[TMainMenuTexts.Goals], 'Metas');
     lblShopping.Text := TUtils.Iif(Translations.ContainsKey(TMainMenuTexts.Shopping), Translations[TMainMenuTexts.Shopping], 'Compras');
     lblReadings.Text := TUtils.Iif(Translations.ContainsKey(TMainMenuTexts.Title), Translations[TMainMenuTexts.Readings], 'Leituras');
     lblNotes.Text    := TUtils.Iif(Translations.ContainsKey(TMainMenuTexts.Notes), Translations[TMainMenuTexts.Notes], 'Anotações');
     lblFinances.Text := TUtils.Iif(Translations.ContainsKey(TMainMenuTexts.Finance), Translations[TMainMenuTexts.Finance], 'Finanças');
   end
  else
   begin
     LblTitle.Text    := 'MENU';
     lblHome.Text     := 'Inicio';
     lblTasks.Text    := 'Minhas Tarefas';
     lblGoals.Text    := 'Minhas Metas';
     lblShopping.Text := 'Minhas Compras';
     lblReadings.Text := 'Minhas Leituras';
     lblNotes.Text    := 'Minhas Anotações';
     lblFinances.Text := 'Minhas Finanças';
   end;
end;

function TMainMenu.isDarkMode(const value: boolean): iOffcanvas;
begin
  inherited;

  {$region 'Cor da linha indicadora de opção selecionada'}
  LineHome.Stroke.Color      := tColorPallete.GetColor(Primary, value);
  LineTasks.Stroke.Color     := tColorPallete.GetColor(Primary, value);
  LineGoals.Stroke.Color     := tColorPallete.GetColor(Primary, value);
  LineShopping.Stroke.Color  := tColorPallete.GetColor(Primary, value);
  LineReadings.Stroke.Color  := tColorPallete.GetColor(Primary, value);
  LineNotes.Stroke.Color     := tColorPallete.GetColor(Primary, value);
  LineFinances.Stroke.Color  := tColorPallete.GetColor(Primary, value);
  {$endregion}

  {$region 'Cor da fonte dos Labels'}
  LblHome.FontColor          := tColorPallete.GetColor(Primary, value);
  LblTasks.FontColor         := tColorPallete.GetColor(Primary, value);
  LblGoals.FontColor         := tColorPallete.GetColor(Primary, value);
  lblShopping.FontColor      := tColorPallete.GetColor(Primary, value);
  lblReadings.FontColor      := tColorPallete.GetColor(Primary, value);
  lblNotes.FontColor         := tColorPallete.GetColor(Primary, value);
  lblFinances.FontColor      := tColorPallete.GetColor(Primary, value);
  {$endregion}

  {$region 'Imagens dos itens'}
  ImgHome.Bitmap             := ImgSource(TSizeF.Create(30, 30), 1, value);
  ImgTasks.Bitmap            := ImgSource(TSizeF.Create(30, 30), 2, value);
  ImgGoals.Bitmap            := ImgSource(TSizeF.Create(30, 30), 3, value);
  ImgShopping.Bitmap         := ImgSource(TSizeF.Create(30, 30), 4, value);
  ImgReadings.Bitmap         := ImgSource(TSizeF.Create(30, 30), 5, value);
  ImgNotes.Bitmap            := ImgSource(TSizeF.Create(30, 30), 6, value);
  ImgFinances.Bitmap         := ImgSource(TSizeF.Create(30, 30), 7, value);
  {$endregion}
end;

{$region 'Eventos dos itens de menu'}
procedure TMainMenu.LayItemFinancesClick(Sender: TObject);
begin
  inherited;

  MainMenuItemClick(TMainMenuItems.Finance);
end;

procedure TMainMenu.LayItemGoalsClick(Sender: TObject);
begin
  inherited;

  MainMenuItemClick(TMainMenuItems.Goals);
end;

procedure TMainMenu.LayItemHomeClick(Sender: TObject);
begin
  inherited;

  MainMenuItemClick(TMainMenuItems.Home);
end;

procedure TMainMenu.LayItemNotesClick(Sender: TObject);
begin
  inherited;

  MainMenuItemClick(TMainMenuItems.Notes);
end;

procedure TMainMenu.LayItemReadingsClick(Sender: TObject);
begin
  inherited;

  MainMenuItemClick(TMainMenuItems.Readings);
end;

procedure TMainMenu.LayItemTasksClick(Sender: TObject);
begin
  inherited;

  MainMenuItemClick(TMainMenuItems.Tasks);
end;

procedure TMainMenu.LayShoppingClick(Sender: TObject);
begin
  inherited;

  MainMenuItemClick(TMainMenuItems.Shopping);
end;
{$endregion}

function TMainMenu.MainMenuItemClick(const value: TMainMenuItems): iMainMenu;
begin
  Result := Self;

  Selected(value);

  Multiview.HideMaster;

  if(Assigned(EventoAoClicarEmItemMenu))then
   EventoAoClicarEmItemMenu(value);
end;

class function TMainMenu.New(const Form: TForm; isDarkMode: Boolean; Translations: TDictionary<TMainMenuTexts, string>): iMainMenu;
begin
  Result := Self.Create(Form);
  TMainMenu(Result).Multiview.Size.Width := 0;
  TMainMenu(Result).SetDirection(ocdRight);
  TMainMenu(Result).LytBtnFilters.Visible := false;

  Result.isDarkMode(isDarkMode);
  Result.ChangeLanguage(Translations);
  Result.Selected(TMainMenuItems.Home);
  Form.AddObject(TMainMenu(Result).Multiview);
end;

function TMainMenu.OnChangeSelectedMainMenuItem(const value: TMainMenuItems): iMainMenu;
begin
  Result                         := Self;

  {$region 'Exibição da marca de seleção (linha) definindo sua grossura'}
  LineHome.Stroke.Thickness      := TUtils.Iif(value = TMainMenuItems.Home, 10, 0);
  LineTasks.Stroke.Thickness     := TUtils.Iif(value = TMainMenuItems.Tasks, 10, 0);
  LineGoals.Stroke.Thickness     := TUtils.Iif(value = TMainMenuItems.Goals, 10, 0);
  LineShopping.Stroke.Thickness  := TUtils.Iif(value = TMainMenuItems.Shopping, 10, 0);
  LineReadings.Stroke.Thickness  := TUtils.Iif(value = TMainMenuItems.Readings, 10, 0);
  LineNotes.Stroke.Thickness     := TUtils.Iif(value = TMainMenuItems.Notes, 10, 0);
  LineFinances.Stroke.Thickness  := TUtils.Iif(value = TMainMenuItems.Finance, 10, 0);
  {$endregion}
end;

function TMainMenu.OnMainMenuItemClick(const Event: TEventoMainMenuClick): iMainMenu;
begin
  Result := Self;
  EventoAoClicarEmItemMenu := Event;
end;

function TMainMenu.Selected(const SelectedMenu: TMainMenuItems): iMainMenu;
begin
  Result := Self;
  SelectedMainMenuItem := SelectedMenu;
  OnChangeSelectedMainMenuItem(SelectedMenu);
end;

end.
