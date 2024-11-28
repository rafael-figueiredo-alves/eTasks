unit eTasks.Components.NavBar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, System.ImageList,
  FMX.ImgList, eTasks.Components.Interfaces, FMX.Layouts;

type
  TNavBar = class(TForm, iNavBar)
    TopBar: TRectangle;
    SombraBar: TShadowEffect;
    BtnVoltar: TImage;
    BtnConfirma: TImage;
    BtnApagar: TImage;
    BtnExplica: TImage;
    BtnAtualizar: TImage;
    LabelTitle: TLabel;
    ImgLight: TImageList;
    ImgDark: TImageList;
    procedure BtnVoltarClick(Sender: TObject);
  private
    { Private declarations }
    fOnBtnBackClick: TEventoClick;
  public
    { Public declarations }
    function SetTitle(const Title: string): iNavBar;
    function Resize(const FormWidth: Integer): iNavBar;
    function isDarkMode(const value: boolean): iNavBar;
    function ShowButtons(const value: TNavBarButtons): iNavBar;
    function OnBtnUpdateClick(const Event: TEventoClick): iNavBar;
    function OnBtnHelpClick(const Event: TEventoClick): iNavBar;
    function OnBtnDeleteClick(const Event: TEventoClick): iNavBar;
    function OnBtnAcceptClick(const Event: TEventoClick): iNavBar;
    function OnBtnBackClick(const Event: TEventoClick): iNavBar;

    class function New(const Layout: TLayout): iNavBar;
  end;

var
  NavBar: TNavBar;

implementation

{$R *.fmx}

uses eTasks.Shared.Consts;

{ TNavBar }

procedure TNavBar.BtnVoltarClick(Sender: TObject);
begin
  fOnBtnBackClick(sender);
end;

function TNavBar.isDarkMode(const value: boolean): iNavBar;
begin
  Result := Self;
end;

class function TNavBar.New(const Layout: TLayout): iNavBar;
begin
  Result := Self.Create(layout);
  Layout.AddObject(TNavBar(Result).TopBar);
end;

function TNavBar.OnBtnAcceptClick(const Event: TEventoClick): iNavBar;
begin
  Result := Self;
end;

function TNavBar.OnBtnBackClick(const Event: TEventoClick): iNavBar;
begin
  Result := Self;
  fOnBtnBackClick := Event;
end;

function TNavBar.OnBtnDeleteClick(const Event: TEventoClick): iNavBar;
begin
  Result := Self;
end;

function TNavBar.OnBtnHelpClick(const Event: TEventoClick): iNavBar;
begin
  Result := Self;
end;

function TNavBar.OnBtnUpdateClick(const Event: TEventoClick): iNavBar;
begin
  Result := Self;
end;

function TNavBar.Resize(const FormWidth: Integer): iNavBar;
begin
  Result := Self;

  SombraBar.Enabled := FormWidth <= MobileSizeWidth;
  BtnVoltar.Visible := FormWidth <= MobileSizeWidth;
end;

function TNavBar.SetTitle(const Title: string): iNavBar;
begin
  Result := Self;
  LabelTitle.Text := Title;
end;

function TNavBar.ShowButtons(const value: TNavBarButtons): iNavBar;
begin
  Result := Self;

  case value of
    NavBarEditButtons:
      begin
        BtnConfirma.Visible  := true;
        BtnApagar.Visible    := True;
        BtnExplica.Visible   := False;
        BtnAtualizar.Visible := False;
      end;

    NavBarUpdateButton:
      begin
        BtnConfirma.Visible  := False;
        BtnApagar.Visible    := False;
        BtnExplica.Visible   := False;
        BtnAtualizar.Visible := True;
      end;

    NavBarHelpButton:
      begin
        BtnConfirma.Visible  := False;
        BtnApagar.Visible    := False;
        BtnExplica.Visible   := True;
        BtnAtualizar.Visible := False;
      end;
  end;
end;

end.
