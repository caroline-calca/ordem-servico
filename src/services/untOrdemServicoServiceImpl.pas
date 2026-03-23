unit untOrdemServicoServiceImpl;

interface

uses
  System.SysUtils,

  untOrdemServico,
  untOrdemServicoRepository,
  untOrdemServicoService;

type
  TOrdemServicoService = class(TInterfacedObject, IOrdemServicoService)
  private
    FRepository: IOrdemServicoRepository;
  public
    constructor Create(ARepository: IOrdemServicoRepository);

    procedure Salvar(AOS: TOrdemServico);
    procedure Excluir(AID: Integer);

    function ObterPorID(AID: Integer): TOrdemServico;
  end;

implementation

constructor TOrdemServicoService.Create(ARepository: IOrdemServicoRepository);
begin
  FRepository := ARepository;
end;

procedure TOrdemServicoService.Salvar(AOS: TOrdemServico);
begin
  if not Assigned(AOS) then
    raise Exception.Create('Ordem de Serviço inválida.');

  if AOS.ClienteID <= 0 then
    raise Exception.Create('Cliente é obrigatório.');

  if AOS.Itens.Count = 0 then
    raise Exception.Create('Informe ao menos um item.');

  if AOS.ID = 0 then
    FRepository.Inserir(AOS)
  else
    FRepository.Atualizar(AOS);
end;

procedure TOrdemServicoService.Excluir(AID: Integer);
begin
  if AID <= 0 then
    raise Exception.Create('OS inválida.');

  FRepository.Excluir(AID);
end;

function TOrdemServicoService.ObterPorID(AID: Integer): TOrdemServico;
begin
  if AID <= 0 then
    raise Exception.Create('OS inválida.');

  Result := FRepository.ObterPorID(AID);

  if not Assigned(Result) then
    raise Exception.Create('OS não encontrada.');
end;

end.
