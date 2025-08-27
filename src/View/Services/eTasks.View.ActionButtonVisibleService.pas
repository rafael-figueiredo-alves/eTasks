unit eTasks.View.ActionButtonVisibleService;

interface

uses
  eTasks.View.Services.Interfaces;

type

 TActionButtonVisibleService = class(TInterfacedObject, iActionButtonVisibleService)
   private
    SetVisibility   : TSetActionButtonVisible;
   public
    function SetActionButtonVisibleEvent(const Event: TSetActionButtonVisible): iActionButtonVisibleService;
    function SetActionButtonVisible(const Visible: Boolean): iActionButtonVisibleService;

    Destructor Destroy; override;
    Constructor Create;
    class function New: iActionButtonVisibleService;
 end;

 function InitActionButtonVisibleService: iActionButtonVisibleService;

var ActionButtonVisibleService: iActionButtonVisibleService;

implementation

{ TActionButtonVisibleService }

function InitActionButtonVisibleService: iActionButtonVisibleService;
begin
  if(not Assigned(ActionButtonVisibleService))then
   ActionButtonVisibleService := TActionButtonVisibleService.New;

  Result := ActionButtonVisibleService;
end;

constructor TActionButtonVisibleService.Create;
begin

end;

destructor TActionButtonVisibleService.Destroy;
begin

  inherited;
end;

class function TActionButtonVisibleService.New: iActionButtonVisibleService;
begin
  Result := Self.Create;
end;

function TActionButtonVisibleService.SetActionButtonVisible(const Visible: Boolean): iActionButtonVisibleService;
begin
  Result := self;

  if(Assigned(SetVisibility))then
   SetVisibility(Visible);
end;

function TActionButtonVisibleService.SetActionButtonVisibleEvent(const Event: TSetActionButtonVisible): iActionButtonVisibleService;
begin
  Result := Self;
  SetVisibility := Event;
end;

end.
