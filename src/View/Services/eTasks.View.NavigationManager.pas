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
   public
    function GoToTasks(var pPage: iPageLayout; id: string = '') : iPageLayout;
    function GoToAbout(var pPage: iPageLayout; id: string = '') : iPageLayout;
    function GoToNotes(var pPage: iPageLayout; id: string = '') : iPageLayout;
    function GoToFinances(var pPage: iPageLayout; id: string = '') : iPageLayout;
    function GoToReadings(var pPage: iPageLayout; id: string = '') : iPageLayout;
    function GoToGoals(var pPage: iPageLayout; id: string = '') : iPageLayout;
    function GoToSettings(var pPage: iPageLayout; id: string = '') : iPageLayout;
    function GoToShopping(var pPage: iPageLayout; id: string = '') : iPageLayout;

    class function New(ScreensLayout: TLayout; UpdateScreenMethod: TUpdateScreenMethod): iNavigationManagerService;
    constructor Create(ScreensLayout: TLayout; UpdateScreenMethod: TUpdateScreenMethod);
 end;

implementation

uses
  eTasks.View.Teste,
  eTasks.View.PageLayout;

{ TNavigationManager }

class function TNavigationManager.New(ScreensLayout: TLayout;UpdateScreenMethod: TUpdateScreenMethod): iNavigationManagerService;
begin
  Result := Self.Create(ScreensLayout, UpdateScreenMethod);
end;

constructor TNavigationManager.Create(ScreensLayout: TLayout;UpdateScreenMethod: TUpdateScreenMethod);
begin
  fScreensLayout := ScreensLayout;
  fUpdateScreenMethod := UpdateScreenMethod;
end;

{$region 'GoToActions'}
function TNavigationManager.GoToAbout(var pPage: iPageLayout; id: string = '') : iPageLayout;
begin
  NavigateTo(pageAbout, pPage, id);
  Result := pPage;
end;

function TNavigationManager.GoToFinances(var pPage: iPageLayout; id: string): iPageLayout;
begin
  NavigateTo(pageFinances, pPage, id);
  Result := pPage;
end;

function TNavigationManager.GoToGoals(var pPage: iPageLayout; id: string): iPageLayout;
begin
  NavigateTo(pageGoals, pPage, id);
  Result := pPage;
end;

function TNavigationManager.GoToNotes(var pPage: iPageLayout; id: string): iPageLayout;
begin
  NavigateTo(pageNotes, pPage, id);
  Result := pPage;
end;

function TNavigationManager.GoToReadings(var pPage: iPageLayout; id: string): iPageLayout;
begin
  NavigateTo(pageReadings, pPage, id);
  Result := pPage;
end;

function TNavigationManager.GoToSettings(var pPage: iPageLayout; id: string): iPageLayout;
begin
  NavigateTo(pageSettings, pPage, id);
  Result := pPage;
end;

function TNavigationManager.GoToShopping(var pPage: iPageLayout; id: string): iPageLayout;
begin
  NavigateTo(pageShopping, pPage, id);
  Result := pPage;
end;

function TNavigationManager.GoToTasks(var pPage: iPageLayout; id: string = '') : iPageLayout;
begin
  NavigateTo(pageTasks, pPage, id);
  Result := pPage;
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
    pageTasks: pPage := TPageLayout1.New(fScreensLayout, fUpdateScreenMethod, TLayoutForm.lfEditButtons, id);
    pageShopping: pPage := TPageLayout1.New(fScreensLayout, fUpdateScreenMethod, TLayoutForm.lfWithHelpButton, id);
    pageNotes: pPage := TPageLayout1.New(fScreensLayout, fUpdateScreenMethod, TLayoutForm.lfWithHelpButton, id);
    pageFinances: pPage := TPageLayout1.New(fScreensLayout, fUpdateScreenMethod, TLayoutForm.lfWithHelpButton, id);
    pageReadings: pPage := TPageLayout1.New(fScreensLayout, fUpdateScreenMethod, TLayoutForm.lfWithHelpButton, id);
    pageGoals: pPage := TPageLayout1.New(fScreensLayout, fUpdateScreenMethod, TLayoutForm.lfWithHelpButton, id);
    pageSettings: pPage := TPageLayout1.New(fScreensLayout, fUpdateScreenMethod, TLayoutForm.lfWithHelpButton, id);
    pageAbout: pPage := TPageLayout1.New(fScreensLayout, fUpdateScreenMethod, TLayoutForm.lfWithHelpButton, id);
  end;

  fUpdateScreenMethod;
end;

end.
