unit Rest.Api.BuscaCep;

interface

uses Rest.Client;

Type
  TRestApiBuscaCep = class
  private
   Const  URL_API = 'http://localhost:9000/BuscarCep/';
   Class var FStatusCode:Integer;
  public
    class property StatusCode:integer read FStatusCode  write FStatusCode;
    class Function ExecutarRequisicao(ACep:String; UrlServer: String = ''): String;
  end;

implementation

uses
  System.SysUtils, StrUtils;

{ TRestApiBuscaCep }

class function TRestApiBuscaCep.ExecutarRequisicao(ACep:String; UrlServer: String = ''): String;
  var FRestRequest : TRESTRequest;
  var FRestClient :  TRESTClient;
begin
  FRestClient := TRESTClient.Create(IfThen(UrlServer.Trim.IsEmpty, URL_API + ACep, UrlServer + ACep));
  FRestRequest := TRESTRequest.Create(FRestClient);
  try
    FRestClient.Accept := '*/*';
    FRestClient.AcceptCharset := 'utf-8';
    FRestRequest.Client := FRestClient;

    FRestRequest.Execute;
    StatusCode := FRestRequest.Response.StatusCode;
    Result:= FRestRequest.Response.JSONText;
  finally
    FreeAndNil(FRestRequest);
    FreeAndNil(FRestClient);
  end;
end;

end.
