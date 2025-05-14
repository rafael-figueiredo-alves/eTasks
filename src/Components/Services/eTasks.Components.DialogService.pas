unit eTasks.Components.DialogService;

interface

uses
  eTasks.Components.IDialogService,
  eTasks.Components.Interfaces,
  System.SysUtils, eTasks.Components.DialogOptions;

type

  TDialogService = class(TInterfacedObject, iDialogService)
    private
      fOnShow : TOnShow;
      fOnHide : TOnHide;

      function ShowDialog(const Options: tDialogOptions) : iDialogService;
    public
      function OnShow(const OnShowMethod: TOnShow) : iDialogService;
      function OnHide(const OnHideMethod: TOnHide) : iDialogService;

      function ConfirmDelete(const Title: string; const Msg: string; OnConfirm: tEventoClick = nil; OnCancel: tEventoClick = nil) : iDialogService;
      function Confirm(const Title: string; const Msg: string; OnConfirm: tEventoClick = nil; OnCancel: tEventoClick = nil) : iDialogService;
      function ShowInfo(const Title: string; const Msg: string; OnConfirm: tEventoClick = nil) : iDialogService;
      function Warn(const Title: string; const Msg: string; OnConfirm: tEventoClick = nil) : iDialogService;
      function ShowError(const Title: string; const Msg: string; StackTrace: string = ''; OnConfirm: tEventoClick = nil) : iDialogService; overload;
      function ShowError(const Title: string; const Msg: Exception; OnConfirm: tEventoClick = nil) : iDialogService; overload;

      function Hide : iDialogService;

      Destructor Destroy; override;
      Constructor Create;
      class function New : iDialogService;
  end;

 function InitDialogService: iDialogService;

var DialogService: iDialogService;

implementation

uses
  eTasks.Components.DialogType;

{ TDialogService }

function InitDialogService: iDialogService;
begin
  if(not Assigned(DialogService))then
   DialogService := TDialogService.New;

  Result := DialogService;
end;

{$Region 'Métodos de Associação e de Esconder diálogos'}
function TDialogService.Hide: iDialogService;
begin
  if(Assigned(fOnHide))then
    fOnHide;
end;

class function TDialogService.New: iDialogService;
begin
  Result := self.Create;
end;

function TDialogService.OnHide(const OnHideMethod: TOnHide): iDialogService;
begin
  Result  := Self;
  fOnHide := OnHideMethod;
end;

function TDialogService.OnShow(const OnShowMethod: TOnShow): iDialogService;
begin
  Result  := Self;
  fOnShow := OnShowMethod;
end;
{$endregion}

{$Region 'Método privado'}
function TDialogService.ShowDialog(const Options: tDialogOptions): iDialogService;
begin
  Result := Self;
  if(Assigned(fOnShow))then
    fOnShow(Options);
end;
{$endregion}

{$Region 'Métodos para evocar a caixa de diálogo correspondente'}
function TDialogService.ConfirmDelete(const Title, Msg: string; OnConfirm,
  OnCancel: tEventoClick): iDialogService;
begin
  Result := ShowDialog(TDialogOptions.create(Title.ToUpper, Msg, TDialogType.ConfirmDelete, OnConfirm, OnCancel));
end;

constructor TDialogService.Create;
begin

end;

destructor TDialogService.Destroy;
begin

  inherited;
end;

function TDialogService.Confirm(const Title, Msg: string; OnConfirm,
  OnCancel: tEventoClick): iDialogService;
begin
  Result := ShowDialog(TDialogOptions.create(Title.ToUpper, Msg, TDialogType.Confirm, OnConfirm, OnCancel));
end;

function TDialogService.ShowError(const Title, Msg: string; StackTrace: string;
  OnConfirm: tEventoClick): iDialogService;
begin
  Result := ShowDialog(TDialogOptions.create(Title.ToUpper, Msg, TDialogType.Error, OnConfirm, nil, StackTrace));
end;

function TDialogService.ShowError(const Title: string; const Msg: Exception;
  OnConfirm: tEventoClick): iDialogService;
begin
  Result := ShowDialog(TDialogOptions.create(Title.ToUpper, Msg.Message, TDialogType.Warning, OnConfirm, nil, Msg.StackTrace));
end;

function TDialogService.ShowInfo(const Title, Msg: string;
  OnConfirm: tEventoClick): iDialogService;
begin
  Result := ShowDialog(TDialogOptions.create(Title.ToUpper, Msg, TDialogType.Information, OnConfirm));
end;

function TDialogService.Warn(const Title, Msg: string;
  OnConfirm: tEventoClick): iDialogService;
begin
  Result := ShowDialog(TDialogOptions.create(Title.ToUpper, Msg, TDialogType.Warning, OnConfirm));
end;
{$endregion}

end.
