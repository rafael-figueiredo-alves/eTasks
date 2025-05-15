unit eTasks.Components.ModalDialog;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TModalDialog = class(TForm)
    MainContainer: TLayout;
    Backdrop: TRectangle;
    ModalContent: TLayout;
    ModalDialog: TRectangle;
    ImageHeader: TLayout;
    DialogIcon: TImage;
    HeaderTitle: TLayout;
    Label1: TLabel;
    Footer: TLayout;
    Layout1: TLayout;
    btnConfirmar: TImage;
    btnCancelar: TImage;
    btnCopiar: TImage;
  private
    { Private declarations }
  public
    { Public declarations }

    class procedure New(const Form: TForm);
  end;

var
  ModalDialog: TModalDialog;

implementation

{$R *.fmx}

{ TModalDialog }

class procedure TModalDialog.New(const Form: TForm);
begin
   Form.AddObject(self.Create(Form).MainContainer);
end;

end.
