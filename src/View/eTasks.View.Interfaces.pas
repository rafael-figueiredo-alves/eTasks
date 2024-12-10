unit eTasks.View.Interfaces;

interface

uses
  FMX.Layouts;

type

  TPages = (pageTasks, pageShopping, pageNotes, pageFinances, pageReadings, pageGoals, pageSettings, pageAbout);
  TLayoutForm = (lfEditButtons, lfWithUpdateButton, lfWithHelpButton);

  TUpdateScreenMethod = Procedure of object;

  iPageLayout = interface
    ['{E22EAB87-8030-43F8-B0DC-AB57B067C0CD}']
    function Layout: TLayout;
    function EntityID : string;
    function Resize(const Formwidth: integer): iPageLayout;
  end;

  iNavigationManagerService = interface
    ['{9D744B61-67D1-4ABE-AAEF-6F53D070166B}']
    function GoToTasks(var pPage: iPageLayout; id: string = '') : iPageLayout;
    function GoToAbout(var pPage: iPageLayout; id: string = '') : iPageLayout;
  end;

  iMainLayout = interface
    ['{62E3430F-0A34-420A-970E-D873D5427ABA}']
    function GetPage: iPageLayout;
    procedure SetPage(value: iPageLayout);
    property Page: iPageLayout read GetPage write SetPage;
    function FormWidth: Integer;
    procedure ScreensLayoutChange;
  end;

implementation

end.



