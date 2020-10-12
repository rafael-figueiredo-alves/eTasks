unit eTasks.View.Windows.login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.TabControl, eTasks.View.Dialogs.Factory,
  FMX.MediaLibrary.Actions, System.Actions, FMX.ActnList, FMX.StdActns;

type
  TForm_Windows_Login = class(TForm)
    TabPrincipal: TTabControl;
    StyleBook1: TStyleBook;
    TabSplash: TTabItem;
    TabItem2: TTabItem;
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    ActionList1: TActionList;
    ActFotoGaleria: TTakePhotoFromLibraryAction;
    ActFotoCamera: TTakePhotoFromCameraAction;
    Button3: TButton;
    Button4: TButton;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    dialogs : iViewDialogsFactory;
    Termos  : iViewDialogsFactory;
  public
    { Public declarations }
  end;

var
  Form_Windows_Login: TForm_Windows_Login;

implementation

{$R *.fmx}

Uses eTasks.View.Dialogs.Messages.Consts;

procedure TForm_Windows_Login.Button1Click(Sender: TObject);
begin
       Dialogs := TViewDialogsMessages.New;
       Form_Windows_Login.AddObject(
                                    Dialogs.Pai(Self).DialogMessages
                                                     .TipoMensagem(tpmErro_brancologin)
                                                     .AcaoBotao(Procedure ()
                                                                begin
                                                                 Dialogs := nil;
                                                                end)
                                                     .AcaoFundo(Procedure ()
                                                                begin
                                                                  Dialogs := nil;
                                                                end)
                                                     .Exibe);
end;

procedure TForm_Windows_Login.Button2Click(Sender: TObject);
begin
  Termos := tviewdialogsmessages.New;
  Form_Windows_Login.AddObject(
                               Termos.Pai(self).DialogTermos
                                                     .AcaoBotao(Procedure ()
                                                                begin
                                                                 Termos := nil;
                                                                end)
                                                     .AcaoFundo(Procedure ()
                                                                begin
                                                                  termos := nil;
                                                                end)
                                                     .Exibe);
end;

procedure TForm_Windows_Login.Button3Click(Sender: TObject);
begin
   ActFotoGaleria.Execute;
end;

procedure TForm_Windows_Login.Button4Click(Sender: TObject);
begin
   ActFotoCamera.Execute;
end;

procedure TForm_Windows_Login.FormCreate(Sender: TObject);
begin
   Self.Height := 660;
   Self.Width  := 360;
end;

procedure TForm_Windows_Login.FormResize(Sender: TObject);
begin
  if Self.Height < 660 then
   Self.Height := 660;
  if Self.Width < 360 then
   Self.Width := 360;
end;

end.
