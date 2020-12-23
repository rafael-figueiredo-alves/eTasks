unit eTasks.View.Android.main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Effects, FMX.Objects,
  FMX.MultiView, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView;

type
  TForm_Android_main = class(TForm)
    Button1: TButton;
    Lay_main: TLayout;
    Estilos_Login: TStyleBook;
    Lay_barra_superior: TLayout;
    LogoTipo_eTasks: TImage;
    Btn_Menu: TCircle;
    ShadowEffect1: TShadowEffect;
    RecListaPrincipal: TRectangle;
    ShadowEffect2: TShadowEffect;
    Img_user_sem_photo: TImage;
    MainMenu: TMultiView;
    Btn_fecha_main_menu: TImage;
    FundoMenu: TRectangle;
    Lay_Topo_lista: TLayout;
    Lay_data_select: TLayout;
    Btn_Volta_data: TImage;
    Btn_Avanca_data: TImage;
    Label_Data: TLabel;
    Img_Concluido: TImage;
    Img_Afazer: TImage;
    Btn_Add_tarefa: TImage;
    ListaTarefas: TListView;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Btn_MenuClick(Sender: TObject);
    procedure Btn_fecha_main_menuClick(Sender: TObject);
    procedure Btn_Volta_dataClick(Sender: TObject);
    procedure Btn_Avanca_dataClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Android_main: TForm_Android_main;

implementation

{$R *.fmx}

Uses
  eTasks.libraries.Android, eTasks.Controller.Login, eTasks.View.Android.login, eTasks.Controller.Interfaces,
  eTasks.Controller.Usuario, eTasks.libraries.Imagens64;

procedure TForm_Android_main.Btn_Avanca_dataClick(Sender: TObject);
begin
  Label_Data.Text := DateToStr(StrToDate(Label_Data.Text) + 1);
end;

procedure TForm_Android_main.Btn_fecha_main_menuClick(Sender: TObject);
begin
  MainMenu.HideMaster;
end;

procedure TForm_Android_main.Btn_MenuClick(Sender: TObject);
begin
   MainMenu.ShowMaster;
end;

procedure TForm_Android_main.Btn_Volta_dataClick(Sender: TObject);
begin
  Label_Data.Text := DateToStr(StrToDate(Label_Data.Text) - 1);
end;

procedure TForm_Android_main.Button1Click(Sender: TObject);
begin
  if tControllerLogin.New.EfetuarLogout = true then
   begin
      if not Assigned(Form_Android_login) then
       Application.CreateForm(TForm_Android_login, Form_Android_login);
      Application.MainForm := Form_Android_login;
      Form_Android_login.Show;
      MainMenu.HideMaster;
      Close;
   end;
end;

procedure TForm_Android_main.FormCreate(Sender: TObject);
var
 AUsuario : iControllerUsuario;
 BitMap : TBitmap;
begin
  tLibraryAndroid.TransparentNavBar;
  AUsuario := tControllerUsuario.New.Ler;
  if AUsuario.Foto <> '' then
   begin
    BitMap := TImagens64.fromBase64(AUsuario.Foto);
    Btn_Menu.Fill.Bitmap.Bitmap := BitMap;
    BitMap.DisposeOf;
   end
  else
   Btn_Menu.Fill.Bitmap.Bitmap := Img_user_sem_photo.Bitmap;
  MainMenu.Width := Screen.Width + 2;
  Label_Data.Text := DateToStr(Now);
end;

end.
