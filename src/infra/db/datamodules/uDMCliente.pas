unit uDMCliente;

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

  untUtils,
  uDMBase,
  untClienteFiltro;

type
  TDMCliente = class(TDMBase)
    qryClientes: TFDQuery;
    qryClientesID: TIntegerField;
    qryClientesNOME: TWideStringField;
    qryClientesDOCUMENTO: TWideStringField;
    qryClientesEMAIL: TWideStringField;
    qryClientesTELEFONE: TWideStringField;
    qryClientesDATA_CADASTRO: TSQLTimeStampField;
    dsClientes: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure Filtrar(AQry: TFDQuery; AFiltro: TClienteFiltro);
  public
    procedure Listar(const AFiltro: TClienteFiltro); overload;
    procedure Listar(const AFiltro: TClienteFiltro; const AOffset, AFetch: Integer); overload;
    function Contar(const AFiltro: TClienteFiltro): Integer;
  end;

var
  DMCliente: TDMCliente;

implementation

{$R *.dfm}

procedure TDMCliente.DataModuleCreate(Sender: TObject);
begin
  if not Assigned(Connection) then
    raise Exception.Create('Conexão não inicializada.');

  qryClientes.Connection := Connection;
end;

procedure TDMCliente.Listar(const AFiltro: TClienteFiltro);
begin
  Listar(AFiltro, 0, 0);
end;

procedure TDMCliente.Listar(const AFiltro: TClienteFiltro; const AOffset, AFetch: Integer);
begin
  qryClientes.Close;
  qryClientes.SQL.Clear;

  qryClientes.SQL.Add('SELECT');
  qryClientes.SQL.Add('  ID,');
  qryClientes.SQL.Add('  NOME,');
  qryClientes.SQL.Add('  DOCUMENTO,');
  qryClientes.SQL.Add('  EMAIL,');
  qryClientes.SQL.Add('  TELEFONE,');
  qryClientes.SQL.Add('  DATA_CADASTRO');
  qryClientes.SQL.Add('FROM CLIENTE');
  qryClientes.SQL.Add('WHERE 1=1');

  Filtrar(qryClientes, AFiltro);

  qryClientes.SQL.Add('ORDER BY NOME');

  if (AOffset > 0) or (AFetch > 0) then
    qryClientes.SQL.Add(Format('OFFSET %d ROWS FETCH NEXT %d ROWS ONLY', [AOffset, AFetch]));

  qryClientes.Open;
end;

function TDMCliente.Contar(const AFiltro: TClienteFiltro): Integer;
var
  qryContar: TFDQuery;
begin
  qryContar := TFDQuery.Create(nil);
  try
    qryContar.Connection := Connection;
    qryContar.SQL.Clear;

    qryContar.SQL.Add('SELECT');
    qryContar.SQL.Add('  COUNT(*) AS TOTAL');
    qryContar.SQL.Add('FROM CLIENTE');
    qryContar.SQL.Add('WHERE 1=1');

    Filtrar(qryContar, AFiltro);

    qryContar.Open;
    Result := qryContar.FieldByName('TOTAL').AsInteger;
  finally
    qryContar.Free;
  end;
end;

procedure TDMCliente.Filtrar(AQry: TFDQuery; AFiltro: TClienteFiltro);
begin
  if Assigned(AFiltro) and AFiltro.TemNome then
  begin
    AQry.SQL.Add('AND UPPER(NOME) LIKE :NOME');
    AQry.ParamByName('NOME').AsString :=
      '%' + UpperCase(AFiltro.Nome) + '%';
  end;
end;

end.
