unit untClienteServiceFactory;

interface

uses
  untClienteService,
  untClienteServiceImpl,
  untClienteRepositoryFirebird;

function ClienteService: IClienteService;

implementation

function ClienteService: IClienteService;
begin
  Result := TClienteService.Create(TClienteRepositoryFirebird.Create);
end;

end.
