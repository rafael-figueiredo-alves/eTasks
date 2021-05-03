unit eTasks.View.Windows.categories;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TWindows_Categories = class(TForm)
    Layout1: TLayout;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FBtnVoltarClick : TProc;
  public
    { Public declarations }
    Function Exibir : TLayout;
    Function BtnVoltarClick (value: tproc): twindows_categories;
  end;

var
  Windows_Categories: TWindows_Categories;

implementation

{$R *.fmx}

{ TWindows_Categories }

function TWindows_Categories.BtnVoltarClick(value: tproc): twindows_categories;
begin
  Result := Self;
  FBtnVoltarClick := value;
end;

procedure TWindows_Categories.Button1Click(Sender: TObject);
begin
  FBtnVoltarClick;
end;

function TWindows_Categories.Exibir: TLayout;
begin
  Result := Layout1;
end;

end.
