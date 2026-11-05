unit eTasks.View.Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Layouts, eTasks.Components.Interfaces, FMX.Objects;

type
  TAluno = class
    Nome : string;
  end;

  TfLogin = class(TForm)
    Button1: TButton;
    Layout1: TLayout;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Aluno : TAluno;
  public
    { Public declarations }
  end;

var
  fLogin: TfLogin;

implementation

uses
  eTasks.View.Main,
  eTasks.Shared.ApplicationHelper, eTasks.Components.LabelledTextbox;

{$R *.fmx}

procedure TfLogin.Button1Click(Sender: TObject);
begin
  if(not Assigned(fMain))then
   Application.CreateForm(tfmain, fMain);
  fMain.Show;
  Application.MainForm := fMain;
  self.Visible := false;
//  Application.OpenMainForm(fLogin);
end;

procedure TfLogin.Button2Click(Sender: TObject);
begin
  ShowMessage(Aluno.Nome);
end;

procedure TfLogin.FormCreate(Sender: TObject);
begin
  Aluno := TAluno.Create;
  Aluno.Nome := 'Jailza';

  TlabelledTextBox.New(Layout1, 'Teste de edição', 'Digite seu texto',
                                function: string
                                begin
                                  Result := Aluno.Nome;
                                end,
                                procedure(Value: string)
                                begin
                                  Aluno.Nome := Value;
                                end);

  TlabelledTextBox.New(Layout1, 'Teste de edição 2', 'Digite seu texto',
                                function: string
                                begin
                                  Result := Aluno.Nome;
                                end,
                                procedure(Value: string)
                                begin
                                  Aluno.Nome := Value;
                                end);

  TlabelledTextBox.New(Layout1, 'Teste de edição 3', 'Digite seu texto',
                                function: string
                                begin
                                  Result := Aluno.Nome;
                                end,
                                procedure(Value: string)
                                begin
                                  Aluno.Nome := Value;
                                end);

  TlabelledTextBox.New(Layout1, 'Teste de edição 4', 'Digite seu texto',
                                function: string
                                begin
                                  Result := Aluno.Nome;
                                end,
                                procedure(Value: string)
                                begin
                                  Aluno.Nome := Value;
                                end);

  TlabelledTextBox.New(Layout1, 'Teste de edição 5', 'Digite seu texto',
                                function: string
                                begin
                                  Result := Aluno.Nome;
                                end,
                                procedure(Value: string)
                                begin
                                  Aluno.Nome := Value;
                                end);

  TlabelledTextBox.New(Layout1, 'Teste de edição 6', 'Digite seu texto',
                                function: string
                                begin
                                  Result := Aluno.Nome;
                                end,
                                procedure(Value: string)
                                begin
                                  Aluno.Nome := Value;
                                end);

  TlabelledTextBox.New(Layout1, 'Teste de edição 7', 'Digite seu texto',
                                function: string
                                begin
                                  Result := Aluno.Nome;
                                end,
                                procedure(Value: string)
                                begin
                                  Aluno.Nome := Value;
                                end);
end;

procedure TfLogin.FormDestroy(Sender: TObject);
begin
   FreeAndNil(Aluno);
end;

end.
