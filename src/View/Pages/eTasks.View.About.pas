unit eTasks.View.About;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  eTasks.View.PageLayout,
  eTasks.View.Layouts.Interfaces;

type
  TPageAbout = class(TPageLayout)
  private
    { Private declarations }
    procedure TranslateUI;override;
  public
    { Public declarations }
  end;

var
  FormAbout: TPageAbout;

implementation

{$R *.fmx}

{ TPageAbout }

{ TPageAbout }

procedure TPageAbout.TranslateUI;
begin
  inherited;
  Self.SetTitle('Teste ' + Self.Name);
end;

end.
