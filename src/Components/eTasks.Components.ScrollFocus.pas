unit eTasks.Components.ScrollFocus;

// Mantém o controle focado visível dentro de um scroll box, em desktop e mobile:
//   - Desktop e mobile: ao receber foco, o controle é rolado para dentro da área visível.
//   - Mobile: quando o teclado virtual aparece, a área visível do scroll box é encolhida
//     para ficar acima dele e o controle focado é rolado para dentro dela.
//
// Substitui a unit eTasks.Components.KeyboardAvoider (não use as duas no mesmo scroll box).
//
// Uso nos componentes (ex.: no OnEnter do edit):
//   TScrollFocus.Reveal(layLabelledTextbox);
// Se o controle não estiver dentro de um scroll box (ex.: só um TLayout), não faz nada.
// O helper é criado sozinho no scroll box ancestral na primeira chamada; não precisa de Attach.

interface

uses
  System.SysUtils,
  System.Types,
  System.Classes,
  System.Math,
  System.Messaging,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Layouts;

type
  TScrollFocus = class(TComponent)
  private
    FScrollBox: TCustomScrollBox;
    FBaseBottomMargin: Single;
    FKeyboardVisible: Boolean;
    FSubscriptionId: Integer;
    FTarget: TControl; // último controle revelado (monitorado por FreeNotification)
    procedure SetTarget(AControl: TControl);
    function RootForm: TCommonCustomForm;
    function FocusedControl: TControl;
    function CurrentTarget: TControl;
    function KeyboardHeightFor(const ABounds: TRect): Single;
    procedure KeyboardChanged(const Sender: TObject; const M: TMessage);
    procedure ApplyKeyboard(AVisible: Boolean; const ABounds: TRect);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AScrollBox: TCustomScrollBox); reintroduce;
    destructor Destroy; override;

    // Devolve o helper do scroll box (cria se ainda não existir). nil se AScrollBox for nil.
    class function Attach(AScrollBox: TCustomScrollBox): TScrollFocus;
    // Procura o scroll box ancestral do controle e devolve o helper dele. nil se não houver scroll box.
    class function ForControl(AControl: TFmxObject): TScrollFocus;
    // Rola o scroll box ancestral até o controle ficar visível. Sem scroll box: não faz nada.
    class procedure Reveal(AControl: TControl);

    procedure ScrollIntoView(AControl: TControl);
  end;

implementation

const
  // Folga (em pixels lógicos) entre o controle e a borda da área visível
  FOCUS_PADDING = 16;

function IsInside(AParent, AChild: TFmxObject): Boolean;
begin
  while AChild <> nil do
  begin
    if AChild = AParent then
      Exit(True);
    AChild := AChild.Parent;
  end;
  Result := False;
end;

{ TScrollFocus }

class function TScrollFocus.Attach(AScrollBox: TCustomScrollBox): TScrollFocus;
var
  I: Integer;
begin
  if AScrollBox = nil then
    Exit(nil);

  for I := 0 to AScrollBox.ComponentCount - 1 do
    if AScrollBox.Components[I] is TScrollFocus then
      Exit(TScrollFocus(AScrollBox.Components[I]));

  Result := TScrollFocus.Create(AScrollBox);
end;

class function TScrollFocus.ForControl(AControl: TFmxObject): TScrollFocus;
var
  LParent: TFmxObject;
begin
  Result := nil;
  LParent := AControl;
  while LParent <> nil do
  begin
    if LParent is TCustomScrollBox then
      Exit(Attach(TCustomScrollBox(LParent)));
    LParent := LParent.Parent;
  end;
end;

class procedure TScrollFocus.Reveal(AControl: TControl);
var
  LHelper: TScrollFocus;
begin
  LHelper := ForControl(AControl);
  if LHelper = nil then
    Exit; // não está num scroll box: nada a rolar

  LHelper.SetTarget(AControl);
  LHelper.ScrollIntoView(AControl);
end;

constructor TScrollFocus.Create(AScrollBox: TCustomScrollBox);
begin
  if AScrollBox = nil then
    raise EArgumentNilException.Create('TScrollFocus: o scrollbox não pode ser nil.');

  inherited Create(AScrollBox); // o scrollbox é o dono: libera junto com ele
  FScrollBox := AScrollBox;
  FBaseBottomMargin := AScrollBox.Margins.Bottom;

  // Mesma mensagem que os próprios forms do FMX usam para disparar OnVirtualKeyboardShown/Hidden.
  // Só é enviada em Android/iOS; no desktop esta assinatura simplesmente nunca dispara.
  FSubscriptionId := TMessageManager.DefaultManager.SubscribeToMessage(
    TVKStateChangeMessage, KeyboardChanged);
