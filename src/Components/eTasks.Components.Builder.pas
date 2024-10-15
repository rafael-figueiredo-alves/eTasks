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
    class function MainMenu(const Form: TForm; isDarkMode: Boolean = false; isFiltersMenu: boolean = false; Direction: TOffcanvasDirection = ocdRight): iOffcanvas;
    class function FilterMenu(const Form: TForm; isDarkMode: Boolean = false; isFiltersMenu: boolean = true; Direction: TOffcanvasDirection = ocdRight): iOffcanvas;
    class function LanguageMenu(const Form: TForm; isDarkMode: Boolean = false; isFiltersMenu: boolean = false; Direction: TOffcanvasDirection = ocdLeft) : iOffcanvas;
    class function AvatarMenu(const Form: TForm; isDarkMode: Boolean = false; Direction: TOffcanvasDirection = ocdRight) : iAvatarMenu;
  end;

implementation

uses
  eTasks.Components.AppBar, eTasks.Components.TitleBar,
  eTasks.Components.Offcanvas, eTasks.Components.AvatarMenu;

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

class function TComponentOffcanvas.AvatarMenu(const Form: TForm; isDarkMode: Boolean; Direction: TOffcanvasDirection): iAvatarMenu;
begin
  Result := tAvatarMenu.New(Form, Direction, isDarkMode);
end;

class function TComponentOffcanvas.FilterMenu(const Form: TForm; isDarkMode: Boolean; isFiltersMenu: boolean; Direction: TOffcanvasDirection): iOffcanvas;
begin
  Result := TOffcanvas.New(Form, isFiltersMenu, Direction, isDarkMode);
end;

class function TComponentOffcanvas.LanguageMenu(const Form: TForm; isDarkMode: Boolean; isFiltersMenu: boolean; Direction: TOffcanvasDirection): iOffcanvas;
begin
  Result := TOffcanvas.New(Form, isFiltersMenu, Direction, isDarkMode);
end;

class function TComponentOffcanvas.MainMenu(const Form: TForm; isDarkMode: Boolean; isFiltersMenu: boolean; Direction: TOffcanvasDirection): iOffcanvas;
begin
  Result := TOffcanvas.New(Form, isFiltersMenu, Direction, isDarkMode);
end;

end.
