unit eTasks.View.PageLayout;

interface

{$region 'Dependências Globais'}
uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Objects,
  eTasks.Components.Interfaces,
  eTasks.View.Layouts.Interfaces,
  eTasks.View.Types,
  eTasks.View.Enums,
  eTasks.Components.ColorPallete;
{$endregion}

type

  TPageLayout = class(TForm, iPageLayout)
    PageViewLayout: TLayout;
    Background: TRectangle;
  private
    { Private declarations }
    fEntityID : string;
    MainLayout: TLayout;
    UpdateScreenMethod : TUpdateScreenMethod;
    fOnBackButton    : TEventCallback;
    fOnHelpButton    : TEventCallback;
    fOnDeleteButton  : TEventCallback;
    fOnConfirmButton : TEventCallback;
    procedure GoBack(Sender: TObject);
    procedure RemovePageViewLayout;
  public
    { Public declarations }
    NavBar : iNavBar;
    function Layout: TLayout;
    function EntityID : string;
    function Resize(const Formwidth: integer): iPageLayout;
    function isDarkMode(const value: Boolean): iPageLayout; virtual;
    function SetTitle(const value: string): iPageLayout; virtual;
    procedure TranslateUI; Virtual;
    function OnBackButtonClick(const value: TEventCallback):iPageLayout;
    function OnHelpButtonClick(const value: TEventCallback):iPageLayout;
    function OnDeleteButtonClick(const value: TEventCallback):iPageLayout;
    function OnConfirmButtonClick(const value: TEventCallback):iPageLayout;

    class function New(const pLayout: TLayout; pUpdateScreenMethod: TUpdateScreenMethod; LayoutForm: TLayoutForm; EntityID: string = string.Empty) : iPageLayout;
    destructor Destroy; override;
  end;

var
  PageLayout: TPageLayout;

implementation

uses
  eTasks.Components.Builder,
  eTasks.View.ThemeService,
  eTasks.View.LanguageService;

{$R *.fmx}

{$region 'Definição de TPageLayout'
{ TPageLayout }

class function TPageLayout.New(const pLayout: TLayout;
  pUpdateScreenMethod: TUpdateScreenMethod; LayoutForm: TLayoutForm;
  EntityID: string): iPageLayout;
begin
  if(Assigned(PageLayout))then
   FreeAndNil(PageLayout);

  PageLayout := Self.Create(pLayout);
  PageLayout.MainLayout := pLayout;

  PageLayout.NavBar := TBars.NavBar(PageLayout.PageViewLayout);
  PageLayout.NavBar.OnBtnBackClick(PageLayout.GoBack);

  case LayoutForm of
    lfEditButtons: PageLayout.NavBar.ShowButtons(TNavBarButtons.NavBarEditButtons);
    lfWithUpdateButton: PageLayout.NavBar.ShowButtons(TNavBarButtons.NavBarUpdateButton);
    lfWithHelpButton: PageLayout.NavBar.ShowButtons(TNavBarButtons.NavBarHelpButton);
  end;

  pLayout.AddObject(PageLayout.PageViewLayout);

  PageLayout.UpdateScreenMethod := pUpdateScreenMethod;

  PageLayout.fEntityID := EntityID;

  ThemeService.SubscribeInterface([PageLayout]);

  if(ThemeService.isDarkTheme)then
   PageLayout.isDarkMode(ThemeService.isDarkTheme);

  LanguageService.SubscribeMethod(PageLayout.Name, PageLayout.TranslateUI);
  PageLayout.TranslateUI;

  Result := PageLayout;
end;

function TPageLayout.OnBackButtonClick(const value: TEventCallback): iPageLayout;
begin
  Result := self;
  fOnBackButton := value;
end;

function TPageLayout.OnConfirmButtonClick(const value: TEventCallback): iPageLayout;
begin
  Result := self;
  fOnConfirmButton := value;
end;

function TPageLayout.OnDeleteButtonClick(const value: TEventCallback): iPageLayout;
begin
  Result := self;
  fOnDeleteButton := value;
end;

function TPageLayout.OnHelpButtonClick(const value: TEventCallback): iPageLayout;
begin
  Result := self;
  fOnHelpButton := value;
end;

destructor TPageLayout.Destroy;
begin
  RemovePageViewLayout;
  LanguageService.UnsubscribeMethod(Self.Name);

  inherited;
end;

function TPageLayout.EntityID: string;
begin
  Result := fEntityID;
end;

procedure TPageLayout.GoBack(Sender: TObject);
begin
    RemovePageViewLayout;

    Application.ProcessMessages;

    UpdateScreenMethod;
end;

function TPageLayout.isDarkMode(const value: Boolean): iPageLayout;
begin
  Result := Self;
  NavBar.isDarkMode(value);
  background.Fill.Color := TColorPallete.GetColor(Cor.Background, value);
end;

procedure TPageLayout.RemovePageViewLayout;
begin
  if Assigned(MainLayout) and MainLayout.ContainsObject(PageViewLayout) then
    MainLayout.RemoveObject(PageViewLayout);
end;

function TPageLayout.Resize(const Formwidth: integer): iPageLayout;
begin
  Result := Self;
  NavBar.Resize(Formwidth);
  UpdateScreenMethod;
end;

function TPageLayout.SetTitle(const value: string): iPageLayout;
begin
  Result := Self;
  NavBar.SetTitle(value);
end;

procedure TPageLayout.TranslateUI;
begin

end;

function TPageLayout.Layout: TLayout;
begin
  Result := Self.PageViewLayout;
end;
{$endregion}

end.
