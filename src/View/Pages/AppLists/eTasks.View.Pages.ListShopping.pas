unit eTasks.View.Pages.ListShopping;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  eTasks.View.Services.Interfaces, eTasks.View.Layouts.Interfaces;

type
  TListShopping = class(TForm)
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
  ListShopping: TListShopping;

implementation

{$R *.fmx}

end.
