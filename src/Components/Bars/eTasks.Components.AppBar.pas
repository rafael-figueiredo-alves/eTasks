unit eTasks.Components.AppBar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Effects,
  System.ImageList, FMX.ImgList;

type
  TEventoClick = procedure(sender: TObject) of object;

  iAppBar = interface
    ['{D3781F3B-96FF-4017-9F8E-5472178C9ABB}']
    function ChangeTitle(const Title: string): iAppBar;
    function ShowTitleBar(const value: Boolean): TRectangle;
    function Render: TRectangle;
    function ThemeChangerClick(const Evento: TEventoClick): iAppBar;
  end;

  TAppBar = class(TForm, iAppBar)
    Rectangle1: TRectangle;
    ShadowEffect1: TShadowEffect;
    BrandTitle: TLabel;
    BrandImage: TImage;
    Avatar: TCircle;
    BtnMainMenu: TImage;
    BtnThemeChanger: TImage;
    TitleBar: TRectangle;
    Title: TLabel;
    ImageList1: TImageList;
    procedure BtnThemeChangerClick(Sender: TObject);
  private
    fThemeChangerClick: TEventoClick;
    { Private declarations }
  public
    { Public declarations }
    function ChangeTitle(const Title: string): iAppBar;
    function ShowTitleBar(const value: Boolean): TRectangle;
    function Render: TRectangle;
    function ThemeChangerClick(const Evento: TEventoClick): iAppBar;
    class function New(const Form: TForm): iAppBar;
  end;

var
  AppBar: TAppBar;

implementation

{$R *.fmx}

{ TAppBar }

procedure TAppBar.BtnThemeChangerClick(Sender: TObject);
begin
  BtnThemeChanger.Bitmap := ImageList1.Bitmap(TSizeF.Create(40, 40), 0);
  Self.Rectangle1.Fill.Color := TAlphaColors.Black;
  fThemeChangerClick(sender);
end;

function TAppBar.ChangeTitle(const Title: string): iAppBar;
begin
  self.Title.Text := Title;
  Result := self;
end;

class function TAppBar.New(const Form: TForm): iAppBar;
begin
  Result := self.Create(Form);
  Form.AddObject(Result.Render);
end;

function TAppBar.Render: TRectangle;
begin
  Result := Self.Rectangle1;
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
