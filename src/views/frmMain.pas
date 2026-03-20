unit frmMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.ExtCtrls,

  untUtils,
  frmConfig;

type
  TfMain = class(TForm)
    pnlMain: TPanel;
    mmMain: TMainMenu;
    Cadastros1: TMenuItem;
    mnClientes: TMenuItem;
    mnItens: TMenuItem;
    N1: TMenuItem;
    mnOrdensServico: TMenuItem;
    Sistema1: TMenuItem;
    mnConfiguracoes: TMenuItem;
    Configuraes2: TMenuItem;
    mnSobre: TMenuItem;
    procedure mnConfiguracoesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

procedure TfMain.mnConfiguracoesClick(Sender: TObject);
begin
  if TfConfig.Executar = mrOk then
  begin
    ShowMsg('As configurações foram alteradas.' + sLineBreak +
            'O sistema será encerrado para aplicar as mudanças.', mtInfo);

    Application.Terminate;
  end;
end;

end.
