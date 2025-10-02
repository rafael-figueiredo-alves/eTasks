unit eTasks.View.Pages.About;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  eTasks.View.PageLayout, FMX.Objects, FMX.Layouts, FMX.Types,
  FMX.Controls.Presentation,
  eTasks.Pages.Components.AboutComponents, eTasks.View.Layouts.Interfaces;

type
  TPage_About = class(TPageLayout)
    FAboutComponents: TAboutComponents;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Teste;
  public
    { Public declarations }
    procedure TranslateUI;override;
    function isDarkMode(const value: Boolean): iPageLayout;reintroduce;
  end;

var
  Page_About: TPage_About;

implementation

uses
  eTranslate4Pascal,
  eTasks.Shared.TranslateKeyConsts, eTasks.View.ThemeService;

{$R *.fmx}

procedure TPage_About.FormCreate(Sender: TObject);
begin
  inherited;
  Self.OnUpdateButtonClick(Teste);
  FAboutComponents.isDarkMode(ThemeService.isDarkTheme);

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

function TPage_About.isDarkMode(const value: Boolean): iPageLayout;
begin
  inherited;
  FAboutComponents.isDarkMode(value);
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
