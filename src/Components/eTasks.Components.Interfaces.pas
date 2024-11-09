unit eTasks.Components.Interfaces;

interface

uses
  FMX.Objects,
  FMX.Layouts,
  FMX.MultiView;

type
  TButtonAppBar = (ThemeBtn, MenuBtn, AvatarBtn);
  TOffcanvasKind = (ockMenu, ockFilter, ockLanguage);
  TOffcanvasDirection = (ocdLeft, ocdRight);

  TEventoClick = procedure(sender: TObject) of object;

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

  iOffcanvas = interface
    ['{FDA880CB-27E0-44F8-9078-EFB33A81C576}']
    function isDarkMode(const value: boolean): iOffcanvas;
    function OpenMenu: iOffcanvas;
  end;

  iAvatarMenu = interface
    ['{35AE5D5E-4B7C-4083-A0D9-17C8341A5410}']
    function isDarkMode(const value: boolean): iAvatarMenu;
    function OpenMenu: iAvatarMenu;
  end;

  iFilterMenu = interface
    ['{1108CC14-4E1B-4828-A1C0-B1AAC08CB499}']
  end;

  iMainMenu = interface
    ['{17026E4B-4B32-48B0-A55F-674D315BF540}']
  end;

  iLanguageMenu = interface
    ['{CD663DA8-C7F0-43E9-9382-3D1926C10042}']
  end;

  iActionButton = interface
    ['{58E61ADA-76CE-4E16-9356-9C8EF7E367B1}']
    function isDarkMode(const value: boolean): iActionButton;
    function SetHint(const value: string): iActionButton;
    function OnClick(const Event: TEventoClick): iActionButton;
  end;

implementation


end.
