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
  eTasks.Components.Interfaces,
  System.Generics.Collections,
  eTasks.Components.TranslationEnums;
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
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    PosicaoCentralY     : Double;
    OnConfirm           : TEventoClick;
    OnCancel            : TEventoClick;
    fFromImageList      : TImageList;
    fErroMessageToCopy  : string;
    fToastMsgSuccess    : string;
    fToastMsgError      : string;
    procedure ShowDialog(const Opcoes: TDialogOptions);
    procedure HideDialog;
    procedure IsDarkMode(const value: Boolean);
    procedure SettingDialogAnimationToShow;
    procedure HandlingDialogOptions(const Options: TDialogOptions);
    procedure ChangeLanguage(const Texts: TDictionary<TDialogTexts, string>);
  public
    { Public declarations }

    class var ContainerPrincipal : TFmxObject;
    class var fDialogTexts       : TDictionary<TDialogTexts, string>;

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
  FMX.Platform, eTasks.Shared.Utils,
  eTasks.Components.DialogType, eTranslate4Pascal;

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
  DialogService.OnChangeLanguage(ChangeLanguage);
  DialogService.OnDarkMode(IsDarkMode);

  IsDarkMode(DialogService.isDark);
end;

procedure TModalDialog.FormDestroy(Sender: TObject);
begin
  if(Assigned(fDialogTexts))then
   FreeAndNil(fDialogTexts);
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
procedure TModalDialog.SettingDialogAnimationToShow;
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

procedure TModalDialog.HandlingDialogOptions(const Options: TDialogOptions);
begin
  ChangeLanguage(fDialogTexts);
  DialogIcon.Bitmap := fFromImageList.Bitmap(TSize.Create(40, 40), ord(Options.TipoDeDialogo));

  if(Options.TipoDeDialogo = TDialogType.Error)then
   DetailAccordion.Height := 52
  else
   DetailAccordion.Height := 0;

  DetailAccordion.Visible := Options.TipoDeDialogo = TDialogType.Error;

  lblTitle.Text   := Options.Titulo;
  lblMessage.Text := Options.Mensagem;

//  btnConfirmar.Hint := 'Confirmar';
//  btnCancelar.Hint  := 'Cancelar';
//  btnCopiar.Hint    := 'Copiar';
//  DetailAccordion.SetTitle('Detalhes do Erro');
  DetailAccordion.SetDetails(Options.Stacktrace);

  btnCopiar.Visible := Options.TipoDeDialogo = TDialogType.Error;

  btnCancelar.Visible := (Options.TipoDeDialogo = TDialogType.ConfirmDelete) or (Options.TipoDeDialogo = TDialogType.Confirm);
end;

procedure TModalDialog.ShowDialog(const Opcoes: TDialogOptions);
begin
  //Set the Accordion to begin collapsed
  DetailAccordion.BeginCollapsed;

  SettingDialogAnimationToShow;

  HandlingDialogOptions(Opcoes);

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

procedure TModalDialog.IsDarkMode(const value: Boolean);
begin
  ModalDialog.Fill.Color            := tColorPallete.GetColor(Cor.Background, value);
  lblTitle.TextSettings.FontColor   := tColorPallete.GetColor(Cor.Primary, value);
  lblMessage.TextSettings.FontColor := tColorPallete.GetColor(Cor.Primary, value);
  fFromImageList                    := TUtils.Iif(value, ImgDialogDark, ImgDialogLight);
  DetailAccordion.IsDarkMode(value);
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
         ToastService.ShowSuccess(fToastMsgSuccess);
       except
         ToastService.ShowError(fToastMsgError);
       end;

      end;
   except

   end;
end;

procedure TModalDialog.ChangeLanguage(const Texts: TDictionary<TDialogTexts, string>);
var
  Par : TPair<TDialogTexts, string>;
begin
  if(Assigned(Texts))then
   begin
     DetailAccordion.SetTitle(TUtils.Iif(Texts.ContainsKey(TDialogTexts.MoreDetails), Texts[TDialogTexts.MoreDetails], 'Mais detalhes'));
     btnConfirmar.hint             := TUtils.Iif(Texts.ContainsKey(TDialogTexts.OkButton), Texts[TDialogTexts.OkButton], 'Confirmar');
     btnCancelar.Hint              := TUtils.Iif(Texts.ContainsKey(TDialogTexts.CancelButton), Texts[TDialogTexts.CancelButton], 'Cancelar');
     btnCopiar.Hint                := TUtils.Iif(Texts.ContainsKey(TDialogTexts.CopyButton), Texts[TDialogTexts.CopyButton], 'Copiar');
     fToastMsgSuccess              := TUtils.Iif(Texts.ContainsKey(TDialogTexts.CopySuccessMsg), Texts[TDialogTexts.CopySuccessMsg], 'Detalhes do erro copiados com sucesso!');
     fToastMsgError                := TUtils.Iif(Texts.ContainsKey(TDialogTexts.CopyErrorMsg), Texts[TDialogTexts.CopyErrorMsg], 'Falha ao copiar detalhes!');

     if(not Assigned(fDialogTexts))then
      fDialogTexts := TDictionary<TDialogTexts, string>.Create;

     for Par in Texts do
      begin
       if(fDialogTexts.ContainsKey(Par.key))then
        fDialogTexts[Par.Key] := Par.Value
       else
        fDialogTexts.Add(Par.Key, Par.Value);
      end;
   end
  else
   begin
     DetailAccordion.SetTitle('Mais detalhes');
     btnConfirmar.hint := 'Confirmar';
     btnCancelar.Hint  := 'Cancelar';
     btnCopiar.Hint    := 'Copiar';
     fToastMsgSuccess  := 'Detalhes do erro copiados com sucesso!';
     fToastMsgError    := 'Falha ao copiar detalhes!';
   end;
end;

{$endregion}

end.
