unit eTasks.View.Pages.ResourceScreens.Home;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.ResourceBase, FMX.Layouts, FMX.Controls.Presentation;

type
  TResourceHome = class(TResourceBase)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TResourceHome;
  end;

var
  ResourceHome: TResourceHome;

implementation

{$R *.fmx}

{ TResourceHome }

class function TResourceHome.New(const Value: TLayout): TResourceHome;
begin
  Result := TResourceHome.Create(Value);
end;

end.
