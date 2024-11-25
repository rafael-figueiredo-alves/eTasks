unit eTasks.View.PageLayout;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, eTasks.View.Interfaces;

type


  TPageLayout = class(TForm, iPageLayout)
    Button1: TButton;
    PageViewLayout: TLayout;
    Background: TRectangle;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    MainLayout: TLayout;
    UpdateScreenMethod : TUpdateScreenMethod;
    procedure GoBack;
    procedure RemovePageViewLayout;
  public
    { Public declarations }
    function Layout: TLayout;
    function IsMobile(const Value: boolean): iPageLayout;

    class function New(const pLayout: TLayout; pUpdateScreenMethod: TUpdateScreenMethod) : iPageLayout;
    destructor Destroy; override;
  end;

var
  PageLayout: TPageLayout;

implementation

{$R *.fmx}

{ TPageLayout }

procedure TPageLayout.Button1Click(Sender: TObject);
begin
  GoBack;
end;

destructor TPageLayout.Destroy;
begin
  RemovePageViewLayout;

  inherited;
end;

procedure TPageLayout.GoBack;
begin
    RemovePageViewLayout;

    Application.ProcessMessages;

    UpdateScreenMethod;
end;

function TPageLayout.IsMobile(const Value: boolean): iPageLayout;
begin
  Result := Self;
  if(Value)then
   Label1.Text := 'Mobile'
  else
   Label1.Text := 'Desktop';
end;

class function TPageLayout.New(const pLayout: TLayout; pUpdateScreenMethod: TUpdateScreenMethod): iPageLayout;
begin
  PageLayout := Self.Create(pLayout);
  PageLayout.MainLayout := pLayout;
  pLayout.AddObject(PageLayout.PageViewLayout);
  PageLayout.UpdateScreenMethod := pUpdateScreenMethod;
  Result := PageLayout;
end;

procedure TPageLayout.RemovePageViewLayout;
begin
  if Assigned(MainLayout) and MainLayout.ContainsObject(PageViewLayout) then
    MainLayout.RemoveObject(PageViewLayout);
end;

function TPageLayout.Layout: TLayout;
begin
  Result := Self.PageViewLayout;
end;

end.
