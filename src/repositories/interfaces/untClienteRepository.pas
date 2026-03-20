unit untClienteRepository;

interface

uses
  untCliente;

type
  IClienteRepository = interface
    ['{A2E3F7B0-9C1E-4A65-9B2F-222222222222}']

    procedure Inserir(ACliente: TCliente);
    procedure Atualizar(ACliente: TCliente);
    procedure Excluir(AID: Integer);
    function ObterPorID(AID: Integer): TCliente;
    function PossuiOrdemServico(const AClienteID: Integer): Boolean;
  end;

implementation

end.
