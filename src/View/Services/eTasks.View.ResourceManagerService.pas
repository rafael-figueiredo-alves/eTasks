unit eTasks.View.ResourceManagerService;

interface

uses
  eTasks.View.Services.Interfaces,
  eTasks.View.Layouts.Interfaces,
  FMX.Layouts;

type

  TResourceManagerService = class(TInterfacedObject, iResourceManager)
    private
      fNavManagerService : iNavigationManagerService;
      fMainLayout        : iMainLayout;
      fLayoutList        : TLayout;
      fLayoutScreen      : TLayout;
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
  eTasks.View.Pages.ListTasks, eTasks.View.Pages.Tasks,
  eTasks.View.Pages.ListGoals, eTasks.View.Pages.Goals,
  eTasks.View.Pages.ListShopping, eTasks.View.Pages.Shopping,
  eTasks.View.Pages.ListReadings, eTasks.View.Pages.Readings,
  eTasks.View.Pages.ListNotes, eTasks.View.Pages.Notes,
  eTasks.View.Pages.ListFinances, eTasks.View.Pages.Finance,
  eTasks.View.Pages.ListHome, eTasks.View.Pages.Homepage;

{ TResourceManagerService }

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
  ListFinances := TListFinances.Create(fLayoutList);
  ListFinances.NavManagerService := fNavManagerService;
  ListFinances.MainLayout := fMainLayout;
  fLayoutList.AddObject(ListFinances.LayLista);

  ResourceFinances := TResourceFinances.Create(fLayoutScreen);
  fLayoutScreen.AddObject(ResourceFinances.LayResource);
end;

procedure TResourceManagerService.OpenGoals;
begin
  ListGoals := TListGoals.Create(fLayoutList);
  ListGoals.NavManagerService := fNavManagerService;
  ListGoals.MainLayout := fMainLayout;
  fLayoutList.AddObject(ListGoals.LayLista);

  ResourceGoals := TResourceGoals.Create(fLayoutScreen);
  fLayoutScreen.AddObject(ResourceGoals.LayResource);
end;

procedure TResourceManagerService.OpenHomePage;
begin
  ListHome := TListHome.Create(fLayoutList);
  ListHome.NavManagerService := fNavManagerService;
  ListHome.MainLayout := fMainLayout;
  fLayoutList.AddObject(ListHome.LayLista);

  ResourceHome := TResourceHome.Create(fLayoutScreen);
  fLayoutScreen.AddObject(ResourceHome.LayResource);
end;

procedure TResourceManagerService.OpenNotes;
begin
  ListNotes := TListNotes.Create(fLayoutList);
  ListNotes.NavManagerService := fNavManagerService;
  ListNotes.MainLayout := fMainLayout;
  fLayoutList.AddObject(ListNotes.LayLista);

  ResourceNotes := TResourceNotes.Create(fLayoutScreen);
  fLayoutScreen.AddObject(ResourceNotes.LayResource);
end;

procedure TResourceManagerService.OpenReadings;
begin
  ListReadings := TListReadings.Create(fLayoutList);
  ListReadings.NavManagerService := fNavManagerService;
  ListReadings.MainLayout := fMainLayout;
  fLayoutList.AddObject(ListReadings.LayLista);

  ResourceReadings := TResourceReadings.Create(fLayoutScreen);
  fLayoutScreen.AddObject(ResourceReadings.LayResource);
end;

procedure TResourceManagerService.OpenShopping;
begin
  ListShopping := TListShopping.Create(fLayoutList);
  ListShopping.NavManagerService := fNavManagerService;
  ListShopping.MainLayout := fMainLayout;
  fLayoutList.AddObject(ListShopping.LayLista);

  ResourceShopping := TResourceShopping.Create(fLayoutScreen);
  fLayoutScreen.AddObject(ResourceShopping.LayResource);
end;

procedure TResourceManagerService.OpenTasks;
begin
  ListTask := TListTask.Create(fLayoutList);
  ListTask.NavManagerService := fNavManagerService;
  ListTask.MainLayout := fMainLayout;
  fLayoutList.AddObject(ListTask.LayLista);

  ResourceTasks := TResourceTasks.Create(fLayoutScreen);
  fLayoutScreen.AddObject(ResourceTasks.LayResource);
end;

end.
