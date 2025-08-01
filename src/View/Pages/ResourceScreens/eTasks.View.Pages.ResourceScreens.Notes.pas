unit eTasks.View.Pages.ResourceScreens.Notes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.ResourceBase, FMX.Layouts, FMX.Controls.Presentation;

type
  TResourceNotes = class(TResourceBase)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TResourceNotes;
  end;

var
  ResourceNotes: TResourceNotes;

implementation

{$R *.fmx}

{ TResourceNotes }

class function TResourceNotes.New(const Value: TLayout): TResourceNotes;
begin
  Result := TResourceNotes.Create(Value);
end;

end.
