unit eTasks.Components.TitleBar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  eTasks.Components.Interfaces;

type


  TTitleBar = class(TForm, iTitleBar)
    LayoutTitleBar: TLayout;
    TitleBar: TRectangle;
    TitleBarText: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    function SetTitle(const Title: string): iTitleBar;
    function isDarkMode(const value: boolean): iTitleBar;
    function Resize(const FormWidth: Integer): iTitleBar;

    class function New(const Form: TForm; const Layout: TLayout): iTitleBar;
  end;

var
  TitleBar : TTitleBar ;

implementation

uses
  eTasks.Components.ColorPallete,
  eTasks.Shared.Consts;

{$R *.fmx}

{ TTitleBar }

function TTitleBar.SetTitle(const Title: string): iTitleBar;
begin
  Result := self;
  self.TitleBarText.text := Title;
end;

function TTitleBar.Resize(const FormWidth: Integer): iTitleBar;
begin
  Result := Self;
  self.TitleBar.Visible := FormWidth <= MobileSizeWidth;
  self.TitleBar.Width := Round((FormWidth * 70) / 100);
end;

function TTitleBar.isDarkMode(const value: boolean): iTitleBar;
begin
  Result := self;
  Self.TitleBar.Fill.Color    := tColorPallete.GetColor(Primary, value);
  Self.TitleBarText.FontColor := tColorPallete.GetColor(Text, not value);
end;

class function TTitleBar.New(const Form: TForm; const Layout: TLayout): iTitleBar;
begin
  Result := self.create(Form);
  Layout.AddObject(TTitleBar(Result).LayoutTitleBar);
end;

end.
