unit eTasks.Components.AvatarMenu;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Effects,
  FMX.Objects,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.MultiView,
  System.ImageList,
  FMX.ImgList,
  eTasks.Components.Interfaces,
  System.Generics.Collections,
  eTasks.Components.MenuEnums,
  eTasks.Components.TranslationEnums;

type
  TAvatarMenu = class(TForm, iAvatarMenu)
    ImgDark: TImageList;
    ImgLight: TImageList;
    Multiview: TMultiView;
    Styles: TStyleBook;
    TopAvatarMenu: TLayout;
    AvatarPicContainer: TLayout;
    AvatarPicture: TCircle;
    Layout3: TLayout;
    CloseLayout: TLayout;
    BtnClose: TImage;
    UserButtons: TLayout;
    LineTop: TLine;
    LineShadow: TShadowEffect;
    Container: TVertScrollBox;
    ImgAvatar: TImageList;
    UserName: TLabel;
    BtnEditProfile: TImage;
    BtnChangePassword: TImage;
    BtnLogout: TImage;
    LayItemConquers: TLayout;
    ImgConquers: TImage;
    lblConquers: TLabel;
    SpacingLineConquers: TLine;
    LayItemConfig: TLayout;
    ImgConfig: TImage;
    lblConfig: TLabel;
    SpacingLineConfig: TLine;
    LayItemTheme: TLayout;
    ImgTheme: TImage;
    lblTheme: TLabel;
    SpacingLineTheme: TLine;
    LayItemLanguage: TLayout;
    ImgLanguage: TImage;
    lblLanguage: TLabel;
    SpacingLineLanguage: TLine;
    LayItemAbout: TLayout;
    ImgAbout: TImage;
    lblAbout: TLabel;
    SpacingLineAbout: TLine;
    procedure BtnCloseClick(Sender: TObject);
    procedure LayItemConquersClick(Sender: TObject);
    procedure LayItemConfigClick(Sender: TObject);
    procedure LayItemThemeClick(Sender: TObject);
    procedure LayItemLanguageClick(Sender: TObject);
    procedure LayItemAboutClick(Sender: TObject);
    procedure BtnEditProfileClick(Sender: TObject);
    procedure BtnChangePasswordClick(Sender: TObject);
    procedure BtnLogoutClick(Sender: TObject);
    procedure AvatarPictureClick(Sender: TObject);
  private
    { Private declarations }
    fDirection               : TOffcanvasDirection;
    EventoAoClicarEmItemMenu : TEventoAvatarMenuClick;
    EventoAvatarClick        : TEventoClick;
    AvatarPhoto              : TBitmap;
    IsDarkTheme              : boolean;
    procedure SetDirection(const direction: TOffcanvasDirection);
    function ImgSource(const size: TSizeF; index: integer; isDarkMode: boolean): TBitmap;
    function AvatarMenuItemClick(const value: TAvatarMenuItems): iAvatarMenu;
  public
    { Public declarations }
    function isDarkMode(const value: boolean): iAvatarMenu;
    function OpenMenu: iAvatarMenu;
    function ChangeLanguage(const Translations: TDictionary<TAvatarMenuTexts, string> = nil): iAvatarMenu;
    function OnAvatarMenuItemClick(const Event: TEventoAvatarMenuClick): iAvatarMenu;
    function SetUserName(const value: string): iAvatarMenu;
    function SetUserPhoto(const value: TBitmap): iAvatarMenu;
    function OnAvatarClick(const value: TEventoClick): iAvatarMenu;

    class function New(const Form: TForm; isDarkMode: Boolean = false; Translations: TDictionary<TAvatarMenuTexts, string> = nil): iAvatarMenu;
  end;

var
  Form1: TAvatarMenu;

implementation

uses
  eTasks.Shared.Utils,
  FMX.MultiView.Types,
  FMX.MultiResBitmap,
  eTasks.Components.ColorPallete;

{$R *.fmx}

{ TAvatarMenu }

{$region 'Métodos dos botões'}
procedure TAvatarMenu.AvatarPictureClick(Sender: TObject);
begin
  if(Assigned(EventoAvatarClick))then
    EventoAvatarClick(nil);
end;

procedure TAvatarMenu.BtnChangePasswordClick(Sender: TObject);
begin
  AvatarMenuItemClick(TAvatarMenuItems.ChangePassword);
end;

procedure TAvatarMenu.BtnCloseClick(Sender: TObject);
begin
  Multiview.HideMaster;
end;

