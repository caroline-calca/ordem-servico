object fRelOrdemServico: TfRelOrdemServico
  Left = 0
  Top = 0
  Caption = '[006] Relat'#243'rio de Ordem de Servi'#231'o'
  ClientHeight = 1125
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object rlRelOrdemServico: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = DMOrdemServico.dsRelOS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri Light'
    Font.Style = []
    object bndTitle: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 35
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object lblTitulo: TRLLabel
        Left = 0
        Top = 3
        Width = 718
        Height = 27
        Align = faCenter
        Alignment = taCenter
        AutoSize = False
        Caption = 'Relat'#243'rio de Ordens de Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
    end
    object bndFooter: TRLBand
      Left = 38
      Top = 248
      Width = 718
      Height = 25
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLSystemInfo1: TRLSystemInfo
        Left = 3
        Top = 4
        Width = 414
        Height = 16
        AutoSize = False
        Info = itFullDate
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 657
        Top = 4
        Width = 20
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Info = itPageNumber
        Text = ''
      end
      object RLLabel7: TRLLabel
        Left = 612
        Top = 4
        Width = 45
        Height = 16
        AutoSize = False
        Caption = 'P'#225'gina'
      end
      object RLLabel8: TRLLabel
        Left = 677
        Top = 4
        Width = 18
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'de'
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 695
        Top = 4
        Width = 20
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Info = itLastPageNumber
        Text = ''
      end
    end
    object grpStatus: TRLGroup
      Left = 38
      Top = 73
      Width = 718
      Height = 137
      DataFields = 'STATUS'
      object bndColHeader: TRLBand
        Left = 0
        Top = 33
        Width = 718
        Height = 27
        BandType = btColumnHeader
        object RLLabel1: TRLLabel
          Left = 33
          Top = 6
          Width = 227
          Height = 16
          AutoSize = False
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri Light'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel2: TRLLabel
          Left = 4
          Top = 6
          Width = 23
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'OS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri Light'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 266
          Top = 6
          Width = 107
          Height = 16
          AutoSize = False
          Caption = 'Dt. Abertura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri Light'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 379
          Top = 6
          Width = 107
          Height = 16
          AutoSize = False
          Caption = 'Dt. Prevista'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri Light'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 492
          Top = 6
          Width = 107
          Height = 16
          AutoSize = False
          Caption = 'Dt. Fechamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri Light'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 605
          Top = 6
          Width = 107
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Vlr. Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri Light'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object bndGroupHeader: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 33
        BandType = btHeader
        object RLLabel9: TRLLabel
          Left = 1
          Top = 12
          Width = 716
          Height = 20
          AutoSize = False
          Caption = ' '
          Color = clBtnFace
          ParentColor = False
          Transparent = False
        end
        object RLLabel10: TRLLabel
          Left = 6
          Top = 14
          Width = 46
          Height = 16
          AutoSize = False
          Caption = 'Status:'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
        object RLDBText10: TRLDBText
          Left = 55
          Top = 14
          Width = 657
          Height = 16
          AutoSize = False
          Color = clBtnFace
          DataField = 'STATUS'
          DataSource = DMOrdemServico.dsRelOS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Text = ''
          Transparent = False
        end
      end
      object bndGroupDetail: TRLBand
        Left = 0
        Top = 60
        Width = 718
        Height = 23
        object RLDBText2: TRLDBText
          Left = 33
          Top = 4
          Width = 227
          Height = 16
          AutoSize = False
          DataField = 'CLIENTE_NOME'
          DataSource = DMOrdemServico.dsRelOS
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 266
          Top = 4
          Width = 107
          Height = 16
          AutoSize = False
          DataField = 'DATA_ABERTURA'
          DataSource = DMOrdemServico.dsRelOS
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 379
          Top = 5
          Width = 107
          Height = 16
          AutoSize = False
          DataField = 'DATA_PREVISTA'
          DataSource = DMOrdemServico.dsRelOS
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 492
          Top = 4
          Width = 107
          Height = 16
          AutoSize = False
          DataField = 'DATA_FECHAMENTO'
          DataSource = DMOrdemServico.dsRelOS
          Text = ''
        end
        object RLDBText8: TRLDBText
          Left = 605
          Top = 4
          Width = 107
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALOR_TOTAL'
          DataSource = DMOrdemServico.dsRelOS
          Text = ''
        end
        object RLDBText9: TRLDBText
          Left = 4
          Top = 4
          Width = 23
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'ID'
          DataSource = DMOrdemServico.dsRelOS
          Text = ''
        end
      end
      object bndGroupSummary: TRLBand
        Left = 0
        Top = 83
        Width = 718
        Height = 51
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLDBResult1: TRLDBResult
          Left = 617
          Top = 8
          Width = 95
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALOR_TOTAL'
          DataSource = DMOrdemServico.dsRelOS
          Info = riSum
          Text = ''
        end
        object RLLabel11: TRLLabel
          Left = 492
          Top = 3
          Width = 220
          Height = 3
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Caption = ' '
        end
        object RLDBResult2: TRLDBResult
          Left = 617
          Top = 27
          Width = 95
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'ID'
          DataSource = DMOrdemServico.dsRelOS
          Info = riCount
          Text = ''
        end
        object RLLabel12: TRLLabel
          Left = 507
          Top = 8
          Width = 104
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Total no status:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri Light'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel13: TRLLabel
          Left = 507
          Top = 27
          Width = 104
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'OSs no status:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri Light'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object bndSummary: TRLBand
      Left = 38
      Top = 210
      Width = 718
      Height = 38
      BandType = btSummary
      object RLLabel17: TRLLabel
        Left = 1
        Top = 8
        Width = 716
        Height = 20
        AutoSize = False
        Caption = ' '
        Color = clBtnFace
        ParentColor = False
        Transparent = False
      end
      object RLLabel14: TRLLabel
        Left = 290
        Top = 5
        Width = 422
        Height = 3
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = ' '
      end
      object RLLabel15: TRLLabel
        Left = 335
        Top = 10
        Width = 79
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Valor total:'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri Light'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object RLLabel16: TRLLabel
        Left = 545
        Top = 10
        Width = 91
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Total de OSs:'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri Light'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object RLDBResult3: TRLDBResult
        Left = 420
        Top = 10
        Width = 119
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Color = clBtnFace
        DataField = 'VALOR_TOTAL'
        DataSource = DMOrdemServico.dsRelOS
        Info = riSum
        ParentColor = False
        Text = ''
        Transparent = False
      end
      object RLDBResult4: TRLDBResult
        Left = 642
        Top = 10
        Width = 70
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Color = clBtnFace
        DataField = 'ID'
        DataSource = DMOrdemServico.dsRelOS
        Info = riCount
        ParentColor = False
        Text = ''
        Transparent = False
      end
    end
  end
end
