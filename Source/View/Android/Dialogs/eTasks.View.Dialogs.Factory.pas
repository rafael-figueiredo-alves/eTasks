unit eTasks.View.Dialogs.Factory;

interface

Uses eTasks.View.Dialogs.Messages;

Type

  iViewDialogsFactory = interface
    ['{AF530F91-6F18-4672-AD8C-60222CA30C4B}']
    Function DialogMessages : TDlg_Login_messages;
  end;

  TViewDialogsMessages = Class(TInterfacedObject, iViewDialogsFactory)
    Private
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iViewDialogsFactory;
     Function DialogMessages : TDlg_Login_messages;
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

class function TViewDialogsMessages.New: iViewDialogsFactory;
begin
  Result := Self.Create;
end;

end.
