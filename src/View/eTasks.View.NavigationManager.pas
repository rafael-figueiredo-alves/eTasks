unit eTasks.View.NavigationManager;

interface

uses
  eTasks.View.Interfaces, FMX.Layouts;

type
 TNavigationManager = class(TInterfacedObject, iNavigationManagerService)
   private
     fScreensLayout      : TLayout;
     fUpdateScreenMethod : TUpdateScreenMethod;
   public
    procedure GoToTasks(var pPage: iPageLayout);
    procedure GoToAbout(var pPage: iPageLayout);
    procedure NavigateTo(const Page: TPages; var pPage: iPageLayout);
    class function New(ScreensLayout: TLayout; UpdateScreenMethod: TUpdateScreenMethod): iNavigationManagerService;
    constructor Create(ScreensLayout: TLayout; UpdateScreenMethod: TUpdateScreenMethod);
//     class procedure NavigateTo(const Page: TPages; ScreensLayout: TLayout; UpdateScreenMethod: TUpdateScreenMethod; var pPage: iPageLayout);
 end;

implementation

uses
  eTasks.View.Teste, eTasks.View.PageLayout;

{ TNavigationManager }

//class procedure TNavigationManager.NavigateTo(const Page: TPages;
//  ScreensLayout: TLayout; UpdateScreenMethod: TUpdateScreenMethod;
//  var pPage: iPageLayout);
//begin
//  if(Assigned(pPage))then
//   begin
//     if(ScreensLayout.ContainsObject(pPage.Layout))then
//      ScreensLayout.RemoveObject(pPage.Layout);
//   end;
//
//  case Page of
//    pageTasks: pPage := TPageLayout1.New(ScreensLayout, UpdateScreenMethod);
//    pageShopping: pPage := TPageLayout.New(ScreensLayout, UpdateScreenMethod);
//    pageNotes: ;
//    pageFinances: ;
//    pageReadings: ;
//    pageGoals: ;
//    pageSettings: ;
//    pageAbout: ;
//  end;
//
//  UpdateScreenMethod;
//end;

{ TNavigationManager }

constructor TNavigationManager.Create(ScreensLayout: TLayout;
  UpdateScreenMethod: TUpdateScreenMethod);
begin
  fScreensLayout := ScreensLayout;
  fUpdateScreenMethod := UpdateScreenMethod;
end;

procedure TNavigationManager.GoToAbout(var pPage: iPageLayout);
begin
  NavigateTo(pageShopping, pPage);
end;

procedure TNavigationManager.GoToTasks(var pPage: iPageLayout);
begin
  NavigateTo(pageTasks, pPage);
end;

procedure TNavigationManager.NavigateTo(const Page: TPages; var pPage: iPageLayout);
begin
  if(Assigned(pPage))then
   begin
     if(fScreensLayout.ContainsObject(pPage.Layout))then
      fScreensLayout.RemoveObject(pPage.Layout);
   end;

  case Page of
    pageTasks: pPage := TPageLayout1.New(fScreensLayout, fUpdateScreenMethod);
    pageShopping: pPage := TPageLayout.New(fScreensLayout, fUpdateScreenMethod);
    pageNotes: ;
    pageFinances: ;
    pageReadings: ;
    pageGoals: ;
    pageSettings: ;
    pageAbout: ;
  end;

  fUpdateScreenMethod;
end;

class function TNavigationManager.New(ScreensLayout: TLayout;
  UpdateScreenMethod: TUpdateScreenMethod): iNavigationManagerService;
begin
  Result := Self.Create(ScreensLayout, UpdateScreenMethod);
end;

end.
