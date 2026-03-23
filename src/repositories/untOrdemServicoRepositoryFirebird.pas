unit untOrdemServicoRepositoryFirebird;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  Data.DB,

  untOrdemServicoFiltro,
  untOrdemServicoRepository,
  untOrdemServico,
  untOrdemServicoItem,
  untConnectionManager;

type
  TOrdemServicoRepositoryFirebird = class(TInterfacedObject, IOrdemServicoRepository)
  private
    FConnection: TFDConnection;
  public
    constructor Create;

    procedure Inserir(AOS: TOrdemServico);
    procedure Atualizar(AOS: TOrdemServico);
    procedure Excluir(AID: Integer);
    function ObterPorID(AID: Integer): TOrdemServico;

    procedure InserirItem(AItem: TOrdemServicoItem);
    function ObterItens(AOrdemID: Integer): TObjectList<TOrdemServicoItem>;
  end;

implementation

{ TOrdemServicoRepositoryFirebird }

constructor TOrdemServicoRepositoryFirebird.Create;
begin
  inherited Create;
  FConnection := FConnectionManager.Connection;
end;

procedure TOrdemServicoRepositoryFirebird.Inserir(AOS: TOrdemServico);
var
  Qry: TFDQuery;
  Item: TOrdemServicoItem;
begin
  FConnection.StartTransaction;
  try
    Qry := TFDQuery.Create(nil);
    try
      Qry.Connection := FConnection;
      Qry.SQL.Text :=
        'INSERT INTO ORDEM_SERVICO (CLIENTE_ID, DATA_ABERTURA, DATA_PREVISTA, DATA_FECHAMENTO, STATUS, DESCRICAO_PROBLEMA, VALOR_TOTAL) ' +
        'VALUES (:CLIENTE_ID, :DATA_ABERTURA, :DATA_PREVISTA, :DATA_FECHAMENTO, :STATUS, :DESCRICAO_PROBLEMA, :VALOR_TOTAL) RETURNING ID';
      Qry.ParamByName('CLIENTE_ID').AsInteger := AOS.ClienteID;
      Qry.ParamByName('DATA_ABERTURA').AsDate := AOS.DataAbertura;
      if AOS.DataPrevista <> 0 then
        Qry.ParamByName('DATA_PREVISTA').AsDate := AOS.DataPrevista
      else
        Qry.ParamByName('DATA_PREVISTA').Clear;
      if AOS.DataFechamento <> 0 then
        Qry.ParamByName('DATA_FECHAMENTO').AsDate := AOS.DataFechamento
      else
        Qry.ParamByName('DATA_FECHAMENTO').Clear;
      Qry.ParamByName('STATUS').AsString := TStatusOSUtils.ToString(AOS.Status);
      Qry.ParamByName('DESCRICAO_PROBLEMA').AsString := AOS.DescricaoProblema;
      AOS.CalcularValorTotal;
      Qry.ParamByName('VALOR_TOTAL').AsFloat := AOS.ValorTotal;
      Qry.Open;

      AOS.ID := Qry.FieldByName('ID').AsInteger;

      for Item in AOS.Itens do
      begin
        Item.OrdemID := AOS.ID;
        InserirItem(Item);
      end;

    finally
      Qry.Free;
    end;

    FConnection.Commit;
  except
    FConnection.Rollback;
    raise;
  end;
end;

procedure TOrdemServicoRepositoryFirebird.InserirItem(AItem: TOrdemServicoItem);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text :=
      'INSERT INTO ITEM_ORDEM (ORDEM_ID, DESCRICAO, QUANTIDADE, VALOR_UNITARIO) ' +
      'VALUES (:ORDEM_ID, :DESCRICAO, :QUANTIDADE, :VALOR_UNITARIO) RETURNING ID';
    Qry.ParamByName('ORDEM_ID').AsInteger := AItem.OrdemID;
    Qry.ParamByName('DESCRICAO').AsString := AItem.Descricao;
    Qry.ParamByName('QUANTIDADE').AsFloat := AItem.Quantidade;
    Qry.ParamByName('VALOR_UNITARIO').AsFloat := AItem.ValorUnitario;
    Qry.Open;

    AItem.ID := Qry.FieldByName('ID').AsInteger;
  finally
    Qry.Free;
  end;
end;

procedure TOrdemServicoRepositoryFirebird.Atualizar(AOS: TOrdemServico);
var
  Qry: TFDQuery;
  Item: TOrdemServicoItem;
