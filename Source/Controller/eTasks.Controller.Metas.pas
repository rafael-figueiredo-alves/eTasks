unit eTasks.Controller.Metas;

interface

uses
  eTasks.Controller.Interfaces,
  System.Generics.Collections,
  System.JSON;

Type
  TControllerMetas = Class(TInterfacedObject, iControllerMetas)
    Private
     FuID            : string;
     FToken          : string;
     FId             : string;
     FMeta           : string;
     FDescricao      : string;
     FPrioridade     : string;
     FStatus         : string;
     FListagemMetas  : TDictionary<string,TMeta>;
     Function MontaJSONMetas : tJsonValue;
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iControllerMetas;
     Function ListarMetas (Prioridade: MetasPrioridade; out erro: string) : iControllerMetas;
     Function NovaMeta (out erro: string) : iControllerMetas;
     Function EditaMeta (out erro: string) : iControllerMetas;
     Function DeletaMeta (out erro: string) : iControllerMetas;
     Function ExibeMeta (out erro: string) : iControllerMetas;
     Function MudaStatus (out erro: string) : iControllerMetas;
     Function id (value: string) : iControllerMetas; overload;
     Function id : string; overload;
     Function Meta (Value: string) : iControllerMetas; overload;
     Function Meta : string; overload;
     Function Descricao (Value: string) : iControllerMetas; overload;
     Function Descricao : string; overload;
     Function Prioridade (Value: string) : iControllerMetas; overload;
     Function Prioridade : string; overload;
     Function Status (Value: string) : iControllerMetas; overload;
     Function Status : string; overload;
     Function ListagemMetas : TDictionary<string,TMeta>;
  End;

implementation

uses
  eTasks.Model.Factory,
  System.SysUtils;

{ TControllerMetas }

constructor TControllerMetas.Create;
begin
  FuID   := tmodelfactory.New.LoggedUser.uID;
  FToken := TModelFactory.New.LoggedUser.Token;
end;

function TControllerMetas.DeletaMeta(out erro: string): iControllerMetas;
var
  Error : string;
begin
  Result := self;
  TModelFactory.New.Metas(FuID, FToken).ExcluirMeta(Fid, error);
  erro := Error;
end;

function TControllerMetas.Descricao(Value: string): iControllerMetas;
begin
  Result := self;
  FDescricao := value;
end;

function TControllerMetas.Descricao: string;
begin
  Result := FDescricao;
end;

destructor TControllerMetas.Destroy;
begin

  inherited;
end;

function TControllerMetas.EditaMeta(out erro: string): iControllerMetas;
Var
  Error : string;
begin
  Result := self;
  TModelFactory.New.Metas(FuID, FToken).EditarMeta(MontaJSONMetas, Fid, error);
  erro := Error;
end;

function TControllerMetas.ExibeMeta(out erro: string): iControllerMetas;
var
  json  : string;
  error : string;
  JsonMeta: TJSONObject;
begin
  Result := self;
  json := TModelFactory.New.Metas(FuID, FToken).ExibeMeta(Fid, error);
  JsonMeta := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Json), 0) as tJsonObject;
  if Error = '' then
   begin
     if JsonMeta <> nil then
      begin
        FMeta       := JsonMeta.GetValue('meta').Value;
        Fdescricao  := JsonMeta.GetValue('descricao').Value;
        Fprioridade := JsonMeta.GetValue('prioridade').Value;
        Fstatus     := JsonMeta.GetValue('status').Value;
      end;
   end;
   erro := error;
   JsonMeta.DisposeOf;
end;

function TControllerMetas.id(value: string): iControllerMetas;
begin
  Result := self;
  FId := value;
end;

function TControllerMetas.id: string;
begin
  Result := FId;
end;

function TControllerMetas.ListagemMetas: TDictionary<string, TMeta>;
begin
  Result := FListagemMetas;
end;

function TControllerMetas.ListarMetas(Prioridade: MetasPrioridade; out erro: string): iControllerMetas;
var
  Json          : string;
  ListaJson     : tjsonobject;
  JsonValores   : TJSONObject;
  Error         : string;
  metas         : integer;
  Meta          : TMeta;
begin
  Result := self;
  FListagemMetas := TDictionary<string,TMeta>.create;
  case Prioridade of
    Baixa: Json := tmodelFactory.New.Metas(FuID, FToken).ListarMetas('Baixa', error);
    Alta: Json := tmodelFactory.New.Metas(FuID, FToken).ListarMetas('Alta', error);
    Normal: Json := tmodelFactory.New.Metas(FuID, FToken).ListarMetas('', error);
  end;
  ListaJson := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Json), 0) as tJsonObject;
  if Error = '' then
   begin
     if ListaJson <> nil then
      begin
        for metas := 0 to ListaJson.Count-1 do
         begin
           JsonValores     := ListaJson.Pairs[metas].JsonValue as TJSONObject;
           Meta.id         := ListaJson.Pairs[metas].JsonString.Value;
           Meta.meta       := JsonValores.GetValue('meta').Value;
           Meta.descricao  := JsonValores.GetValue('descricao').Value;
           Meta.prioridade := JsonValores.GetValue('prioridade').Value;
           Meta.status     := JsonValores.GetValue('status').Value;
           FListagemMetas.Add(Meta.id, Meta);
         end;
      end;
   end;
  erro := Error;
  ListaJson.DisposeOf;
end;

function TControllerMetas.Meta: string;
begin
  Result := FMeta;
end;

function TControllerMetas.Meta(Value: string): iControllerMetas;
begin
  Result := self;
  FMeta := Value;
end;

function TControllerMetas.MontaJSONMetas: tJsonValue;
var
 JsonString : string;
begin
  JsonString := '{' +
                  '"meta" : "' + FMeta + '" ,' +
                  '"descricao" : "' + Fdescricao + '" ,' +
                  '"prioridade" : "'      + FPrioridade + '" ,' +
                  '"status" : "' + Fstatus + '"' +
                '}';
  Result := TJSONObject.ParseJSONValue(JsonString);
end;

function TControllerMetas.MudaStatus(out erro: string): iControllerMetas;
Var
  error : String;
begin
  Result := self;
  TModelFactory.New.Metas(FuID, FToken).MudarStatusMeta(Fid, Fstatus, error);
  Erro := error;
end;

class function TControllerMetas.New: iControllerMetas;
begin
  Result := Self.Create;
end;

function TControllerMetas.NovaMeta(out erro: string): iControllerMetas;
var
  error : string;
begin
  Result := self;
  TModelFactory.New.Metas(FuID, FToken).CriarMeta(MontaJSONMetas, error);
  Erro := error;
end;

function TControllerMetas.Prioridade(Value: string): iControllerMetas;
begin
  Result := self;
  FPrioridade := value;
end;

function TControllerMetas.Prioridade: string;
begin
  Result := FPrioridade;
end;

function TControllerMetas.Status(Value: string): iControllerMetas;
begin
  Result := self;
  FStatus := value;
end;

function TControllerMetas.Status: string;
begin
  Result := FStatus;
end;

end.
