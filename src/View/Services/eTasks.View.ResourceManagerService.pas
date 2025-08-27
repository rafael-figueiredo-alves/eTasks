unit eTasks.View.ResourceManagerService;

interface

uses
  eTasks.View.Services.Interfaces,
  eTasks.View.Layouts.Interfaces,
  FMX.Layouts, eTasks.View.FormModels, eTasks.Components.MenuEnums;

type

  TResourceManagerService = class(TInterfacedObject, iResourceManager)
    private
      fNavManagerService : iNavigationManagerService;
      fMainLayout        : iMainLayout;
      fLayoutList        : TLayout;
      fLayoutScreen      : TLayout;

      procedure RemovePageViewLayout;
      procedure CleanLayouts;
      procedure OpenResource(const Lista: iAppList; Resource: iResource; Page: TMainMenuItems);
    public
      procedure OpenHomePage;
      procedure OpenTasks;
      procedure OpenGoals;
      procedure OpenReadings;
      procedure OpenNotes;
      procedure OpenFinances;
      procedure OpenShopping;

      Destructor Destroy; override;
      Constructor Create(const NavManagerService: iNavigationManagerService; MainLayout: iMainLayout; LayoutList, LayoutScreen: TLayout);
      class function New(const NavManagerService: iNavigationManagerService; MainLayout: iMainLayout; LayoutList, LayoutScreen: TLayout) : iResourceManager;
  end;

implementation

uses
  System.SysUtils,
  eTasks.View.Pages.AppLists.Tasks,
  eTasks.View.Pages.ResourceScreens.Tasks,
  eTasks.View.Pages.AppLists.Shopping,
  eTasks.View.Pages.ResourceScreens.Shopping,
  eTasks.View.Pages.ResourceScreens.Readings,
  eTasks.View.Pages.AppLists.Readings,
  eTasks.View.Pages.AppLists.Notes,
  eTasks.View.Pages.ResourceScreens.Notes,
  eTasks.View.Pages.AppLists.Home,
  eTasks.View.Pages.ResourceScreens.Home,
  eTasks.View.Pages.ResourceScreens.Goals,
  eTasks.View.Pages.AppLists.Goals,
  eTasks.View.Pages.ResourceScreens.Finances,
  eTasks.View.Pages.AppLists.Finances, eTasks.View.ThemeService,
  eTasks.View.ActionButtonVisibleService;

{ TResourceManagerService }

procedure TResourceManagerService.CleanLayouts;
var
 Item : integer;
begin
  for Item := 0 to fLayoutList.ComponentCount - 1 do
    fLayoutList.RemoveObject(Item);
  for Item := 0 to fLayoutScreen.ComponentCount - 1 do
    fLayoutScreen.RemoveObject(Item);

  fMainLayout.ScreensLayoutChange;
end;

constructor TResourceManagerService.Create(const NavManagerService: iNavigationManagerService; MainLayout: iMainLayout; LayoutList, LayoutScreen: TLayout);
begin
  fNavManagerService := NavManagerService;
  fMainLayout        := MainLayout;
  fLayoutList        := LayoutList;
  fLayoutScreen      := LayoutScreen;
end;

destructor TResourceManagerService.Destroy;
begin

  inherited;
end;

class function TResourceManagerService.New(const NavManagerService: iNavigationManagerService; MainLayout: iMainLayout; LayoutList, LayoutScreen : TLayout): iResourceManager;
begin
  Result := Self.Create(NavManagerService, MainLayout, LayoutList, LayoutScreen);
end;

procedure TResourceManagerService.OpenFinances;
begin
  OpenResource(tAppListFinances.New(fLayoutList), TResourceFinances.New(fLayoutScreen), TMainMenuItems.Finance);
end;

procedure TResourceManagerService.OpenGoals;
begin
  OpenResource(tAppListGoals.New(fLayoutList), TResourceGoals.New(fLayoutScreen), TMainMenuItems.Goals);
end;

procedure TResourceManagerService.OpenHomePage;
begin
  OpenResource(tAppListHome.New(fLayoutList), TResourceHome.New(fLayoutScreen), TMainMenuItems.Home);
end;

procedure TResourceManagerService.OpenNotes;
begin
  OpenResource(tAppListNotes.New(fLayoutList), TResourceNotes.New(fLayoutScreen), TMainMenuItems.Notes);
end;

procedure TResourceManagerService.OpenReadings;
begin
  OpenResource(tAppListReadings.New(fLayoutList), TResourceReadings.New(fLayoutScreen), TMainMenuItems.Readings);
end;

procedure TResourceManagerService.OpenResource(const Lista: iAppList; Resource: iResource; Page: TMainMenuItems);
begin
  RemovePageViewLayout;
  CleanLayouts;

  fMainLayout.SetSelectedPage(Page);

  fLayoutList.AddObject(Lista.SetMainLayout(fMainLayout).SetResourceManagerService(self).SetNavManagerService(fNavManagerService).ReturnLayout);

  fLayoutScreen.AddObject(Resource.SetResourceManagerService(self).ReturnLayout);
  ThemeService.SubscribeInterface([Lista, Resource]);

  ActionButtonVisibleService.SetActionButtonVisible( Page <> TMainMenuItems.Home);
end;

procedure TResourceManagerService.OpenShopping;
begin
  OpenResource(tAppListShopping.New(fLayoutList), TResourceShopping.New(fLayoutScreen), TMainMenuItems.Shopping);
end;

procedure TResourceManagerService.OpenTasks;
begin
  OpenResource(tAppListTasks.New(fLayoutList), TResourceTasks.New(fLayoutScreen), TMainMenuItems.Tasks);
end;

procedure TResourceManagerService.RemovePageViewLayout;
var
 item       : integer;
 PageLayout : iPageLayout;
begin
  if Assigned(fMainLayout)then
   for item := 0 to fLayoutScreen.ComponentCount - 1 do
    try
     if(Supports(fLayoutScreen.Components[item], iPageLayout, PageLayout))then
      PageLayout.GoBack(nil);
    finally

    end;
end;

end.
