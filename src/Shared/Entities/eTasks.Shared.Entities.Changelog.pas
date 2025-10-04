unit eTasks.Shared.Entities.Changelog;

interface

type
  TChangelogItem = record
    VersionTitle: string;
    Features: TArray<string>;
  end;

  TChangelogsByLanguage = class
    Language: string;
    Changelog: TArray<TChangelogItem>;
  end;

  function GetChangelogByLanguage(const ALanguage, AJsonFile: string): TArray<TChangelogItem>;

implementation

uses
  System.IOUtils, System.SysUtils, System.JSON, REST.JSON;

function GetChangelogByLanguage(const ALanguage, AJsonFile: string): TArray<TChangelogItem>;
var
  JsonText  : string;
  Languages : TArray<TChangelogsByLanguage>;
  Lang      : TChangelogsByLanguage;
begin
  JsonText := TFile.ReadAllText(AJsonFile, TEncoding.UTF8);

  Languages := TJson.JsonToObject<TArray<TChangelogsByLanguage>>(JsonText);

  for Lang in Languages do
    if SameText(Lang.Language, ALanguage) then
      Exit(Lang.Changelog);

  Result := [];
end;

end.
