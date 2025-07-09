unit eTasks.View.Services.Interfaces;

interface

uses
  eTasks.View.Layouts.Interfaces,
  eTasks.View.Types;

type

  iNavigationManagerService = interface
    ['{9D744B61-67D1-4ABE-AAEF-6F53D070166B}']
    function GoToTasks(var pPage: iPageLayout; id: string = '') : iPageLayout;
    function GoToAbout(const MainLayout: iMainLayout; id: string = '') : iPageLayout;
    function GoToNotes(var pPage: iPageLayout; id: string = '') : iPageLayout;
    function GoToFinances(var pPage: iPageLayout; id: string = '') : iPageLayout;
    function GoToReadings(var pPage: iPageLayout; id: string = '') : iPageLayout;
    function GoToGoals(var pPage: iPageLayout; id: string = '') : iPageLayout;
    function GoToSettings(var pPage: iPageLayout; id: string = '') : iPageLayout;
    function GoToShopping(var pPage: iPageLayout; id: string = '') : iPageLayout;
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


implementation

end.
