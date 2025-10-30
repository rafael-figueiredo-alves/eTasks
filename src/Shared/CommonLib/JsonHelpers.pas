unit JsonHelpers;

interface

Uses
  System.JSON.Serializers,
  System.SysUtils;

type

  TJsonHelper = class
    private
     class function WithSerializer<TResult>(const Func: TFunc<TJsonSerializer, TResult>): TResult;
    public
     class function FromJSON<T>(const pJSON: string) : T;
     class function ToJSON<T>(const pObject: T) : string;
  end;

implementation

{ TJsonHelper }

class function TJsonHelper.FromJSON<T>(const pJSON: string): T;
begin
  Result := WithSerializer<T>(
    function(Serializer: TJsonSerializer): T
    begin
      Result := Serializer.Deserialize<T>(pJSON);
    end
  );
end;

class function TJsonHelper.ToJSON<T>(const pObject: T): string;
begin
  Result := WithSerializer<string>(
    function(Serializer: TJsonSerializer): string
    begin
      Result := Serializer.Serialize<T>(pObject);
    end
  );
end;

class function TJsonHelper.WithSerializer<TResult>(const Func: TFunc<TJsonSerializer, TResult>): TResult;
var
  JSONSerializer: TJsonSerializer;
begin
  JSONSerializer := TJsonSerializer.Create;
  try
    Result := Func(JSONSerializer);
  finally
    FreeAndNil(JSONSerializer);
  end;
end;

end.
