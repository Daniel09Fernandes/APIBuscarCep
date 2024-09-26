program Api.Cep;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  Busca.Cep.Controller in 'Controller\Busca.Cep.Controller.pas',
  BuscaCep.Services in 'Services\BuscaCep.Services.pas',
  BuscaCep.Repository in 'Repository\BuscaCep.Repository.pas',
  Client.Socket in 'Modules\Client.Socket.pas',
  Busca.Cep.Apicep.Model in 'Model\Busca.Cep.Apicep.Model.pas',
  Busca.Cep.AwesomeApi.Model in 'Model\Busca.Cep.AwesomeApi.Model.pas',
  Busca.Cep.Viacep.Model in 'Model\Busca.Cep.Viacep.Model.pas',
  Startup in 'Startup.pas',
  System.SysUtils,
  Gerador.Logs in 'Modules\Gerador.Logs.pas',
  Busca.Cep.Model in 'Model\Busca.Cep.Model.pas';

begin
  try
    StartServer;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
