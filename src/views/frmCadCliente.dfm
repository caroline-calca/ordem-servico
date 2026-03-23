object fCliente: TfCliente
  Left = 0
  Top = 0
  Caption = '[003] Cadastro de Clientes'
  ClientHeight = 191
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 19
      Top = 3
      Width = 231
      Height = 35
      Caption = 'Cadastro de Clientes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -28
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnlCliente: TPanel
    Left = 0
    Top = 41
    Width = 635
    Height = 109
    Align = alClient
    TabOrder = 1
    object Label2: TLabel
      Left = 46
      Top = 17
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
    object Label3: TLabel
      Left = 15
      Top = 46
      Width = 65
      Height = 15
      Caption = 'Documento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 45
      Top = 75
      Width = 35
      Height = 15
      Caption = 'E-mail:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 333
      Top = 46
      Width = 47
      Height = 15
      Caption = 'Telefone:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
    end
    object edtNome: TEdit
      Left = 86
      Top = 14
      Width = 530
      Height = 23
      MaxLength = 120
      TabOrder = 0
    end
    object edtDocumento: TEdit
      Left = 86
      Top = 43
      Width = 230
      Height = 23
      MaxLength = 20
      TabOrder = 1
    end
    object edtEmail: TEdit
      Left = 86
      Top = 72
      Width = 530
      Height = 23
      MaxLength = 120
      TabOrder = 3
    end
    object edtTelefone: TEdit
      Left = 386
      Top = 43
      Width = 230
      Height = 23
      MaxLength = 30
      TabOrder = 2
    end
  end
  object pnlInferior: TPanel
    Left = 0
    Top = 150
    Width = 635
    Height = 41
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      635
      41)
    object btnCancelar: TButton
      Left = 421
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
      Left = 527
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
end
