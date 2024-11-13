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
  eTasks.Components.Interfaces, FMX.Ani;

type
  TActionButton = class(TForm, iActionButton)
    LayoutActionButton: TLayout;
    Button: TCircle;
    ImgAdd: TImage;
    Sombra: TShadowEffect;
    ClickAnimationX: TFloatAnimation;
    ClickAnimationY: TFloatAnimation;
    MudaCor: TColorAnimation;
    procedure ClickAnimationYFinish(Sender: TObject);
    procedure ClickAnimationXFinish(Sender: TObject);
    procedure ButtonClick(Sender: TObject);
  private
    { Private declarations }
    fOnClickClick : TEventoClick;
  public
    { Public declarations }
    function isDarkMode(const value: boolean): iActionButton;
    function SetHint(const value: string): iActionButton;
    function OnClick(const Event: TEventoClick): iActionButton;
    function IsVisible(const Value: Boolean = true): iActionButton;

    class function New(const Form: TForm): iActionButton;
  end;

var
  ActionButton: TActionButton;

implementation

uses
  eTasks.Components.ColorPallete;

{$R *.fmx}

{ TActionButton }

procedure TActionButton.ButtonClick(Sender: TObject);
begin
  ClickAnimationX.Start;
  ClickAnimationY.Start;

  if(Assigned(fOnClickClick))then
   fOnClickClick(Sender);
end;

procedure TActionButton.ClickAnimationXFinish(Sender: TObject);
begin
  ClickAnimationX.Inverse := not ClickAnimationX.Inverse;

  if(ClickAnimationX.Inverse)then
   ClickAnimationX.Start;
end;

procedure TActionButton.ClickAnimationYFinish(Sender: TObject);
begin
  ClickAnimationY.Inverse := not ClickAnimationY.Inverse;

  if(ClickAnimationY.Inverse)then
   ClickAnimationY.Start;
end;

function TActionButton.isDarkMode(const value: boolean): iActionButton;
begin
  Result := Self;
  MudaCor.StartValue := tColorPallete.GetColor(FabButton, not value);
  MudaCor.StopValue  := tColorPallete.GetColor(FabButton, value);
  MudaCor.Start;
end;

function TActionButton.IsVisible(const Value: Boolean): iActionButton;
begin
  Result := Self;
  LayoutActionButton.Visible := Value;
end;

class function TActionButton.New(const Form: TForm): iActionButton;
begin
  Result := Self.Create(Form);
  Form.AddObject(TActionButton(Result).LayoutActionButton);
end;

function TActionButton.OnClick(const Event: TEventoClick): iActionButton;
begin
  Result := Self;
  fOnClickClick := Event;
end;

function TActionButton.SetHint(const value: string): iActionButton;
begin
  Result := Self;
  Button.Hint := value;
end;

end.
