unit untClienteServiceImpl;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  untCliente,
  untClienteRepository,
  untClienteService,
  untClienteFiltro;

type
  TClienteService = class(TInterfacedObject, IClienteService)
  private
    FRepository: IClienteRepository;
  public
    constructor Create(ARepository: IClienteRepository);

    procedure Salvar(ACliente: TCliente);
    procedure Excluir(AID: Integer);

    function ObterPorID(AID: Integer): TCliente;
  end;

implementation

constructor TClienteService.Create(ARepository: IClienteRepository);
begin
  FRepository := ARepository;
end;

procedure TClienteService.Salvar(ACliente: TCliente);
begin
  if not Assigned(ACliente) then
    raise Exception.Create('Cliente inválido.');

  if Trim(ACliente.Nome) = '' then
    raise Exception.Create('Nome é obrigatório.');

  if ACliente.ID = 0 then
    FRepository.Inserir(ACliente)
  else
    FRepository.Atualizar(ACliente);
end;

procedure TClienteService.Excluir(AID: Integer);
begin
  if AID <= 0 then
    raise Exception.Create('Cliente inválido.');

  if FRepository.PossuiOrdemServico(AID) then
    raise Exception.Create('Não é possível excluir o cliente pois ele possui ordens de serviço.');

  FRepository.Excluir(AID);
end;

function TClienteService.ObterPorID(AID: Integer): TCliente;
begin
  if AID <= 0 then
    raise Exception.Create('Cliente inválido.');

  Result := FRepository.ObterPorID(AID);

  if not Assigned(Result) then
    raise Exception.Create('Cliente não encontrado.');
end;

end.
