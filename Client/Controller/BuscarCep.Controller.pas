unit BuscarCep.Controller;

interface
uses BuscarCep.Model, BuscarCep.Entity;
 Type
   TBuscarCepController = class
    private
     FModel : TBuscarCepModel;
    public
      constructor Create;
      destructor Destroy; override;

      function BuscaCep(ACep: String): TBuscarCepEntity;
   end;

implementation

uses
  System.SysUtils;

{ TBuscarCepController }

function TBuscarCepController.BuscaCep(ACep: String): TBuscarCepEntity;
begin
   Result := FModel.BuscaCep(ACep);
end;

constructor TBuscarCepController.Create;
begin
  FModel := TBuscarCepModel.Create;
end;

destructor TBuscarCepController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

end.
