unit untClienteService;

interface

uses
  untCliente;

type
  IClienteService = interface
    ['{32934C41-DC6C-451E-B65D-685C0ABB0303}']

    procedure Salvar(ACliente: TCliente);
    procedure Excluir(AID: Integer);
    function ObterPorID(AID: Integer): TCliente;
  end;

implementation

end.
