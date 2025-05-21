unit eTasks.Components.ModalDialog;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  eTasks.Components.DialogOptions, FMX.Ani;

type
  TModalDialog = class(TForm)
    MainContainerDlg: TLayout;
    Backdrop: TRectangle;
    ModalContent: TLayout;
    ModalDialog: TRectangle;
    ImageHeader: TLayout;
    DialogIcon: TImage;
    HeaderTitle: TLayout;
    Label1: TLabel;
    Footer: TLayout;
    Layout1: TLayout;
    btnConfirmar: TImage;
    btnCancelar: TImage;
    btnCopiar: TImage;
    FadeIn: TFloatAnimation;
    FadeOut: TFloatAnimation;
    TesteAni: TFloatAnimation;
    Label2: TLabel;
    procedure MainContainerDlgResized(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FadeOutFinish(Sender: TObject);
    procedure FadeInProcess(Sender: TObject);
  private
    { Private declarations }
    procedure ShowDialog(const Opcoes: TDialogOptions);
    procedure HideDialog;
  public
    { Public declarations }

    class var ContainerPrincipal : TFmxObject;
    class var Teste : TLayout;

    class procedure New(const Form: TForm);
  end;

var
  ModalDialog: TModalDialog;

implementation

uses
  eTasks.Components.ToastService, eTasks.Components.DialogService;

{$R *.fmx}

{ TModalDialog }

procedure TModalDialog.btnCancelarClick(Sender: TObject);
begin
  HideDialog;
end;

procedure TModalDialog.FadeInProcess(Sender: TObject);
begin
   TesteAni.Start;
end;

procedure TModalDialog.FadeOutFinish(Sender: TObject);
begin
  Backdrop.Visible := false;
end;

procedure TModalDialog.FormCreate(Sender: TObject);
begin
  Backdrop.Visible := false;
  Backdrop.Opacity := 0;

  DialogService.OnShow(ShowDialog);
  DialogService.OnHide(HideDialog);
end;

procedure TModalDialog.HideDialog;
begin
  FadeOut.Start;
end;

procedure TModalDialog.MainContainerDlgResized(Sender: TObject);
const
  MARGIN = 20; // Margin from parent form edges
  DESKTOP_WIDTH = 800; // Modal width for desktop (modal-lg)
  MOBILE_WIDTH = 90; // Percentage of screen width for mobile
  MAX_HEIGHT_PERCENT = 90; // Max height as percentage of parent height
var
  ScreenWidth : single;
  IsMobile    : Boolean;
  MaxBottom   : double;
begin
  if(Assigned(ContainerPrincipal))then
   begin
    ScreenWidth := TLayout(ContainerPrincipal).Width;
    IsMobile := ScreenWidth < 768;

    if IsMobile then
      ModalContent.Width := Round(ScreenWidth * MOBILE_WIDTH / 100)
    else
      if((ScreenWidth >= 768) and (ScreenWidth <= 820))then
        ModalContent.Width := (ScreenWidth - MARGIN)
      else
        ModalContent.Width := DESKTOP_WIDTH;

    MaxBottom := 0;
    MaxBottom := 10 + ImageHeader.Height + Label1.Height + 3 + Footer.Height + Label2.Height;

    ModalContent.Height := MaxBottom;

   end;
end;

class procedure TModalDialog.New(const Form: TForm);
var i: integer;
begin
   ContainerPrincipal := self.Create(Form).MainContainerdlg;
   Form.AddObject(ContainerPrincipal);
end;

procedure TModalDialog.ShowDialog(const Opcoes: TDialogOptions);
begin
  Backdrop.parent := ContainerPrincipal;

  Backdrop.Visible := true;
  Backdrop.Opacity := 0;

  Label1.Text := Opcoes.Titulo;
  Label2.Text := Opcoes.Mensagem;

  FadeIn.Start;
  MainContainerDlgResized(nil);

  //Backdrop.BringToFront;
end;

end.
