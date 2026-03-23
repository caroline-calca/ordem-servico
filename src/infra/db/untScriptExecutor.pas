unit untScriptExecutor;

interface

uses
  System.Classes,
  System.SysUtils,
  FireDAC.Comp.Client;

procedure ExecutarScript(AConnection: TFDConnection);

implementation

procedure ExecutarScript(AConnection: TFDConnection);
var
  ScriptPath: String;
  Script: TStringList;
  Comandos: TStringList;
  I: Integer;
  Qry: TFDQuery;
begin
  ScriptPath := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'sql\db.sql';

  if not FileExists(ScriptPath) then
    raise Exception.Create('Arquivo de script não encontrado: ' +sLineBreak+ ScriptPath);

  Script := TStringList.Create;
  Comandos := TStringList.Create;
  Qry := TFDQuery.Create(nil);
  try
    Script.LoadFromFile(ScriptPath);

    Script.Text := StringReplace(Script.Text, sLineBreak, ' ', [rfReplaceAll]);

    Comandos.Delimiter := ';';
    Comandos.StrictDelimiter := True;
    Comandos.DelimitedText := Script.Text;

    Qry.Connection := AConnection;

    for I := 0 to Comandos.Count - 1 do
    begin
      if Trim(Comandos[I]) <> '' then
        Qry.ExecSQL(Comandos[I]);
    end;

  finally
    Script.Free;
    Comandos.Free;
    Qry.Free;
  end;
end;

end.
