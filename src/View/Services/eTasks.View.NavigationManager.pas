unit eTasks.View.NavigationManager;

interface

uses
  FMX.Layouts,
  eTasks.View.Services.Interfaces,
  eTasks.View.Types,
  eTasks.View.Enums,
  eTasks.View.Layouts.Interfaces;

type

 TNavigationManager = class(TInterfacedObject, iNavigationManagerService)
   private
     fScreensLayout      : TLayout;
     fUpdateScreenMethod : TUpdateScreenMethod;
     procedure NavigateTo(const Page: TPages; var pPage: iPageLayout; id: string = '');
     function OpenPage(const MainLayout: iMainLayout; const Page: TPages; id: string = '') : iPageLayout;
   public
    function GoToTasks(const MainLayout: iMainLayout; id: string = '') : iPageLayout;
    function GoToAbout(const MainLayout: iMainLayout; id: string = '') : iPageLayout;
    function GoToNotes(const MainLayout: iMainLayout; id: string = '') : iPageLayout;
    function GoToFinances(const MainLayout: iMainLayout; id: string = '') : iPageLayout;
    function GoToReadings(const MainLayout: iMainLayout; id: string = '') : iPageLayout;
    function GoToGoals(const MainLayout: iMainLayout; id: string = '') : iPageLayout;
    function GoToSettings(const MainLayout: iMainLayout; id: string = '') : iPageLayout;
    function GoToShopping(const MainLayout: iMainLayout; id: string = '') : iPageLayout;

    class function New(ScreensLayout: TLayout; UpdateScreenMethod: TUpdateScreenMethod): iNavigationManagerService;
    constructor Create(ScreensLayout: TLayout; UpdateScreenMethod: TUpdateScreenMethod);
 end;

implementation

uses
  eTasks.View.Teste,
  eTasks.View.PageLayout,
  eTasks.View.About;

{ TNavigationManager }

class function TNavigationManager.New(ScreensLayout: TLayout;UpdateScreenMethod: TUpdateScreenMethod): iNavigationManagerService;
begin
  Result := Self.Create(ScreensLayout, UpdateScreenMethod);
end;

function TNavigationManager.OpenPage(const MainLayout: iMainLayout;const Page: TPages; id: string): iPageLayout;
var
 pPage : iPageLayout;
begin
  pPage := MainLayout.Page;
  NavigateTo(Page, pPage, id);
  MainLayout.Page := pPage;
  MainLayout.Page.Resize(MainLayout.FormWidth);
  MainLayout.ScreensLayoutChange;
  Result := pPage;
end;

constructor TNavigationManager.Create(ScreensLayout: TLayout;UpdateScreenMethod: TUpdateScreenMethod);
begin
  fScreensLayout := ScreensLayout;
  fUpdateScreenMethod := UpdateScreenMethod;
end;


{$region 'GoToActions'}
function TNavigationManager.GoToAbout(const MainLayout: iMainLayout; id: string = '') : iPageLayout;
begin
  Result := OpenPage(MainLayout, pageAbout, id);
end;

function TNavigationManager.GoToFinances(const MainLayout: iMainLayout; id: string): iPageLayout;
begin
  Result := OpenPage(MainLayout, pageFinances, id);
end;

function TNavigationManager.GoToGoals(const MainLayout: iMainLayout; id: string): iPageLayout;
begin
  Result := OpenPage(MainLayout, pageGoals, id);
end;

function TNavigationManager.GoToNotes(const MainLayout: iMainLayout; id: string): iPageLayout;
begin
  Result := OpenPage(MainLayout, pageNotes, id);
end;

function TNavigationManager.GoToReadings(const MainLayout: iMainLayout; id: string): iPageLayout;
begin
  Result := OpenPage(MainLayout, pageReadings, id);
end;

function TNavigationManager.GoToSettings(const MainLayout: iMainLayout; id: string): iPageLayout;
begin
  Result := OpenPage(MainLayout, pageSettings, id);
end;

function TNavigationManager.GoToShopping(const MainLayout: iMainLayout; id: string): iPageLayout;
begin
  Result :=  OpenPage(MainLayout, pageShopping, id);
end;

function TNavigationManager.GoToTasks(const MainLayout: iMainLayout; id: string = '') : iPageLayout;
begin
  Result :=  OpenPage(MainLayout, pageTasks, id);
end;
{$endregion}

procedure TNavigationManager.NavigateTo(const Page: TPages; var pPage: iPageLayout; id: string = '');
begin
  if(Assigned(pPage))then
   begin
     if(fScreensLayout.ContainsObject(pPage.Layout))then
      fScreensLayout.RemoveObject(pPage.Layout);
   end;

  case Page of
    //Realizar manutenção e substituir TPageLayout1 pela classe correta
       pageTasks : pPage := TPageLayout1.New(fScreensLayout, fUpdateScreenMethod, TLayoutForm.lfEditButtons, id);
    pageShopping : pPage := TPageLayout1.New(fScreensLayout, fUpdateScreenMethod, TLayoutForm.lfWithHelpButton, id);
       pageNotes : pPage := TPageLayout1.New(fScreensLayout, fUpdateScreenMethod, TLayoutForm.lfWithHelpButton, id);
    pageFinances : pPage := TPageLayout1.New(fScreensLayout, fUpdateScreenMethod, TLayoutForm.lfWithHelpButton, id);
    pageReadings : pPage := TPageLayout1.New(fScreensLayout, fUpdateScreenMethod, TLayoutForm.lfWithHelpButton, id);
       pageGoals : pPage := TPageLayout1.New(fScreensLayout, fUpdateScreenMethod, TLayoutForm.lfWithHelpButton, id);
    pageSettings : pPage := TPageLayout1.New(fScreensLayout, fUpdateScreenMethod, TLayoutForm.lfWithHelpButton, id);
       pageAbout : pPage := TPageAbout.New(fScreensLayout, fUpdateScreenMethod, TLayoutForm.lfWithUpdateButton, id);
  end;

  fUpdateScreenMethod;
end;

end.
