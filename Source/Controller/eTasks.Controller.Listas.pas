unit eTasks.Controller.Listas;

interface

uses
  eTasks.Controller.Interfaces,
  System.Generics.Collections,
  System.JSON;

Type
  TControllerItemLista = Class(TInterfacedObject, iControllerItemLista)
    Private
     FuID            : string;
     FToken          : string;
     FId             : string;
     FItem           : string;
     FQuantidade     : string;
     FUnidade        : string;
     FStatus         : string;
     FData           : string;
     FListagemListas : TDictionary<string,TItemLista>;
     Function MontaJSONListas : tJsonValue;
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iControllerItemLista;
     Function ListarItemsLista (out erro: string) : iControllerItemLista;
     Function NovoItem (out erro: string) : iControllerItemLista;
     Function EditaItem (out erro: string) : iControllerItemLista;
     Function DeletaItem (out erro: string) : iControllerItemLista;
     Function ExibeItem (out erro: string) : iControllerItemLista;
     Function MudaStatus (out erro: string) : iControllerItemLista;
     Function data (value: string) : iControllerItemLista;
     Function id (value : string) : iControllerItemLista; overload;
     Function id : string; overload;
     Function item (value: string) : iControllerItemLista; overload;
     Function Item : string; Overload;
     Function Quantidade (value: string) : iControllerItemLista; overload;
     Function quantidade : string; overload;
     Function unidade (value: string) : iControllerItemLista; overload;
     Function unidade : string; overload;
     Function Status (value: string) : iControllerItemLista; overload;
     Function Status : string; overload;
     Function ListagemItems : TDictionary<string,TItemLista>;
  End;

implementation

uses
  eTasks.Model.Factory,
  System.SysUtils;

{ TControllerItemLista }

constructor TControllerItemLista.Create;
begin
  FuID   := tmodelfactory.New.LoggedUser.uID;
  FToken := TModelFactory.New.LoggedUser.Token;
end;

function TControllerItemLista.data(value: string): iControllerItemLista;
begin
  Result := self;
  FData := value.Replace('/', '_');
end;

function TControllerItemLista.DeletaItem(
  out erro: string): iControllerItemLista;
var
  Error : string;
begin
  Result := self;
  TModelFactory.New.Listas(FuID, FToken).Data(FData).ExcluirItem(Fid, error);
  erro := Error;
end;

destructor TControllerItemLista.Destroy;
begin
  if Assigned(FListagemListas) then
    FListagemListas.DisposeOf;
  inherited;
end;

function TControllerItemLista.EditaItem(out erro: string): iControllerItemLista;
Var
  Error : string;
begin
  Result := self;
  TModelFactory.New.Listas(FuID, FToken).Data(FData).EditarItem(MontaJSONListas, Fid, error);
  erro := Error;
end;

function TControllerItemLista.ExibeItem(out erro: string): iControllerItemLista;
var
  json  : string;
  error : string;
  JsonItemLista: TJSONObject;
begin
  Result := self;
  json := TModelFactory.New.Listas(FuID, FToken).Data(FData).ExibeItem(Fid, error);
  JsonItemLista := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Json), 0) as tJsonObject;
  if Error = '' then
   begin
     if JsonItemLista <> nil then
      begin
        FItem       := JsonItemLista.GetValue('item').Value;
        FQuantidade := JsonItemLista.GetValue('quantidade').Value;
        FUnidade    := JsonItemLista.GetValue('unidade').Value;
        Fstatus     := JsonItemLista.GetValue('status').Value;
      end;
   end;
   erro := error;
   JsonItemLista.DisposeOf;
end;

function TControllerItemLista.id(value: string): iControllerItemLista;
begin
  Result := self;
  FId := value;
end;

function TControllerItemLista.id: string;
begin
  Result := FId;
end;

function TControllerItemLista.item: string;
begin
  Result := FItem;
end;

function TControllerItemLista.item(value: string): iControllerItemLista;
begin
  Result := self;
  FItem := value;
end;

function TControllerItemLista.ListagemItems: TDictionary<string, TItemLista>;
begin
  Result := FListagemListas;
end;

function TControllerItemLista.ListarItemsLista(
  out erro: string): iControllerItemLista;
var
  Json          : string;
  ListaJson     : tjsonobject;
  JsonValores   : TJSONObject;
  Error         : string;
  Listas        : integer;
  Lista         : TItemLista;
begin
  Result := self;
  FListagemListas := TDictionary<string,TItemLista>.create;
  Json := tmodelFactory.New.Listas(FuID, FToken).Data(FData).ListarItens(error);
  ListaJson := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Json), 0) as tJsonObject;
  if Error = '' then
   begin
     if ListaJson <> nil then
      begin
        for listas := 0 to ListaJson.Count-1 do
         begin
           JsonValores     := ListaJson.Pairs[listas].JsonValue as TJSONObject;
           Lista.id         := ListaJson.Pairs[listas].JsonString.Value;
           Lista.item       := JsonValores.GetValue('item').Value;
           Lista.quantidade  := JsonValores.GetValue('quantidade').Value;
           Lista.unidade := JsonValores.GetValue('unidade').Value;
           Lista.status     := JsonValores.GetValue('status').Value;
           FListagemListas.Add(Lista.id, Lista);
         end;
      end;
   end;
  erro := Error;
  ListaJson.DisposeOf;
end;

function TControllerItemLista.MontaJSONListas: tJsonValue;
var
 JsonString : string;
begin
  JsonString := '{' +
                  '"item" : "' + FItem + '" ,' +
                  '"quantidade" : "' + FQuantidade + '" ,' +
                  '"unidade" : "'      + FUnidade + '" ,' +
                  '"status" : "' + Fstatus + '"' +
                '}';
  Result := TJSONObject.ParseJSONValue(JsonString);
end;

function TControllerItemLista.MudaStatus(
  out erro: string): iControllerItemLista;
Var
  error : String;
begin
  Result := self;
  TModelFactory.New.Listas(FuID, FToken).Data(FData).MudarStatusItem(Fid, Fstatus, error);
  Erro := error;
end;

class function TControllerItemLista.New: iControllerItemLista;
begin
  Result := Self.Create;
end;

function TControllerItemLista.NovoItem(out erro: string): iControllerItemLista;
var
  error : string;
begin
  Result := self;
  TModelFactory.New.Listas(FuID, FToken).Data(FData).CriarItem(MontaJSONListas, error);
  Erro := error;
end;

function TControllerItemLista.Quantidade: string;
begin
  Result := FQuantidade;
end;

function TControllerItemLista.Quantidade(value: string): iControllerItemLista;
begin
  Result := self;
  FQuantidade := value;
end;

function TControllerItemLista.Status: string;
begin
  Result := FStatus;
end;

function TControllerItemLista.Status(value: string): iControllerItemLista;
begin
  Result := self;
  FStatus := value;
end;

function TControllerItemLista.unidade: string;
begin
  Result := FUnidade;
end;

function TControllerItemLista.unidade(value: string): iControllerItemLista;
begin
  Result := self;
  FUnidade := value;
end;

end.
