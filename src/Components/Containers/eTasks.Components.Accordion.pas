unit eTasks.Components.Accordion;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, FMX.Ani;

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
  end;

const
  CollapsedSize = 52;

implementation

{$R *.fmx}

{ TAccordion }

function TAccordion.AccordionIsCollapsed: Boolean;
begin
  Result := AccordionBackground.Height = CollapsedSize;
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

end.
