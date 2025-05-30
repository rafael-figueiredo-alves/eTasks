unit eTasks.Components.ModalDialog;

interface

{$region 'Dependências Globais'}
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
  FMX.Layouts,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  eTasks.Components.DialogOptions,
  FMX.Ani,
  eTasks.Components.Accordion,
  System.ImageList,
  FMX.ImgList,
  eTasks.Components.Interfaces;
{$endregion}

type
  TModalDialog = class(TForm)
    {$region 'Componentes de Tela'}
    MainContainerDlg: TLayout;
    Backdrop: TRectangle;
    ModalContent: TLayout;
    ModalDialog: TRectangle;
    ImageHeader: TLayout;
    DialogIcon: TImage;
    HeaderTitle: TLayout;
    lblTitle: TLabel;
    Footer: TLayout;
    LayButtons: TLayout;
    btnConfirmar: TImage;
    btnCancelar: TImage;
    btnCopiar: TImage;
    FadeIn: TFloatAnimation;
    FadeOut: TFloatAnimation;
    lblMessage: TLabel;
    DetailAccordion: TAccordion;
    ZoomInOutHeight: TFloatAnimation;
    ZoomInOutWidth: TFloatAnimation;
    SlideIn: TFloatAnimation;
    SlideOut: TFloatAnimation;
    ImgDialogLight: TImageList;
    ImgDialogDark: TImageList;
    {$endregion}
    procedure MainContainerDlgResized(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FadeOutFinish(Sender: TObject);
    procedure DetailAccordionAccordionButtonClick(Sender: TObject);
    procedure BackdropClick(Sender: TObject);
    procedure SlideInFinish(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCopiarClick(Sender: TObject);
  private
    { Private declarations }
    PosicaoCentralY     : Double;
    OnConfirm           : TEventoClick;
    OnCancel            : TEventoClick;
    fErroMessageToCopy  : string;
    procedure ShowDialog(const Opcoes: TDialogOptions);
    procedure HideDialog;
    procedure SettingDialogToShow;
  public
    { Public declarations }

    class var ContainerPrincipal : TFmxObject;

    class procedure New(const Form: TForm);
  end;

var
  ModalDialog: TModalDialog;

implementation

uses
  eTasks.Components.ToastService,
  eTasks.Components.DialogService,
  eTasks.Components.ColorPallete,
  FMX.Clipboard,
  FMX.Platform;

{$R *.fmx}

{ TModalDialog }

{$region 'Accordion Action and Animation Events'}
procedure TModalDialog.DetailAccordionAccordionButtonClick(Sender: TObject);
begin
  DetailAccordion.ExpandOrCollapse;
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

procedure TModalDialog.FadeOutFinish(Sender: TObject);
begin
  Backdrop.Visible := false;
end;

procedure TModalDialog.SlideInFinish(Sender: TObject);
begin
  ModalContent.Align := TAlignLayout.Center;
end;
{$endregion}

{$region 'Class basic methods and responsive treatment'}
procedure TModalDialog.FormCreate(Sender: TObject);
begin
  Backdrop.Visible := false;
  Backdrop.Opacity := 0;

  DetailAccordion.OnResizeAccordion(MainContainerDlgResized);

  DialogService.OnShow(ShowDialog);
  DialogService.OnHide(HideDialog);
end;

procedure TModalDialog.MainContainerDlgResized(Sender: TObject);
const
  MARGIN = 20; // Margin from parent form edges
  DESKTOP_WIDTH = 800; // Modal width for desktop (modal-lg)
  MOBILE_WIDTH = 90; // Percentage of screen width for mobile
  MAX_HEIGHT_PERCENT = 90; // Max height as percentage of parent height
  TOTALMARGIN_TO_ADD = 53;
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
    MaxBottom := TOTALMARGIN_TO_ADD + ImageHeader.Height +
                 HeaderTitle.Height + Footer.Height + lblMessage.Height +
                 DetailAccordion.Height;

    ModalContent.Height := MaxBottom;
   end;
end;

class procedure TModalDialog.New(const Form: TForm);
var i: integer;
begin
   ContainerPrincipal := self.Create(Form).MainContainerdlg;
   Form.AddObject(ContainerPrincipal);
end;
{$endregion}

{$region 'Show/Hide Dialog events'}
procedure TModalDialog.SettingDialogToShow;
var
 XPos: double;
begin
  ModalContent.Align := TAlignLayout.None;
  Backdrop.parent := ContainerPrincipal;
  MainContainerDlgResized(nil);

  PosicaoCentralY := (TLayout(ContainerPrincipal).Height - ModalContent.Height) / 2;
  XPos := (TLayout(ContainerPrincipal).Width - ModalContent.Width) / 2;
  ModalContent.Position.x := Xpos;

  ModalContent.Position.Y := PosicaoCentralY - 30;

  SlideIn.StartFromCurrent := True;
  SlideIn.StopValue        := PosicaoCentralY;

  Backdrop.Visible := true;
  Backdrop.Opacity := 0;
end;

procedure TModalDialog.ShowDialog(const Opcoes: TDialogOptions);

begin
  //Set the Accordion to begin collapsed
  DetailAccordion.BeginCollapsed;

  SettingDialogToShow;

  lblTitle.Text   := Opcoes.Titulo;
  lblMessage.Text := Opcoes.Mensagem;

  SlideIn.Start;
  FadeIn.Start;
  MainContainerDlgResized(nil);
end;

procedure TModalDialog.HideDialog;
begin
  ModalContent.Align  := TAlignLayout.None;
  SlideOut.StartValue := ModalContent.Position.y;
  SlideOut.StopValue  := ModalContent.Position.y - 30;

  SlideOut.Start;
  FadeOut.Start;
end;
{$endregion}

{$Region 'Button Events'}
procedure TModalDialog.btnCancelarClick(Sender: TObject);
begin
  if(Assigned(OnCancel))then
   OnCancel(Sender);

  HideDialog;
end;

procedure TModalDialog.btnConfirmarClick(Sender: TObject);
begin
  if(Assigned(OnConfirm))then
   OnConfirm(Sender);

  HideDialog;
end;

procedure TModalDialog.btnCopiarClick(Sender: TObject);
var
  Clipboard : IFMXExtendedClipboardService;
begin
   try
     if TPlatformServices.Current.SupportsPlatformService(IFMXExtendedClipboardService, Clipboard) then
      begin
       try
         Clipboard.SetText(fErroMessageToCopy);
         ToastService.ShowSuccess('Detalhes do erro copiados com sucesso!');
       except

       end;

      end;
   except

   end;
end;
{$endregion}

end.
