object DMCliente: TDMCliente
  OnCreate = DataModuleCreate
  Height = 173
  Width = 300
  object qryClientes: TFDQuery
    SQL.Strings = (
      'SELECT ID, NOME, DOCUMENTO, EMAIL, TELEFONE, DATA_CADASTRO'
      'FROM CLIENTE')
    Left = 48
    Top = 24
    object qryClientesID: TIntegerField
      DisplayLabel = 'Id'
      DisplayWidth = 5
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryClientesNOME: TWideStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 40
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 120
    end
    object qryClientesDOCUMENTO: TWideStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 18
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
    end
    object qryClientesEMAIL: TWideStringField
      DisplayLabel = 'E-mail'
      DisplayWidth = 35
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 120
    end
    object qryClientesTELEFONE: TWideStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 18
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 30
    end
    object qryClientesDATA_CADASTRO: TSQLTimeStampField
      DisplayLabel = 'Data de Cadastro'
      DisplayWidth = 20
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
  end
  object dsClientes: TDataSource
    DataSet = qryClientes
    Left = 120
    Top = 24
  end
end
