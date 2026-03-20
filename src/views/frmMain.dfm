object fMain: TfMain
  Left = 0
  Top = 0
  Caption = '[000] Solu'#231#227'o de Ordens de Servi'#231'o'
  ClientHeight = 342
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Calibri Light'
  Font.Style = []
  Menu = mmMain
  Position = poScreenCenter
  WindowState = wsMaximized
  TextHeight = 14
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 427
    Height = 342
    Align = alClient
    TabOrder = 0
  end
  object mmMain: TMainMenu
    Left = 56
    Top = 56
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
      end
    end
  end
end
