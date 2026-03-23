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
  FireDAC.DApt, Data.DB,
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
    procedure DataModuleCreate(Sender: TObject);
    procedure qryOSAfterOpen(DataSet: TDataSet);
    procedure qryOSAfterRefresh(DataSet: TDataSet);
    procedure qryOSAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure Listar(const AFiltro: TOrdemServicoFiltro);
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
end;

procedure TDMOrdemServico.Listar(const AFiltro: TOrdemServicoFiltro);
var
  i: Integer;
  Params: string;
begin
  qryOS.Close;
  qryOS.SQL.Clear;

  qryOS.SQL.Add('SELECT');
  qryOS.SQL.Add('  ID,');
  qryOS.SQL.Add('  CLIENTE_ID,');
  qryOS.SQL.Add('  CLIENTE_NOME,');
  qryOS.SQL.Add('  DATA_ABERTURA,');
  qryOS.SQL.Add('  DATA_PREVISTA,');
  qryOS.SQL.Add('  DATA_FECHAMENTO,');
  qryOS.SQL.Add('  STATUS,');
  qryOS.SQL.Add('  VALOR_TOTAL,');
  qryOS.SQL.Add('  EM_ATRASO');
  qryOS.SQL.Add('FROM VW_OS_RESUMO');
  qryOS.SQL.Add('WHERE 1=1');

  if Assigned(AFiltro) then
  begin
    // ID OS
    if AFiltro.TemIDInicial then
    begin
      qryOS.SQL.Add('AND ID >= :ID_INICIAL');
      qryOS.ParamByName('ID_INICIAL').AsInteger := AFiltro.IDInicial;
    end;

    if AFiltro.TemIDFinal then
    begin
      qryOS.SQL.Add('AND ID <= :ID_FINAL');
      qryOS.ParamByName('ID_FINAL').AsInteger := AFiltro.IDFinal;
    end;

    // Data Abertura
    if AFiltro.TemDataAberturaInicial then
    begin
      qryOS.SQL.Add('AND DATA_ABERTURA >= :DATA_ABERTURA_INICIAL');
      qryOS.ParamByName('DATA_ABERTURA_INICIAL').AsDate := AFiltro.DataAberturaInicial;
    end;

    if AFiltro.TemDataAberturaFinal then
    begin
      qryOS.SQL.Add('AND DATA_ABERTURA <= :DATA_ABERTURA_FINAL');
      qryOS.ParamByName('DATA_ABERTURA_FINAL').AsDate := AFiltro.DataAberturaFinal;
    end;

    // Data Prevista
    if AFiltro.TemDataPrevistaInicial then
    begin
      qryOS.SQL.Add('AND DATA_PREVISTA >= :DATA_PREVISTA_INICIAL');
      qryOS.ParamByName('DATA_PREVISTA_INICIAL').AsDate := AFiltro.DataPrevistaInicial;
    end;

    if AFiltro.TemDataPrevistaFinal then
    begin
      qryOS.SQL.Add('AND DATA_PREVISTA <= :DATA_PREVISTA_FINAL');
      qryOS.ParamByName('DATA_PREVISTA_FINAL').AsDate := AFiltro.DataPrevistaFinal;
    end;

    // Data Fechamento
    if AFiltro.TemDataFechamentoInicial then
    begin
      qryOS.SQL.Add('AND DATA_FECHAMENTO >= :DATA_FECHAMENTO_INICIAL');
      qryOS.ParamByName('DATA_FECHAMENTO_INICIAL').AsDate := AFiltro.DataFechamentoInicial;
    end;

    if AFiltro.TemDataFechamentoFinal then
    begin
      qryOS.SQL.Add('AND DATA_FECHAMENTO <= :DATA_FECHAMENTO_FINAL');
      qryOS.ParamByName('DATA_FECHAMENTO_FINAL').AsDate := AFiltro.DataFechamentoFinal;
    end;

    // Cliente
    if AFiltro.TemCliente then
    begin
      qryOS.SQL.Add('AND UPPER(CLIENTE_NOME) LIKE :CLIENTE');
      qryOS.ParamByName('CLIENTE').AsString :=
        '%' + UpperCase(AFiltro.ClienteNome) + '%';
    end;

    // Valor Total
    if AFiltro.TemValorMin then
    begin
      qryOS.SQL.Add('AND VALOR_TOTAL >= :VALOR_MIN');
      qryOS.ParamByName('VALOR_MIN').AsFloat := AFiltro.ValorMin;
    end;

    if AFiltro.TemValorMax then
    begin
      qryOS.SQL.Add('AND VALOR_TOTAL <= :VALOR_MAX');
      qryOS.ParamByName('VALOR_MAX').AsFloat := AFiltro.ValorMax;
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

      qryOS.SQL.Add('AND STATUS IN (' + Params + ')');

      for i := 0 to High(AFiltro.Status) do
      begin
        qryOS.ParamByName('STATUS' + i.ToString).AsString :=
          TStatusOSUtils.ToString(AFiltro.Status[i]);
      end;
    end;
  end;

  qryOS.SQL.Add('ORDER BY ID DESC');

  qryOS.Open;
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

end.
