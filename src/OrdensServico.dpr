program OrdensServico;

uses
  Vcl.Forms,
  frmMain in 'views\frmMain.pas' {fMain},
  frmConfig in 'views\frmConfig.pas' {fConfig},
  untAppBootstrap in 'infra\common\untAppBootstrap.pas',
  untUtils in 'infra\common\untUtils.pas',
  untConfigManager in 'infra\config\untConfigManager.pas',
  untConnectionManager in 'infra\db\untConnectionManager.pas',
  untDatabaseBootstrap in 'infra\db\interfaces\untDatabaseBootstrap.pas',
  untDatabaseBootstrapFirebird in 'infra\firebird\untDatabaseBootstrapFirebird.pas',
  untScriptExecutor in 'infra\db\untScriptExecutor.pas',
  uDMBase in 'infra\db\datamodules\uDMBase.pas' {DMBase: TDataModule},
  untCliente in 'domain\untCliente.pas',
  untClienteRepository in 'repositories\interfaces\untClienteRepository.pas',
  untClienteRepositoryFirebird in 'repositories\untClienteRepositoryFirebird.pas',
  untClienteServiceImpl in 'services\untClienteServiceImpl.pas',
  frmListaClientes in 'views\frmListaClientes.pas' {fListaClientes},
  uDMCliente in 'infra\db\datamodules\uDMCliente.pas' {DMCliente: TDataModule},
  frmCliente in 'views\frmCliente.pas' {fCliente},
  untClienteService in 'services\interfaces\untClienteService.pas';

{$R *.res}

begin
  Application.Initialize;

  FConnectionManager := TConnectionManager.Create;

  if not InicializarSistema then
    Exit;

  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMBase, DMBase);
  Application.CreateForm(TDMCliente, DMCliente);
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfCliente, fCliente);
  Application.Run;
end.
