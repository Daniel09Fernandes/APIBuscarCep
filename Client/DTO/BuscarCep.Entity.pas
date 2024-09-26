unit BuscarCep.Entity;

interface

type
  TBuscarCepEntity = class
  private
    FCidade: String;
    FLogradouro: String;
    FBairro: String;
    FUF: String;
    FApi: String;
  public
    property Cidade: String read FCidade write FCidade;
    property Logradouro: String read FLogradouro write FLogradouro;
    property Bairro: String read FBairro write FBairro;
    property UF: String read FUF write FUF;
    property Api: String read FApi write FApi;
  end;

implementation

end.
