unit untCliente;

interface

type
  TCliente = class
  private
    FID: Integer;
    FNome: string;
    FDocumento: string;
    FEmail: string;
    FTelefone: string;
    FDataCadastro: TDateTime;
  public
    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property Documento: string read FDocumento write FDocumento;
    property Email: string read FEmail write FEmail;
    property Telefone: string read FTelefone write FTelefone;
    property DataCadastro: TDateTime read FDataCadastro write FDataCadastro;
  end;

implementation

end.
