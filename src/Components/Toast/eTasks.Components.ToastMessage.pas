unit eTasks.Components.ToastMessage;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Effects, FMX.Controls.Presentation, FMX.StdCtrls,
  System.ImageList, FMX.ImgList, eTasks.Components.ToastType;

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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowToastMessage(const Mensagem: string; const Tipo: TToastType);
    procedure HideToastMessage;

    class procedure New(const Form: TForm);
  end;

var
  ToastMessage: TToastMessage;

implementation

uses
  eTasks.Components.ToastService;

{$R *.fmx}

{ TToastMessage }

procedure TToastMessage.FormCreate(Sender: TObject);
begin
  ToastService.OnShow(ShowToastMessage);
  ToastService.OnHide(HideToastMessage);
end;

procedure TToastMessage.HideToastMessage;
begin

end;

class procedure TToastMessage.New(const Form: TForm);
begin
    Form.AddObject(self.Create(Form).MainContainer);
end;

procedure TToastMessage.ShowToastMessage(const Mensagem: string;
  const Tipo: TToastType);
begin

end;

end.