begin
  FConnection.StartTransaction;
  try
    Qry := TFDQuery.Create(nil);
    try
      Qry.Connection := FConnection;
      Qry.SQL.Text :=
        'UPDATE ORDEM_SERVICO SET CLIENTE_ID=:CLIENTE_ID, DATA_ABERTURA=:DATA_ABERTURA, DATA_PREVISTA=:DATA_PREVISTA, ' +
        'DATA_FECHAMENTO=:DATA_FECHAMENTO, STATUS=:STATUS, DESCRICAO_PROBLEMA=:DESCRICAO_PROBLEMA, VALOR_TOTAL=:VALOR_TOTAL ' +
        'WHERE ID=:ID';
      Qry.ParamByName('ID').AsInteger := AOS.ID;
      Qry.ParamByName('CLIENTE_ID').AsInteger := AOS.ClienteID;
      Qry.ParamByName('DATA_ABERTURA').AsDate := AOS.DataAbertura;
      Qry.ParamByName('DATA_PREVISTA').AsDate := AOS.DataPrevista;
      if AOS.DataFechamento <> 0 then
        Qry.ParamByName('DATA_FECHAMENTO').AsDate := AOS.DataFechamento
      else
        Qry.ParamByName('DATA_FECHAMENTO').Clear;
      Qry.ParamByName('STATUS').AsString := TStatusOSUtils.ToString(AOS.Status);
      Qry.ParamByName('DESCRICAO_PROBLEMA').AsString := AOS.DescricaoProblema;
      AOS.CalcularValorTotal;
      Qry.ParamByName('VALOR_TOTAL').AsFloat := AOS.ValorTotal;
      Qry.ExecSQL;

      Qry.SQL.Text := 'DELETE FROM ITEM_ORDEM WHERE ORDEM_ID = :ORDEM_ID';
      Qry.ParamByName('ORDEM_ID').AsInteger := AOS.ID;
      Qry.ExecSQL;

      for Item in AOS.Itens do
      begin
        Item.OrdemID := AOS.ID;
        InserirItem(Item);
      end;

    finally
      Qry.Free;
    end;

    FConnection.Commit;
  except
    FConnection.Rollback;
    raise;
  end;
end;

procedure TOrdemServicoRepositoryFirebird.Excluir(AID: Integer);
var
  Qry: TFDQuery;
begin
  if AID <= 0 then Exit;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text := 'DELETE FROM ORDEM_SERVICO WHERE ID = :ID';
    Qry.ParamByName('ID').AsInteger := AID;
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

function TOrdemServicoRepositoryFirebird.ObterPorID(AID: Integer): TOrdemServico;
var
  Qry: TFDQuery;
begin
  Result := nil;
  if AID <= 0 then Exit;

  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text :=
      'SELECT ID, CLIENTE_ID, DATA_ABERTURA, DATA_PREVISTA, DATA_FECHAMENTO, STATUS, DESCRICAO_PROBLEMA, VALOR_TOTAL ' +
      'FROM ORDEM_SERVICO WHERE ID=:ID';
    Qry.ParamByName('ID').AsInteger := AID;
    Qry.Open;

    if not Qry.IsEmpty then
    begin
      Result := TOrdemServico.Create;
      Result.ID := Qry.FieldByName('ID').AsInteger;
      Result.ClienteID := Qry.FieldByName('CLIENTE_ID').AsInteger;
      Result.DataAbertura := Qry.FieldByName('DATA_ABERTURA').AsDateTime;
      Result.DataPrevista := Qry.FieldByName('DATA_PREVISTA').AsDateTime;
      Result.DataFechamento := Qry.FieldByName('DATA_FECHAMENTO').AsDateTime;
      Result.Status := TStatusOSUtils.FromString(Qry.FieldByName('STATUS').AsString);
      Result.DescricaoProblema := Qry.FieldByName('DESCRICAO_PROBLEMA').AsString;
      Result.ValorTotal := Qry.FieldByName('VALOR_TOTAL').AsFloat;

      Result.Itens := ObterItens(Result.ID);
    end;
  finally
    Qry.Free;
  end;
end;

function TOrdemServicoRepositoryFirebird.ObterItens(AOrdemID: Integer): TObjectList<TOrdemServicoItem>;
var
  Qry: TFDQuery;
  Item: TOrdemServicoItem;
begin
  Result := TObjectList<TOrdemServicoItem>.Create(True);
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text :=
      'SELECT ID, DESCRICAO, QUANTIDADE, VALOR_UNITARIO ' +
      'FROM ITEM_ORDEM WHERE ORDEM_ID = :ORDEMID';
    Qry.ParamByName('ORDEMID').AsInteger := AOrdemID;
    Qry.Open;

    while not Qry.Eof do
    begin
      Item := TOrdemServicoItem.Create;
      Item.ID := Qry.FieldByName('ID').AsInteger;
      Item.OrdemID := AOrdemID;
      Item.Descricao := Qry.FieldByName('DESCRICAO').AsString;
      Item.Quantidade := Qry.FieldByName('QUANTIDADE').AsFloat;
      Item.ValorUnitario := Qry.FieldByName('VALOR_UNITARIO').AsFloat;
      Result.Add(Item);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

end.
