program BuscaCep.Client;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  BuscaCep.view in 'View\BuscaCep.view.pas' {frBuscarCepView},
  BuscarCep.Controller in 'Controller\BuscarCep.Controller.pas',
  BuscarCep.Model in 'Model\BuscarCep.Model.pas',
  BuscarCep.Entity in 'DTO\BuscarCep.Entity.pas',
  Rest.Api.BuscaCep in '..\Compartilhado\Rest.Api.BuscaCep.pas',
  Busca.Cep.Apicep.Model in '..\API\Model\Busca.Cep.Apicep.Model.pas',
  Busca.Cep.AwesomeApi.Model in '..\API\Model\Busca.Cep.AwesomeApi.Model.pas',
  Busca.Cep.Viacep.Model in '..\API\Model\Busca.Cep.Viacep.Model.pas',
  Busca.Cep.Model in '..\API\Model\Busca.Cep.Model.pas',
  Gerador.Logs in '..\API\Modules\Gerador.Logs.pas';

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.CreateForm(TfrBuscarCepView, frBuscarCepView);
  Application.Run;
end.
