object fListaOrdemServico: TfListaOrdemServico
  Left = 0
  Top = 0
  Caption = '[004] Listagem de Ordens de Servi'#231'o'
  ClientHeight = 657
  ClientWidth = 1089
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 0
    Top = 451
    Width = 1089
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 345
    ExplicitWidth = 103
  end
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 1089
    Height = 41
    Align = alTop
    TabOrder = 0
    DesignSize = (
      1089
      41)
    object Label2: TLabel
      Left = 19
      Top = 3
      Width = 206
      Height = 35
      Caption = 'Ordens de Servi'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -28
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
    object btnImprimir: TBitBtn
      Left = 982
      Top = 10
      Width = 92
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #55357#56744#65039' Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnClick = btnImprimirClick
    end
  end
  object pnlOS: TPanel
    Left = 0
    Top = 177
    Width = 1089
    Height = 274
    Align = alClient
    TabOrder = 2
    object dbgOS: TDBGrid
      Left = 1
      Top = 1
      Width = 1087
      Height = 272
      Align = alClient
      BorderStyle = bsNone
      DataSource = DMOrdemServico.dsOS
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = dbgOSDblClick
      OnKeyDown = dbgOSKeyDown
    end
  end
  object pnlInferior: TPanel
    Left = 0
    Top = 616
    Width = 1089
    Height = 41
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      1089
      41)
    object Label14: TLabel
      Left = 171
      Top = 12
      Width = 109
      Height = 15
      Caption = 'Registros por p'#225'gina:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
    object lblTotalPaginas: TLabel
      Left = 107
      Top = 12
      Width = 57
      Height = 15
      AutoSize = False
      Caption = 'de 1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 19
      Top = 12
      Width = 38
      Height = 15
      Caption = 'P'#225'gina:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
    object btnNovo: TButton
      Left = 840
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Novo [INS]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnNovoClick
    end
    object btnEditar: TButton
      Left = 921
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Editar [F2]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnEditarClick
    end
    object btnExcluir: TButton
      Left = 1002
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Excluir [DEL]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnExcluirClick
    end
    object spnRegPorPagina: TSpinEdit
      Left = 286
      Top = 9
      Width = 41
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri Light'
      Font.Style = []
      MaxValue = 9999
      MinValue = 1
      ParentFont = False
      TabOrder = 1
      Value = 50
      OnChange = spnRegPorPaginaChange
    end
    object spnPaginaAtual: TSpinEdit
      Left = 63
      Top = 9
      Width = 41
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri Light'
      Font.Style = []
      MaxValue = 9999
      MinValue = 1
      ParentFont = False
      TabOrder = 0
      Value = 1
      OnChange = spnPaginaAtualChange
    end
  end
  object pnlFiltros: TPanel
    Left = 0
    Top = 41
    Width = 1089
    Height = 136
    Align = alTop
    TabOrder = 1
    DesignSize = (
      1089
      136)
    object Label1: TLabel
      Left = 19
      Top = 108
      Width = 90
      Height = 15
      Caption = 'Nome do Cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
    object edtNomeCliente: TEdit
      Left = 115
      Top = 105
      Width = 853
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      OnKeyDown = edtNomeClienteKeyDown
    end
    object btnPesquisar: TBitBtn
      Left = 974
      Top = 104
      Width = 95
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Pesquisar [Enter]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 7
      OnClick = btnPesquisarClick
    end
    object gbStatus: TGroupBox
      Left = 371
      Top = 6
      Width = 170
      Height = 91
      Caption = 'Status'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object chkStatusAberta: TCheckBox
        Left = 6
        Top = 29
        Width = 58
        Height = 17
        Caption = 'Aberta'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnKeyDown = edtNomeClienteKeyDown
      end
      object chkStatusEmAndamento: TCheckBox
        Left = 6
        Top = 58
        Width = 80
        Height = 17
        Caption = 'Andamento'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnKeyDown = edtNomeClienteKeyDown
      end
      object chkStatusConcluida: TCheckBox
        Left = 90
        Top = 29
        Width = 77
        Height = 17
        Caption = 'Concluida'
        TabOrder = 2
        OnKeyDown = edtNomeClienteKeyDown
      end
      object chkStatusCancelada: TCheckBox
        Left = 90
        Top = 58
        Width = 77
        Height = 17
        Caption = 'Cancelada'
        TabOrder = 3
        OnKeyDown = edtNomeClienteKeyDown
      end
    end
    object gbId: TGroupBox
      Left = 19
      Top = 6
      Width = 170
      Height = 91
      Caption = 'N'#250'mero da OS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label3: TLabel
        Left = 15
        Top = 29
        Width = 32
        Height = 14
        Caption = 'Inicial:'
      end
      object Label8: TLabel
        Left = 21
        Top = 58
        Width = 27
        Height = 14
        Caption = 'Final:'
      end
      object edtIdInicial: TEdit
        Left = 55
        Top = 26
        Width = 100
        Height = 22
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 0
        OnKeyDown = edtNomeClienteKeyDown
      end
      object edtIdFinal: TEdit
        Left = 55
        Top = 55
        Width = 100
        Height = 22
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 1
        OnKeyDown = edtNomeClienteKeyDown
      end
    end
    object gbDtAbertura: TGroupBox
      Left = 547
      Top = 6
      Width = 170
      Height = 91
      Caption = 'Data de Abertura'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object Label4: TLabel
        Left = 15
        Top = 29
        Width = 32
        Height = 14
        Caption = 'Inicial:'
      end
      object Label6: TLabel
        Left = 21
        Top = 58
        Width = 27
        Height = 14
        Caption = 'Final:'
      end
      object dtpDtAberturaInicial: TDateTimePicker
        Left = 55
        Top = 26
        Width = 100
        Height = 22
        Date = 46104.000000000000000000
        Time = 0.132603923608257900
        ShowCheckbox = True
        Checked = False
        TabOrder = 0
        OnKeyDown = edtNomeClienteKeyDown
      end
      object dtpDtAberturaFinal: TDateTimePicker
        Left = 55
        Top = 55
        Width = 100
        Height = 22
        Date = 46104.000000000000000000
        Time = 0.133045706017583100
        ShowCheckbox = True
        Checked = False
        TabOrder = 1
        OnKeyDown = edtNomeClienteKeyDown
      end
    end
    object gbDtPrevista: TGroupBox
      Left = 723
      Top = 6
      Width = 170
      Height = 91
      Caption = 'Data Prevista'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object Label5: TLabel
        Left = 15
        Top = 29
        Width = 32
        Height = 14
        Caption = 'Inicial:'
      end
      object Label7: TLabel
        Left = 21
        Top = 58
        Width = 27
        Height = 14
        Caption = 'Final:'
      end
      object dtpDtPrevistaInicial: TDateTimePicker
        Left = 55
        Top = 26
        Width = 100
        Height = 22
        Date = 46104.000000000000000000
        Time = 0.132603923608257900
        ShowCheckbox = True
        Checked = False
        TabOrder = 0
        OnKeyDown = edtNomeClienteKeyDown
      end
      object dtpDtPrevistaFinal: TDateTimePicker
        Left = 55
        Top = 55
        Width = 100
        Height = 22
        Date = 46104.000000000000000000
        Time = 0.133045706017583100
        ShowCheckbox = True
        Checked = False
        TabOrder = 1
        OnKeyDown = edtNomeClienteKeyDown
      end
    end
    object gbDtFechamento: TGroupBox
      Left = 899
      Top = 6
      Width = 170
      Height = 91
      Caption = 'Data de Fechamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object Label9: TLabel
        Left = 15
        Top = 29
        Width = 32
        Height = 14
        Caption = 'Inicial:'
      end
      object Label10: TLabel
        Left = 21
        Top = 58
        Width = 27
        Height = 14
        Caption = 'Final:'
      end
      object dtpDtFechamentoInicial: TDateTimePicker
        Left = 55
        Top = 26
        Width = 100
        Height = 22
        Date = 46104.000000000000000000
        Time = 0.132603923608257900
        ShowCheckbox = True
        Checked = False
        TabOrder = 0
        OnKeyDown = edtNomeClienteKeyDown
      end
      object dtpDtFechamentoFinal: TDateTimePicker
        Left = 55
        Top = 55
        Width = 100
        Height = 22
        Date = 46104.000000000000000000
        Time = 0.133045706017583100
        ShowCheckbox = True
        Checked = False
        TabOrder = 1
        OnKeyDown = edtNomeClienteKeyDown
      end
    end
    object gbVlrTotal: TGroupBox
      Left = 195
      Top = 6
      Width = 170
      Height = 91
      Caption = 'Valor Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label11: TLabel
        Left = 15
        Top = 29
        Width = 32
        Height = 14
        Caption = 'Inicial:'
      end
      object Label12: TLabel
        Left = 21
        Top = 58
        Width = 27
        Height = 14
        Caption = 'Final:'
      end
      object edtVlrTotalInicial: TEdit
        Left = 55
        Top = 26
        Width = 100
        Height = 22
        Alignment = taRightJustify
        MaxLength = 18
        TabOrder = 0
        OnExit = edtVlrTotalInicialExit
        OnKeyDown = edtNomeClienteKeyDown
        OnKeyPress = edtVlrTotalInicialKeyPress
      end
      object edtVlrTotalFinal: TEdit
        Left = 55
        Top = 55
        Width = 100
        Height = 22
        Alignment = taRightJustify
        MaxLength = 18
        TabOrder = 1
        OnExit = edtVlrTotalInicialExit
        OnKeyDown = edtNomeClienteKeyDown
        OnKeyPress = edtVlrTotalInicialKeyPress
      end
    end
  end
  object pnlItens: TPanel
    Left = 0
    Top = 454
    Width = 1089
    Height = 162
    Align = alBottom
    TabOrder = 4
    object Label13: TLabel
      Left = 1
      Top = 1
      Width = 1087
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
      Top = 16
      Width = 1087
      Height = 145
      Align = alClient
      BorderStyle = bsNone
      DataSource = DMOrdemServico.dsItens
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnKeyDown = dbgOSKeyDown
    end
  end
end
