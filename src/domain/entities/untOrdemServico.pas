unit untOrdemServico;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  untCliente,
  untOrdemServicoItem;

type
  TStatusOS = (soAberta, soEmAndamento, soConcluida, soCancelada);

type
  TStatusOSUtils = class
  public
    class function FromString(const AValue: string): TStatusOS;
    class function ToString(AStatus: TStatusOS): string;
  end;

type
  TOrdemServico = class
  private
    FID: Integer;
    FClienteID: Integer;
    FDataAbertura: TDateTime;
    FDataPrevista: TDateTime;
    FDataFechamento: TDateTime;
    FStatus: TStatusOS;
    FDescricaoProblema: string;
    FValorTotal: Double;
    FItens: TObjectList<TOrdemServicoItem>;
  public
    constructor Create;
    destructor Destroy; override;

    procedure CalcularValorTotal;
    function EstaEmAtraso: Boolean;
    procedure AdicionarItem(AItem: TOrdemServicoItem);
    procedure RemoverItem(AItem: TOrdemServicoItem);

    property ID: Integer read FID write FID;
    property ClienteID: Integer read FClienteID write FClienteID;
    property DataAbertura: TDateTime read FDataAbertura write FDataAbertura;
    property DataPrevista: TDateTime read FDataPrevista write FDataPrevista;
    property DataFechamento: TDateTime read FDataFechamento write FDataFechamento;
    property Status: TStatusOS read FStatus write FStatus;
    property DescricaoProblema: string read FDescricaoProblema write FDescricaoProblema;
    property ValorTotal: Double read FValorTotal write FValorTotal;
    property Itens: TObjectList<TOrdemServicoItem> read FItens write FItens;
  end;

implementation

{ TStatusOSUtils }

class function TStatusOSUtils.FromString(const AValue: string): TStatusOS;
begin
  if SameText(AValue, 'Aberta') then Result := soAberta
  else if SameText(AValue, 'Em Andamento') then Result := soEmAndamento
  else if SameText(AValue, 'Concluida') then Result := soConcluida
  else if SameText(AValue, 'Cancelada') then Result := soCancelada
  else raise Exception.CreateFmt('StatusOS inválido: %s', [AValue]);
end;

class function TStatusOSUtils.ToString(AStatus: TStatusOS): string;
begin
  case AStatus of
    soAberta: Result := 'Aberta';
    soEmAndamento: Result := 'Em Andamento';
    soConcluida: Result := 'Concluida';
    soCancelada: Result := 'Cancelada';
  else
    Result := '';
  end;
end;

{ TOrdemServico }

constructor TOrdemServico.Create;
begin
  FItens := TObjectList<TOrdemServicoItem>.Create(True);
  FDataAbertura := Date;
  FStatus := soAberta;
end;

destructor TOrdemServico.Destroy;
begin
  FItens.Free;
  inherited;
end;

procedure TOrdemServico.CalcularValorTotal;
var
  Item: TOrdemServicoItem;
begin
  FValorTotal := 0;
  for Item in FItens do
    FValorTotal := FValorTotal + (Item.Quantidade * Item.ValorUnitario);
end;

function TOrdemServico.EstaEmAtraso: Boolean;
begin
  Result := (FStatus <> soConcluida) and
            (FStatus <> soCancelada) and
            (FDataPrevista <> 0) and
            (Date > FDataPrevista);
end;

procedure TOrdemServico.AdicionarItem(AItem: TOrdemServicoItem);
begin
  FItens.Add(AItem);
  CalcularValorTotal;
end;

procedure TOrdemServico.RemoverItem(AItem: TOrdemServicoItem);
begin
  FItens.Remove(AItem);
  CalcularValorTotal;
end;

end.
