unit eTasks.Components.AppBar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Effects,
  System.ImageList, FMX.ImgList, eTasks.Components.Interfaces;

type
  TAppBar = class(TForm, iAppBar)
    TopBar: TRectangle;
    ShadowEffect1: TShadowEffect;
    BrandTitle: TLabel;
    BrandImage: TImage;
    Avatar: TCircle;
    BtnMainMenu: TImage;
    BtnThemeChanger: TImage;
    TitleBar: TRectangle;
    Title: TLabel;
    ImgLight: TImageList;
    ImgDark: TImageList;
    ImgAvatar: TImageList;
    procedure BtnThemeChangerClick(Sender: TObject);
  private
    fThemeChangerClick: TEventoClick;

    { Private declarations }
    function ImgSource(const size: TSizeF; index: integer; isDarkMode: boolean): TBitmap;
  public
    { Public declarations }
    function ChangeTitle(const Title: string): iAppBar;
    function ShowTitleBar(const value: Boolean): TRectangle;
    function Render: TRectangle;
    function ThemeChangerClick(const Evento: TEventoClick): iAppBar;
    function isDarkMode(const value: boolean): iAppBar;
    class function New(const Form: TForm): iAppBar;
  end;

var
  AppBar: TAppBar;

implementation

uses
  eTasks.Components.ColorPallete, FMX.MultiResBitmap, eTasks.Shared.Utils;

{$R *.fmx}

{ TAppBar }

procedure TAppBar.BtnThemeChangerClick(Sender: TObject);
begin
  if(Assigned(fThemeChangerClick))then
   fThemeChangerClick(sender);
end;

function TAppBar.ChangeTitle(const Title: string): iAppBar;
begin
  self.Title.Text := Title;
  Result := self;
end;

function TAppBar.ImgSource(const size: TSizeF; index: integer; isDarkMode: boolean): TBitmap;
begin
  Result := TUtils.Iif(isDarkMode, ImgDark.Bitmap(size, index), ImgLight.Bitmap(size, index));
end;

function TAppBar.isDarkMode(const value: boolean): iAppBar;
var
 AvatarImg: tCustomBitmapItem;
 Size: TSize;
begin
   Result := self;
   BtnThemeChanger.Bitmap    := ImgSource(TSizeF.Create(40, 40), 0, value);
   BtnMainMenu.Bitmap        := ImgSource(TSizeF.Create(40, 40), 1, value);
   Self.TopBar.Fill.Color    := tColorPallete.GetColor(Background, value);
   Self.TitleBar.Fill.Color  := tColorPallete.GetColor(Primary, value);
   Self.Title.FontColor      := tColorPallete.GetColor(Text, not value);
   Self.BrandTitle.FontColor := tColorPallete.GetColor(Primary, value);
   if ImgAvatar.BitmapItemByName(TUtils.Iif(value, 'Dark', 'Light'), AvatarImg, size) then
    Avatar.Fill.Bitmap.Bitmap := AvatarImg.Bitmap;
end;

class function TAppBar.New(const Form: TForm): iAppBar;
begin
  Result := self.Create(Form);
  Form.AddObject(Result.Render);
end;

function TAppBar.Render: TRectangle;
begin
  Result := Self.TopBar;
end;

function TAppBar.ShowTitleBar(const value: Boolean): TRectangle;
begin
  self.TitleBar.Visible := value;
  Result := self.TitleBar;
end;

function TAppBar.ThemeChangerClick(const Evento: TEventoClick): iAppBar;
begin
  fThemeChangerClick := Evento;
  Result := Self;
end;

end.
