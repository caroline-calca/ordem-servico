unit untOrdemServicoItem;

interface

type
  TOrdemServicoItem = class
  private
    FID: Integer;
    FOrdemID: Integer;
    FDescricao: string;
    FQuantidade: Double;
    FValorUnitario: Double;
  public
    property ID: Integer read FID write FID;
    property OrdemID: Integer read FOrdemID write FOrdemID;
    property Descricao: string read FDescricao write FDescricao;
    property Quantidade: Double read FQuantidade write FQuantidade;
    property ValorUnitario: Double read FValorUnitario write FValorUnitario;
  end;

implementation

end.
