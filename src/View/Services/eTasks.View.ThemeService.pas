unit eTasks.View.ThemeService;

interface

uses
  eTasks.View.Services.Interfaces,
  System.Generics.Collections;

type

 TThemeService = class(TInterfacedObject, iThemeService)
   private
    ListInterfaces : TList<IInterface>;
    fDarkTheme     : Boolean;
   public
    function SubscribeInterface(const interfaces: array of IInterface): iThemeService;
    function ChangeTheme: iThemeService;
    function isDarkTheme: Boolean;
    function SetDarkTheme(const value: Boolean): iThemeService;
    function ApplyTheme: iThemeService;

    Destructor Destroy; override;
    Constructor Create;
    class function New: iThemeService;
 end;

var ThemeService: iThemeService;

implementation

{ TThemeService }

uses eTasks.Shared.Utils;



function TThemeService.ApplyTheme: iThemeService;
begin
   TUtils.ExecuteMethodWithParams(ListInterfaces, 'isDarkMode', [fDarkTheme]);
   Result := Self;
end;

function TThemeService.ChangeTheme: iThemeService;
begin
  fDarkTheme := not fDarkTheme;
  ApplyTheme;

  Result := Self;
end;

constructor TThemeService.Create;
begin
  ListInterfaces := TList<IInterface>.Create;
  fDarkTheme     := False;
end;

destructor TThemeService.Destroy;
begin
  if(Assigned(ListInterfaces))then
   ListInterfaces.Free;
  inherited;
end;

function TThemeService.isDarkTheme: Boolean;
begin
  Result := fDarkTheme;
end;

class function TThemeService.New: iThemeService;
begin
  Result := Self.Create;
end;

function TThemeService.SetDarkTheme(const value: Boolean): iThemeService;
begin
  fDarkTheme := value;
  Result := Self;
end;

function TThemeService.SubscribeInterface(const interfaces: array of IInterface): iThemeService;
var
 fInterface : IInterface;
begin
  for fInterface in interfaces do
   ListInterfaces.Add(fInterface);

  Result := Self;
end;

initialization

begin
  if(not Assigned(ThemeService))then
   ThemeService := TThemeService.New;
end;

end.