procedure TAvatarMenu.BtnEditProfileClick(Sender: TObject);
begin
  AvatarMenuItemClick(TAvatarMenuItems.EditProfile);
end;

procedure TAvatarMenu.BtnLogoutClick(Sender: TObject);
begin
  AvatarMenuItemClick(TAvatarMenuItems.Logout);
end;

procedure TAvatarMenu.LayItemAboutClick(Sender: TObject);
begin
  AvatarMenuItemClick(TAvatarMenuItems.About);
end;

procedure TAvatarMenu.LayItemConfigClick(Sender: TObject);
begin
  AvatarMenuItemClick(TAvatarMenuItems.Settings);
end;

procedure TAvatarMenu.LayItemConquersClick(Sender: TObject);
begin
  AvatarMenuItemClick(TAvatarMenuItems.Conquers);
end;

procedure TAvatarMenu.LayItemLanguageClick(Sender: TObject);
begin
  AvatarMenuItemClick(TAvatarMenuItems.ChangeLanguage);
end;

procedure TAvatarMenu.LayItemThemeClick(Sender: TObject);
begin
  AvatarMenuItemClick(TAvatarMenuItems.ChangeTheme);
end;
{$endregion}

function TAvatarMenu.ChangeLanguage(const Translations: TDictionary<TAvatarMenuTexts, string>): iAvatarMenu;
begin
  Result := self;

  if(Assigned(Translations))then
   begin
     LblConquers.Text       := TUtils.Iif(Translations.ContainsKey(TAvatarMenuTexts.Conquers), Translations[TAvatarMenuTexts.Conquers], 'Conquistas');
     lblConfig.Text         := TUtils.Iif(Translations.ContainsKey(TAvatarMenuTexts.Settings), Translations[TAvatarMenuTexts.Settings], 'Configurações');
     lblTheme.Text          := TUtils.Iif(Translations.ContainsKey(TAvatarMenuTexts.ChangeTheme), Translations[TAvatarMenuTexts.ChangeTheme], 'Trocar tema');
     lblLanguage.Text       := TUtils.Iif(Translations.ContainsKey(TAvatarMenuTexts.ChangeLanguage), Translations[TAvatarMenuTexts.ChangeLanguage], 'Trocar idioma');
     lblAbout.Text          := TUtils.Iif(Translations.ContainsKey(TAvatarMenuTexts.About), Translations[TAvatarMenuTexts.About], 'Sobre');
     BtnEditProfile.Hint    := TUtils.Iif(Translations.ContainsKey(TAvatarMenuTexts.EditProfile), Translations[TAvatarMenuTexts.EditProfile], 'Editar perfil');
     BtnChangePassword.Hint := TUtils.Iif(Translations.ContainsKey(TAvatarMenuTexts.ChangePassword), Translations[TAvatarMenuTexts.ChangePassword], 'Trocar senha');
     BtnLogout.Hint         := TUtils.Iif(Translations.ContainsKey(TAvatarMenuTexts.Logout), Translations[TAvatarMenuTexts.Logout], 'Sair');
   end
  else
   begin
     LblConquers.Text       := 'Conquistas';
     lblConfig.Text         := 'Configurações';
     lblTheme.Text          := 'Trocar tema';
     lblLanguage.Text       := 'Trocar idioma';
     lblAbout.Text          := 'Sobre';
     BtnEditProfile.Hint    := 'Editar perfil';
     BtnChangePassword.Hint := 'Trocar senha';
     BtnLogout.Hint         := 'Sair';
   end;
end;

function TAvatarMenu.ImgSource(const size: TSizeF; index: integer;isDarkMode: boolean): TBitmap;
begin
  Result := TUtils.Iif(isDarkMode, ImgDark.Bitmap(size, index), ImgLight.Bitmap(size, index));
end;

function TAvatarMenu.isDarkMode(const value: boolean): iAvatarMenu;
var
 AvatarImg: tCustomBitmapItem;
 Size: TSize;
