unit untOrdemServicoService;

interface

uses
  untOrdemServico;

type
  IOrdemServicoService = interface
    ['{12345678-ABCD-1234-ABCD-1234567890AB}']

    procedure Salvar(AOS: TOrdemServico);
    procedure Excluir(AID: Integer);

    function ObterPorID(AID: Integer): TOrdemServico;
  end;

implementation

end.
