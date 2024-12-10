unit eTasks.View.NavigationManager;

interface

uses
  eTasks.View.Interfaces, FMX.Layouts;

type

 TNavigationManager = class(TInterfacedObject, iNavigationManagerService)
   private
     fScreensLayout      : TLayout;
     fUpdateScreenMethod : TUpdateScreenMethod;
     procedure NavigateTo(const Page: TPages; var pPage: iPageLayout; id: string = '');
   public
    function GoToTasks(var pPage: iPageLayout; id: string = '') : iPageLayout;
    function GoToAbout(var pPage: iPageLayout; id: string = '') : iPageLayout;

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

function TNavigationManager.GoToAbout(var pPage: iPageLayout; id: string = '') : iPageLayout;
begin
  NavigateTo(pageShopping, pPage, id);
  Result := pPage;
end;

function TNavigationManager.GoToTasks(var pPage: iPageLayout; id: string = '') : iPageLayout;
begin
  NavigateTo(pageTasks, pPage, id);
  Result := pPage;
end;

procedure TNavigationManager.NavigateTo(const Page: TPages; var pPage: iPageLayout; id: string = '');
begin
  if(Assigned(pPage))then
   begin
     if(fScreensLayout.ContainsObject(pPage.Layout))then
      fScreensLayout.RemoveObject(pPage.Layout);
   end;

  case Page of
    pageTasks: pPage := TPageLayout1.New(fScreensLayout, fUpdateScreenMethod, TLayoutForm.lfEditButtons, id);
    pageShopping: pPage := TPageLayout1.New(fScreensLayout, fUpdateScreenMethod, TLayoutForm.lfWithHelpButton, id);
    pageNotes: ;
    pageFinances: ;
    pageReadings: ;
    pageGoals: ;
    pageSettings: ;
    pageAbout: ;
  end;

  fUpdateScreenMethod;
end;

end.
