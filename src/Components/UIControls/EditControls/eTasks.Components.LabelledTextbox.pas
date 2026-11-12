unit eTasks.Components.LabelledTextbox;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Edit,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.Layouts,
  System.Math,
  eTasks.Components.Interfaces,
  System.Generics.Collections,
  System.Generics.Defaults,
  eTasks.Components.TranslationEnums;

type
  TLabelledTextBox = class(TFrame, ilabelledTextbox)
    layLabelledTextbox: TLayout;
    lbCaption: TLabel;
    lbtxFrame: TRectangle;
    lbtxEdit: TEdit;
    lbtxStyle: TStyleBook;
  private
    { Private declarations }
    fGetter : TFunc<string>;
    fSetter : TProc<string>;
    FUpdating : Boolean;

    procedure EditChangeTracking(Sender : TObject);
    procedure lbtxEditKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure lbtxEditEnter(Sender: TObject);
    procedure FocusNext;

    {$IFDEF ANDROID}
    procedure lbtxEditKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure lbtxEditChange(Sender: TObject);
    procedure HandleReturn;
    {$ENDIF}

  public
    { Public declarations }

    constructor Create(AOwner: TComponent); override;

    function isDarkMode(const value: boolean) : iLabelledTextbox;
    function Bind(const AGetter : TFunc<string>; ASetter : TProc<string>) : iLabelledTextbox;
    function Caption(const AText: string) : iLabelledTextbox;
    function TextPrompt(const APrompt: string) : iLabelledTextbox;
    function Refresh : iLabelledTextbox;

    class function New(const Layout: TFmxObject; ACaption, ATextPrompt : string; AGetter: TFunc<string>; ASetter: TProc<string>; isDarkMode: Boolean = false) : iLabelledTextbox;
  end;

var LabelledTextBox : TLabelledTextBox;

implementation

uses
  eTasks.Components.ColorPallete,
  eTasks.Components.ScrollFocus;

{$R *.fmx}

{ TlabelledTextBox }

var
  // Momento (em ms) do último avanço por Enter/Próximo, compartilhado por todas as instâncias
  GLastReturnAdvance: Cardinal = 0;

// Coleta, em qualquer profundidade, os controles que podem receber foco por Tab
procedure CollectFocusable(AParent: TFmxObject; AList: TList<TControl>);
var
  I: Integer;
  LChild: TFmxObject;
  LControl: TControl;
begin
  for I := 0 to AParent.ChildrenCount - 1 do
  begin
    LChild := AParent.Children[I];
    if LChild is TControl then
    begin
      LControl := TControl(LChild);
      if LControl.CanFocus and LControl.TabStop and
         LControl.ParentedVisible and LControl.AbsoluteEnabled then
        AList.Add(LControl);
    end;
    CollectFocusable(LChild, AList);
  end;
end;

procedure TlabelledTextBox.FocusNext;
var
  LContainer: TFmxObject;
  LCandidates: TList<TControl>;
  LIndex: Integer;
begin
  // Procura entre os campos do mesmo layout onde este componente foi adicionado.
  // Não usa a tab list do FMX: cada contêiner tem a sua, e a busca a partir do form
  // não é confiável para controles aninhados em vários níveis.
  LContainer := layLabelledTextbox.Parent;
  if LContainer = nil then
    Exit;

  LCandidates := TList<TControl>.Create;
  try
    CollectFocusable(LContainer, LCandidates);

    // Ordem = ordem visual na tela (de cima para baixo, depois da esquerda para a direita)
    LCandidates.Sort(TComparer<TControl>.Construct(
      function(const A, B: TControl): Integer
      begin
        Result := CompareValue(A.AbsoluteRect.Top, B.AbsoluteRect.Top);
        if Result = 0 then
          Result := CompareValue(A.AbsoluteRect.Left, B.AbsoluteRect.Left);
      end));

    LIndex := LCandidates.IndexOf(lbtxEdit);
    if (LIndex >= 0) and (LIndex < LCandidates.Count - 1) then
      LCandidates[LIndex + 1].SetFocus
    else
      lbtxEdit.ResetFocus; // sem próximo campo: tira o foco (no mobile, em geral fecha o teclado)
  finally
    LCandidates.Free;
  end;
end;

function TlabelledTextBox.Bind(const AGetter: TFunc<string>;ASetter: TProc<string>): iLabelledTextbox;
begin
  fGetter := AGetter;
  fSetter := ASetter;

  Refresh;

  Result := Self;
end;

function TlabelledTextBox.Caption(const AText: string): iLabelledTextbox;
begin
  lbCaption.Text := AText;

  Result := self;
end;

