unit Startup;

interface
uses System.SysUtils,
     Horse,
     Busca.Cep.Controller,
     System.Classes,
     System.SyncObjs,
     System.Threading;

Procedure StartServer;

implementation

procedure StartHorse;
begin
  Writeln('Horse rodando na porta:9000');
  Writeln('Servidor Iniciado!');
  Writeln;
  Writeln('Pressione qualquer tecla para, parar o servidor...');
  TBuscaCepController.GetInstance.Rotas;
  THorse.Listen(9000);
end;

Procedure StartServer;
var
  ServerTask: ITask;
begin
  try
    //Necessario rodar em paralelo, para liberar o terminal, e poder interagir, para parar o servidor horse
    ServerTask := TTask.Create(StartHorse);
    ServerTask.Start;

    //Colocando o terminal em espera
    Readln;
    Writeln('O Servidor est� sendo encerrado!');
    THorse.StopListen;

  finally
    // Libera a controller da memoria
    TBuscaCepController.FreeInstance;
    ServerTask := nil;
  end;
end;


end.
