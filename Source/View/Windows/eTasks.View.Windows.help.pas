unit eTasks.View.Windows.help;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects;

type
  TForm_Windows_Ajuda = class(TForm)
    Lay_main: TLayout;
    recFundo: TRectangle;
    Layout1: TLayout;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Line1: TLine;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Windows_Ajuda: TForm_Windows_Ajuda;

implementation

{$R *.fmx}

end.
