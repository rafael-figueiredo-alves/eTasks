unit eTasks.Pages.Components.AboutComponents;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation;

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
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateDateCopyright;
    procedure isDarkMode(const value: boolean);
  end;

implementation

uses
  eTasks.Components.ColorPallete;

{$R *.fmx}

{ TAboutComponents }

procedure TAboutComponents.isDarkMode(const value: boolean);
begin
  lblAppTitle.FontColor := tColorPallete.GetColor(Primary, value);
end;

procedure TAboutComponents.UpdateDateCopyright;
begin
  LblAuthor.Text := '© 2020 - ' + inttostr(CurrentYear) + ' by Rafael de Figueiredo Alves';
end;

end.
