unit eTasks.Shared.Entities.Changelog;

interface

uses
  System.Generics.Collections;

type
  TChangelogItem = record
    VersionTitle: string;
    Features: TArray<string>;
  end;

  TChangelogsByLanguage = class
    Language: string;
    Changelog: TArray<TChangelogItem>;
  end;

  function GetChangelogByLanguage(const ALanguage, AJsonFile: string): TList<TChangelogsByLanguage>;

implementation

uses
  System.IOUtils, System.SysUtils, System.JSON, REST.JSON;

function GetChangelogByLanguage(const ALanguage, AJsonFile: string): TList<TChangelogsByLanguage>;
var
  JsonText  : string;
  Languages : TJSONArray;
  Lang      : TJSONValue;
  Item      : TChangelogsByLanguage;
begin
  Result := TList<TChangelogsByLanguage>.Create;

  JsonText := TFile.ReadAllText(AJsonFile, TEncoding.UTF8);

//  Languages := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(JsonText), 0) As TJSONArray;
//
//  for Lang in Languages do
//   begin
//     Result.Add();
//   end;



  //Languages := TJson.JsonToObject<TArray<TChangelogsByLanguage>>(JsonText);

//  for Lang in Languages do
//    if SameText(Lang.Language, ALanguage) then
//      Exit(Lang.Changelog);
//
//  Result := [];
end;

end.
