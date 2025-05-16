unit eTasks.Components.ModalDialog;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  eTasks.Components.DialogOptions;

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
    procedure MainContainerDlgResized(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ShowDialog(const Opcoes: TDialogOptions);
    procedure HideDialog;
  public
    { Public declarations }

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

procedure TModalDialog.FormCreate(Sender: TObject);
begin
  DialogService.OnShow(ShowDialog);
  DialogService.OnHide(HideDialog);
end;

procedure TModalDialog.HideDialog;
begin
  maincontainerdlg.Visible := false;
end;

procedure TModalDialog.MainContainerDlgResized(Sender: TObject);
const
  MARGIN = 20; // Margin from parent form edges
  DESKTOP_WIDTH = 800; // Modal width for desktop (modal-lg)
  MOBILE_WIDTH = 90; // Percentage of screen width for mobile
  MAX_HEIGHT_PERCENT = 90; // Max height as percentage of parent height
var
  ScreenWidth, ParentHeight: single;
  IsMobile: Boolean;
begin
  ScreenWidth := MainContainerdlg.Width;
  IsMobile := ScreenWidth < 768;

  if IsMobile then
    ModalContent.Width := Round(ScreenWidth * MOBILE_WIDTH / 100)
  else
    if((ScreenWidth >= 768) and (ScreenWidth <= 820))then
      ModalContent.Width := (ScreenWidth - MARGIN)
    else
      ModalContent.Width := DESKTOP_WIDTH;
end;

class procedure TModalDialog.New(const Form: TForm);
begin
   Form.AddObject(self.Create(Form).MainContainerdlg);
end;

procedure TModalDialog.ShowDialog(const Opcoes: TDialogOptions);
begin
  maincontainerdlg.Visible := true;
  MainContainerdlg.BringToFront;
  ShowMessage('E aí?');
end;

end.
