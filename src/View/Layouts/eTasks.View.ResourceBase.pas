unit eTasks.View.ResourceBase;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  eTasks.View.FormModels;

type
  TResourceBase = class(TForm, iResource)
    ContainerResource: TLayout;
  private
    { Private declarations }
  public
    { Public declarations }
    function ReturnLayout: TLayout;
  end;

var
  ResourceBase: TResourceBase;

implementation

{$R *.fmx}

{ TResourceBase }

function TResourceBase.ReturnLayout: TLayout;
begin
  Result := self.ContainerResource;
end;

end.
