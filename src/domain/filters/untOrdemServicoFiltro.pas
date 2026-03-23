unit untOrdemServicoFiltro;

interface

uses
  System.SysUtils,
  untOrdemServico;

type
  TOrdemServicoFiltro = class
  public
    IDInicial: Integer;
    IDFinal: Integer;
    Status: TArray<TStatusOS>;
    ClienteNome: string;
    ValorMin: Double;
    ValorMax: Double;
    // Data Abertura
    DataAberturaInicial: TDateTime;
    DataAberturaFinal: TDateTime;
    // Data Prevista
    DataPrevistaInicial: TDateTime;
    DataPrevistaFinal: TDateTime;
    // Data Fechamento
    DataFechamentoInicial: TDateTime;
    DataFechamentoFinal: TDateTime;

    function TemIDInicial: Boolean;
    function TemIDFinal: Boolean;
    function TemCliente: Boolean;
    function TemValorMin: Boolean;
    function TemValorMax: Boolean;
    function TemStatus: Boolean;
    // Data Abertura
    function TemDataAberturaInicial: Boolean;
    function TemDataAberturaFinal: Boolean;
    // Data Prevista
    function TemDataPrevistaInicial: Boolean;
    function TemDataPrevistaFinal: Boolean;
    // Data Fechamento
    function TemDataFechamentoInicial: Boolean;
    function TemDataFechamentoFinal: Boolean;
  end;

implementation

function TOrdemServicoFiltro.TemIDInicial: Boolean;
begin
  Result := IDInicial > 0;
end;

function TOrdemServicoFiltro.TemIDFinal: Boolean;
begin
  Result := IDFinal > 0;
end;

function TOrdemServicoFiltro.TemCliente: Boolean;
begin
  Result := Trim(ClienteNome) <> '';
end;

function TOrdemServicoFiltro.TemValorMin: Boolean;
begin
  Result := ValorMin > 0;
end;

function TOrdemServicoFiltro.TemValorMax: Boolean;
begin
  Result := ValorMax > 0;
end;

function TOrdemServicoFiltro.TemStatus: Boolean;
begin
  Result := Length(Status) > 0;
end;

// Data Abertura
function TOrdemServicoFiltro.TemDataAberturaInicial: Boolean;
begin
  Result := DataAberturaInicial <> 0;
end;

function TOrdemServicoFiltro.TemDataAberturaFinal: Boolean;
begin
  Result := DataAberturaFinal <> 0;
end;

// Data Prevista
function TOrdemServicoFiltro.TemDataPrevistaInicial: Boolean;
begin
  Result := DataPrevistaInicial <> 0;
end;

function TOrdemServicoFiltro.TemDataPrevistaFinal: Boolean;
begin
  Result := DataPrevistaFinal <> 0;
end;

// Data Fechamento
function TOrdemServicoFiltro.TemDataFechamentoInicial: Boolean;
begin
  Result := DataFechamentoInicial <> 0;
end;

function TOrdemServicoFiltro.TemDataFechamentoFinal: Boolean;
begin
  Result := DataFechamentoFinal <> 0;
end;

end.
