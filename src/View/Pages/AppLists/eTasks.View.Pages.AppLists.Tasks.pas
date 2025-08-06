unit eTasks.View.Pages.AppLists.Tasks;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.AppListBase, FMX.Layouts, FMX.Controls.Presentation,
  eTasks.View.FormModels;

type
  TAppListTasks = class(TAppListBase)
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    class function New(const Value: TLayout) : TAppListBase;
    function isDarkMode(const Value: Boolean) : iAppList; reintroduce;
    function TranslateUI : iAppList; reintroduce;
  end;

var
  AppListTasks: TAppListTasks;

implementation

uses
  eTasks.Components.ColorPallete, eTasks.View.ThemeService;

{$R *.fmx}

procedure TAppListTasks.Button1Click(Sender: TObject);
begin
  inherited;
  NavManagerService.GoToTasks(MainLayout);
end;

function TAppListTasks.isDarkMode(const Value: Boolean): iAppList;
begin
  inherited;
  Result := self;
  self.Label1.FontColor := tColorPallete.GetColor(Primary, value);
end;

class function TAppListTasks.New(const Value: TLayout): TAppListBase;
begin
  Result := TAppListTasks.Create(Value);
  Result.isDarkMode(ThemeService.isDarkTheme);
end;

function TAppListTasks.TranslateUI: iAppList;
begin
  inherited;
end;

end.
