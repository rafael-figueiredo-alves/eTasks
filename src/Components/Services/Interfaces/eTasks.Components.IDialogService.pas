unit eTasks.Components.IDialogService;

interface

uses
  eTasks.Components.DialogOptions,
  eTasks.Components.Interfaces,
  System.SysUtils;

type

  TOnShow = procedure(const Opcoes: TDialogOptions) of object;
  TOnHide = procedure of object;

  iDialogService = interface
    ['{BDC7A0BF-3FEA-402D-8A3D-EEABC4DAC4F8}']
    function OnShow(const OnShowMethod: TOnShow) : iDialogService;
    function OnHide(const OnHideMethod: TOnHide) : iDialogService;

    function ConfirmDelete(const Title: string; const Msg: string; OnConfirm: tEventoClick = nil; OnCancel: tEventoClick = nil) : iDialogService;
    function Confirm(const Title: string; const Msg: string; OnConfirm: tEventoClick = nil; OnCancel: tEventoClick = nil) : iDialogService;
    function ShowInfo(const Title: string; const Msg: string; OnConfirm: tEventoClick = nil) : iDialogService;
    function Warn(const Title: string; const Msg: string; OnConfirm: tEventoClick = nil) : iDialogService;
    function ShowError(const Title: string; const Msg: string; StackTrace: string = ''; OnConfirm: tEventoClick = nil) : iDialogService; overload;
    function ShowError(const Title: string; const Msg: Exception; OnConfirm: tEventoClick = nil) : iDialogService; overload;

    function Hide : iDialogService;
  end;

implementation

end.