end;

destructor TScrollFocus.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TVKStateChangeMessage, FSubscriptionId);
  SetTarget(nil);
  inherited;
end;

procedure TScrollFocus.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FTarget) then
    FTarget := nil; // o controle foi liberado: esquece a referência
end;

procedure TScrollFocus.SetTarget(AControl: TControl);
begin
  if FTarget = AControl then
    Exit;
  if FTarget <> nil then
    FTarget.RemoveFreeNotification(Self);
  FTarget := AControl;
  if FTarget <> nil then
    FTarget.FreeNotification(Self);
end;

function TScrollFocus.RootForm: TCommonCustomForm;
var
  LRoot: IRoot;
begin
  Result := nil;
  LRoot := FScrollBox.Root; // o root real onde o scrollbox está sendo exibido
  if (LRoot <> nil) and (LRoot.GetObject is TCommonCustomForm) then
    Result := TCommonCustomForm(LRoot.GetObject);
end;

function TScrollFocus.FocusedControl: TControl;
var
  LRoot: IRoot;
  LObject: TFmxObject;
begin
  Result := nil;
  LRoot := FScrollBox.Root;
  if (LRoot = nil) or (LRoot.Focused = nil) then
    Exit;

  LObject := LRoot.Focused.GetObject;
  if LObject is TControl then
    Result := TControl(LObject);
end;

function TScrollFocus.CurrentTarget: TControl;
var
  LFocused: TControl;
begin
  // Se o foco está dentro do último controle revelado (ex.: o edit dentro do bloco
  // label + moldura + edit), rola o bloco inteiro; senão, só o controle focado.
  LFocused := FocusedControl;
  if (FTarget <> nil) and (LFocused <> nil) and IsInside(FTarget, LFocused) then
    Result := FTarget
  else
    Result := LFocused;
end;

function TScrollFocus.KeyboardHeightFor(const ABounds: TRect): Single;
var
  LForm: TCommonCustomForm;
begin
  LForm := RootForm;
  if LForm <> nil then
    // Bounds vem em coordenadas de tela; converte para coordenadas do form
    Result := Max(0, LForm.ClientHeight - LForm.ScreenToClient(PointF(ABounds.Left, ABounds.Top)).Y)
  else
    Result := ABounds.Height;
end;

procedure TScrollFocus.KeyboardChanged(const Sender: TObject; const M: TMessage);
var
  LMsg: TVKStateChangeMessage;
begin
  if not (M is TVKStateChangeMessage) then
    Exit;
  LMsg := TVKStateChangeMessage(M);
  ApplyKeyboard(LMsg.KeyboardVisible, LMsg.KeyboardBounds);
end;

procedure TScrollFocus.ApplyKeyboard(AVisible: Boolean; const ABounds: TRect);
begin
  if AVisible then
  begin
    // A mensagem é global: ignora scrollbox que não está visível na tela agora
    if not FScrollBox.ParentedVisible then
      Exit;

    FKeyboardVisible := True;

    // Encolhe a área visível do scrollbox para ficar acima do teclado
    FScrollBox.Margins.Bottom := FBaseBottomMargin + KeyboardHeightFor(ABounds);
    //FScrollBox.Realign;

    ScrollIntoView(CurrentTarget);
  end
  else
  begin
    if not FKeyboardVisible then
      Exit; // este scrollbox não estava desviando do teclado

    FKeyboardVisible := False;
    FScrollBox.Margins.Bottom := FBaseBottomMargin;
    //FScrollBox.Realign;
  end;
end;

procedure TScrollFocus.ScrollIntoView(AControl: TControl);
var
  LControlRect: TRectF;
  LViewRect: TRectF;
  Dy: Single;
begin
  if (AControl = nil) or not IsInside(FScrollBox, AControl) then
    Exit;

  LControlRect := AControl.AbsoluteRect; // já considera o scroll atual do conteúdo
  LViewRect := FScrollBox.AbsoluteRect;  // área visível (encolhida pela margem se há teclado)

  Dy := 0;
  if LControlRect.Bottom + FOCUS_PADDING > LViewRect.Bottom then
    Dy := LControlRect.Bottom + FOCUS_PADDING - LViewRect.Bottom
  else if LControlRect.Top - FOCUS_PADDING < LViewRect.Top then
    Dy := LControlRect.Top - FOCUS_PADDING - LViewRect.Top;

  if Dy <> 0 then
    FScrollBox.ViewportPosition :=
      PointF(FScrollBox.ViewportPosition.X, FScrollBox.ViewportPosition.Y + Dy);
end;

end.
