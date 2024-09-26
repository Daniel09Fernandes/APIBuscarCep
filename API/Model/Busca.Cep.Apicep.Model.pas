unit Busca.Cep.Apicep.Model;

interface
uses Busca.Cep.Model;

type
  TApiCepModel = class(TBuscaCepModel)
  private
    FAddress: string;
    FCity: string;
    FCode: string;
    FDistrict: string;
    FState: string;
    FStatus: Integer;
  Public
    property Address: string read FAddress write FAddress;
    property City: string read FCity write FCity;
    property Code: string read FCode write FCode;
    property District: string read FDistrict write FDistrict;
    property State: string read FState write FState;
    property Status: Integer read FStatus write FStatus;
    constructor Create();
  end;

implementation

{ TApiCepModel }

constructor TApiCepModel.Create();
begin
  inherited;
  Api := 'apicep';
end;
end.
