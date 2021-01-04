unit eTasks.View.Windows.main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.ListBox;

type
  TForm_Windows_Main = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Circle1: TCircle;
    Button1: TButton;
    Image1: TImage;
    ListBox1: TListBox;
    Button2: TButton;
    Button3: TButton;
    StyleBook1: TStyleBook;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Windows_Main: TForm_Windows_Main;

implementation

uses
  eTasks.Controller.Usuario, eTasks.Controller.Interfaces,
  eTasks.libraries.Imagens64, eTasks.view.categorias;

{$R *.fmx}


procedure TForm_Windows_Main.Button1Click(Sender: TObject);
Var
 Bitmap : TBitmap;
begin
  Bitmap := TImagens64.fromBase64(TCategorias.New.PegaImagem('Cat_001'));
  Image1.Bitmap := Bitmap;
  Bitmap.DisposeOf;
end;

procedure TForm_Windows_Main.Button2Click(Sender: TObject);
begin
  TCategorias.New.MontaListagem(ListBox1);
end;

procedure TForm_Windows_Main.Button3Click(Sender: TObject);
Var
 lbitem    : TListBoxItem;
 ItemImage : TImage;
begin
  ListBox1.BeginUpdate;
  ListBox1.Items.Clear;
  lbitem             := TListBoxItem.Create(nil);
  lbitem.Parent      := ListBox1;
  lbitem.StyleLookup := 'ListBoxItem1Style1';
  ItemImage          := lbitem.FindStyleResource('imgage2') as TImage;
  if Assigned(ItemImage) then
   begin
    ItemImage.Bitmap := Image1.Bitmap;
   end;
   ListBox1.EndUpdate;
end;

procedure TForm_Windows_Main.FormCreate(Sender: TObject);
Var
  AUsuario : iControllerUsuario;
  bitmap   : TBitmap;
begin
  AUsuario := tControllerUsuario.New.Ler;
  Label1.Text := AUsuario.Nome;
  Label2.Text := AUsuario.Email;
  Bitmap      := timagens64.fromBase64(AUsuario.Foto);
  Circle1.Fill.Bitmap.Bitmap := Bitmap;
  bitmap.DisposeOf;
end;

end.
