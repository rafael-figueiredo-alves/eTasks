unit eTasks.View.Services.Interfaces;

interface

uses
  eTasks.View.Layouts.Interfaces;

type

  iNavigationManagerService = interface
    ['{9D744B61-67D1-4ABE-AAEF-6F53D070166B}']
    function GoToTasks(var pPage: iPageLayout; id: string = '') : iPageLayout;
    function GoToAbout(var pPage: iPageLayout; id: string = '') : iPageLayout;
    function GoToNotes(var pPage: iPageLayout; id: string = '') : iPageLayout;
    function GoToFinances(var pPage: iPageLayout; id: string = '') : iPageLayout;
    function GoToReadings(var pPage: iPageLayout; id: string = '') : iPageLayout;
    function GoToGoals(var pPage: iPageLayout; id: string = '') : iPageLayout;
    function GoToSettings(var pPage: iPageLayout; id: string = '') : iPageLayout;
    function GoToShopping(var pPage: iPageLayout; id: string = '') : iPageLayout;
  end;

  iThemeService = interface
    ['{741F4923-A65F-4F5B-9339-88D62795F52A}']
    function ChangeTheme: iThemeService;
  end;


implementation

end.
