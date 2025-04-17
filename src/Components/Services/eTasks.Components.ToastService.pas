unit eTasks.Components.ToastService;

interface

uses
  eTasks.Components.IToastService;

type

 TToastService = class(TInterfacedObject, iToastService)
   private
     fOnShow : TOnShow;
     fOnHide : TOnHide;
   public
     function OnShow(const OnShowMethod: TOnShow): iToastService;
     function OnHide(const OnHideMethod: TOnHide): iToastService;
     procedure ShowSuccess(const Mensagem: string);
     procedure ShowError(const Mensagem: string);
     procedure Hide;

     Destructor Destroy; override;
     Constructor Create;
     class function New: iToastService;
 end;

 function InitToastService: iToastService;

var ToastService: iToastService;

implementation

uses
  eTasks.Components.ToastType;

function InitToastService: iToastService;
begin
  if(not Assigned(ToastService))then
   ToastService := TToastService.New;

  Result := ToastService;
end;

{ TToastService }

constructor TToastService.Create;
begin

end;

destructor TToastService.Destroy;
begin

  inherited;
end;

procedure TToastService.Hide;
begin
  if(Assigned(fOnHide))then
    fOnHide();
end;

class function TToastService.New: iToastService;
begin
  Result := TToastService.Create;
end;

function TToastService.OnHide(const OnHideMethod: TOnHide): iToastService;
begin
  Result  := self;
  fOnHide := OnHideMethod;
end;

function TToastService.OnShow(const OnShowMethod: TOnShow): iToastService;
begin
  Result  := Self;
  fOnShow := OnShowMethod;
end;

procedure TToastService.ShowError(const Mensagem: string);
begin
  if(Assigned(fOnShow))then
   fOnShow(Mensagem, TToastType.Error);
end;

procedure TToastService.ShowSuccess(const Mensagem: string);
begin
  if(Assigned(fOnShow))then
   fOnShow(Mensagem, TToastType.Success);
end;

end.
