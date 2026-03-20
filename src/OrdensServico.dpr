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
  untScriptExecutor in 'infra\db\untScriptExecutor.pas';

{$R *.res}

begin
  Application.Initialize;

  FConnectionManager := TConnectionManager.Create;

  if not InicializarSistema then
    Exit;

  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
