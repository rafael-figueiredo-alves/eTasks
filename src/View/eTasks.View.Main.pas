unit eTasks.View.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TfMain = class(TForm)
    Rectangle1: TRectangle;
    ShadowEffect1: TShadowEffect;
    Label1: TLabel;
    Image1: TImage;
    Circle1: TCircle;
    Image2: TImage;
    Image3: TImage;
    Rectangle2: TRectangle;
    Label2: TLabel;
    Layout1: TLayout;
    Rectangle3: TRectangle;
    Label3: TLabel;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.fmx}

procedure TfMain.FormResize(Sender: TObject);
begin
  if(fMain.Width <= 768)then
   begin
     Rectangle2.Visible := false;
     Layout1.Visible := true;
   end
  else
   begin
     Rectangle2.Visible := true;
     Layout1.Visible := false;
   end;
end;

end.
