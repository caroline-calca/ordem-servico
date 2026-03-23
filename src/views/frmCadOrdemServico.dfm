object fOrdemServico: TfOrdemServico
  Left = 0
  Top = 0
  Caption = '[005] Cadastro de Ordens de Servi'#231'o'
  ClientHeight = 516
  ClientWidth = 676
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 676
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 19
      Top = 3
      Width = 347
      Height = 35
      Caption = 'Cadastro de Ordens de Servi'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -28
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnlOS: TPanel
    Left = 0
    Top = 41
    Width = 676
    Height = 170
    Align = alTop
    TabOrder = 1
    DesignSize = (
      676
      170)
    object Label2: TLabel
      Left = 66
      Top = 16
      Width = 39
      Height = 15
      Caption = 'Cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 18
      Top = 47
      Width = 87
      Height = 14
      Caption = 'Data de Abertura:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 237
      Top = 47
      Width = 68
      Height = 14
      Caption = 'Data Prevista:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 441
      Top = 47
      Width = 105
      Height = 14
      Caption = 'Data de Fechamento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 513
      Top = 17
      Width = 33
      Height = 14
      Anchors = [akTop, akRight]
      Caption = 'Status:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 19
      Top = 70
      Width = 115
      Height = 14
      Caption = 'Descri'#231#227'o do problema:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
    object cmbStatus: TComboBox
      Left = 552
      Top = 14
      Width = 107
      Height = 22
      Style = csDropDownList
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri Light'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 1
      Text = 'Aberta'
      Items.Strings = (
        'Aberta'
        'Em Andamento'
        'Concluida'
        'Cancelada')
    end
    object mmDescricao: TMemo
      Left = 18
      Top = 86
      Width = 641
      Height = 75
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri Light'
      Font.Style = []
      MaxLength = 500
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 5
    end
    object edtIdCliente: TEdit
      Left = 111
      Top = 14
      Width = 68
      Height = 22
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri Light'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
      OnExit = edtIdClienteExit
    end
    object edtNomeCliente: TEdit
      Left = 185
      Top = 14
      Width = 312
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      Color = cl3DLight
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object dtpDtAbertura: TDateTimePicker
      Left = 111
      Top = 42
      Width = 107
      Height = 22
      Date = 46104.000000000000000000
      Time = 0.132603923608257900
      ShowCheckbox = True
      Checked = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object dtpDtPrevista: TDateTimePicker
      Left = 311
      Top = 42
      Width = 107
      Height = 22
      Date = 46104.000000000000000000
      Time = 0.132603923608257900
      ShowCheckbox = True
      Checked = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object dtpDtFechamento: TDateTimePicker
      Left = 552
      Top = 42
      Width = 107
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      Date = 46104.000000000000000000
      Time = 0.132603923608257900
      ShowCheckbox = True
      Checked = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 475
    Width = 676
    Height = 41
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      676
      41)
    object Label6: TLabel
      Left = 19
      Top = 12
      Width = 104
      Height = 19
      Caption = 'Total do Pedido:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
    object lblTotal: TLabel
      Left = 129
      Top = 12
      Width = 49
      Height = 19
      Caption = 'R$ 0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
    object btnCancelar: TButton
      Left = 462
      Top = 8
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancelar [ESC]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnCancelarClick
    end
    object btnSalvar: TButton
      Left = 568
      Top = 8
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Salvar [F1]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnSalvarClick
    end
  end
  object pnlItens: TPanel
    Left = 0
    Top = 211
    Width = 676
    Height = 264
    Align = alClient
    TabOrder = 2
    DesignSize = (
      676
      264)
    object Label9: TLabel
      Left = 28
      Top = 29
      Width = 54
      Height = 15
      Caption = 'Descri'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 17
      Top = 58
      Width = 65
      Height = 15
      Caption = 'Quantidade:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 220
      Top = 58
      Width = 73
      Height = 15
      Caption = 'Valor unit'#225'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 1
      Top = 1
      Width = 674
      Height = 15
      Align = alTop
      Caption = ' Itens da OS:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri Light'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 78
    end
    object dbgItens: TDBGrid
      Left = 1
      Top = 88
      Width = 674
      Height = 175
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsItens
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object edtDescricao: TEdit
      Left = 88
      Top = 26
      Width = 571
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 255
      TabOrder = 0
      OnKeyDown = edtDescricaoKeyDown
    end
    object edtQtd: TEdit
      Left = 88
      Top = 55
      Width = 110
      Height = 23
      Alignment = taRightJustify
      MaxLength = 15
      TabOrder = 1
      Text = '0,00'
      OnExit = edtQtdExit
      OnKeyDown = edtDescricaoKeyDown
      OnKeyPress = edtQtdKeyPress
    end
    object edtValor: TEdit
      Left = 299
      Top = 55
      Width = 110
      Height = 23
      Hint = 'Preencha apenas com n'#250'meros.'
      Alignment = taRightJustify
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 18
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Text = '0,00'
      OnExit = edtQtdExit
      OnKeyDown = edtDescricaoKeyDown
      OnKeyPress = edtQtdKeyPress
    end
    object btnAdicionar: TButton
      Left = 415
      Top = 54
      Width = 119
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Adicionar [Enter]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnAdicionarClick
    end
    object btnExcluir: TButton
      Left = 540
      Top = 54
      Width = 119
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Excluir [Del]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = btnExcluirClick
    end
  end
  object mtItens: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 496
    Top = 355
    object mtItensDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 70
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 200
    end
    object mtItensQUANTIDADE: TFMTBCDField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object mtItensVALOR_UNITARIO: TFMTBCDField
      DisplayLabel = 'Vlr. Unit'#225'rio'
      DisplayWidth = 10
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 20
      Size = 2
    end
    object mtItensTOTAL_ITEM: TFMTBCDField
      DisplayLabel = 'Vlr. Total'
      DisplayWidth = 10
      FieldName = 'TOTAL_ITEM'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object dsItens: TDataSource
    DataSet = mtItens
    Left = 552
    Top = 355
  end
end
