unit eTasks.View.Windows.telas;

interface

uses
  eTasks.View.Windows.help, eTasks.View.Windows.tasks,
  eTasks.View.Windows.categories;

Type
 iWindowsTelas = interface
   ['{41C2DA36-AF0F-4945-9E57-43B5D7B0E9E4}']
   Function Tela_Ajuda : TForm_Windows_Ajuda;
   Function Tela_Tasks : TWindows_tasks;
   Function Tela_Categories : TWindows_Categories;
 end;


  TWindowsTelas = Class(TInterfacedObject, iWindowsTelas)
    Private
     FTelaAjuda   : TForm_Windows_Ajuda;
     FTelaTarefas : tWindows_Tasks;
     FTelaCategories : tWindows_Categories;
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iWindowsTelas;
     Function Tela_Ajuda : TForm_Windows_Ajuda;
     Function Tela_Tasks : TWindows_tasks;
     Function Tela_Categories : TWindows_Categories;
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
  if Assigned(FTelaTarefas) then
   FTelaTarefas.DisposeOf;
  if Assigned(FTelaCategories) then
   FTelaCategories.DisposeOf;
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

function TWindowsTelas.Tela_Categories: TWindows_Categories;
begin
  if not Assigned(FTelaCategories) then
   FTelaCategories := TWindows_Categories.Create(nil);
  Result := FTelaCategories;
end;

function TWindowsTelas.Tela_Tasks: TWindows_tasks;
begin
  if not Assigned(FTelaTarefas) then
   FTelaTarefas := TWindows_Tasks.Create(nil);
  Result := FTelaTarefas;
end;

end.
