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
  public
    { Public declarations }
  end;

var
  FormAbout: TPageAbout;

implementation

{$R *.fmx}

{ TPageAbout }

end.
