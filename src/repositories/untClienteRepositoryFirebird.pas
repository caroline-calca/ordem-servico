unit untClienteRepositoryFirebird;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  Data.DB,

  untConnectionManager,
  untClienteRepository,
  untCliente,
  untClienteFiltro;

type
  TClienteRepositoryFirebird = class(TInterfacedObject, IClienteRepository)
  private
    FConnection: TFDConnection;
  public
    constructor Create;

    procedure Inserir(ACliente: TCliente);
    procedure Atualizar(ACliente: TCliente);
    procedure Excluir(AID: Integer);

    function ObterPorID(AID: Integer): TCliente;
    function PossuiOrdemServico(const AID: Integer): Boolean;
  end;

implementation

constructor TClienteRepositoryFirebird.Create;
begin
  inherited Create;
  FConnection := FConnectionManager.Connection;
end;

procedure TClienteRepositoryFirebird.Inserir(ACliente: TCliente);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text :=
      'INSERT INTO CLIENTE (NOME, DOCUMENTO, EMAIL, TELEFONE) ' +
      'VALUES (:NOME, :DOCUMENTO, :EMAIL, :TELEFONE) ' +
      'RETURNING ID';

    Qry.ParamByName('NOME').AsString := ACliente.Nome;
    Qry.ParamByName('DOCUMENTO').AsString := ACliente.Documento;
    Qry.ParamByName('EMAIL').AsString := ACliente.Email;
    Qry.ParamByName('TELEFONE').AsString := ACliente.Telefone;

    Qry.Open;
    ACliente.ID := Qry.FieldByName('ID').AsInteger;
  finally
    Qry.Free;
  end;
end;

procedure TClienteRepositoryFirebird.Atualizar(ACliente: TCliente);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text :=
      'UPDATE CLIENTE SET ' +
      'NOME = :NOME, ' +
      'DOCUMENTO = :DOCUMENTO, ' +
      'EMAIL = :EMAIL, ' +
      'TELEFONE = :TELEFONE ' +
      'WHERE ID = :ID';

    Qry.ParamByName('ID').AsInteger := ACliente.ID;
    Qry.ParamByName('NOME').AsString := ACliente.Nome;
    Qry.ParamByName('DOCUMENTO').AsString := ACliente.Documento;
    Qry.ParamByName('EMAIL').AsString := ACliente.Email;
    Qry.ParamByName('TELEFONE').AsString := ACliente.Telefone;

    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TClienteRepositoryFirebird.Excluir(AID: Integer);
var
  Qry: TFDQuery;
begin
  if AID <= 0 then
    Exit;

  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text := 'DELETE FROM CLIENTE WHERE ID = :ID';
    Qry.ParamByName('ID').AsInteger := AID;
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

function TClienteRepositoryFirebird.ObterPorID(AID: Integer): TCliente;
var
  Qry: TFDQuery;
begin
  Result := nil;

  if AID <= 0 then
    Exit;

  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text :=
      'SELECT ID, NOME, DOCUMENTO, EMAIL, TELEFONE, DATA_CADASTRO ' +
      'FROM CLIENTE WHERE ID = :ID';

    Qry.ParamByName('ID').AsInteger := AID;
    Qry.Open;

    if not Qry.IsEmpty then
    begin
      Result := TCliente.Create;
      Result.ID := Qry.FieldByName('ID').AsInteger;
      Result.Nome := Qry.FieldByName('NOME').AsString;
      Result.Documento := Qry.FieldByName('DOCUMENTO').AsString;
      Result.Email := Qry.FieldByName('EMAIL').AsString;
      Result.Telefone := Qry.FieldByName('TELEFONE').AsString;
      Result.DataCadastro := Qry.FieldByName('DATA_CADASTRO').AsDateTime;
    end;
  finally
    Qry.Free;
  end;
end;

function TClienteRepositoryFirebird.PossuiOrdemServico(const AID: Integer): Boolean;
var
  Qry: TFDQuery;
begin
  Result := False;

  if AID <= 0 then
    Exit;

  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;

    Qry.SQL.Text :=
      'SELECT 1 ' +
      'FROM ORDEM_SERVICO ' +
      'WHERE CLIENTE_ID = :ID ' +
      'ROWS 1';

    Qry.ParamByName('ID').AsInteger := AID;
    Qry.Open;

    Result := not Qry.IsEmpty;
  finally
    Qry.Free;
  end;
end;

end.
