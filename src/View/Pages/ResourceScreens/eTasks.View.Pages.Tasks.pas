unit eTasks.View.Pages.Tasks;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TResourceTasks = class(TForm)
    LayResource: TLayout;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ResourceTasks: TResourceTasks;

implementation

{$R *.fmx}

end.
