unit eTasks.View.Pages.ListReadings;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  eTasks.View.Services.Interfaces, eTasks.View.Layouts.Interfaces,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TListReadings = class(TForm)
    LayLista: TLayout;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    NavManagerService : iNavigationManagerService;
    MainLayout        : iMainLayout;
  end;

var
  ListReadings: TListReadings;

implementation

{$R *.fmx}

end.
