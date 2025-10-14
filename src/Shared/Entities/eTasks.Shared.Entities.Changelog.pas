unit eTasks.Shared.Entities.Changelog;

interface

uses
  System.Generics.Collections;

type
  TChangelogItem = record
    VersionTitle: string;
    Features: TArray<string>;
  end;

  TChangelogsByLanguage = record
    Language: string;
    Changelog: TArray<TChangelogItem>;
  end;

  function GetChangelogByLanguage(const ALanguage, AJsonFile: string): TArray<TChangelogItem>;

implementation

uses
  System.IOUtils,
  System.SysUtils,
  System.JSON,
  System.JSON.Serializers,
  REST.JSON;

function GetChangelogByLanguage(const ALanguage, AJsonFile: string): TArray<TChangelogItem>;
var
  JsonText      : string;
  Languages     : TJSONArray;
  Language      : TJSONValue;
  Changelogs    : TJSONArray;
  JSONSerialize : TJsonSerializer;
  LanguageValue : string;
begin
  Result := [];

  JsonText := TFile.ReadAllText(AJsonFile, TEncoding.UTF8);

  Languages := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(JsonText), 0) as TJSONArray;

  for Language in Languages do
   begin
     if(Language.TryGetValue('Language', LanguageValue))then
      if(LanguageValue = ALanguage)then
       begin
         if(Language.TryGetValue<TJSONArray>('Changelog', Changelogs))then
          begin
            JSONSerialize := TJsonSerializer.Create;
            try
              Result := JSONSerialize.Deserialize<TArray<TChangelogItem>>(Changelogs.ToString);
            finally
              FreeAndNil(JSONSerialize);
            end;
          end;
         Break;
       end;
   end;

   FreeAndNil(Languages);
end;

end.
