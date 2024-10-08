unit BuscaCep.Services;

interface
 uses BuscaCep.Repository;

 Type
   IBuscaCepServices = interface
     ['{855BAA7D-78EA-4334-BD62-B10E09D6A4BA}']

     Function GetCep(ACep: String):String;
   end;

   TBuscaCepServices = class(TInterfacedObject, IBuscaCepServices)
    Private
     FBuscaCepRepository: IBuscaCepRepository<String>;
    Public
    constructor Create(BuscaCepRepository: IBuscaCepRepository<string>);
    Function GetCep(ACep: String): String;
   end;

implementation

{ TBuscaCepServices }

constructor TBuscaCepServices.Create(BuscaCepRepository: IBuscaCepRepository<string>);
begin
  FBuscaCepRepository := BuscaCepRepository;
end;

function TBuscaCepServices.GetCep(ACep: String): String;
begin
   //Patterns Services - Aqui pode conter alguma logica de  negocios, antes de devolver o Json para o client
   Result := FBuscaCepRepository.GetCep(ACep);
end;

end.
