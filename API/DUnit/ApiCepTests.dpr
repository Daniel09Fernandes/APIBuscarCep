program ApiCepTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  TestBusca.Cep in 'TestBusca.Cep.pas',
  Rest.Api.BuscaCep in '..\..\Compartilhado\Rest.Api.BuscaCep.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

