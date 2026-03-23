unit uDMOrdemServico;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  uDMBase,
  untOrdemServicoFiltro,
  untOrdemServico;

type
  TDMOrdemServico = class(TDMBase)
    qryOS: TFDQuery;
    qryOSID: TIntegerField;
    qryOSCLIENTE_ID: TIntegerField;
    qryOSCLIENTE_NOME: TWideStringField;
    qryOSDATA_ABERTURA: TDateField;
    qryOSDATA_PREVISTA: TDateField;
    qryOSDATA_FECHAMENTO: TDateField;
    qryOSSTATUS: TWideStringField;
    qryOSVALOR_TOTAL: TFMTBCDField;
    qryOSEM_ATRASO: TIntegerField;
    qryItens: TFDQuery;
    qryItensORDEM_ID: TIntegerField;
    qryItensID: TIntegerField;
    qryItensDESCRICAO: TWideStringField;
    qryItensQUANTIDADE: TFMTBCDField;
    qryItensVALOR_UNITARIO: TFMTBCDField;
    dsOS: TDataSource;
    dsItens: TDataSource;
    qryRelOS: TFDQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    WideStringField1: TWideStringField;
    DateField1: TDateField;
    DateField2: TDateField;
    DateField3: TDateField;
    WideStringField2: TWideStringField;
    FMTBCDField1: TFMTBCDField;
    IntegerField3: TIntegerField;
    qryRelItens: TFDQuery;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    WideStringField3: TWideStringField;
    FMTBCDField2: TFMTBCDField;
    FMTBCDField3: TFMTBCDField;
    dsRelOS: TDataSource;
    dsRelItens: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryOSAfterOpen(DataSet: TDataSet);
    procedure qryOSAfterRefresh(DataSet: TDataSet);
    procedure qryOSAfterScroll(DataSet: TDataSet);
    procedure qryRelOSAfterOpen(DataSet: TDataSet);
    procedure qryRelOSAfterRefresh(DataSet: TDataSet);
    procedure qryRelOSAfterScroll(DataSet: TDataSet);
  private
    procedure Listar(const AFiltro: TOrdemServicoFiltro; AQry: TFDQuery; AOrdem: String = ''); overload;
  public
    procedure Listar(const AFiltro: TOrdemServicoFiltro); overload;
    procedure ListarRelatorio(const AFiltro: TOrdemServicoFiltro);
  end;

var
  DMOrdemServico: TDMOrdemServico;

implementation

{$R *.dfm}

procedure TDMOrdemServico.DataModuleCreate(Sender: TObject);
begin
  if not Assigned(Connection) then
    raise Exception.Create('Conexão não inicializada.');

  qryOS.Connection := Connection;
  qryItens.Connection := Connection;

  qryRelOS.Connection := Connection;
  qryRelItens.Connection := Connection;
end;

procedure TDMOrdemServico.qryOSAfterOpen(DataSet: TDataSet);
begin
  qryItens.Open;
end;

procedure TDMOrdemServico.qryOSAfterRefresh(DataSet: TDataSet);
begin
  qryItens.Open;
end;

procedure TDMOrdemServico.qryOSAfterScroll(DataSet: TDataSet);
begin
  qryItens.Open;
end;

procedure TDMOrdemServico.qryRelOSAfterOpen(DataSet: TDataSet);
begin
  qryRelItens.Open;
end;

procedure TDMOrdemServico.qryRelOSAfterRefresh(DataSet: TDataSet);
begin
  qryRelItens.Open;
end;

procedure TDMOrdemServico.qryRelOSAfterScroll(DataSet: TDataSet);
begin
  qryRelItens.Open;
end;

procedure TDMOrdemServico.Listar(const AFiltro: TOrdemServicoFiltro);
begin
  Listar(AFiltro, qryOS);
end;

procedure TDMOrdemServico.ListarRelatorio(const AFiltro: TOrdemServicoFiltro);
begin
  Listar(AFiltro, qryRelOS, 'STATUS');
end;

procedure TDMOrdemServico.Listar(const AFiltro: TOrdemServicoFiltro; AQry: TFDQuery; AOrdem: String = '');
var
  i: Integer;
  Params: string;
