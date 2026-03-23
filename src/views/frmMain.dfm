object fMain: TfMain
  Left = 0
  Top = 0
  Caption = '[000] Solu'#231#227'o de Ordens de Servi'#231'o'
  ClientHeight = 272
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Calibri Light'
  Font.Style = []
  KeyPreview = True
  Menu = mmMain
  Position = poScreenCenter
  ShowHint = True
  WindowState = wsMaximized
  OnKeyDown = FormKeyDown
  TextHeight = 14
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 436
    Height = 272
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 427
    ExplicitHeight = 342
    object GroupBox1: TGroupBox
      Left = 16
      Top = 16
      Width = 265
      Height = 129
      Caption = 'Atalhos r'#225'pidos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Calibri Light'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object btnClientes: TBitBtn
        Left = 15
        Top = 40
        Width = 75
        Height = 75
        Hint = 'Cadastro de Clientes'
        Caption = #55357#56909#55356#57339
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -40
        Font.Name = 'Segoe UI'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnClientesClick
      end
      object btnOrdemServico: TBitBtn
        Left = 96
        Top = 40
        Width = 75
        Height = 75
        Hint = 'Cadastro de Ordem de Servi'#231'o'
        Caption = #55357#56523
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -40
        Font.Name = 'Segoe UI'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnOrdemServicoClick
      end
      object btnConfiguracoes: TBitBtn
        Left = 177
        Top = 40
        Width = 75
        Height = 75
        Hint = 'Configura'#231#245'es'
        Caption = #9881#65039
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -40
        Font.Name = 'Segoe UI'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnConfiguracoesClick
      end
    end
  end
  object mmMain: TMainMenu
    Left = 352
    Top = 16
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object mnClientes: TMenuItem
        Caption = 'Clientes'
        OnClick = mnClientesClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnOrdensServico: TMenuItem
        Caption = 'Ordens de Servi'#231'o'
        OnClick = mnOrdensServicoClick
      end
    end
    object Sistema1: TMenuItem
      Caption = 'Sistema'
      object mnConfiguracoes: TMenuItem
        Caption = 'Configura'#231#245'es'
        OnClick = mnConfiguracoesClick
      end
      object Configuraes2: TMenuItem
        Caption = '-'
      end
      object mnSobre: TMenuItem
        Caption = 'Sobre'
        OnClick = mnSobreClick
      end
    end
  end
end
