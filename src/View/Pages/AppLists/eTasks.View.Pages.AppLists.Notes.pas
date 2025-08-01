unit eTasks.View.Pages.AppLists.Notes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.AppListBase, FMX.Layouts, FMX.Controls.Presentation;

type
  TAppListNotes = class(TAppListBase)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(const Value: TLayout) : TAppListNotes;
  end;

var
  AppListNotes: TAppListNotes;

implementation

{$R *.fmx}

{ TAppListNotes }

class function TAppListNotes.New(const Value: TLayout): TAppListNotes;
begin
  Result := TAppListNotes.Create(Value);
end;

end.
