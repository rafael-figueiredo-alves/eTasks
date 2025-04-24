unit eTasks.Components.ToastMessage;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Effects, FMX.Controls.Presentation, FMX.StdCtrls,
  System.ImageList, FMX.ImgList, eTasks.Components.ToastType, FMX.Ani;

type
  TToastMessage = class(TForm)
    MainContainer: TLayout;
    ToastContainer: TLayout;
    ToastRectangle: TRectangle;
    Sombra: TShadowEffect;
    ContainerImagem: TLayout;
    ContainerBotao: TLayout;
    ContainerTexto: TLayout;
    ImagemBotaoFechar: TImage;
    TextoMensagem: TLabel;
    Images: TImageList;
    ImagemToast: TImage;
    ContainerSuperior: TLayout;
    FadeIn: TFloatAnimation;
    FadeOut: TFloatAnimation;
    procedure FormCreate(Sender: TObject);
    procedure ContainerBotaoClick(Sender: TObject);
    procedure FadeOutFinish(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FadeInFinish(Sender: TObject);
  private
    { Private declarations }
    FTimer: TTimer;
    FIsTimerRunning: Boolean;
    procedure OnTimer(Sender: TObject);
    procedure StartTimer;
    procedure StopTimer;
  public
    { Public declarations }
    procedure ShowToastMessage(const Mensagem: string; const Tipo: TToastType);
    procedure HideToastMessage;

    class procedure New(const Form: TForm);
  end;

var
  ToastMessage: TToastMessage;

const
  SuccessToastColor  : TAlphaColor = $ff66BB6A;
  ErrorToastColor    : TAlphaColor = $ffEE5351;
  IntervalToastShown : integer = 5000;

implementation

uses
  eTasks.Components.ToastService;

{$R *.fmx}

{ TToastMessage }

procedure TToastMessage.ContainerBotaoClick(Sender: TObject);
begin
  HideToastMessage;
end;

procedure TToastMessage.FadeInFinish(Sender: TObject);
begin
  Sombra.Enabled := true;
end;

procedure TToastMessage.FadeOutFinish(Sender: TObject);
begin
  MainContainer.SendToBack;
  Sombra.Enabled := false;
  FIsTimerRunning := False;
end;

procedure TToastMessage.FormCreate(Sender: TObject);
begin
  FIsTimerRunning := False;
  FTimer := TTimer.Create(nil);
  FTimer.Interval := IntervalToastShown; // 5 segundos
  FTimer.Enabled := False;
  FTimer.OnTimer := OnTimer;

  ToastRectangle.Opacity := 0;
  ToastRectangle.Visible := false;

  ToastService.OnShow(ShowToastMessage);
  ToastService.OnHide(HideToastMessage);
end;

procedure TToastMessage.FormDestroy(Sender: TObject);
begin
  OnShow := nil;
  OnHide := nil;
  StopTimer;
  FTimer.Free;
end;

procedure TToastMessage.HideToastMessage;
begin
  StopTimer;

  if(Assigned(OnHide))then
    OnHide(nil);

  FadeOut.Start;
end;

class procedure TToastMessage.New(const Form: TForm);
begin
    Form.AddObject(self.Create(Form).MainContainer);
end;

procedure TToastMessage.OnTimer(Sender: TObject);
begin
  if FIsTimerRunning then
    HideToastMessage;
end;

procedure TToastMessage.ShowToastMessage(const Mensagem: string;const Tipo: TToastType);
begin
  StopTimer;

  if(not ToastRectangle.Visible)then
    ToastRectangle.Visible := true;

  if(Assigned(OnShow))then
   OnShow(nil);

  if FadeOut.Enabled then
    FadeOut.Stop;

  // Configura a nova mensagem
  TextoMensagem.Text := Mensagem;

  case Tipo of
    Success:
      begin
        ImagemToast.Bitmap := Images.Bitmap(TSizeF.Create(50, 50), 1);
        ToastRectangle.Fill.Color := SuccessToastColor;
      end;
    Error:
      begin
        ImagemToast.Bitmap := Images.Bitmap(TSizeF.Create(50, 50), 0);
        ToastRectangle.Fill.Color := ErrorToastColor;
      end;
  end;

  // Exibe a toast
  MainContainer.BringToFront;
  FadeIn.Start;

  // Inicia o timer para fechamento automático
  StartTimer;
end;

procedure TToastMessage.StartTimer;
begin
  StopTimer; // Para qualquer timer ativo
  FIsTimerRunning := True;
  FTimer.Enabled := True;
end;

procedure TToastMessage.StopTimer;
begin
  FTimer.Enabled := False;
  FIsTimerRunning := False;
end;

end.
