unit eTasks.View.Dialogs.Factory;

interface

Uses eTasks.View.Dialogs.Messages, eTasks.View.Dialogs.Termos, eTasks.View.Dialogs.SheetFotos;

Type

  iViewDialogsFactory = interface
    ['{AF530F91-6F18-4672-AD8C-60222CA30C4B}']
    Function DialogMessages : TDlg_Login_messages;
    Function DialogTermos   : TDlg_Termos;
    Function SheetFotos     : TSheet_fotos;
  end;

  TViewDialogsMessages = Class(TInterfacedObject, iViewDialogsFactory)
    Private
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iViewDialogsFactory;
     Function DialogMessages : TDlg_Login_messages;
     Function DialogTermos   : TDlg_Termos;
     Function SheetFotos     : TSheet_fotos;
  End;

implementation

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
  Result := TDlg_Login_messages.Create(nil);
end;

function TViewDialogsMessages.DialogTermos: TDlg_Termos;
begin
  Result := TDlg_Termos.Create(nil);
end;

class function TViewDialogsMessages.New: iViewDialogsFactory;
begin
  Result := Self.Create;
end;

function TViewDialogsMessages.SheetFotos: TSheet_fotos;
begin
  Result := TSheet_fotos.Create(nil);
end;

end.
