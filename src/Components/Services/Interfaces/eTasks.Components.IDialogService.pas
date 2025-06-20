unit eTasks.Components.IDialogService;

interface

uses
  eTasks.Components.DialogOptions,
  eTasks.Components.Interfaces,
  eTasks.Components.TranslationEnums,
  System.SysUtils,
  System.Generics.Collections;

type

  TOnShow = procedure(const Opcoes: TDialogOptions) of object;
  TOnHide = procedure of object;
  TOnDarkMode = procedure(const isDark: Boolean) of object;
  TOnTranslationChange = procedure (const Texts: TDictionary<TDialogTexts, string>) of object;

  iDialogService = interface
    ['{BDC7A0BF-3FEA-402D-8A3D-EEABC4DAC4F8}']
    function OnShow(const OnShowMethod: TOnShow) : iDialogService;
    function OnHide(const OnHideMethod: TOnHide) : iDialogService;
    function OnChangeLanguage(const onChange: TOnTranslationChange) : iDialogService;
    function OnDarkMode(const OnDarkModeMethod: TOnDarkMode) : iDialogService;

    function ConfirmDelete(const Title: string; const Msg: string; OnConfirm: tEventoClick = nil; OnCancel: tEventoClick = nil) : iDialogService;
    function Confirm(const Title: string; const Msg: string; OnConfirm: tEventoClick = nil; OnCancel: tEventoClick = nil) : iDialogService;
    function ShowInfo(const Title: string; const Msg: string; OnConfirm: tEventoClick = nil) : iDialogService;
    function Warn(const Title: string; const Msg: string; OnConfirm: tEventoClick = nil) : iDialogService;
    function ShowError(const Title: string; const Msg: string; StackTrace: string = ''; OnConfirm: tEventoClick = nil) : iDialogService; overload;
    function ShowError(const Title: string; const Msg: Exception; OnConfirm: tEventoClick = nil) : iDialogService; overload;

    function isDarkMode(const value: Boolean): iDialogService;
    function ChangeLanguage(const Texts: TDictionary<TDialogTexts, string>) : iDialogService;

    function isDark: boolean;

    function Hide : iDialogService;
  end;

implementation

end.
