unit eTasks.View.Dialogs.Factory;

interface

Uses eTasks.View.Dialogs.Messages, eTasks.View.Dialogs.Termos, eTasks.View.Dialogs.SheetFotos;

Type

  iViewDialogsFactory = interface
    ['{AF530F91-6F18-4672-AD8C-60222CA30C4B}']
    Function DialogMessages : TDlg_Login_messages;
    Function DialogTermos   : TDlg_Termos;
    Function SheetFotos     : TSheet_fotos;
    Function Pai (Value : TObject) : iViewDialogsFactory;
  end;

  TViewDialogsMessages = Class(TInterfacedObject, iViewDialogsFactory)
    Private
     FSheetFotos : TSheet_fotos;
     FDialogMessages : TDlg_Login_messages;
     FDialogTermos : TDlg_Termos;
     FPai          : tobject;
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iViewDialogsFactory;
     Function DialogMessages : TDlg_Login_messages;
     Function DialogTermos   : TDlg_Termos;
     Function SheetFotos     : TSheet_fotos;
     Function Pai (Value : Tobject) : iViewDialogsFactory;
  End;

implementation

uses
  FMX.Forms, FMX.Types;

{ TViewDialogsMessages }

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
  if not assigned(FSheetFotos) then
   FSheetFotos := TSheet_fotos.Create(nil);
  Result := FSheetFotos;
end;

end.
