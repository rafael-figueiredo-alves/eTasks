unit eTasks.View.Windows.main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TForm_Windows_Main = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Circle1: TCircle;
    procedure FormCreate(Sender: TObject);
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
  eTasks.libraries.Imagens64;

{$R *.fmx}


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
