unit eTasks.Components.Accordion;

interface

{$region 'Dependências Globais'}
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
  FMX.Objects,
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.Ani,
  FMX.Memo.Types,
  FMX.ScrollBox,
  FMX.Memo, System.ImageList, FMX.ImgList;
{$endregion}

type
  TResizeEvent = Procedure(sender: TObject) of object;

  TAccordion = class(TFrame)
    AccordionBackground: TRectangle;
    AccordionButton: TLayout;
    LayTitle: TLayout;
    lblTitle: TLabel;
    ExpandAccordion: TFloatAnimation;
    CollapseAccordion: TFloatAnimation;
    ChevronAccordion: TImage;
    ExpandAccordionIcon: TFloatAnimation;
    CollapseAccordionIcon: TFloatAnimation;
    Details: TMemo;
    ImagensAccordion: TImageList;
    procedure CollapseAccordionProcess(Sender: TObject);
    procedure ExpandAccordionProcess(Sender: TObject);
  private
    { Private declarations }
    ResizeEvent : TResizeEvent;
    function AccordionIsCollapsed : Boolean;
    procedure OpenAccordion;
    procedure CloseAccordion;

    procedure ResizeComponent;
  public
    { Public declarations }

    function OnResizeAccordion(const event: TResizeEvent) : TAccordion;
    procedure ExpandOrCollapse;
    function BeginCollapsed : TAccordion;
    function BeginExpanded  : TAccordion;
    function IsDarkMode(const value: Boolean) : TAccordion;
    function SetTitle(const value: string) : TAccordion;
    function SetDetails(const value: string) : TAccordion;

  end;

const
  CollapsedSize     = 52;
  ExpandedSize      = 152;
  RotationCollapsed = 0;
  RotationExpanded  = -180;

implementation

uses
  eTasks.Components.ColorPallete, eTasks.Shared.Utils;

{$R *.fmx}

{ TAccordion }

function TAccordion.AccordionIsCollapsed: Boolean;
begin
  Result := AccordionBackground.Height = CollapsedSize;
end;

function TAccordion.BeginCollapsed: TAccordion;
begin
  Self.Height                    := CollapsedSize;
  AccordionBackground.Height     := CollapsedSize;
  ChevronAccordion.RotationAngle := RotationCollapsed;
  Result                         := Self;
end;

function TAccordion.BeginExpanded: TAccordion;
begin
  Self.Height                    := ExpandedSize;
  AccordionBackground.Height     := ExpandedSize;
  ChevronAccordion.RotationAngle := RotationExpanded;
  Result                         := Self;
end;

procedure TAccordion.CloseAccordion;
begin
  CollapseAccordionIcon.Start;
  CollapseAccordion.Start;
end;

procedure TAccordion.CollapseAccordionProcess(Sender: TObject);
begin
  ResizeComponent;
end;

procedure TAccordion.ExpandAccordionProcess(Sender: TObject);
begin
  ResizeComponent;
end;

procedure TAccordion.ExpandOrCollapse;
begin
  if(AccordionIsCollapsed)then
    OpenAccordion
  else
    CloseAccordion;
end;

function TAccordion.IsDarkMode(const value: Boolean): TAccordion;
begin
  lblTitle.TextSettings.FontColor := tColorPallete.GetColor(primary, value);
  Details.TextSettings.FontColor  := tColorPallete.GetColor(Primary, value);
  AccordionBackground.Fill.Color  := tColorPallete.GetColor(Background, value);
  if(value)then
   AccordionBackground.Stroke.Color := TAlphaColorRec.White
  else
   AccordionBackground.Stroke.Color := $FFDEE2E6;

  ChevronAccordion.Bitmap := ImagensAccordion.Bitmap(TSizeF.Create(30, 30), tutils.Iif(value, 1, 0));

  Result := Self;
end;

function TAccordion.OnResizeAccordion(const event: TResizeEvent): TAccordion;
begin
  Result      := Self;
  ResizeEvent := event;
end;

procedure TAccordion.OpenAccordion;
begin
  ExpandAccordionIcon.Start;
  ExpandAccordion.Start;
end;

procedure TAccordion.ResizeComponent;
begin
  Self.Height := AccordionBackground.Height;

  if(Assigned(ResizeEvent))then
    ResizeEvent(nil);
end;

function TAccordion.SetDetails(const value: string): TAccordion;
begin
  Details.Lines.Clear;
  Details.Lines.Add(value);

  Result := Self;
end;

function TAccordion.SetTitle(const value: string): TAccordion;
begin
  lblTitle.Text := value;

  Result := Self;
end;

end.
