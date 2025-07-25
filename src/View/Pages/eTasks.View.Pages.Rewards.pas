unit eTasks.View.Pages.Rewards;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.PageLayout, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TPage_Rewards = class(TPageLayout)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Page_Rewards: TPage_Rewards;

implementation

{$R *.fmx}

end.
