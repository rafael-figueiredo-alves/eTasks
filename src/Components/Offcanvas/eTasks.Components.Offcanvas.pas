unit eTasks.Components.Offcanvas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.MultiView, eTasks.Components.Interfaces,
  FMX.Objects, FMX.Layouts, FMX.StdCtrls, FMX.Effects, System.ImageList,
  FMX.ImgList;

type
  TOffcanvas = class(TForm, iOffcanvas)
    Multiview: TMultiView;
    Styles: TStyleBook;
    LytTitle: TLayout;
    BtnClose: TImage;
    LytBtnFilters: TLayout;
    LblTitle: TLabel;
    BtnClear: TImage;
    BtnAccept: TImage;
    LineTop: TLine;
    LineShadow: TShadowEffect;
    ImgLight: TImageList;
    ImgDark: TImageList;
    Container: TVertScrollBox;
    procedure BtnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fDirection : TOffcanvasDirection;
    procedure SetDirection(const direction: TOffcanvasDirection);
    function ImgSource(const size: TSizeF; index: integer; isDarkMode: boolean): TBitmap;
    function isDarkMode(const value: boolean): iOffcanvas;
    function OpenMenu: iOffcanvas;
    class function New(const Form: TForm; Kind: TOffcanvasKind; Direction: TOffcanvasDirection = ocdRight; isDarkMode: Boolean = false): iOffcanvas;
  end;

var
  Offcanvas: TOffcanvas;

implementation

{$R *.fmx}

uses eTasks.Shared.Utils, FMX.MultiView.Types, eTasks.Components.ColorPallete;

{ TOffcanvas }

procedure TOffcanvas.BtnCloseClick(Sender: TObject);
begin
  Multiview.HideMaster;
end;

function TOffcanvas.ImgSource(const size: TSizeF; index: integer; isDarkMode: boolean): TBitmap;
begin
  Result := TUtils.Iif(isDarkMode, ImgDark.Bitmap(size, index), ImgLight.Bitmap(size, index));
end;

function TOffcanvas.isDarkMode(const value: boolean): iOffcanvas;
begin
  Result := Self;

  case fDirection of
    ocdLeft: Multiview.StyleLookup := TUtils.Iif(value, 'DarkModeLeft', 'LightModeLeft');
    ocdRight: Multiview.StyleLookup := TUtils.Iif(value, 'DarkModeRight', 'LightModeRight');
   else
    Multiview.StyleLookup := TUtils.Iif(value, 'DarkModeRight', 'LightModeRight');
  end;

   BtnClose.Bitmap      := ImgSource(TSizeF.Create(20, 20), 0, value);
   LblTitle.FontColor   := tColorPallete.GetColor(Primary, value);
   LineTop.Stroke.Color := tColorPallete.GetColor(Primary, value);
end;

class function TOffcanvas.New(const Form: TForm; Kind: TOffcanvasKind; Direction: TOffcanvasDirection; isDarkMode: Boolean): iOffcanvas;
begin
  Result := Self.Create(Form);
  TOffcanvas(Result).Multiview.Size.Width := 0;
  TOffcanvas(Result).SetDirection(Direction);
  TOffcanvas(Result).LytBtnFilters.Visible := Kind = ockFilter;
  Result.isDarkMode(isDarkMode);
  Form.AddObject(TOffcanvas(Result).Multiview);
end;

function TOffcanvas.OpenMenu: iOffcanvas;
begin
  Multiview.Size.Width := 328;
  Multiview.ShowMaster;
end;

procedure TOffcanvas.SetDirection(const direction: TOffcanvasDirection);
begin
  fDirection := direction;

  case direction of
    ocdLeft:
     begin
       Multiview.DrawerOptions.Placement := TPanelPlacement.Left;
       BtnClose.Align                    := TAlignLayout.Right;
       LytBtnFilters.Align               := TAlignLayout.Left;
       BtnClear.Align                    := TAlignLayout.Right;
     end;
    ocdRight:
     begin
       Multiview.DrawerOptions.Placement := TPanelPlacement.Right;
       BtnClose.Align                    := TAlignLayout.Left;
       LytBtnFilters.Align               := TAlignLayout.Right;
       BtnClear.Align                    := TAlignLayout.Left;
     end;
  end;
end;

end.
