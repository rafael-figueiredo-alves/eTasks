unit eTasks.Components.Offcanvas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.MultiView, eTasks.Components.Interfaces;

type
  TOffcanvas = class(TForm, iOffcanvas)
    Multiview: TMultiView;
    Styles: TStyleBook;
  private
    { Private declarations }
    fDirection : TOffcanvasDirection;
    procedure SetDirection(const direction: TOffcanvasDirection);
  public
    { Public declarations }
    function Render(const Direction: TOffcanvasDirection = ocdRight; isDarkMode: Boolean = false): TMultiView;
    function isDarkMode(const value: boolean): iOffcanvas;
    function OpenMenu: iOffcanvas;
    class function New(const Form: TForm; Direction: TOffcanvasDirection = ocdRight; isDarkMode: Boolean = false): iOffcanvas;
  end;

var
  Offcanvas: TOffcanvas;

implementation

{$R *.fmx}

uses eTasks.Shared.Utils, FMX.MultiView.Types;

{ TOffcanvas }

function TOffcanvas.isDarkMode(const value: boolean): iOffcanvas;
begin
  Result := Self;
  case fDirection of
    ocdLeft: Multiview.StyleLookup := TUtils.Iif(value, 'DarkModeLeft', 'LightModeLeft');
    ocdRight: Multiview.StyleLookup := TUtils.Iif(value, 'DarkModeRight', 'LightModeRight');
   else
    Multiview.StyleLookup := TUtils.Iif(value, 'DarkModeRight', 'LightModeRight');
  end;
end;

class function TOffcanvas.New(const Form: TForm; Direction: TOffcanvasDirection; isDarkMode: Boolean): iOffcanvas;
begin
  Result := Self.Create(Form);
  Form.AddObject(Result.Render(Direction, isDarkMode));
end;

function TOffcanvas.OpenMenu: iOffcanvas;
begin
  Multiview.ShowMaster;
end;

function TOffcanvas.Render(const Direction: TOffcanvasDirection = ocdRight; isDarkMode: Boolean = false): TMultiView;
begin
  SetDirection(Direction);
  Self.isDarkMode(isDarkMode);
  Result := Multiview;
end;

procedure TOffcanvas.SetDirection(const direction: TOffcanvasDirection);
begin
  fDirection := direction;
  case direction of
    ocdLeft: Multiview.DrawerOptions.Placement := TPanelPlacement.Left;
    ocdRight: Multiview.DrawerOptions.Placement := TPanelPlacement.Right;
  end;
end;

end.
