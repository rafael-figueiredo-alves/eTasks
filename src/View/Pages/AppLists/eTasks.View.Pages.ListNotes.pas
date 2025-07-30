unit eTasks.View.Pages.ListNotes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  eTasks.View.Layouts.Interfaces, eTasks.View.Services.Interfaces;

type
  TListNotes = class(TForm)
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
  ListNotes: TListNotes;

implementation

{$R *.fmx}

end.
