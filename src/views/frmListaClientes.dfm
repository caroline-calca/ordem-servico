object fListaClientes: TfListaClientes
  Left = 0
  Top = 0
  Caption = '[002] Listagem de Clientes'
  ClientHeight = 441
  ClientWidth = 947
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
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 947
    Height = 41
    Align = alTop
    TabOrder = 0
    DesignSize = (
      947
      41)
    object Label1: TLabel
      Left = 168
      Top = 13
      Width = 34
      Height = 15
      Caption = 'Nome:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 19
      Top = 3
      Width = 90
      Height = 35
      Caption = 'Clientes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -28
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
    object edtNome: TEdit
      Left = 208
      Top = 10
      Width = 626
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnKeyDown = edtNomeKeyDown
    end
    object btnPesquisar: TBitBtn
      Left = 840
      Top = 9
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
      TabOrder = 1
      OnClick = btnPesquisarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 947
    Height = 359
    Align = alClient
    TabOrder = 1
    object dbgClientes: TDBGrid
      Left = 1
      Top = 1
      Width = 945
      Height = 357
      Align = alClient
      BorderStyle = bsNone
      DataSource = DMCliente.dsClientes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnKeyDown = dbgClientesKeyDown
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 400
    Width = 947
    Height = 41
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      947
      41)
    object btnNovo: TButton
      Left = 698
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
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnEditar: TButton
      Left = 779
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
      TabOrder = 1
      OnClick = btnEditarClick
    end
    object btnExcluir: TButton
      Left = 860
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
      TabOrder = 2
      OnClick = btnExcluirClick
    end
  end
end
