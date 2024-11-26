unit eTasks.Components.Builder;

interface

uses
  eTasks.Components.Interfaces,
  FMX.Forms, FMX.Layouts;

type

  TComponentBars = class
    class function AppBar(const Form: TForm; const Layout: TLayout) : iAppBar;
    class function TitleBar(const Form: TForm; const Layout: TLayout) : iTitleBar;
    class function NavBar(const Form: TForm; const Layout: TLayout) : iNavBar;
  end;

  TComponentOffcanvas = class
    class function MainMenu(const Form: TForm; isDarkMode: Boolean = false; Direction: TOffcanvasDirection = ocdRight): iOffcanvas;
    class function FilterMenu(const Form: TForm; isDarkMode: Boolean = false; Direction: TOffcanvasDirection = ocdRight): iOffcanvas;
    class function LanguageMenu(const Form: TForm; isDarkMode: Boolean = false; Direction: TOffcanvasDirection = ocdLeft) : iOffcanvas;
    class function AvatarMenu(const Form: TForm; isDarkMode: Boolean = false; Direction: TOffcanvasDirection = ocdRight) : iAvatarMenu;
  end;

  TComponentButtons = class
    class function ActionButton(const Form: TForm) : iActionButton;
  end;

implementation

uses
  eTasks.Components.AppBar, eTasks.Components.TitleBar,
  eTasks.Components.Offcanvas, eTasks.Components.AvatarMenu,
  eTasks.Components.ActionButton, eTasks.Components.NavBar;

{ TComponentBars }

class function TComponentBars.AppBar(const Form: TForm; const Layout: TLayout): iAppBar;
begin
  Result := tAppBar.New(Form, Layout);
end;

class function TComponentBars.NavBar(const Form: TForm;
  const Layout: TLayout): iNavBar;
begin
  Result := tNavBar.New(Form, Layout);
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

class function TComponentOffcanvas.FilterMenu(const Form: TForm; isDarkMode: Boolean; Direction: TOffcanvasDirection): iOffcanvas;
begin
  Result := TOffcanvas.New(Form, ockFilter, Direction, isDarkMode);
end;

class function TComponentOffcanvas.LanguageMenu(const Form: TForm; isDarkMode: Boolean; Direction: TOffcanvasDirection): iOffcanvas;
begin
  Result := TOffcanvas.New(Form, ockLanguage, Direction, isDarkMode);
end;

class function TComponentOffcanvas.MainMenu(const Form: TForm; isDarkMode: Boolean; Direction: TOffcanvasDirection): iOffcanvas;
begin
  Result := TOffcanvas.New(Form, ockMenu, Direction, isDarkMode);
end;

{ TComponentButtons }

class function TComponentButtons.ActionButton(const Form: TForm): iActionButton;
begin
  Result := TActionButton.New(Form);
end;

end.
