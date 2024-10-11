unit eTasks.Components.Builder;

interface

uses
  eTasks.Components.Interfaces,
  FMX.Forms, FMX.Layouts;

type

  TComponentBars = class
    class function AppBar(const Form: TForm; const Layout: TLayout) : iAppBar;
    class function TitleBar(const Form: TForm; const Layout: TLayout) : iTitleBar;
  end;

  TComponentOffcanvas = class
    class function MainMenu(const Form: TForm; Direction: TOffcanvasDirection = ocdRight; isDarkMode: Boolean = false): iOffcanvas;
  end;

implementation

uses
  eTasks.Components.AppBar, eTasks.Components.TitleBar,
  eTasks.Components.Offcanvas;

{ TComponentBars }

class function TComponentBars.AppBar(const Form: TForm; const Layout: TLayout): iAppBar;
begin
  Result := tAppBar.New(Form, Layout);
end;

class function TComponentBars.TitleBar(const Form: TForm; const Layout: TLayout): iTitleBar;
begin
  Result := tTitleBar.New(Form, Layout);
end;

{ TComponentOffcanvas }

class function TComponentOffcanvas.MainMenu(const Form: TForm; Direction: TOffcanvasDirection; isDarkMode: Boolean): iOffcanvas;
begin
  Result := TOffcanvas.New(Form, Direction, isDarkMode);
end;

end.
