unit eTasks.Components.Builder;

interface

uses
  eTasks.Components.Interfaces,
  FMX.Forms;

type

  TComponentBars = class
    class function AppBar(const Form: TForm) : iAppBar;
  end;

implementation

uses
  eTasks.Components.AppBar;

{ TComponentBars }

class function TComponentBars.AppBar(const Form: TForm): iAppBar;
begin
  Result := tAppBar.New(Form);
end;

end.
