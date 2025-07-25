unit eTasks.View.Pages.EditProfile;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.PageLayout, FMX.Objects, FMX.Layouts, FMX.Controls.Presentation;

type
  TPage_Profile = class sealed(TPageLayout)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Page_Profile: TPage_Profile;

implementation

{$R *.fmx}

end.
