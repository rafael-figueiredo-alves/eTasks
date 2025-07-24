unit eTasks.View.About;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.PageLayout, FMX.Objects, FMX.Layouts, FMX.Types,
  FMX.Controls.Presentation;

type
  TPageAbout = class(TPageLayout)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Teste;
  public
    { Public declarations }
    procedure TranslateUI;override;
  end;

var
  PageAbout1: TPageAbout;

implementation

uses
  eTranslate4Pascal,
  eTasks.Shared.TranslateKeyConsts;

{$R *.fmx}

procedure TPageAbout.FormCreate(Sender: TObject);
begin
  inherited;
  Self.OnUpdateButtonClick(Teste);
end;

procedure TPageAbout.Teste;
begin
  showmessage('Teste');
end;

procedure TPageAbout.TranslateUI;
begin
  inherited;
  Self.SetTitle(eTranslate.Translate(ActionButton_Hint, 'Adicionar'));
end;

end.
