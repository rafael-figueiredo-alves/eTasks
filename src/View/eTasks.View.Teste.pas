unit eTasks.View.Teste;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.PageLayout, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TPageLayout1 = class(TPageLayout)
    Rectangle2: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PageLayout1: TPageLayout1;

implementation

{$R *.fmx}

end.
