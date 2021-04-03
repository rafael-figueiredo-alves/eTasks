unit eTasks.Controller.Categorias;

interface

uses
  eTasks.Controller.Interfaces,
  System.Generics.Collections,
  System.JSON;

Type
  TControllerCategorias = Class(TInterfacedObject, iControllerCategorias)
    Private
      FuID                        : string;
      FToken                      : string;
      fcat_id                         : string;
      Fcategoria                  : string;
      Fcat_icon                   : string;
      Flistagemcategorias         : tdictionary<string,Tcategoria>;
      Function MontaJSONCategoria : tJSONValue;
    Public
     Constructor Create;
     Destructor Destroy; Override;
     Class function New: iControllerCategorias;
     Function ListarCategorias(out erro: string)  : iControllerCategorias;
     Function CriarCategoria(out erro : string)   : iControllerCategorias;
     Function EditarCategoria(out erro : string)  : iControllerCategorias;
     Function DeletarCategoria(out erro : string) : iControllerCategorias;
     Function ExibeCategoria(out erro : string)   : iControllerCategorias;
     Function Cat_id (Value : string)             : iControllerCategorias; overload;
     Function Cat_id                              : string; overload;
     Function Categoria (Value : string)          : iControllerCategorias; overload;
     Function Categoria                           : string; overload;
     Function Cat_icon (value : string)           : iControllerCategorias; Overload;
     Function Cat_icon                            : string; overload;
     Function ListagemCategorias                  : TDictionary<string,TCategoria>;
  End;

implementation

uses
  eTasks.Model.Factory,
  System.SysUtils;

{ TControllerCategorias }

function TControllerCategorias.Categoria(Value: string): iControllerCategorias;
begin
  Result     := self;
  Fcategoria := Value;
end;

function TControllerCategorias.Categoria: string;
begin
  Result := Fcategoria;
end;

function TControllerCategorias.Cat_icon: string;
begin
  Result := Fcat_icon;
end;

function TControllerCategorias.Cat_icon(value: string): iControllerCategorias;
begin
  Result    := self;
  Fcat_icon := value;
end;

function TControllerCategorias.Cat_id: string;
begin
  Result := Fcat_id;
end;

function TControllerCategorias.Cat_id(Value: string): iControllerCategorias;
begin
  Result := self;
  fcat_id := value;
end;

constructor TControllerCategorias.Create;
begin
  FuID   := tmodelfactory.New.LoggedUser.uID;
  FToken := TModelFactory.New.LoggedUser.Token;
end;

function TControllerCategorias.CriarCategoria(
  out erro: string): iControllerCategorias;
var
  error : string;
begin
  Result := self;
  TModelFactory.New.Categorias(FuID, FToken).NovaCategoria(MontaJSONCategoria, error);
  Erro := error;
end;

function TControllerCategorias.DeletarCategoria(
  out erro: string): iControllerCategorias;
var
  Error : string;
begin
  Result := self;
  TModelFactory.New.Categorias(FuID, FToken).ExcluirCategoria(Fcat_id, error);
  erro := Error;
end;

destructor TControllerCategorias.Destroy;
begin
  if Assigned(Flistagemcategorias) then
   Flistagemcategorias.DisposeOf;
  inherited;
end;

function TControllerCategorias.EditarCategoria(
  out erro: string): iControllerCategorias;
Var
  Error : string;
begin
  Result := self;
  TModelFactory.New.Categorias(FuID, FToken).EditarCategoria(MontaJSONCategoria, Fcat_id, error);
  erro := Error;
end;

function TControllerCategorias.ExibeCategoria(
  out erro: string): iControllerCategorias;
var
  json          : string;
  error         : string;
  JsonCategoria : TJSONObject;
begin
  Result := self;
  json := TModelFactory.New.Categorias(FuID, FToken).ExibeCategoria(fcat_id, error);
  JsonCategoria := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Json), 0) as tJsonObject;
  if Error = '' then
   begin
     if JsonCategoria <> nil then
      begin
        FCategoria    := JsonCategoria.GetValue('categoria').Value;
        fcat_icon     := JsonCategoria.GetValue('cat_icon').Value;
      end;
   end;
   erro := error;
   JsonCategoria.DisposeOf;
end;

function TControllerCategorias.ListagemCategorias: TDictionary<string, TCategoria>;
begin
  Result := Flistagemcategorias;
end;

function TControllerCategorias.ListarCategorias(
  out erro: string): iControllerCategorias;
var
  Json          : string;
  ListaJson     : tjsonobject;
  JsonValores   : TJSONObject;
  Error         : string;
  Categories    : integer;
  Categoria     : tCategoria;
begin
  Result := self;
  FListagemCategorias := TDictionary<string,TCategoria>.create;
  Json := tmodelFactory.New.Categorias(FuID, FToken).ListarCategorias(error);
  ListaJson := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Json), 0) as tJsonObject;
  if Error = '' then
   begin
     if ListaJson <> nil then
      begin
        for Categories := 0 to ListaJson.Count-1 do
         begin
           JsonValores         := ListaJson.Pairs[categories].JsonValue as TJSONObject;
           Categoria.cat_id    := ListaJson.Pairs[categories].JsonString.Value;
           Categoria.categoria := JsonValores.GetValue('categoria').Value;
           Categoria.cat_icon  := JsonValores.GetValue('cat_icon').Value;
           FListagemCategorias.Add(Categoria.cat_id, Categoria);
         end;
      end;
   end;
  erro := Error;
  ListaJson.DisposeOf;
end;

function TControllerCategorias.MontaJSONCategoria: tJSONValue;
Var
 JSONstring : string;
begin
  JSONstring := '{' +
                  '"categoria":"' + Fcategoria + '",' +
                  '"cat_icon":"' + Fcat_icon + '"' +
                '}';
  Result := TJSONObject.ParseJSONValue(JSONstring);
end;

class function TControllerCategorias.New: iControllerCategorias;
begin
  Result := Self.Create;
end;

end.
