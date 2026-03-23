unit untOrdemServicoServiceFactory;

interface

uses
  untOrdemServicoService,
  untOrdemServicoServiceImpl,
  untOrdemServicoRepositoryFirebird;

function OSService: IOrdemServicoService;

implementation

function OSService: IOrdemServicoService;
begin
  Result := TOrdemServicoService.Create(TOrdemServicoRepositoryFirebird.Create);
end;

end.