begin
  if AOrdem = '' then
    AOrdem := 'ID DESC';

  AQry.Close;
  AQry.SQL.Clear;

  AQry.SQL.Add('SELECT');
  AQry.SQL.Add('  ID,');
  AQry.SQL.Add('  CLIENTE_ID,');
  AQry.SQL.Add('  CLIENTE_NOME,');
  AQry.SQL.Add('  DATA_ABERTURA,');
  AQry.SQL.Add('  DATA_PREVISTA,');
  AQry.SQL.Add('  DATA_FECHAMENTO,');
  AQry.SQL.Add('  STATUS,');
  AQry.SQL.Add('  VALOR_TOTAL,');
  AQry.SQL.Add('  EM_ATRASO');
  AQry.SQL.Add('FROM VW_OS_RESUMO');
  AQry.SQL.Add('WHERE 1=1');

  if Assigned(AFiltro) then
  begin
    // ID OS
    if AFiltro.TemIDInicial then
    begin
      AQry.SQL.Add('AND ID >= :ID_INICIAL');
      AQry.ParamByName('ID_INICIAL').AsInteger := AFiltro.IDInicial;
    end;

    if AFiltro.TemIDFinal then
    begin
      AQry.SQL.Add('AND ID <= :ID_FINAL');
      AQry.ParamByName('ID_FINAL').AsInteger := AFiltro.IDFinal;
    end;

    // Data Abertura
    if AFiltro.TemDataAberturaInicial then
    begin
      AQry.SQL.Add('AND DATA_ABERTURA >= :DATA_ABERTURA_INICIAL');
      AQry.ParamByName('DATA_ABERTURA_INICIAL').AsDate := AFiltro.DataAberturaInicial;
    end;

    if AFiltro.TemDataAberturaFinal then
    begin
      AQry.SQL.Add('AND DATA_ABERTURA <= :DATA_ABERTURA_FINAL');
      AQry.ParamByName('DATA_ABERTURA_FINAL').AsDate := AFiltro.DataAberturaFinal;
    end;

    // Data Prevista
    if AFiltro.TemDataPrevistaInicial then
    begin
      AQry.SQL.Add('AND DATA_PREVISTA >= :DATA_PREVISTA_INICIAL');
      AQry.ParamByName('DATA_PREVISTA_INICIAL').AsDate := AFiltro.DataPrevistaInicial;
    end;

    if AFiltro.TemDataPrevistaFinal then
    begin
      AQry.SQL.Add('AND DATA_PREVISTA <= :DATA_PREVISTA_FINAL');
      AQry.ParamByName('DATA_PREVISTA_FINAL').AsDate := AFiltro.DataPrevistaFinal;
    end;

    // Data Fechamento
    if AFiltro.TemDataFechamentoInicial then
    begin
      AQry.SQL.Add('AND DATA_FECHAMENTO >= :DATA_FECHAMENTO_INICIAL');
      AQry.ParamByName('DATA_FECHAMENTO_INICIAL').AsDate := AFiltro.DataFechamentoInicial;
    end;

    if AFiltro.TemDataFechamentoFinal then
    begin
      AQry.SQL.Add('AND DATA_FECHAMENTO <= :DATA_FECHAMENTO_FINAL');
      AQry.ParamByName('DATA_FECHAMENTO_FINAL').AsDate := AFiltro.DataFechamentoFinal;
    end;

    // Cliente
    if AFiltro.TemCliente then
    begin
      AQry.SQL.Add('AND UPPER(CLIENTE_NOME) LIKE :CLIENTE');
      AQry.ParamByName('CLIENTE').AsString :=
        '%' + UpperCase(AFiltro.ClienteNome) + '%';
    end;

    // Valor Total
    if AFiltro.TemValorMin then
    begin
      AQry.SQL.Add('AND VALOR_TOTAL >= :VALOR_MIN');
      AQry.ParamByName('VALOR_MIN').AsFloat := AFiltro.ValorMin;
    end;

    if AFiltro.TemValorMax then
    begin
      AQry.SQL.Add('AND VALOR_TOTAL <= :VALOR_MAX');
      AQry.ParamByName('VALOR_MAX').AsFloat := AFiltro.ValorMax;
    end;

    // Status
    if AFiltro.TemStatus then
    begin
      Params := '';

      for i := 0 to High(AFiltro.Status) do
      begin
        if i > 0 then
          Params := Params + ',';

        Params := Params + ':STATUS' + i.ToString;
      end;

      AQry.SQL.Add('AND STATUS IN (' + Params + ')');

      for i := 0 to High(AFiltro.Status) do
      begin
        AQry.ParamByName('STATUS' + i.ToString).AsString :=
          TStatusOSUtils.ToString(AFiltro.Status[i]);
      end;
    end;
  end;

  AQry.SQL.Add('ORDER BY ' + AOrdem);

  AQry.Open;
end;

end.
