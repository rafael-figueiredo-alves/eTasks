unit eTasks.View.Pages.About;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.PageLayout, FMX.Objects, FMX.Layouts, FMX.Types,
  FMX.Controls.Presentation;

type
  TPage_About = class(TPageLayout)
    lytImage: TLayout;
    imgLogo: TImage;
    lblAppTitle: TLabel;
    lytVersion: TLayout;
    lblVersion: TLabel;
    LytFooter: TLayout;
    lytChangelog: TLayout;
    Topline: TLine;
    LblAuthor: TLabel;
    lblDedicatoria: TLabel;
    lytTitleChangelog: TLayout;
    lblTitleChangelog: TLabel;
    ChangelogBorder: TRectangle;
    ChangelogScroll: TVertScrollBox;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Teste;
  public
    { Public declarations }
    procedure TranslateUI;override;
  end;

var
  Page_About: TPage_About;

implementation

uses
  eTranslate4Pascal,
  eTasks.Shared.TranslateKeyConsts;

{$R *.fmx}

procedure TPage_About.FormCreate(Sender: TObject);
begin
  inherited;
  Self.OnUpdateButtonClick(Teste);

//  SkLabel1.Words.Add('Teste de linha de texto qualquer' + sLineBreak);
//  SkLabel1.Words.Add('Teste de linha de texto qualquer' + sLineBreak);
//  SkLabel1.Words.Add('Teste de linha de texto qualquer' + sLineBreak);
//  SkLabel1.Words.Add('Teste de linha de texto qualquer' + sLineBreak);
//  SkLabel1.Words.Add(sLineBreak);
//  SkLabel1.Words.Add('Teste de linha de texto qualquer' + sLineBreak);
//  SkLabel1.Words.Add('Teste de linha de texto qualquer' + sLineBreak);
//  SkLabel1.Words.Add(sLineBreak);
//  SkLabel1.Words.Add('Teste de linha de texto qualquer' + sLineBreak);
//  SkLabel1.Words.Add('Teste de linha de texto qualquer' + sLineBreak);
end;

procedure TPage_About.Teste;
begin
  Self.GoBack(nil);
end;

procedure TPage_About.TranslateUI;
begin
  inherited;
  Self.SetTitle(eTranslate.Translate(ActionButton_Hint, 'Adicionar'));
end;

end.
