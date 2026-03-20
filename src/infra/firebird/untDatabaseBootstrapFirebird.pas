unit untDatabaseBootstrapFirebird;

interface

uses
  System.SysUtils,
  System.Classes,
  System.IOUtils,
  FireDAC.Comp.Client,
  FireDAC.Stan.Def,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.DApt,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param,
  Data.DB,
  Vcl.Controls,

  untUtils,
  untDatabaseBootstrap,
  untConnectionManager,
  untConfigManager,
  untScriptExecutor;

type
  TDatabaseBootstrapFirebird = class(TInterfacedObject, IDatabaseBootstrap)
  private
    FConnBoot: TFDConnection;

    procedure CriarDatabase;
    procedure CriarEstrutura;

    procedure ConectarBoot(const ACreateDatabase: Boolean = False);
  public
    constructor Create;
    destructor Destroy; override;

    function Inicializar: Boolean;
  end;

implementation

{ TDatabaseBootstrapFirebird }

procedure TDatabaseBootstrapFirebird.ConectarBoot(const ACreateDatabase: Boolean = False);
begin
  if FConnBoot.Connected then
    FConnBoot.Connected := False;

  FConnectionManager.ConfigurarParametros(FConnBoot.Params, ACreateDatabase);
  FConnBoot.Connected := True;
end;

constructor TDatabaseBootstrapFirebird.Create;
begin
  //
end;

destructor TDatabaseBootstrapFirebird.Destroy;
begin
  //
  inherited;
end;

procedure TDatabaseBootstrapFirebird.CriarDatabase;
begin
  ConectarBoot(True);
end;

procedure TDatabaseBootstrapFirebird.CriarEstrutura;
begin
  ExecutarScript(FConnBoot);
end;

function TDatabaseBootstrapFirebird.Inicializar: Boolean;
var
  Config: TConfigManager;
  BancoNovo: Boolean;
begin
  Result := False;

  Config := TConfigManager.Create;
  try
    if not Config.ConfiguracaoValida then
      raise Exception.Create('Configuração de banco inválida.');

    BancoNovo := not FileExists(Config.Database);
  finally
    Config.Free;
  end;

  if BancoNovo then
  begin
    if ShowMsg('O banco de dados configurado não foi encontrado.' + sLineBreak +
               'Deseja criá-lo automaticamente?', mtQuest) <> mrYes then
      Exit(False);
  end;

  FConnBoot := TFDConnection.Create(nil);
  try
    if BancoNovo then
    begin
      CriarDatabase;

      ConectarBoot(False);
      CriarEstrutura;
    end
    else
      ConectarBoot(False);

    FConnectionManager.Conectar;
    Result := True;
  finally
    FConnBoot.Connected := False;
    FConnBoot.Free;
  end;

end;

end.
