unit eTasks.Components.AvatarMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Objects, FMX.StdCtrls, FMX.Layouts, FMX.Controls.Presentation,
  FMX.MultiView, System.ImageList, FMX.ImgList, eTasks.Components.Interfaces;

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
    Layout4: TLayout;
    BtnClose: TImage;
    Layout5: TLayout;
    LineTop: TLine;
    LineShadow: TShadowEffect;
    Container: TVertScrollBox;
  private
    { Private declarations }
    fDirection : TOffcanvasDirection;
    procedure SetDirection(const direction: TOffcanvasDirection);
    function ImgSource(const size: TSizeF; index: integer; isDarkMode: boolean): TBitmap;
  public
    { Public declarations }
    function isDarkMode(const value: boolean): iAvatarMenu;
    function OpenMenu: iAvatarMenu;

    class function New(const Form: TForm; Direction: TOffcanvasDirection = ocdRight; isDarkMode: Boolean = false): iAvatarMenu;
  end;

var
  Form1: TAvatarMenu;

implementation

uses
  eTasks.Shared.Utils, FMX.MultiView.Types;

{$R *.fmx}

{ TAvatarMenu }

function TAvatarMenu.ImgSource(const size: TSizeF; index: integer;isDarkMode: boolean): TBitmap;
begin
  Result := TUtils.Iif(isDarkMode, ImgDark.Bitmap(size, index), ImgLight.Bitmap(size, index));
end;

function TAvatarMenu.isDarkMode(const value: boolean): iAvatarMenu;
begin
  Result := Self;

  case fDirection of
    ocdLeft: Multiview.StyleLookup := TUtils.Iif(value, 'AvatarDarkModeLeft', 'AvatarLightModeLeft');
    ocdRight: Multiview.StyleLookup := TUtils.Iif(value, 'AvatarDarkModeRight', 'AvatarLightModeRight');
   else
    Multiview.StyleLookup := TUtils.Iif(value, 'AvatarDarkModeRight', 'AvatarLightModeRight');
  end;
end;

class function TAvatarMenu.New(const Form: TForm; Direction: TOffcanvasDirection; isDarkMode: Boolean): iAvatarMenu;
begin
  Result := Self.Create(Form);
  TAvatarMenu(Result).SetDirection(Direction);
  Result.isDarkMode(isDarkMode);
  Form.AddObject(TAvatarMenu(Result).Multiview);
end;

function TAvatarMenu.OpenMenu: iAvatarMenu;
begin
  Multiview.ShowMaster;
end;

procedure TAvatarMenu.SetDirection(const direction: TOffcanvasDirection);
begin
  fDirection := direction;

  case direction of
    ocdLeft:
     begin
       Multiview.DrawerOptions.Placement := TPanelPlacement.Left;
//       BtnClose.Align                    := TAlignLayout.Right;
//       LytBtnFilters.Align               := TAlignLayout.Left;
//       BtnClear.Align                    := TAlignLayout.Right;
     end;
    ocdRight:
     begin
       Multiview.DrawerOptions.Placement := TPanelPlacement.Right;
//       BtnClose.Align                    := TAlignLayout.Left;
//       LytBtnFilters.Align               := TAlignLayout.Right;
//       BtnClear.Align                    := TAlignLayout.Left;
     end;
  end;
end;

end.
