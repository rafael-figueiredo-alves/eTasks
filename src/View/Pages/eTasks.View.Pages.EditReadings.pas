unit eTasks.View.Pages.EditReadings;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.PageLayout, FMX.Objects, FMX.Layouts, FMX.Controls.Presentation;

type
  TPage_EditReadings = class sealed(TPageLayout)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Page_EditReadings: TPage_EditReadings;

implementation

{$R *.fmx}

end.
