unit eTasks.View.Windows.help;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.WebBrowser, FMX.StdCtrls, FMX.Edit, FMX.SearchBox,
  FMX.ListBox, FMX.Controls.Presentation, FMX.MultiView, FMX.Effects;

type
  TForm_Windows_Ajuda = class(TForm)
    Lay_main: TLayout;
    recFundo: TRectangle;
    Lay_barra_superior_ajuda: TLayout;
    Btn_voltar: TImage;
    btn_menu_ajuda: TImage;
    Titulo_ajuda: TImage;
    Linha_sup_ajuda: TLine;
    MenuAjuda: TMultiView;
    ListaTopicos: TListBox;
    SearchBox_topico_ajuda: TSearchBox;
    Lay_top_menu_ajuda: TLayout;
    Btn_Fecha_menu_ajuda: TImage;
    Label_menu_ajuda: TLabel;
    Lay_main_container: TLayout;
    Lay_container_wb: TLayout;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    StyleBook1: TStyleBook;
    Label1: TLabel;
    Image1: TImage;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    procedure Btn_voltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_menu_ajudaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListBox1ItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure ListBox1Click(Sender: TObject);
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

uses
  eTasks.view.categorias;

{$R *.fmx}

{ TForm_Windows_Ajuda }

function TForm_Windows_Ajuda.BtnVoltarClick(Value: TProc): TForm_windows_ajuda;
begin
  Result := Self;
  FBtnVoltarClick := value;
end;

procedure TForm_Windows_Ajuda.btn_menu_ajudaClick(Sender: TObject);
begin
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
Var
 item : integer;
begin
  tCategorias.New.MontaListagem(listbox1);
  for item := 1 to ListBox1.Count-1 do
   begin
    if ListBox1.ListItems[item].TagString = 'Cat_052' then
     begin
       Label1.Text := 'Cat_052';
       Image1.Parent := ListBox1.ListItems[item];
       image1.BringToFront;
     end;
   end;
  {ListBox1.ItemIndex := 0;
  label1.Text :=  ListBox1.Selected.TagString;
  image1.Parent := ListBox1.Selected;
  image1.BringToFront;}
  //Rectangle1.Parent := ListBox1.Selected;
  //Rectangle1.Visible := true;
end;

procedure TForm_Windows_Ajuda.FormShow(Sender: TObject);
begin
  ListBox1.Clear;
  tCategorias.New.MontaListagem(listbox1);
end;

procedure TForm_Windows_Ajuda.ListBox1Click(Sender: TObject);
begin
  //ShowMessage('Teste 1');
end;

procedure TForm_Windows_Ajuda.ListBox1ItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  Label1.Text := Item.TagString;
  image1.Parent := Item;
  image1.BringToFront;
end;

end.
