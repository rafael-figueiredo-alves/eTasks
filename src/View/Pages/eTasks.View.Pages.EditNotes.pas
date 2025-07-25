unit eTasks.View.Pages.EditNotes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.PageLayout, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TPage_EditNotes = class sealed(TPageLayout)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Page_EditNotes: TPage_EditNotes;

implementation

{$R *.fmx}

end.
