unit eTasks.View.FormModels;

interface

uses
  FMX.Forms,
  eTasks.View.Services.Interfaces,
  FMX.Layouts,
  eTasks.View.Layouts.Interfaces;

type

  TAppListBase = class(TForm)
  public
    LayLista: TLayout;
    NavManagerService: iNavigationManagerService;
    MainLayout: iMainLayout;
  end;

  TResourceBase = class(TForm)
  public
    LayResource: TLayout;
  end;

implementation

end.
