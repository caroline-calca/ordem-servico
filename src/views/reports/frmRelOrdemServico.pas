unit frmRelOrdemServico;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.StdCtrls,
  Vcl.Forms,
  Vcl.Dialogs,
  RLReport,

  uDMOrdemServico;

type
  TfRelOrdemServico = class(TForm)
    rlRelOrdemServico: TRLReport;
    bndTitle: TRLBand;
    lblTitulo: TRLLabel;
    bndFooter: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLSystemInfo3: TRLSystemInfo;
    grpStatus: TRLGroup;
    bndColHeader: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    bndGroupHeader: TRLBand;
    bndGroupDetail: TRLBand;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLDBText10: TRLDBText;
    bndGroupSummary: TRLBand;
    RLDBResult1: TRLDBResult;
    RLLabel11: TRLLabel;
    RLDBResult2: TRLDBResult;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    bndSummary: TRLBand;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLLabel17: TRLLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelOrdemServico: TfRelOrdemServico;

implementation

{$R *.dfm}

end.