{$IFDEF ANDROID}
// No Android, o teclado virtual não é fonte confiável de eventos de tecla: a tecla de ação
// (Próximo/Enter) pode não gerar OnKeyDown/OnKeyUp. Por isso há dois caminhos extras,
// todos passando por HandleReturn, que garante um único avanço por pressionamento.

procedure TLabelledTextBox.HandleReturn;
begin
  // Mais de um evento pode reportar o mesmo "Enter" (KeyDown, KeyUp, OnChange), e o
  // evento seguinte chega já no campo novo: avança só uma vez por pressionamento.
  if (GLastReturnAdvance <> 0) and (TThread.GetTickCount - GLastReturnAdvance < 500) then
    Exit;
  GLastReturnAdvance := TThread.GetTickCount;

  {$IFDEF ANDROID}
  // Mudar o foco dentro do callback de ação do teclado pode atrapalhar o próprio teclado:
  // adia para depois que o callback terminar.
  TThread.ForceQueue(nil, FocusNext);
  {$ELSE}
  FocusNext;
  {$ENDIF}
end;

procedure TlabelledTextBox.lbtxEditKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if (Key = vkReturn) or (key = vkNext) or (key = vkTab) then
  begin
    Key := 0;
    HandleReturn;
  end;
end;

procedure TlabelledTextBox.lbtxEditChange(Sender: TObject);
begin
  // A tecla de ação com ReturnKeyType = Next chega como "commit" do texto (OnChange).
  // Perder o foco também dispara OnChange, então só avança se o edit ainda está focado.
  if lbtxEdit.IsFocused then
    HandleReturn;
end;
{$ENDIF}

constructor TLabelledTextBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  lbtxEdit.OnChangeTracking := EditChangeTracking;
  lbtxEdit.ReturnKeyType := TReturnKeyType.Next;  // mostra "Próximo" no teclado do celular
  lbtxEdit.OnKeyUp := lbtxEditKeyUp;
  lbtxEdit.OnEnter := lbtxEditEnter;

  self.Name := '';

  {$IFDEF ANDROID}
  // No Android a tecla de ação do teclado virtual não chega como tecla (ver comentários abaixo)
  lbtxEdit.OnKeyDown := lbtxEditKeyDown;
  lbtxEdit.OnChange := lbtxEditChange;
  {$ENDIF}
end;

procedure TlabelledTextBox.EditChangeTracking(Sender: TObject);
begin
  if FUpdating then
    Exit;
  if Assigned(FSetter) then
    FSetter(lbtxEdit.Text);
end;

procedure TlabelledTextBox.lbtxEditEnter(Sender: TObject);
begin
  // Rola o bloco inteiro (label + campo) para a área visível, se estiver num scrollbox.
  // Vale para desktop e mobile; num TLayout simples não faz nada.
  TScrollFocus.Reveal(layLabelledTextbox);
end;

function TlabelledTextBox.isDarkMode(const value: boolean): iLabelledTextbox;
begin
  lbCaption.FontColor    := tColorPallete.GetColor(Primary, value);
  lbtxFrame.Stroke.Color := tColorPallete.GetColor(Primary, value);
  lbtxEdit.FontColor     := tColorPallete.GetColor(Primary, value);

  Result := self;
end;

procedure TlabelledTextBox.lbtxEditKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if (Key = vkReturn) or (Key = vkTab) or (key = vkNext) then
  begin
    Key := 0;
    FocusNext;
  end;
end;

class function TlabelledTextBox.New(const Layout: TFmxObject; ACaption, ATextPrompt : string; AGetter: TFunc<string>; ASetter: TProc<string>; isDarkMode: Boolean = false): iLabelledTextbox;
begin
  Result := Self.Create(Layout);
  Layout.AddObject(TlabelledTextBox(Result).layLabelledTextbox);

  // Força o novo controle a entrar no fim da pilha de Align = Top
  TlabelledTextBox(Result).layLabelledTextbox.Align := TAlignLayout.None;
  TlabelledTextBox(Result).layLabelledTextbox.Position.Y := 1E10;
  TlabelledTextBox(Result).layLabelledTextbox.Align := TAlignLayout.Top;

  Result.isDarkMode(isDarkMode)
        .Caption(ACaption)
        .TextPrompt(ATextPrompt)
        .Bind(AGetter, ASetter);
end;

function TlabelledTextBox.Refresh: iLabelledTextbox;
begin
 if Assigned(FGetter) then
  begin
    FUpdating := True; // evita que a atribuição do Text dispare o setter de volta
    try
      lbtxEdit.Text := FGetter();
    finally
      FUpdating := False;
    end;
  end;
  Result := Self;
end;

function TlabelledTextBox.TextPrompt(const APrompt: string): iLabelledTextbox;
begin
  lbtxEdit.TextPrompt := APrompt;

  Result := self;
end;

end.