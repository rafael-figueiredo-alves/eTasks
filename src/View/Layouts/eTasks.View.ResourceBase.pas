unit eTasks.View.ResourceBase;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  eTasks.View.FormModels, eTasks.View.Services.Interfaces;

type
  TResourceBase = class(TForm, iResource)
    ContainerResource: TLayout;
  private
    { Private declarations }
  public
    { Public declarations }
    ResourceManager : iResourceManager;
    function SetResourceManagerService(const Value: iResourceManager): iResource;
    function ReturnLayout: TLayout;
    function isDarkMode(const Value: boolean): iResource; virtual;
    function TranslateUI: iResource; virtual;
  end;

var
  ResourceBase: TResourceBase;

implementation

{$R *.fmx}

{ TResourceBase }

function TResourceBase.isDarkMode(const Value: boolean) : iResource;
begin

end;

function TResourceBase.ReturnLayout: TLayout;
begin
  Result := self.ContainerResource;
end;

function TResourceBase.SetResourceManagerService(const Value: iResourceManager): iResource;
begin
  Result := self;
  ResourceManager := Value;
end;

function TResourceBase.TranslateUI : iResource;
begin

end;

end.
