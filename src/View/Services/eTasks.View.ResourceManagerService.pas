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
      Constructor Create;
      class function New(const NavManagerService: iNavigationManagerService; MainLayout: iMainLayout; LayoutList, LayoutScreen: TLayout) : iResourceManager;
  end;

implementation

{ TResourceManagerService }

constructor TResourceManagerService.Create;
begin

end;

destructor TResourceManagerService.Destroy;
begin

  inherited;
end;

class function TResourceManagerService.New(const NavManagerService   : iNavigationManagerService;
                                                        MainLayout   : iMainLayout;
                                                        LayoutList,
                                                        LayoutScreen : TLayout): iResourceManager;
begin

end;

procedure TResourceManagerService.OpenFinances;
begin

end;

procedure TResourceManagerService.OpenGoals;
begin

end;

procedure TResourceManagerService.OpenHomePage;
begin

end;

procedure TResourceManagerService.OpenNotes;
begin

end;

procedure TResourceManagerService.OpenReadings;
begin

end;

procedure TResourceManagerService.OpenShopping;
begin

end;

procedure TResourceManagerService.OpenTasks;
begin

end;

end.
