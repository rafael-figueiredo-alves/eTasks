unit eTasks.View.Pages.Finance;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TResourceFinances = class(TForm)
    LayResource: TLayout;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ResourceFinances: TResourceFinances;

implementation

{$R *.fmx}

end.
