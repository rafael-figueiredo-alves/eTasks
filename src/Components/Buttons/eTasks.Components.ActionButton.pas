unit eTasks.Components.ActionButton;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Objects,
  FMX.Layouts,
  FMX.Effects,
  eTasks.Components.Interfaces;

type
  TActionButton = class(TForm, iActionButton)
    LayoutActionButton: TLayout;
    Button: TCircle;
    ImgAdd: TImage;
    Sombra: TShadowEffect;
  private
    { Private declarations }
    fOnClickClick : TEventoClick;
  public
    { Public declarations }
    function isDarkMode(const value: boolean): iActionButton;
    function SetHint(const value: string): iActionButton;
    function OnClick(const Event: TEventoClick): iActionButton;

    class function New(const Form: TForm): iActionButton;
  end;

var
  ActionButton: TActionButton;

implementation

{$R *.fmx}

{ TActionButton }

function TActionButton.isDarkMode(const value: boolean): iActionButton;
begin

end;

class function TActionButton.New(const Form: TForm): iActionButton;
begin
  Result := Self.Create(Form);
  Form.AddObject(TActionButton(Result).LayoutActionButton);
end;

function TActionButton.OnClick(const Event: TEventoClick): iActionButton;
begin

end;

function TActionButton.SetHint(const value: string): iActionButton;
begin

end;

end.
