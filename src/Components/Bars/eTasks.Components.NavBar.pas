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
    procedure BtnConfirmaClick(Sender: TObject);
    procedure BtnAtualizarClick(Sender: TObject);
    procedure BtnExplicaClick(Sender: TObject);
    procedure BtnApagarClick(Sender: TObject);
  private
    { Private declarations }
    fOnBtnBackClick: TEventoClick;
    fOnBtnConfirmClick: TEventoClick;
    fOnBtnDeleteClick: TEventoClick;
    fOnBtnUpdateClick: TEventoClick;
    fOnBtnInfoClick: TEventoClick;
    function ImgSource(const size: TSizeF; index: integer; isDarkMode: boolean): TBitmap;
  public
    { Public declarations }
    function SetTitle(const Title: string): iNavBar;
    function Resize(const FormWidth: Integer): iNavBar; reintroduce;
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

uses eTasks.Shared.Consts, eTasks.Shared.Utils, eTasks.Components.ColorPallete;

{ TNavBar }

procedure TNavBar.BtnApagarClick(Sender: TObject);
begin
  if(Assigned(fOnBtnDeleteClick))then
   fOnBtnDeleteClick(sender);
end;

procedure TNavBar.BtnAtualizarClick(Sender: TObject);
begin
  if(Assigned(fOnBtnUpdateClick))then
   fOnBtnUpdateClick(sender);
end;

procedure TNavBar.BtnConfirmaClick(Sender: TObject);
begin
  if(Assigned(fOnBtnConfirmClick))then
   fOnBtnConfirmClick(sender);
end;

procedure TNavBar.BtnExplicaClick(Sender: TObject);
begin
  if(Assigned(fOnBtnInfoClick))then
   fOnBtnInfoClick(sender);
end;

procedure TNavBar.BtnVoltarClick(Sender: TObject);
begin
  if(Assigned(fOnBtnBackClick))then
   fOnBtnBackClick(sender);
end;

function TNavBar.ImgSource(const size: TSizeF; index: integer; isDarkMode: boolean): TBitmap;
begin
  Result := TUtils.Iif(isDarkMode, ImgDark.Bitmap(size, index), ImgLight.Bitmap(size, index));
end;

function TNavBar.isDarkMode(const value: boolean): iNavBar;
begin
  BtnApagar.Bitmap       := ImgSource(TSizeF.Create(40, 40), 0, value);
  BtnConfirma.Bitmap     := ImgSource(TSizeF.Create(40, 40), 1, value);
  BtnVoltar.Bitmap       := ImgSource(TSizeF.Create(40, 40), 2, value);
  BtnAtualizar.Bitmap    := ImgSource(TSizeF.Create(40, 40), 3, value);
  BtnExplica.Bitmap      := ImgSource(TSizeF.Create(40, 40), 4, value);
  LabelTitle.FontColor   := tColorPallete.GetColor(Primary, value);
  Self.TopBar.Fill.Color := tColorPallete.GetColor(Background, value);
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
  fOnBtnConfirmClick := Event;
end;

function TNavBar.OnBtnBackClick(const Event: TEventoClick): iNavBar;
begin
  Result := Self;
  fOnBtnBackClick := Event;
end;

function TNavBar.OnBtnDeleteClick(const Event: TEventoClick): iNavBar;
begin
  Result := Self;
  fOnBtnDeleteClick := Event
end;

function TNavBar.OnBtnHelpClick(const Event: TEventoClick): iNavBar;
begin
  Result := Self;
  fOnBtnInfoClick := Event
end;

function TNavBar.OnBtnUpdateClick(const Event: TEventoClick): iNavBar;
begin
  Result := Self;
  fOnBtnUpdateClick := Event;
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
