unit Busca.Cep.Controller;

interface

uses
  Horse,
  BuscaCep.Services,
  BuscaCep.Repository;

 Type
  TBuscaCepController = class
    private
      class var FBuscaCepController: TBuscaCepController;
      FBuscaCepServices: IBuscaCepServices;
      procedure BuscarCep (Req: THorseRequest; Res: THorseResponse; Next: TProc);
      constructor Create(); //Para Aplicação do singleton, protege o create
      destructor Destroy;   override; //Para Aplicação do singleton, protege o destroy
    public
      procedure Rotas;
      class function GetInstance: TBuscaCepController;
      class procedure FreeInstance;
  end;

implementation

uses
  System.SysUtils;

{ TBuscaCepController }

procedure TBuscaCepController.BuscarCep(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  Res.Send(FBuscaCepServices.GetCep(req.Params.Items['cep']));
end;

constructor TBuscaCepController.Create();
begin
  FBuscaCepServices := TBuscaCepServices.Create(TBuscaCepRepository.Create)
end;

destructor TBuscaCepController.Destroy;
begin
  FBuscaCepServices := Nil;
  inherited;
end;

class procedure TBuscaCepController.FreeInstance;
begin
  if Assigned(FBuscaCepController) then //para evitar AV  
    FreeAndNil(FBuscaCepController);
end;

class function TBuscaCepController.GetInstance: TBuscaCepController;
begin
  if not Assigned(FBuscaCepController) then
    FBuscaCepController := TBuscaCepController.Create;

  Result :=  FBuscaCepController; //Controle, para garantir que apenas uma instancia será criada.
end;

procedure TBuscaCepController.Rotas;
begin
  THorse.Get('/BuscarCep/:cep',BuscarCep);
end;

end.
