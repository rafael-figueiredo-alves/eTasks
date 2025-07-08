unit eTasks.View.Layouts.Interfaces;

interface

uses
  FMX.Layouts,
  eTasks.View.Types;

type

  iPageLayout = interface
    ['{E22EAB87-8030-43F8-B0DC-AB57B067C0CD}']
    function Layout: TLayout;
    function EntityID : string;
    function Resize(const Formwidth: integer): iPageLayout;
    function isDarkMode(const value: Boolean): iPageLayout;
    function SetTitle(const value: string): iPageLayout;
    function OnBackButtonClick(const value: TEventCallback):iPageLayout;
    function OnHelpButtonClick(const value: TEventCallback):iPageLayout;
    function OnDeleteButtonClick(const value: TEventCallback):iPageLayout;
    function OnConfirmButtonClick(const value: TEventCallback):iPageLayout;
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
