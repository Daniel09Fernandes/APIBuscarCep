unit Gerador.Logs;

interface

uses
  System.Classes, System.SysUtils;

Type
  TLog = class

    class procedure GravarLog(AText: String);
  end;

implementation

{ TLog }

class procedure TLog.GravarLog(AText: String);
begin
  var
    slLog := TStringList.Create;
  try
     var FilePath: string := (ExtractFilePath(ParamStr(0)) + '\Log\ApiCep.txt');

  if not DirectoryExists(ExtractFilePath(FilePath)) then
    ForceDirectories(ExtractFilePath(FilePath));

  if FileExists(FilePath) then
   slLog.LoadFromFile(FilePath);

  slLog.Insert(slLog.Count,
                      FormatDateTime('dd/MM/yyyy hh:mm:ss',now)+
                      ': '+ AText);
   slLog.SaveToFile(FilePath);
finally
   slLog.Free;
end;
end;

end.
