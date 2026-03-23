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
  FireDAC.DApt, 
  Data.DB, 
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  
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
    { Private declarations }
  public
    procedure Listar(const AFiltro: TClienteFiltro);
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

  if Assigned(AFiltro) and AFiltro.TemNome then
  begin
    qryClientes.SQL.Add('AND UPPER(NOME) LIKE :NOME');
    qryClientes.ParamByName('NOME').AsString :=
      '%' + UpperCase(AFiltro.Nome) + '%';
  end;

  qryClientes.SQL.Add('ORDER BY NOME');

  qryClientes.Open;
end;

end.
