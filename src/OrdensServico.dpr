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
  untClienteRepository in 'repositories\interfaces\untClienteRepository.pas',
  untClienteRepositoryFirebird in 'repositories\untClienteRepositoryFirebird.pas',
  untClienteServiceImpl in 'services\untClienteServiceImpl.pas',
  frmListaClientes in 'views\frmListaClientes.pas' {fListaClientes},
  frmCadCliente in 'views\frmCadCliente.pas' {fCliente},
  untClienteService in 'services\interfaces\untClienteService.pas',
  untCliente in 'domain\entities\untCliente.pas',
  untClienteFiltro in 'domain\filters\untClienteFiltro.pas',
  untClienteServiceFactory in 'services\factories\untClienteServiceFactory.pas',
  untOrdemServico in 'domain\entities\untOrdemServico.pas',
  untOrdemServicoItem in 'domain\entities\untOrdemServicoItem.pas',
  untOrdemServicoFiltro in 'domain\filters\untOrdemServicoFiltro.pas',
  untOrdemServicoRepository in 'repositories\interfaces\untOrdemServicoRepository.pas',
  untOrdemServicoRepositoryFirebird in 'repositories\untOrdemServicoRepositoryFirebird.pas',
  untOrdemServicoService in 'services\interfaces\untOrdemServicoService.pas',
  untOrdemServicoServiceImpl in 'services\untOrdemServicoServiceImpl.pas',
  untOrdemServicoServiceFactory in 'services\factories\untOrdemServicoServiceFactory.pas',
  frmListaOrdemServico in 'views\frmListaOrdemServico.pas' {fListaOrdemServico},
  frmCadOrdemServico in 'views\frmCadOrdemServico.pas' {fOrdemServico},
  frmRelOrdemServico in 'views\reports\frmRelOrdemServico.pas' {fRelOrdemServico},
  uDMOrdemServico in 'infra\db\datamodules\uDMOrdemServico.pas' {DMOrdemServico: TDataModule},
  uDMCliente in 'infra\db\datamodules\uDMCliente.pas' {DMCliente: TDataModule};

{$R *.res}

begin
  Application.Initialize;

  FConnectionManager := TConnectionManager.Create;

  if not InicializarSistema then
    Exit;

  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMBase, DMBase);
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TDMOrdemServico, DMOrdemServico);
  Application.CreateForm(TDMCliente, DMCliente);
  Application.Run;
end.
