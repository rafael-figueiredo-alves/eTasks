unit eTasks.Components.ModalDialog;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  eTasks.Components.DialogOptions, FMX.Ani, eTasks.Components.Accordion;

type
  TModalDialog = class(TForm)
    MainContainerDlg: TLayout;
    Backdrop: TRectangle;
    ModalContent: TLayout;
    ModalDialog: TRectangle;
    ImageHeader: TLayout;
    DialogIcon: TImage;
    HeaderTitle: TLayout;
    lblTitle: TLabel;
    Footer: TLayout;
    Layout1: TLayout;
    btnConfirmar: TImage;
    btnCancelar: TImage;
    btnCopiar: TImage;
    FadeIn: TFloatAnimation;
    FadeOut: TFloatAnimation;
    TesteAni: TFloatAnimation;
    lblMessage: TLabel;
    Accordion1: TAccordion;
    ZoomInOutHeight: TFloatAnimation;
    ZoomInOutWidth: TFloatAnimation;
    SlideIn: TFloatAnimation;
    procedure MainContainerDlgResized(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FadeOutFinish(Sender: TObject);
    procedure FadeInProcess(Sender: TObject);
    procedure Accordion1AccordionButtonClick(Sender: TObject);
    procedure BackdropClick(Sender: TObject);
    procedure SlideInFinish(Sender: TObject);
  private
    { Private declarations }
    PosicaoCentralY : Double;
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

procedure TModalDialog.Accordion1AccordionButtonClick(Sender: TObject);
begin
  Accordion1.ExpandOrCollapse;
end;

procedure TModalDialog.BackdropClick(Sender: TObject);
begin
  ZoomInOutHeight.StartValue := 1;
  ZoomInOutHeight.StopValue  := 1.01;

  ZoomInOutWidth.StartValue := 1;
  ZoomInOutWidth.StopValue  := 1.01;

  ZoomInOutHeight.Start;
  ZoomInOutWidth.Start;
end;

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

  Accordion1.OnResizeAccordion(MainContainerDlgResized);

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
    MaxBottom := 10 + ImageHeader.Height + HeaderTitle.Height + 13 + Footer.Height + lblMessage.Height + 10 + 20 + Accordion1.Height;

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
var
 Xpos: double;
begin
ModalContent.Align := TAlignLayout.None;
  Backdrop.parent := ContainerPrincipal;
  MainContainerDlgResized(nil);

  PosicaoCentralY := ModalContent.Position.Y;
  XPos := ModalContent.Position.X;
//  ModalContent.Align := TAlignLayout.None;
  ModalContent.Position.x := Xpos;

  ModalContent.Position.Y := PosicaoCentralY - 30;

  SlideIn.StartFromCurrent := True;
  SlideIn.StopValue        := PosicaoCentralY;

  Backdrop.Visible := true;
  Backdrop.Opacity := 0;

  lblTitle.Text := Opcoes.Titulo;
  lblMessage.Text := Opcoes.Mensagem;

  SlideIn.Start;
  FadeIn.Start;
  MainContainerDlgResized(nil);
end;

procedure TModalDialog.SlideInFinish(Sender: TObject);
begin
  ModalContent.Align := TAlignLayout.Center;
end;

end.
