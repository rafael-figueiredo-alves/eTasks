unit eTasks.View.Pages.PageSettings;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.PageLayout, FMX.Objects, FMX.Layouts, FMX.Controls.Presentation;

type
  TPage_Settings = class(TPageLayout)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Page_Settings: TPage_Settings;

implementation

{$R *.fmx}

end.
