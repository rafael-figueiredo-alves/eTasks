unit eTasks.View.Dialogs.Termos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo;

type
  TDlg_Termos = class(TForm)
    Lay_dlg_termos: TLayout;
    RecEscurecer: TRectangle;
    Lay_caixa_msg: TLayout;
    RecDesignCaixa: TRectangle;
    Container_principal: TLayout;
    Lay_topo: TLayout;
    Img_logo_termos: TImage;
    Img_titulo_termos: TImage;
    Container_botao: TLayout;
    Button_message: TImage;
    Memo1: TMemo;
    procedure RecEscurecerClick(Sender: TObject);
    procedure Button_messageClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Function Exibe : TLayout;
    Procedure Fechar;
  end;

var
  Dlg_Termos: TDlg_Termos;

implementation

{$R *.fmx}

procedure TDlg_Termos.Button_messageClick(Sender: TObject);
begin
    Self.DisposeOf;
end;

function TDlg_Termos.Exibe: TLayout;
begin
   Result := Lay_dlg_termos;
end;

procedure TDlg_Termos.Fechar;
begin
   Self.RecEscurecerClick(self);
end;

procedure TDlg_Termos.RecEscurecerClick(Sender: TObject);
begin
    Self.DisposeOf;
end;

end.
