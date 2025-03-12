unit eTasks.Components.Interfaces;

interface

uses
  FMX.Objects,
  FMX.Layouts,
  FMX.MultiView,
  eTasks.Components.TranslationEnums, System.Generics.Collections,
  eTasks.Components.MenuEnums;

type
  TButtonAppBar = (ThemeBtn, MenuBtn, AvatarBtn);
  TOffcanvasKind = (ockMenu, ockFilter, ockLanguage);
  TOffcanvasDirection = (ocdLeft, ocdRight);
  TNavBarButtons = (NavBarEditButtons, NavBarUpdateButton, NavBarHelpButton);

  TEventoClick = procedure(sender: TObject) of object;
  TEventoMainMenuClick = procedure(const button: TMainMenuItems) of object;
  TEventoAvatarMenuClick = procedure(const button: TAvatarMenuItems) of object;

  iTitleBar = interface
    ['{CCA6D914-787E-495F-ADE7-F9472A0FBC45}']
    function SetTitle(const Title: string): iTitleBar;
    function Resize(const FormWidth: Integer): iTitleBar;
    function isDarkMode(const value: boolean): iTitleBar;
  end;

  iAppBar = interface
    ['{D3781F3B-96FF-4017-9F8E-5472178C9ABB}']
    function SetTitle(const Title: string): iAppBar;
    function ShowTitleBar(const value: Boolean): TRectangle;
    function isDarkMode(const value: boolean): iAppBar;
    function SetButtonAppBarAction(const ButtonAppBar: TButtonAppBar; const Action: TEventoClick): iAppBar;
  end;

  iNavBar = interface
    ['{025C4B42-971C-4DF5-AF6A-0C51B61C3EA5}']
    function SetTitle(const Title: string): iNavBar;
    function Resize(const FormWidth: Integer): iNavBar;
    function isDarkMode(const value: boolean): iNavBar;
    function ShowButtons(const value: TNavBarButtons): iNavBar;
    function OnBtnUpdateClick(const Event: TEventoClick): iNavBar;
    function OnBtnHelpClick(const Event: TEventoClick): iNavBar;
    function OnBtnDeleteClick(const Event: TEventoClick): iNavBar;
    function OnBtnAcceptClick(const Event: TEventoClick): iNavBar;
    function OnBtnBackClick(const Event: TEventoClick): iNavBar;
  end;

  iOffcanvas = interface
    ['{FDA880CB-27E0-44F8-9078-EFB33A81C576}']
    function isDarkMode(const value: boolean): iOffcanvas;
    function OpenMenu: iOffcanvas;
  end;

  iAvatarMenu = interface
    ['{35AE5D5E-4B7C-4083-A0D9-17C8341A5410}']
    function isDarkMode(const value: boolean): iAvatarMenu;
    function OpenMenu: iAvatarMenu;
    function ChangeLanguage(const Translations: TDictionary<TAvatarMenuTexts, string> = nil): iAvatarMenu;
    function OnAvatarMenuItemClick(const Event: TEventoAvatarMenuClick): iAvatarMenu;
  end;

  iFilterMenu = interface
    ['{1108CC14-4E1B-4828-A1C0-B1AAC08CB499}']
  end;

  iMainMenu = interface(iOffCanvas)
    ['{17026E4B-4B32-48B0-A55F-674D315BF540}']
    function ChangeLanguage(const Translations: TDictionary<TMainMenuTexts, string> = nil): iMainMenu;
    function OnMainMenuItemClick(const Event: TEventoMainMenuClick): iMainMenu;
    function Selected(const SelectedMenu: TMainMenuItems) : iMainMenu;
  end;

  iLanguageMenu = interface
    ['{CD663DA8-C7F0-43E9-9382-3D1926C10042}']
  end;

  iActionButton = interface
    ['{58E61ADA-76CE-4E16-9356-9C8EF7E367B1}']
    function isDarkMode(const value: boolean): iActionButton;
    function SetHint(const value: string): iActionButton;
    function OnClick(const Event: TEventoClick): iActionButton;
    function IsVisible(const Value: Boolean = true): iActionButton;
  end;

implementation


end.
