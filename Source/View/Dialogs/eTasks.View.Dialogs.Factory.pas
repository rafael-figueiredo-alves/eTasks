unit eTasks.View.Dialogs.Factory;

interface

Uses
  eTasks.View.Dialogs.Messages,
  eTasks.View.Dialogs.Termos,
  eTasks.View.Dialogs.SheetFotos,
  eTasks.View.Dialogs.loading,
  eTasks.View.Dialogs.dialogYesNo,
  eTasks.View.Dialogs.Calendar;

Type

  iViewDialogsFactory = interface
    ['{AF530F91-6F18-4672-AD8C-60222CA30C4B}']
    Function DialogMessages : TDlg_Login_messages;
    Function DialogTermos   : TDlg_Termos;
    Function SheetFotos     : TSheet_fotos;
    Function Loading        : TForm_Loading;
    Function DialogYesNo    : TDialogYesNo;
    Function Calendar       : TDlg_Calendar;
    Function Pai (Value : TObject) : iViewDialogsFactory;
  end;

  TViewDialogsMessages = Class(TInterfacedObject, iViewDialogsFactory)
    Private
     FSheetFotos      : TSheet_fotos;
     FDialogMessages  : TDlg_Login_messages;
     FDialogTermos    : TDlg_Termos;
     FLoading         : TForm_loading;
     FDialogYesNo     : TDialogYesNo;
     FCalendar        : TDlg_Calendar;
     FPai             : tobject;
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iViewDialogsFactory;
     Function DialogMessages : TDlg_Login_messages;
     Function DialogTermos   : TDlg_Termos;
     Function SheetFotos     : TSheet_fotos;
     Function Loading        : TForm_Loading;
     Function DialogYesNo    : TDialogYesNo;
     Function Calendar       : TDlg_Calendar;
     Function Pai (Value : Tobject) : iViewDialogsFactory;
  End;

implementation

uses
  FMX.Forms, FMX.Types;

{ TViewDialogsMessages }

function TViewDialogsMessages.Calendar: TDlg_Calendar;
begin
  if not assigned(FCalendar) then
  {$ifdef Android}
    FCalendar := TDlg_Calendar.Create(nil);
  {$endif}
  {$ifdef MSWindows}
    FCalendar := TDlg_Calendar.Create(nil);
    FCalendar.Parent := TFmxObject(FPai);
  {$Endif}
  Result := FCalendar;
end;

constructor TViewDialogsMessages.Create;
begin

end;

destructor TViewDialogsMessages.Destroy;
begin

  inherited;
end;

function TViewDialogsMessages.DialogMessages: TDlg_Login_messages;
begin
  if not assigned(FDialogMessages) then
  {$ifdef Android}
    FDialogMessages := TDlg_Login_messages.Create(nil);
  {$endif}
  {$ifdef MSWindows}
    FDialogMessages := TDlg_Login_messages.Create(nil);
    FDialogMessages.Parent := TFmxObject(FPai);
  {$Endif}
  Result := FDialogMessages;
end;

function TViewDialogsMessages.DialogTermos: TDlg_Termos;
begin
  if not Assigned(FDialogTermos) then
  {$ifdef Android}
   FDialogTermos := TDlg_Termos.Create(nil);
  {$endif}
  {$ifdef MSWindows}
   FDialogTermos := TDlg_Termos.Create(nil);
   FDialogTermos.Parent := TFmxObject(FPai);
  {$endif}
  Result := FDialogTermos;
end;

function TViewDialogsMessages.DialogYesNo: TDialogYesNo;
begin
  if not Assigned(FDialogYesNo) then
  {$ifdef Android}
   FDialogYesNo := TDialogYesNo.Create(nil);
  {$endif}
  {$ifdef MSWindows}
   FDialogYesNo := TDialogYesNo.Create(nil);
   FDialogYesNo.Parent := TFmxObject(FPai);
  {$endif}
  Result := FDialogYesNo;
end;

function TViewDialogsMessages.Loading: TForm_Loading;
begin
  if not Assigned(FLoading) then
   FLoading := TForm_loading.Create(nil);
  Result := FLoading;
end;

class function TViewDialogsMessages.New: iViewDialogsFactory;
begin
  Result := Self.Create;
end;

function TViewDialogsMessages.Pai(Value: Tobject): iViewDialogsFactory;
begin
   Result := self;
   FPai := value;
end;

function TViewDialogsMessages.SheetFotos: TSheet_fotos;
begin
  if not Assigned(FSheetFotos) then
  {$ifdef Android}
   FSheetFotos := TSheet_fotos.Create(nil);
  {$endif}
  {$ifdef MSWindows}
   FSheetFotos := TSheet_fotos.Create(nil);
   FSheetFotos.Parent := TFmxObject(FPai);
  {$endif}
  Result := FSheetFotos;
end;

end.
