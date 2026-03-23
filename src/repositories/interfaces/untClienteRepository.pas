unit untClienteRepository;

interface

uses
  System.Generics.Collections,
  untCliente,
  untClienteFiltro;

type
  IClienteRepository = interface
    ['{A2E3F7B0-9C1E-4A65-9B2F-222222222222}']

    procedure Inserir(ACliente: TCliente);
    procedure Atualizar(ACliente: TCliente);
    procedure Excluir(AID: Integer);

    function ObterPorID(AID: Integer): TCliente;
    function PossuiOrdemServico(const AID: Integer): Boolean;
  end;

implementation

end.
