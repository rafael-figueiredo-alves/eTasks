unit eTasks.View.Pages.EditTasks;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.PageLayout, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts,
  eTasks.View.Layouts.Interfaces;

type
  TPage_EditTasks = class(TPageLayout)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Page_EditTasks: TPage_EditTasks;

implementation

{$R *.fmx}

end.
