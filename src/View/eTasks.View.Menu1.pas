unit eTasks.View.Menu1;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Layouts,
  eTasks.View.Services.Interfaces,
  eTasks.View.Layouts.Interfaces;

type
  TMenu1 = class(TForm)
    Layout1: TLayout;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    fNavigationManager: iNavigationManagerService;
    fLayout : iMainLayout;
  public
    { Public declarations }
    class function New(const NavManager: iNavigationManagerService; Layout: iMainLayout; LayoutAdd: TLayout) : TMenu1;
  end;

var
  Menu1: TMenu1;

implementation

{$R *.fmx}

{ TMenu1 }

procedure TMenu1.Button1Click(Sender: TObject);
begin
  fNavigationManager.GoToAbout(fLayout);
end;

procedure TMenu1.Button2Click(Sender: TObject);
begin
  fNavigationManager.GoToTasks(fLayout);
end;

class function TMenu1.New(const NavManager: iNavigationManagerService; Layout: iMainLayout; LayoutAdd: TLayout): TMenu1;
begin
  Result := Self.Create(LayoutAdd);
  Result.fNavigationManager := NavManager;
  Result.fLayout := layout;
  LayoutAdd.AddObject(Result.Layout1);
end;

end.
