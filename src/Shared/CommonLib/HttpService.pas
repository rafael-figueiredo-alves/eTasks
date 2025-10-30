unit HttpService;

interface

uses
  System.SysUtils,
  System.Net.HttpClient,
  System.Classes;

type

 TResponse = record
   StatusCode : integer;
   StatusText : string;
   Content    : string;
 end;

 THttpService = class
   private
     class function UseHttpClient(const Func: TFunc<THttpClient, IHTTPResponse>) : TResponse;
   public
     class function GetRequest(const pEndpoint: string) : TResponse;
     class function DownloadFile(const pEndpoint, pFilePath: string) : Boolean;
 end;

implementation

{ THttpService }

class function THttpService.DownloadFile(const pEndpoint, pFilePath: string): Boolean;
var
 FileStream : TFileStream;
begin
  FileStream := TFileStream.Create(pFilePath, fmCreate);

  try
    Result := UseHttpClient(
      function(HttpClient: THttpClient) : IHTTPResponse
      begin
        Result := HttpClient.Get(pEndpoint, FileStream);
      end
    ).StatusCode < 400;
  finally
    FreeAndNil(FileStream);
  end;
end;

class function THttpService.GetRequest(const pEndpoint: string): TResponse;
begin
  Result := UseHttpClient(
    function(HttpClient: THttpClient) : IHTTPResponse
    begin
      Result := HttpClient.Get(pEndpoint);
    end
  );
end;

class function THttpService.UseHttpClient(const Func: TFunc<THttpClient, IHTTPResponse>): TResponse;
var
  HTTPClient : THttpClient;
  Response   : IHTTPResponse;
begin
  HTTPClient := THTTPClient.Create;
  try
    Response          := Func(HTTPClient);
    Result.StatusCode := Response.StatusCode;
    Result.StatusText := Response.StatusText;
    Result.Content    := Response.ContentAsString(TEncoding.UTF8);
  finally
    FreeAndNil(HTTPClient);
  end;
end;

end.
