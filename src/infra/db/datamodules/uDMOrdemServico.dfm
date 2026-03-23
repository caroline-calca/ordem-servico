object DMOrdemServico: TDMOrdemServico
  OnCreate = DataModuleCreate
  Height = 240
  Width = 231
  object qryOS: TFDQuery
    AfterOpen = qryOSAfterOpen
    AfterScroll = qryOSAfterScroll
    AfterRefresh = qryOSAfterRefresh
    SQL.Strings = (
      'SELECT'
      '  ID,'
      '  CLIENTE_ID,'
      '  CLIENTE_NOME,'
      '  DATA_ABERTURA,'
      '  DATA_PREVISTA,'
      '  DATA_FECHAMENTO,'
      '  STATUS,'
      '  VALOR_TOTAL,'
      '  EM_ATRASO'
      'FROM VW_OS_RESUMO')
    Left = 32
    Top = 24
    object qryOSID: TIntegerField
      DisplayLabel = 'Id'
      DisplayWidth = 5
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryOSCLIENTE_ID: TIntegerField
      DisplayLabel = 'Id Cliente'
      DisplayWidth = 5
      FieldName = 'CLIENTE_ID'
      Origin = 'CLIENTE_ID'
      Required = True
      Visible = False
    end
    object qryOSCLIENTE_NOME: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cliente'
      DisplayWidth = 40
      FieldName = 'CLIENTE_NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 120
    end
    object qryOSDATA_ABERTURA: TDateField
      DisplayLabel = 'Dt. Abertura'
      DisplayWidth = 10
      FieldName = 'DATA_ABERTURA'
      Origin = 'DATA_ABERTURA'
      Required = True
    end
    object qryOSDATA_PREVISTA: TDateField
      DisplayLabel = 'Dt. Prevista'
      DisplayWidth = 10
      FieldName = 'DATA_PREVISTA'
      Origin = 'DATA_PREVISTA'
    end
    object qryOSDATA_FECHAMENTO: TDateField
      DisplayLabel = 'Dt. Fechamento'
      FieldName = 'DATA_FECHAMENTO'
      Origin = 'DATA_FECHAMENTO'
    end
    object qryOSSTATUS: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
      Size = 15
    end
    object qryOSVALOR_TOTAL: TFMTBCDField
      DisplayLabel = 'Vlr. Total'
      DisplayWidth = 10
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object qryOSEM_ATRASO: TIntegerField
      DisplayLabel = 'Em Atraso'
      DisplayWidth = 5
      FieldName = 'EM_ATRASO'
      Origin = 'EM_ATRASO'
      Visible = False
    end
  end
  object qryItens: TFDQuery
    MasterSource = dsOS
    MasterFields = 'ID'
    DetailFields = 'ORDEM_ID'
    SQL.Strings = (
      'SELECT'
      '  ID,'
      '  ORDEM_ID,'
      '  DESCRICAO,'
      '  QUANTIDADE,'
      '  VALOR_UNITARIO'
      'FROM ITEM_ORDEM'
      'WHERE ORDEM_ID = :ID')
    Left = 32
    Top = 112
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryItensORDEM_ID: TIntegerField
      DisplayLabel = 'OS'
      DisplayWidth = 5
      FieldName = 'ORDEM_ID'
      Origin = 'ORDEM_ID'
      Required = True
      Visible = False
    end
    object qryItensID: TIntegerField
      DisplayLabel = 'Id'
      DisplayWidth = 5
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object qryItensDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 70
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 200
    end
    object qryItensQUANTIDADE: TFMTBCDField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object qryItensVALOR_UNITARIO: TFMTBCDField
      DisplayLabel = 'Vlr. Unit'#225'rio'
      DisplayWidth = 10
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object dsOS: TDataSource
    DataSet = qryOS
    Left = 96
    Top = 24
  end
  object dsItens: TDataSource
    DataSet = qryItens
    Left = 96
    Top = 112
  end
end
