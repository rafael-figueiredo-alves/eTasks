unit eTasks.View.FormModels;

interface

uses
  FMX.Forms,
  eTasks.View.Services.Interfaces,
  FMX.Layouts,
  eTasks.View.Layouts.Interfaces;

type

  iAppList = interface
  ['{A7932859-BBBB-41E9-AF1F-DC703743520A}']
    function SetMainLayout(const Value: iMainLayout): iAppList;
    function SetNavManagerService(const Value: iNavigationManagerService): iAppList;
    function ReturnLayout: TLayout;
  end;

  iResource = interface
  ['{D0B06348-BD46-4FBD-9293-C1940BC99CDC}']
    function ReturnLayout: TLayout;
  end;

implementation

end.
