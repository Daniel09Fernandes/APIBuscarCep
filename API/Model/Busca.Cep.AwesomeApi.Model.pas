unit Busca.Cep.AwesomeApi.Model;

interface

uses Busca.Cep.Model;

Type
  TAwensomeCepModel = class(TBuscaCepModel)
  private
    FAddress: string;
    [JSONName('address_name')]
    FAddressName: string;
    [JSONName('address_type')]
    FAddressType: string;
    FCep: string;
    FCity: string;
    [JSONName('city_ibge')]
    FCityIbge: string;
    FDdd: string;
    FDistrict: string;
    FLat: string;
    FLng: string;
    FState: string;
  Public
    property Address: string read FAddress write FAddress;
    property AddressName: string read FAddressName write FAddressName;
    property AddressType: string read FAddressType write FAddressType;
    property Cep: string read FCep write FCep;
    property City: string read FCity write FCity;
    property CityIbge: string read FCityIbge write FCityIbge;
    property Ddd: string read FDdd write FDdd;
    property District: string read FDistrict write FDistrict;
    property Lat: string read FLat write FLat;
    property Lng: string read FLng write FLng;
    property State: string read FState write FState;
    constructor Create();
  end;

implementation

{ TAwensomeCepModel }

constructor TAwensomeCepModel.Create();
begin
  inherited;
  Api := 'awensomecep';
end;

end.
