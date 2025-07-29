unit eTasks.View.Services.Interfaces;

interface

uses
  eTasks.View.Layouts.Interfaces,
  eTasks.View.Types;

type

  iNavigationManagerService = interface
    ['{9D744B61-67D1-4ABE-AAEF-6F53D070166B}']
    function GoToTasks(const MainLayout: iMainLayout;  id: string = '') : iPageLayout;
    function GoToAbout(const MainLayout: iMainLayout; id: string = '') : iPageLayout;
    function GoToNotes(const MainLayout: iMainLayout;  id: string = '') : iPageLayout;
    function GoToFinances(const MainLayout: iMainLayout; id: string = '') : iPageLayout;
    function GoToReadings(const MainLayout: iMainLayout; id: string = '') : iPageLayout;
    function GoToGoals(const MainLayout: iMainLayout; id: string = '') : iPageLayout;
    function GoToSettings(const MainLayout: iMainLayout; id: string = '') : iPageLayout;
    function GoToShopping(const MainLayout: iMainLayout; id: string = '') : iPageLayout;
    function GoToRewards(const MainLayout: iMainLayout; id: string = '') : iPageLayout;
    function GoToProfile(const MainLayout: iMainLayout; id: string = '') : iPageLayout;
  end;

  iThemeService = interface
    ['{741F4923-A65F-4F5B-9339-88D62795F52A}']
    function SubscribeInterface(const interfaces: array of IInterface): iThemeService;
    function ApplyTheme: iThemeService;
    function ChangeTheme: iThemeService;
    function isDarkTheme: Boolean;
    function SetDarkTheme(const value: Boolean): iThemeService;
  end;

  iLanguageService = interface
    ['{E20D33CF-7E64-4C30-8463-44578C0E7F15}']
    function GetLanguage: string;
    function SetLanguage(const LanguageCode: string): iLanguageService;
    function SubscribeMethod(const id: string; const Method: TTranslateUiMethod) : iLanguageService;
    function UnsubscribeMethod(const id: string) : iLanguageService;
  end;

  iResourceManager = interface
    ['{24985934-6806-4EAA-890D-32F2E68B678C}']
    procedure OpenHomePage;
    procedure OpenTasks;
    procedure OpenGoals;
    procedure OpenReadings;
    procedure OpenNotes;
    procedure OpenFinances;
    procedure OpenShopping;
  end;


implementation

end.