begin
  Result := Self;
  IsDarkTheme := value;

  case fDirection of
    ocdLeft: Multiview.StyleLookup := TUtils.Iif(value, 'AvatarDarkModeLeft', 'AvatarLightModeLeft');
    ocdRight: Multiview.StyleLookup := TUtils.Iif(value, 'AvatarDarkModeRight', 'AvatarLightModeRight');
   else
    Multiview.StyleLookup := TUtils.Iif(value, 'AvatarDarkModeRight', 'AvatarLightModeRight');
  end;

   if(Assigned(AvatarPhoto))then
     AvatarPicture.Fill.Bitmap.Bitmap := AvatarPhoto
   else
     if ImgAvatar.BitmapItemByName(TUtils.Iif(value, 'Dark', 'Light'), AvatarImg, size) then
      AvatarPicture.Fill.Bitmap.Bitmap := AvatarImg.Bitmap;

  BtnClose.Bitmap          := ImgSource(TSizeF.Create(20, 20), 0, value);
  BtnEditProfile .Bitmap   := ImgSource(TSizeF.Create(30, 30), 1, value);
  BtnChangePassword.Bitmap := ImgSource(TSizeF.Create(30, 30), 2, value);
  BtnLogout.Bitmap         := ImgSource(TSizeF.Create(30, 30), 3, value);
  UserName.FontColor       := tColorPallete.GetColor(Primary, value);
  LineTop.Stroke.Color     := tColorPallete.GetColor(Primary, value);

  ImgConquers.Bitmap       := ImgSource(TSizeF.Create(30, 30), 4, value);
  lblConquers.FontColor    := tColorPallete.GetColor(Primary, value);

  ImgConfig.Bitmap         := ImgSource(TSizeF.Create(30, 30), 5, value);
  lblConfig.FontColor      := tColorPallete.GetColor(Primary, value);

  ImgTheme.Bitmap          := ImgSource(TSizeF.Create(30, 30), 6, value);
  lblTheme.FontColor       := tColorPallete.GetColor(Primary, value);

  ImgLanguage.Bitmap        := ImgSource(TSizeF.Create(30, 30), 7, value);
  lblLanguage.FontColor     := tColorPallete.GetColor(Primary, value);

  ImgAbout.Bitmap           := ImgSource(TSizeF.Create(30, 30), 8, value);
  lblAbout.FontColor        := tColorPallete.GetColor(Primary, value);
end;

function TAvatarMenu.AvatarMenuItemClick(const value: TAvatarMenuItems): iAvatarMenu;
begin
  Result := Self;

  Multiview.HideMaster;

  if(Assigned(EventoAoClicarEmItemMenu))then
   EventoAoClicarEmItemMenu(value);
end;

class function TAvatarMenu.New(const Form: TForm; isDarkMode: Boolean; Translations: TDictionary<TAvatarMenuTexts, string>): iAvatarMenu;
begin
  Result := Self.Create(Form);
  TAvatarMenu(Result).Multiview.Size.Width := 0;
  TAvatarMenu(Result).SetDirection(ocdRight);

  Result.isDarkMode(isDarkMode)
          .ChangeLanguage(Translations);

  Form.AddObject(TAvatarMenu(Result).Multiview);
end;

function TAvatarMenu.OnAvatarClick(const value: TEventoClick): iAvatarMenu;
begin
   Result := self;
   EventoAvatarClick := value;
end;

function TAvatarMenu.OnAvatarMenuItemClick(const Event: TEventoAvatarMenuClick): iAvatarMenu;
begin
  Result := Self;
  EventoAoClicarEmItemMenu := Event;
end;

function TAvatarMenu.OpenMenu: iAvatarMenu;
begin
  Multiview.Size.Width := 328;
  Multiview.ShowMaster;
end;

procedure TAvatarMenu.SetDirection(const direction: TOffcanvasDirection);
begin
  fDirection := direction;

  case direction of
    ocdLeft:
     begin
       Multiview.DrawerOptions.Placement := TPanelPlacement.Left;
     end;
    ocdRight:
     begin
       Multiview.DrawerOptions.Placement := TPanelPlacement.Right;
     end;
  end;
end;

function TAvatarMenu.SetUserName(const value: string): iAvatarMenu;
begin
  Result := self;

  if(value.Trim <> EmptyStr)then
     UserName.Text := value.Trim
  else
     Username.Text := 'Anônimo';
end;

function TAvatarMenu.SetUserPhoto(const value: TBitmap): iAvatarMenu;
var
 AvatarImg: tCustomBitmapItem;
 Size: TSize;
begin
  Result := Self;
  AvatarPhoto := value;

  if(Assigned(AvatarPhoto))then
     AvatarPicture.Fill.Bitmap.Bitmap := AvatarPhoto
  else
   if ImgAvatar.BitmapItemByName(TUtils.Iif(IsDarkTheme, 'Dark', 'Light'), AvatarImg, size) then
     AvatarPicture.Fill.Bitmap.Bitmap := AvatarImg.Bitmap;
end;

end.
