unit eTasks.View.Android.listas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Ani, FMX.Objects, FMX.TabControl;

type
  Tandroid_listas = class(TForm)
    Lay_main: TLayout;
    ToolBar_container: TLayout;
    ToolBar: TLayout;
    Linha_titulo: TLine;
    Botao_voltar: TImage;
    botao_ajuda: TImage;
    title_MinhasListas: TImage;
    title_EditaItemLista: TImage;
    title_NovoItemLista: TImage;
    RecStatus: TRectangle;
    AnimaStatus: TFloatAnimation;
    TabListas: TTabControl;
    procedure AnimaStatusFinish(Sender: TObject);
    procedure Botao_voltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  android_listas: Tandroid_listas;

implementation

{$R *.fmx}

procedure Tandroid_listas.AnimaStatusFinish(Sender: TObject);
begin
  if AnimaStatus.Inverse = False then
   begin
    AnimaStatus.Inverse := true;
   end
  else
   begin
    AnimaStatus.Inverse := false;
    ModalResult := mrOk;
   end;
end;

procedure Tandroid_listas.Botao_voltarClick(Sender: TObject);
begin
  AnimaStatus.Start;
end;

procedure Tandroid_listas.FormShow(Sender: TObject);
begin
  AnimaStatus.Start;
end;

end.
