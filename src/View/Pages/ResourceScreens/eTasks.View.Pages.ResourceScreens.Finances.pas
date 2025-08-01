unit eTasks.View.Pages.ResourceScreens.Finances;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.ResourceBase, FMX.Layouts, FMX.Controls.Presentation;

type
  TResourceFinances = class(TResourceBase)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TResourceFinances;
  end;

var
  ResourceFinances: TResourceFinances;

implementation

{$R *.fmx}

{ TResourceFinances }

class function TResourceFinances.New(const Value: TLayout): TResourceFinances;
begin
  Result := TResourceFinances.Create(Value);
end;

end.
