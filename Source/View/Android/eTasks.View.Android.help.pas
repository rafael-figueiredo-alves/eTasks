unit eTasks.View.Android.help;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.WebBrowser,
  FMX.Objects, FMX.Layouts;

type
  TForm_Android_Ajuda = class(TForm)
    Lay_main: TLayout;
    recFundo: TRectangle;
    Lay_barra_superior_ajuda: TLayout;
    Btn_voltar: TImage;
    btn_menu_ajuda: TImage;
    Titulo_ajuda: TImage;
    Linha_sup_ajuda: TLine;
    WB_ajuda: TWebBrowser;
    procedure FormShow(Sender: TObject);
    procedure Btn_voltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Android_Ajuda: TForm_Android_Ajuda;

implementation

{$R *.fmx}

procedure TForm_Android_Ajuda.Btn_voltarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TForm_Android_Ajuda.FormShow(Sender: TObject);
begin
  WB_ajuda.URL := 'https://rafael-figueiredo-alves.github.io/eTasks/';
end;

end.
