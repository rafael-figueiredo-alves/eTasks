unit eTasks.View.Windows.help;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.WebBrowser, FMX.StdCtrls, FMX.Edit, FMX.SearchBox,
  FMX.ListBox, FMX.Controls.Presentation, FMX.MultiView;

type
  TForm_Windows_Ajuda = class(TForm)
    Lay_main: TLayout;
    recFundo: TRectangle;
    Lay_barra_superior_ajuda: TLayout;
    Btn_voltar: TImage;
    btn_menu_ajuda: TImage;
    Titulo_ajuda: TImage;
    Linha_sup_ajuda: TLine;
    WB_ajuda: TWebBrowser;
    MenuAjuda: TMultiView;
    ListaTopicos: TListBox;
    SearchBox_topico_ajuda: TSearchBox;
    Lay_top_menu_ajuda: TLayout;
    Btn_Fecha_menu_ajuda: TImage;
    Label_menu_ajuda: TLabel;
    Img_espelho: TImage;
    Lay_main_container: TLayout;
    Lay_container_wb: TLayout;
    procedure Btn_voltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_menu_ajudaClick(Sender: TObject);
    procedure MenuAjudaHidden(Sender: TObject);
  private
    { Private declarations }
    FBtnVoltarClick : TProc;
  public
    { Public declarations }
    Function Exibir : TLayout;
    Function BtnVoltarClick (Value: TProc) : TForm_windows_ajuda;
  end;

var
  Form_Windows_Ajuda: TForm_Windows_Ajuda;

implementation

{$R *.fmx}

{ TForm_Windows_Ajuda }

function TForm_Windows_Ajuda.BtnVoltarClick(Value: TProc): TForm_windows_ajuda;
begin
  Result := Self;
  FBtnVoltarClick := value;
end;

procedure TForm_Windows_Ajuda.btn_menu_ajudaClick(Sender: TObject);
begin
  Img_espelho.Bitmap := WB_ajuda.MakeScreenshot;
  WB_ajuda.Visible := False;
  Img_espelho.Visible := True;
  MenuAjuda.ShowMaster;
end;

procedure TForm_Windows_Ajuda.Btn_voltarClick(Sender: TObject);
begin
  FBtnVoltarClick;
end;

function TForm_Windows_Ajuda.Exibir: TLayout;
begin
  Result := Lay_main;
end;

procedure TForm_Windows_Ajuda.FormCreate(Sender: TObject);
begin
  WB_ajuda.URL := 'https://rafael-figueiredo-alves.github.io/eTasks/';
end;

procedure TForm_Windows_Ajuda.MenuAjudaHidden(Sender: TObject);
begin
  WB_ajuda.Visible := true;
  Img_espelho.Visible := false;
end;

end.
