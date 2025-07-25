unit eTasks.View.Pages.EditShopping;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.PageLayout, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TPage_EditShopping = class sealed(TPageLayout)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Page_EditShopping: TPage_EditShopping;

implementation

{$R *.fmx}

end.
