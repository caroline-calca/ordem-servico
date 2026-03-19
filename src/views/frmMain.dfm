object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'Solu'#231#227'o de Ordens de Servi'#231'o'
  ClientHeight = 342
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = mmMain
  Position = poScreenCenter
  WindowState = wsMaximized
  TextHeight = 15
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 427
    Height = 342
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 120
    ExplicitHeight = 0
  end
  object mmMain: TMainMenu
    Left = 56
    Top = 56
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object mnClientes: TMenuItem
        Caption = 'Clientes'
      end
      object mnItens: TMenuItem
        Caption = 'Itens'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnOrdensServico: TMenuItem
        Caption = 'Ordens de Servi'#231'o'
      end
    end
  end
end
