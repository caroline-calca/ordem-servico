unit untOrdemServicoRepository;

interface

uses
  System.Generics.Collections,
  untOrdemServico,
  untOrdemServicoItem,
  untOrdemServicoFiltro;

type
  IOrdemServicoRepository = interface
    ['{0F1C2E3D-4B5A-6789-0123-456789ABCDEF}']

    procedure Inserir(AOS: TOrdemServico);
    procedure Atualizar(AOS: TOrdemServico);
    procedure Excluir(AID: Integer);
    function ObterPorID(AID: Integer): TOrdemServico;

    procedure InserirItem(AItem: TOrdemServicoItem);
    function ObterItens(AOrdemID: Integer): TObjectList<TOrdemServicoItem>;
  end;

implementation

end.
