unit eTasks.View.Pages.ListHome;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  eTasks.View.Services.Interfaces, eTasks.View.Layouts.Interfaces;

type
  TListHome = class(TForm)
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
  ListHome: TListHome;

implementation

{$R *.fmx}

end.
