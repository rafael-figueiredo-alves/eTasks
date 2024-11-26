unit eTasks.View.Interfaces;

interface

uses
  FMX.Layouts;

type

  TPages = (pageTasks, pageShopping, pageNotes, pageFinances, pageReadings, pageGoals, pageSettings, pageAbout);

  TUpdateScreenMethod = Procedure of object;

  iPageLayout = interface
    ['{E22EAB87-8030-43F8-B0DC-AB57B067C0CD}']
    function Layout: TLayout;
    function IsMobile(const Value: boolean): iPageLayout;
  end;

  iNavigationManagerService = interface
    ['{9D744B61-67D1-4ABE-AAEF-6F53D070166B}']
    procedure NavigateTo(const Page: TPages; var pPage: iPageLayout);
    procedure GoToTasks(var pPage: iPageLayout);
    procedure GoToAbout(var pPage: iPageLayout);
  end;

implementation

end.



