unit eTasks.View.Windows.telas;

interface

uses
  eTasks.View.Windows.help;

Type
 iWindowsTelas = interface
   ['{41C2DA36-AF0F-4945-9E57-43B5D7B0E9E4}']
   Function Tela_Ajuda : TForm_Windows_Ajuda;
 end;


  TWindowsTelas = Class(TInterfacedObject, iWindowsTelas)
    Private
     FTelaAjuda : TForm_Windows_Ajuda;
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iWindowsTelas;
     Function Tela_Ajuda : TForm_Windows_Ajuda;
  End;

implementation

{ TWindowsTelas }

constructor TWindowsTelas.Create;
begin

end;

destructor TWindowsTelas.Destroy;
begin
  if Assigned(FTelaAjuda) then
   FTelaAjuda.DisposeOf;
  inherited;
end;

class function TWindowsTelas.New: iWindowsTelas;
begin
  Result := Self.Create;
end;

function TWindowsTelas.Tela_Ajuda: TForm_Windows_Ajuda;
begin
  if not Assigned(FTelaAjuda) then
   FTelaAjuda := TForm_Windows_Ajuda.Create(nil);
  Result := FTelaAjuda;
end;

end.
