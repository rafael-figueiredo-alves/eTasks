unit eTasks.Components.Builder;

interface

uses
  eTasks.Components.Interfaces,
  FMX.Forms,
  FMX.Layouts,
  System.Generics.Collections,
  eTasks.Components.TranslationEnums;

type

  TBars = class
    class function AppBar(const Form: TForm; const Layout: TLayout) : iAppBar;
    class function TitleBar(const Form: TForm; const Layout: TLayout) : iTitleBar;
    class function NavBar(const Layout: TLayout) : iNavBar;
  end;

  TMenus = class
    class function MainMenu(const Form: TForm; isDarkMode: Boolean = false; Translations: TDictionary<TMainMenuTexts, string> = nil): iMainMenu;
    class function FilterMenu(const Form: TForm; isDarkMode: Boolean = false): iOffcanvas;
    class function LanguageMenu(const Form: TForm; isDarkMode: Boolean = false; Translations: TDictionary<TLanguageMenuTexts, string> = nil) : iLanguageMenu;
    class function AvatarMenu(const Form: TForm; isDarkMode: Boolean = false; Translations: TDictionary<TAvatarMenuTexts, string> = nil) : iAvatarMenu;
  end;

  TButtons = class
    class function ActionButton(const Form: TForm) : iActionButton;
  end;

  TToast = class
    class procedure ToastMessage(const Form: TForm);
  end;

  TModalDlg = class
    class procedure ModalDialogs(const Form: TForm);
  end;

implementation

uses
  eTasks.Components.AppBar,
  eTasks.Components.TitleBar,
  eTasks.Components.AvatarMenu,
  eTasks.Components.ActionButton,
  eTasks.Components.NavBar,
  eTasks.Components.MainMenu,
  eTasks.Components.LanguageMenu,
  eTasks.Components.FilterMenu, eTasks.Components.ToastMessage,
  eTasks.Components.ModalDialog;

{ TComponentBars }

class function TBars.AppBar(const Form: TForm; const Layout: TLayout): iAppBar;
begin
  Result := tAppBar.New(Form, Layout);
end;

class function TBars.NavBar(const Layout: TLayout): iNavBar;
begin
  Result := tNavBar.New(Layout);
end;

class function TBars.TitleBar(const Form: TForm; const Layout: TLayout): iTitleBar;
begin
  Result := tTitleBar.New(Form, Layout);
end;

{ TComponentOffcanvas }

class function TMenus.AvatarMenu(const Form: TForm; isDarkMode: Boolean; Translations: TDictionary<TAvatarMenuTexts, string>): iAvatarMenu;
begin
  Result := tAvatarMenu.New(Form, isDarkMode, Translations);
end;

class function TMenus.FilterMenu(const Form: TForm; isDarkMode: Boolean): iOffcanvas;
begin
  Result := TFilterMenu.New(Form, isDarkMode);
end;

class function TMenus.LanguageMenu(const Form: TForm; isDarkMode: Boolean; Translations: TDictionary<TLanguageMenuTexts, string>): iLanguageMenu;
begin
  Result := TLanguageMenu.new(Form, isDarkMode, Translations);
end;

class function TMenus.MainMenu(const Form: TForm; isDarkMode: Boolean; Translations: TDictionary<TMainMenuTexts, string>): iMainMenu;
begin
  Result := TMainMenu.New(Form, isDarkMode, Translations);
end;

{ TComponentButtons }

class function TButtons.ActionButton(const Form: TForm): iActionButton;
begin
  Result := TActionButton.New(Form);
end;

{ TToast }

class procedure TToast.ToastMessage(const Form: TForm);
begin
  TToastMessage.New(Form);
end;

{ TModalDlg }

class procedure TModalDlg.ModalDialogs(const Form: TForm);
begin
  TModalDialog.New(Form);
end;

end.
