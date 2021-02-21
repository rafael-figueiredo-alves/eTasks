unit eTasks.View.Android.help;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.WebBrowser,
  FMX.Objects, FMX.Layouts, FMX.Edit, FMX.SearchBox, FMX.ListBox,
  FMX.Controls.Presentation, FMX.MultiView, FMX.StdCtrls;

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
    Img_espelho: TImage;
    MenuAjuda: TMultiView;
    StyleBook1: TStyleBook;
    ListaTopicos: TListBox;
    Lay_top_menu_ajuda: TLayout;
    SearchBox_topico_ajuda: TSearchBox;
    Btn_Fecha_menu_ajuda: TImage;
    Label_menu_ajuda: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Btn_voltarClick(Sender: TObject);
    procedure btn_menu_ajudaClick(Sender: TObject);
    procedure MenuAjudaHidden(Sender: TObject);
    procedure Btn_Fecha_menu_ajudaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Android_Ajuda: TForm_Android_Ajuda;

implementation

{$R *.fmx}

procedure TForm_Android_Ajuda.Btn_Fecha_menu_ajudaClick(Sender: TObject);
begin
  MenuAjuda.HideMaster;
end;

procedure TForm_Android_Ajuda.btn_menu_ajudaClick(Sender: TObject);
begin
  Img_espelho.Bitmap := WB_ajuda.MakeScreenshot;
  WB_ajuda.Visible := False;
  Img_espelho.Visible := True;
  MenuAjuda.ShowMaster;
end;

procedure TForm_Android_Ajuda.Btn_voltarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TForm_Android_Ajuda.FormShow(Sender: TObject);
begin
  WB_ajuda.URL := 'https://rafael-figueiredo-alves.github.io/eTasks/';
end;

procedure TForm_Android_Ajuda.MenuAjudaHidden(Sender: TObject);
begin
  WB_ajuda.Visible := true;
  Img_espelho.Visible := false;
end;

end.

