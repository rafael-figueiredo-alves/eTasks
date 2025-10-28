unit eTasks.Controller.Version;

interface

uses eTasks.Shared.Entities.VersionInfo;

type
 TUpdateCheckCallback  = reference to procedure(const UpdateAvailable: Boolean; DisplayVersion, DownloadURL: string; Unreachable: Boolean);
 TCheckVersionCallback = reference to procedure(const VersionInfo: TVersionInfo; Unreachable: Boolean);

 TControllerVersion = class
   class procedure IsUpdateAvailable(const OnFinished: TUpdateCheckCallback);
 end;

const endpoint_version = '/version.json';

implementation

Uses
  System.Net.HttpClient,
  Dotenv4Delphi,
  System.JSON.Serializers,
  System.SysUtils,
  InternetChecker,
  eTasks.Shared.Entities.Errors,
  eTasks.Shared.Consts,
  System.Threading,
  System.Classes;

{ TControllerVersion }

function MakeRequest(const URL: string) : IHTTPResponse;
var
  HttpClient : THTTPClient;
begin
  HttpClient := THTTPClient.Create;
  try
    Result := HttpClient.Get(URL);
  finally
    FreeAndNil(HttpClient);
  end;
end;

function ConvertToTVersionInfo(const JSON: string) : TVersionInfo;
var
  JsonSerializer : TJsonSerializer;
begin
  JsonSerializer := TJsonSerializer.Create;
  try
    Result := JsonSerializer.Deserialize<TVersionInfo>(JSON);
  finally
    FreeAndNil(JsonSerializer);
  end;
end;

procedure GetVersionInfoAsync(const OnFinished: TCheckVersionCallback);
begin
  TInternetChecker.CheckConnectionAsync(
    procedure(Const Connected: Boolean)
    var
      Response    : IHTTPResponse;
      Info        : TVersionInfo;
      Unreachable : Boolean;
    begin
      Unreachable := False;

      if not Connected then
      begin
        Unreachable := True;
        TThread.Queue(nil, procedure begin OnFinished(Info, Unreachable); end);
        Exit;
      end;

      TTask.Run(
        procedure
        begin
          try
            Response := MakeRequest(DotEnv.Env(TEnvVar.BASE_URL) + endpoint_version);

            if Response.StatusCode = 200 then
              Info := ConvertToTVersionInfo(Response.ContentAsString(TEncoding.UTF8))
            else
              Unreachable := True;
          except
            Unreachable := True;
          end;

          TThread.Queue(nil,
            procedure
            begin
              OnFinished(Info, Unreachable);
            end);
        end);
    end);
end;

class procedure TControllerVersion.IsUpdateAvailable(const OnFinished: TUpdateCheckCallback);
begin
  GetVersionInfoAsync(
    procedure(const VersionInfo: TVersionInfo; Unreachable: Boolean)
    var
      UpdateAvailable: Boolean;
      DisplayVersion, URL_Download: string;
    begin
      if Unreachable then
      begin
        TThread.Queue(nil, procedure begin OnFinished(False, '', '', True); end);
        Exit;
      end;

      try
        UpdateAvailable := VersionInfo.AppVersion > AppVersion;
        DisplayVersion := VersionInfo.DisplayVersion;

        {$IFDEF ANDROID}
        URL_Download := VersionInfo.URL_APK;
        {$ENDIF}

        {$IFDEF MSWINDOWS}
        URL_Download := VersionInfo.URL_Win;
        {$ENDIF}
      except
        UpdateAvailable := False;
        DisplayVersion := '';
        URL_Download := '';
      end;

      TThread.Queue(nil,
        procedure
        begin
          OnFinished(UpdateAvailable, DisplayVersion, URL_Download, Unreachable);
        end);
    end);
end;

end.
