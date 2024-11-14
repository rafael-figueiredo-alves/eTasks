unit eTasks.Components.NavBar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, System.ImageList,
  FMX.ImgList, eTasks.Components.Interfaces;

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
  private
    { Private declarations }
  public
    { Public declarations }
    function SetTitle(const Title: string): iNavBar;
    function Resize(const FormWidth: Integer): iNavBar;
    function isDarkMode(const value: boolean): iNavBar;
    function ShowButtons(const value: TNavBarButtons): iNavBar;
  end;

var
  NavBar: TNavBar;

implementation

{$R *.fmx}

{ TNavBar }

function TNavBar.isDarkMode(const value: boolean): iNavBar;
begin
  Result := Self;
end;

function TNavBar.Resize(const FormWidth: Integer): iNavBar;
begin
  Result := Self;
end;

function TNavBar.SetTitle(const Title: string): iNavBar;
begin
  Result := Self;
  LabelTitle.Text := Title;
end;

function TNavBar.ShowButtons(const value: TNavBarButtons): iNavBar;
begin
  Result := Self;
end;

end.
