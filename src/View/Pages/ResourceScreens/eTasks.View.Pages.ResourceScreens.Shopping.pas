unit eTasks.View.Pages.ResourceScreens.Shopping;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.ResourceBase, FMX.Layouts, FMX.Controls.Presentation;

type
  TResourceShopping = class(TResourceBase)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TResourceShopping;
  end;

var
  ResourceShopping: TResourceShopping;

implementation

{$R *.fmx}

{ TResourceShopping }

class function TResourceShopping.New(const Value: TLayout): TResourceShopping;
begin
  Result := TResourceShopping.Create(Value);
end;

end.
