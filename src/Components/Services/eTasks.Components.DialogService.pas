unit eTasks.Components.DialogService;

interface

uses
  eTasks.Components.IDialogService,
  eTasks.Components.Interfaces,
  System.SysUtils, eTasks.Components.DialogOptions,
  eTasks.Components.TranslationEnums,
  System.Generics.Collections;

type

  TDialogService = class(TInterfacedObject, iDialogService)
    private
      fOnShow     : TOnShow;
      fOnHide     : TOnHide;
      fOnChangeLanguage : TOnTranslationChange;
      fOnDarkMode : TOnDarkMode;
      fDarkMode   : Boolean;

      function ShowDialog(const Options: tDialogOptions) : iDialogService;
    public
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

{$Region 'M�todos de Associa��o e de Esconder di�logos'}
function TDialogService.Hide: iDialogService;
begin
  if(Assigned(fOnHide))then
    fOnHide;
end;

function TDialogService.isDark: boolean;
begin
  Result := fDarkMode;
end;

function TDialogService.isDarkMode(const value: Boolean): iDialogService;
begin
  if(Assigned(fOnDarkMode))then
   fOnDarkMode(value);

  fDarkMode := value;

  Result := Self;
end;

class function TDialogService.New: iDialogService;
begin
  Result := self.Create;
end;

function TDialogService.OnChangeLanguage(const onChange: TOnTranslationChange): iDialogService;
begin
  Result := Self;
  fOnChangeLanguage := onChange;
end;

function TDialogService.OnDarkMode(const OnDarkModeMethod: TOnDarkMode): iDialogService;
begin
  Result := Self;
  fOnDarkMode := OnDarkModeMethod;
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

{$Region 'M�todo privado'}
function TDialogService.ShowDialog(const Options: tDialogOptions): iDialogService;
begin
  Result := Self;
  if(Assigned(fOnShow))then
    fOnShow(Options);

  Options.Free;
end;
{$endregion}

{$Region 'M�todos para evocar a caixa de di�logo correspondente'}
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

function TDialogService.ChangeLanguage(const Texts: TDictionary<TDialogTexts, string>): iDialogService;
begin
  Result := Self;
  if(Assigned(Texts))then
   if(Assigned(fOnChangeLanguage))then
    fOnChangeLanguage(Texts);
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
  Result := ShowDialog(TDialogOptions.create(Title.ToUpper, Msg.Message, TDialogType.Error, OnConfirm, nil, Msg.StackTrace));
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
