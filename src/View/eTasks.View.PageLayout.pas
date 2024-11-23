unit eTasks.View.PageLayout;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  iPageLayout = interface
    ['{E22EAB87-8030-43F8-B0DC-AB57B067C0CD}']
    function _Layout: TLayout;
  end;

  TMetodoScreen = Procedure of object;

  TPageLayout = class(TForm, iPageLayout)
    Button1: TButton;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    Layout: TLayout;
    Metodo : TMetodoScreen;
  public
    { Public declarations }
    function _Layout: TLayout;
    class function New(const pLayout: TLayout; met: TMetodoScreen) : iPageLayout;
    destructor Destroy; override;
  end;

var
  PageLayout: TPageLayout;

implementation

{$R *.fmx}

{ TPageLayout }

procedure TPageLayout.Button1Click(Sender: TObject);
begin
    // Remove Layout1 do Layout principal
    if Assigned(Layout) and Layout.ContainsObject(Layout1) then
      Layout.RemoveObject(Layout1);

    // Força a atualização do foco para o formulário principal
    Application.ProcessMessages;

    Metodo;
end;

destructor TPageLayout.Destroy;
begin

  // Certifique-se de que Layout1 seja removido do layout pai antes de destruir
  if Assigned(Layout) and Layout.ContainsObject(Layout1) then
    Layout.RemoveObject(Layout1);

  inherited;
end;

class function TPageLayout.New(const pLayout: TLayout; met: TMetodoScreen): iPageLayout;
begin
  PageLayout := Self.Create(pLayout);
  PageLayout.Layout := pLayout;
  pLayout.AddObject(PageLayout.Layout1);
  PageLayout.Metodo := met;
  Result := PageLayout;
end;

function TPageLayout._Layout: TLayout;
begin
  Result := Self.Layout1;
end;

end.
