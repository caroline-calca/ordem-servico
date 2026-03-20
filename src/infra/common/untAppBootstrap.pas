unit untAppBootstrap;

interface

function InicializarSistema: Boolean;

implementation

uses
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  untDatabaseBootstrap,
  untDatabaseBootstrapFirebird,
  untConnectionManager,

  frmConfig;

function InicializarSistema: Boolean;
var
  Bootstrap: IDatabaseBootstrap;
begin
  Result := False;

  Bootstrap := TDatabaseBootstrapFirebird.Create;
  try
    try
      // Tentativa normal de inicialização
      if Bootstrap.Inicializar then
      begin
        Result := True;
        Exit;
      end;

      // Usuário não quis criar o banco
      if TfConfig.Executar <> mrOk then
      begin
        Application.Terminate;
        Exit;
      end;

      // Tentamos novamente após o usuário ajustar a config
      Result := InicializarSistema;

    except
      on E: Exception do
      begin
        // Erro real (config inválida, erro inesperado, etc)
        if TfConfig.Executar <> mrOk then
        begin
          Application.Terminate;
          Exit;
        end;

        Result := InicializarSistema;
      end;
    end;
  finally
    Bootstrap := nil;
  end;
end;

end.
