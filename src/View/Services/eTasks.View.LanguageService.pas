unit eTasks.View.LanguageService;

interface

uses
  eTasks.View.Services.Interfaces,
  System.Generics.Collections,
  eTasks.View.Types;

type

 TLanguageService = class(TInterfacedObject, iLanguageService)
   private
    MethodsList: TDictionary<string, TTranslateUiMethod>;
    CurrentLanguage: string;
    procedure ApplyLanguage;
   public
    function GetLanguage: string;
    function SetLanguage(const LanguageCode: string): iLanguageService;
    function SubscribeMethod(const id: string; const Method: TTranslateUiMethod) : iLanguageService;
    function UnsubscribeMethod(const id: string) : iLanguageService;

    Destructor Destroy; override;
    Constructor Create;
    class function New: iLanguageService;
 end;

 function InitLanguageService: iLanguageService;

var LanguageService: iLanguageService;

implementation

uses
  LocalStorage4Pascal,
  eTasks.Shared.Consts,
  eTranslate4Pascal;

{ TLangageService }

function InitLanguageService: iLanguageService;
begin
  if(not Assigned(LanguageService))then
   LanguageService := TLanguageService.New;

  Result := LanguageService;
end;

procedure TLanguageService.ApplyLanguage;
var
  MethodPair : TPair<string, TTranslateUiMethod>;
begin
  for MethodPair in MethodsList do
    MethodPair.Value;
end;

constructor TLanguageService.Create;
begin
  MethodsList := TDictionary<string, TTranslateUiMethod>.Create;
  CurrentLanguage := LocalStorage4Delphi.GetString(LSK_Language, LSK_LanguageDefaultValue);
end;

destructor TLanguageService.Destroy;
begin
  if(Assigned(MethodsList))then
   MethodsList.Free;
  inherited;
end;

function TLanguageService.GetLanguage: string;
begin
  Result := CurrentLanguage;
end;

class function TLanguageService.New: iLanguageService;
begin
  Result := Self.Create;
end;

function TLanguageService.SetLanguage(const LanguageCode: string): iLanguageService;
begin
  CurrentLanguage := LanguageCode;
  eTranslate.SetLanguage(CurrentLanguage);

  LocalStorage4Delphi.SetValue(LSK_Language, CurrentLanguage);

  ApplyLanguage;

  Result := self;
end;

function TLanguageService.SubscribeMethod(const id: string;const Method: TTranslateUiMethod): iLanguageService;
begin
  if(not MethodsList.ContainsKey(id))then
   MethodsList.Add(id, Method);

  Result := self;
end;

function TLanguageService.UnsubscribeMethod(const id: string): iLanguageService;
begin
  if(MethodsList.ContainsKey(id))then
   MethodsList.Remove(id);

  Result := self;
end;

end.
