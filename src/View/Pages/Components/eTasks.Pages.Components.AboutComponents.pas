unit eTasks.Pages.Components.AboutComponents;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, System.Skia, FMX.Skia;

type
  TAboutComponents = class(TFrame)
    lytImage: TLayout;
    imgLogo: TImage;
    lblAppTitle: TLabel;
    lytVersion: TLayout;
    lblVersion: TLabel;
    LytFooter: TLayout;
    Topline: TLine;
    LblAuthor: TLabel;
    lblDedicatoria: TLabel;
    lytChangelog: TLayout;
    lytTitleChangelog: TLayout;
    lblTitleChangelog: TLabel;
    ChangelogBorder: TRectangle;
    ChangelogScroll: TVertScrollBox;
    Changelog: TSkLabel;
  private
    { Private declarations }
    procedure AddVersionTitle(const Text: string; isDarkTheme: Boolean);
    procedure AddFeature(const Text: string; isDarkTheme: Boolean);
    procedure AddBlankline;
  public
    { Public declarations }
    procedure UpdateDateCopyright;
    procedure isDarkMode(const value: boolean);
    procedure ReloadChangelog(const isDarkTheme: boolean; language: string);
    procedure SetVersionLabel(const Value: string);
    procedure SetTitleChangelog(const Value: string);
    procedure SetDedicatoria(const value: string);
  end;

implementation

uses
  eTasks.Components.ColorPallete, eTasks.Shared.Entities.Changelog,
  System.Generics.Collections, System.IOUtils;

{$R *.fmx}

{ TAboutComponents }

procedure TAboutComponents.AddBlankline;
begin
  Changelog.Words.Add(sLineBreak);
end;

procedure TAboutComponents.AddFeature(const Text: string; isDarkTheme: Boolean);
begin
  Changelog.Words.Add(Text + sLineBreak, tColorPallete.GetColor(Secondary, isDarkTheme), 14, TFontWeight.Regular);
end;

procedure TAboutComponents.AddVersionTitle(const Text: string; isDarkTheme: Boolean);
begin
  Changelog.Words.Add(Text + sLineBreak, tColorPallete.GetColor(Primary, isDarkTheme), 14, TFontWeight.Bold);
end;

procedure TAboutComponents.isDarkMode(const value: boolean);
begin
  lblAppTitle.FontColor        := tColorPallete.GetColor(Primary, value);
  lblVersion.FontColor         := tColorPallete.GetColor(Secondary, value);
  LblAuthor.FontColor          := tColorPallete.GetColor(Primary, value);
  lblDedicatoria.FontColor     := tColorPallete.GetColor(Secondary, value);
  lblTitleChangelog.FontColor  := tColorPallete.GetColor(Primary, value);
  ChangelogBorder.Stroke.Color := tColorPallete.GetColor(Primary, value);
  Topline.Stroke.Color         := tColorPallete.GetColor(Primary, value);
end;

procedure TAboutComponents.ReloadChangelog(const isDarkTheme: boolean; language: string);
var
  ChangeLogArray    : TArray<TChangelogItem>;
  ChangeLogItem     : TChangelogItem;
  Feature           : string;
  ChangelogFilepath : string;
begin
   Changelog.Words.Clear;

  {$IFDEF ANDROID}
  ChangelogFilepath := TPath.Combine(TPath.GetDocumentsPath, 'Changelog.json');
  {$ENDIF}

  {$IFDEF MSWINDOWS}
  ChangelogFilepath :=  ExtractFilePath(ParamStr(0)) + 'Changelog.json';
  {$ENDIF}

   ChangeLogArray := GetChangelogByLanguage(language, ChangelogFilepath);

   for ChangeLogItem in ChangeLogArray do
     begin
       AddVersionTitle(ChangeLogItem.VersionTitle, isDarkTheme);
       for Feature in ChangeLogItem.Features do
        begin
          AddFeature(Feature, isDarkTheme);
        end;
       AddBlankline;
     end;
end;

procedure TAboutComponents.SetDedicatoria(const value: string);
begin
  lblDedicatoria.Text := value;
end;

procedure TAboutComponents.SetTitleChangelog(const Value: string);
begin
  lblTitleChangelog.Text := Value;
end;

procedure TAboutComponents.SetVersionLabel(const Value: string);
begin
  lblVersion.Text := Value;
end;

procedure TAboutComponents.UpdateDateCopyright;
begin
  LblAuthor.Text := '© 2020 - ' + inttostr(CurrentYear) + ' by Rafael de Figueiredo Alves';
end;

end.
