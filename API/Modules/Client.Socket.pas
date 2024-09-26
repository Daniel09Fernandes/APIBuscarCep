unit Client.Socket;

interface
uses
  System.SysUtils, System.Classes, REST.Types, REST.Client,
  System.JSON, REST.Json;

 Type
   TClientSocket<T: class, constructor> = class(TRESTClient)
   private
    FRESTRequest: TRESTRequest;
   public
    function    Get:T;
    constructor Create(AOwner: TComponent; AUrl: string);
    destructor  Destroy; override;
   end;

implementation

{ TClientSocket }

constructor TClientSocket<T>.Create(AOwner: TComponent; AUrl: string);
begin
  inherited Create(AUrl);
  Accept := '*/*';
  AcceptCharset := 'utf-8';
  AllowCookies := true;
  FRESTRequest := TRESTRequest.Create(self);
  FRESTRequest.Client := Self;
end;

destructor TClientSocket<T>.Destroy;
begin
  FreeAndNil(FRESTRequest);
  inherited;
end;

function TClientSocket<T>.Get(): T;
begin
  FRESTRequest.Method := rmGET;
  FRESTRequest.Execute;

  Result := TJson.JsonToObject<T>(FRESTRequest.Response.JSONText);
end;

end.
