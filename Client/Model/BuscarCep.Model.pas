unit BuscarCep.Model;

interface
 uses
   Rest.Json, System.JSON,
   Gerador.Logs,
   Rest.Api.BuscaCep,
   Busca.Cep.Viacep.Model,
   Busca.Cep.AwesomeApi.Model,
   Busca.Cep.ApiCep.Model,
   BuscarCep.Entity;
Type
  TBuscarCepModel = class
   private
     Function ParseApiCepToBuscarCepModel(AModel: TApiCepModel): TBuscarCepEntity;
     Function ParseViaCepToBuscarCepModel(AModel: TViaCepModel): TBuscarCepEntity;
     Function ParseAwensomeCepToBuscarCepModel(AModel: TAwensomeCepModel): TBuscarCepEntity;
   public
    function BuscaCep(ACep: String): TBuscarCepEntity;
    constructor Create;
    destructor Destroy; override;

  end;

implementation

uses
  System.SysUtils, StrUtils;

{ TBuscarCepModel }

function TBuscarCepModel.BuscaCep(ACep: String): TBuscarCepEntity;
begin
  try
    var Response := TRestApiBuscaCep.ExecutarRequisicao(ACep);
    var JsonObject := TJSONObject.ParseJSONValue(Response) as TJSONObject;
    try
      if Assigned(JsonObject) then
      begin
       var APIValue := JsonObject.GetValue<string>('api');

        case AnsiIndexStr(lowerCase(APIValue), ['viacep', 'apicep','awensomecep']) of
           0 : Result := ParseViaCepToBuscarCepModel(TJson.JsonToObject<TViaCepModel>(Response));
           1 : Result := ParseApiCepToBuscarCepModel(TJson.JsonToObject<TApiCepModel>(Response));
           2 : Result := ParseAwensomeCepToBuscarCepModel(TJson.JsonToObject<TAwensomeCepModel>(Response));
        else
           begin
             TLog.GravarLog('TBuscarCepModel.BuscaCep: Erro ao realizar parse, nenhum objeto foi encontrado');
             Result := nil;
           end;
        end;
      end
      else
        TLog.GravarLog('TBuscarCepModel.BuscaCep: Erro ao assinar o json');
    finally
      JsonObject.Free;
    end;
  Except
   on E:Exception do
   begin
    TLog.GravarLog('TBuscarCepModel.BuscaCep: '+ E.Message);
    Result :=  nil;
   end;
  end;
end;

constructor TBuscarCepModel.Create();
begin

end;

destructor TBuscarCepModel.Destroy;
begin
  
  inherited;
end;

function TBuscarCepModel.ParseApiCepToBuscarCepModel(
  AModel: TApiCepModel): TBuscarCepEntity;
begin
  Result := TBuscarCepEntity.Create;
  with Result do
  begin
   Cidade     := AModel.City;
   Logradouro := AModel.Address;
   Bairro     := AModel.District;
   UF         := AModel.State;
   Api        := AModel.Api;
  end;

end;

function TBuscarCepModel.ParseAwensomeCepToBuscarCepModel(
  AModel: TAwensomeCepModel): TBuscarCepEntity;
begin
  Result := TBuscarCepEntity.Create;
  with Result do
  begin
   Cidade     := AModel.City;
   Logradouro := AModel.Address;
   Bairro     := AModel.District;
   UF         := AModel.State;
   Api        := AModel.Api;
  end;
end;

function TBuscarCepModel.ParseViaCepToBuscarCepModel(
  AModel: TViaCepModel): TBuscarCepEntity;
begin
  Result := TBuscarCepEntity.Create;
  with Result do
  begin
   Cidade     := AModel.Localidade;
   Logradouro := AModel.Logradouro;
   Bairro     := AModel.Bairro;
   UF         := AModel.Uf;
   Api        := AModel.Api;
  end;
end;

end.
