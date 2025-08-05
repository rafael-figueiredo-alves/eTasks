unit eTasks.View.AppListBase;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  eTasks.View.Services.Interfaces, eTasks.View.Layouts.Interfaces,
  eTasks.View.FormModels;

type
  TAppListBase = class(TForm, iAppList)
    ContainerLista: TLayout;
  private
    { Private declarations }
  public
    { Public declarations }
    NavManagerService : iNavigationManagerService;
    MainLayout        : iMainLayout;

    function SetMainLayout(const Value: iMainLayout): iAppList;
    function SetNavManagerService(const Value: iNavigationManagerService): iAppList;
    function ReturnLayout: TLayout;
    function isDarkMode(const Value: boolean) : iAppList;
    function TranslateUI : iAppList;
  end;

var
  AppListBase: TAppListBase;

implementation

{$R *.fmx}

{ TAppListBase }

function TAppListBase.isDarkMode(const Value: boolean) : iAppList;
begin

end;

function TAppListBase.ReturnLayout: TLayout;
begin
  Result := Self.ContainerLista;
end;

function TAppListBase.SetMainLayout(const Value: iMainLayout): iAppList;
begin
  Result := Self;
  MainLayout := Value;
end;

function TAppListBase.SetNavManagerService(
  const Value: iNavigationManagerService): iAppList;
begin
  Result := self;
  NavManagerService := Value;
end;

function TAppListBase.TranslateUI : iAppList;
begin

end;

end.
