unit eTasks.View.Teste;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.PageLayout, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts,
  eTasks.View.Layouts.Interfaces;

type
  TPageLayout1 = class(TPageLayout)
    Rectangle2: TRectangle;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function isDarkMode(const value: Boolean): iPageLayout; override;
  end;

var
  PageLayout1: TPageLayout1;

implementation

{$R *.fmx}

procedure TPageLayout1.Button1Click(Sender: TObject);
var
  Teste : ipagelayout;
begin
  inherited;
  ShowMessage(EntityID);
end;

function TPageLayout1.isDarkMode(const value: Boolean): iPageLayout;
begin
  inherited;
end;

end.
