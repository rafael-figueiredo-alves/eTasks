unit eTasks.Components.LabelledTextbox;

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
  FMX.Edit,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Layouts,
  eTasks.Components.Interfaces,
  System.Generics.Collections,
  eTasks.Components.TranslationEnums;

type
  TlabelledTextBox = class(TForm, ilabelledTextbox)
    layLabelledTextbox: TLayout;
    lbCaption: TLabel;
    lbtxFrame: TRectangle;
    lbtxEdit: TEdit;
    lbtxStyle: TStyleBook;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    fGetter : TFunc<string>;
    fSetter : TProc<string>;
    FUpdating : Boolean;

    procedure EditChangeTracking(Sender : TObject);
  public
    { Public declarations }
    function isDarkMode(const value: boolean) : iLabelledTextbox;
    function Bind(const AGetter : TFunc<string>; ASetter : TProc<string>) : iLabelledTextbox;
    function Caption(const AText: string) : iLabelledTextbox;
    function TextPrompt(const APrompt: string) : iLabelledTextbox;
    function Refresh : iLabelledTextbox;

    class function New(const Layout: TLayout; ACaption, ATextPrompt : string; AGetter: TFunc<string>; ASetter: TProc<string>; isDarkMode: Boolean = false) : iLabelledTextbox;
  end;

var
  labelledTextBox: TlabelledTextBox;

implementation

uses
  eTasks.Components.ColorPallete;

{$R *.fmx}

{ TlabelledTextBox }

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

procedure TlabelledTextBox.EditChangeTracking(Sender: TObject);
begin
  if FUpdating then
    Exit;
  if Assigned(FSetter) then
    FSetter(lbtxEdit.Text);
end;

procedure TlabelledTextBox.FormCreate(Sender: TObject);
begin
  lbtxEdit.OnChangeTracking := EditChangeTracking;
end;

function TlabelledTextBox.isDarkMode(const value: boolean): iLabelledTextbox;
begin
  lbCaption.FontColor    := tColorPallete.GetColor(Primary, value);
  lbtxFrame.Stroke.Color := tColorPallete.GetColor(Primary, value);
  lbtxEdit.FontColor     := tColorPallete.GetColor(Primary, value);

  Result := self;
end;

class function TlabelledTextBox.New(const Layout: TLayout; ACaption, ATextPrompt : string; AGetter: TFunc<string>; ASetter: TProc<string>; isDarkMode: Boolean = false): iLabelledTextbox;
begin
  Result := Self.Create(Layout);
  Layout.AddObject(TlabelledTextBox(Result).layLabelledTextbox);
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
