unit eTasks.Controller.Version;

interface

type
 TControllerVersion = class
   class function IsUpdateAvailable(var DisplayVersion, URL_Download: string) : boolean;
 end;

const endpoint_version = '/version.json';

implementation

Uses
  eTasks.Shared.Entities.VersionInfo,
  System.Net.HttpClient,
  Dotenv4Delphi,
  System.JSON.Serializers,
  System.SysUtils,
  InternetChecker;

{ TControllerVersion }

function GetVersionInfo(var Unreachable: boolean) : TVersionInfo;
var
  HttpClient     : THTTPClient;
  Response       : IHTTPResponse;
  JsonSerializer :
  HasInternet    : Boolean;
begin
  Unreachable := False;

  try
    TInternetChecker.CheckConnectionAsync(procedure(const Connected: Boolean)
                                          begin
                                            HasInternet := Connected;
                                          end);
  except
    on E:EErrorNoInternetConnection do
     Unreachable := True;
  end;

  if(not HasInternet)then
   raise EErrorNoInternetConnection.Create('Sem conexão com internet');

  HttpClient := THttpClient.Create;
  try
    Response := HttpClient.Get(DotEnv.Env(TEnvVar.BASE_URL) + endpoint_version);

    if(Response.StatusCode = 200)then
      Result :=
    else
  finally
    FreeAndNil(HttpClient);
  end;
end;

class function TControllerVersion.IsUpdateAvailable(var DisplayVersion, URL_Download: string): boolean;
var
  VersionInfo : TVersionInfo;
begin

end;

end.
