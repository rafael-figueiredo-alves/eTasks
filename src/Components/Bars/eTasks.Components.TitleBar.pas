unit eTasks.Components.TitleBar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  iTitleBar = interface
    ['{CCA6D914-787E-495F-ADE7-F9472A0FBC45}']
    function Layout : TLayout;
    function ChangeTitle(const Title: string): iTitleBar;
  end;

  TTitleBar = class(TForm, iTitleBar)
    Layout1: TLayout;
    Rectangle3: TRectangle;
    Label3: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    function Layout : TLayout;
    function ChangeTitle(const Title: string): iTitleBar;
    class function New(const Form: TForm): iTitleBar;
  end;

var
  TitleBar : TTitleBar ;

implementation

{$R *.fmx}

{ TTitleBar }

function TTitleBar.ChangeTitle(const Title: string): iTitleBar;
begin
  Result := self;
  self.Label3.text := Title;
end;

function TTitleBar.Layout: TLayout;
begin
  Result := self.Layout1;
end;

class function TTitleBar.New(const Form: TForm): iTitleBar;
begin
  Result := self.create(Form);
  Form.AddObject(Result.Layout);
end;

end.
