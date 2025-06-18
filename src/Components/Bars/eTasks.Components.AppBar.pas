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
    procedure BtnMainMenuClick(Sender: TObject);
    procedure AvatarClick(Sender: TObject);
  private
    fThemeChangerClick : TEventoClick;
    fMenuButtonClick   : TEventoClick;
    fAvatarButtonClick : TEventoClick;

    { Private declarations }
    function ImgSource(const size: TSizeF; index: integer; isDarkMode: boolean): TBitmap;
  public
    { Public declarations }
    function SetTitle(const Title: string): iAppBar;
    function ShowTitleBar(const value: Boolean): TRectangle;
    function isDarkMode(const value: boolean): iAppBar;
    function SetButtonAppBarAction(const ButtonAppBar: TButtonAppBar; const Action: TEventoClick): iAppBar;
    function SetButtonAppBarHints(const ButtonAppBar: TButtonAppBar; const Hint: string): iAppBar;
    class function New(const Form: TForm; const Layout: TLayout): iAppBar;
  end;

var
  AppBar: TAppBar;

implementation

uses
  eTasks.Components.ColorPallete, FMX.MultiResBitmap, eTasks.Shared.Utils;

{$R *.fmx}

{ TAppBar }

procedure TAppBar.AvatarClick(Sender: TObject);
begin
  if(Assigned(fAvatarButtonClick))then
   fAvatarButtonClick(sender);
end;

procedure TAppBar.BtnMainMenuClick(Sender: TObject);
begin
  if(Assigned(fMenuButtonClick))then
   fMenuButtonClick(sender);
end;

procedure TAppBar.BtnThemeChangerClick(Sender: TObject);
begin
  if(Assigned(fThemeChangerClick))then
   fThemeChangerClick(sender);
end;

function TAppBar.SetTitle(const Title: string): iAppBar;
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

class function TAppBar.New(const Form: TForm; const Layout: TLayout): iAppBar;
begin
  Result := self.Create(Form);
  Layout.AddObject(TAppBar(Result).TopBar);
end;

function TAppBar.SetButtonAppBarAction(const ButtonAppBar: TButtonAppBar; const Action: TEventoClick): iAppBar;
begin
  Result := Self;

  case ButtonAppBar of
     ThemeBtn: fThemeChangerClick := Action;
      MenuBtn: fMenuButtonClick   := Action;
    AvatarBtn: fAvatarButtonClick := Action;
  end;
end;

function TAppBar.SetButtonAppBarHints(const ButtonAppBar: TButtonAppBar;const Hint: string): iAppBar;
begin
  Result := Self;

  case ButtonAppBar of
     ThemeBtn: BtnThemeChanger.Hint := Hint;
      MenuBtn: BtnMainMenu.Hint     := Hint;
    AvatarBtn: Avatar.Hint          := Hint;
  end;
end;

function TAppBar.ShowTitleBar(const value: Boolean): TRectangle;
begin
  self.TitleBar.Visible := value;
  Result := self.TitleBar;
end;

end.
