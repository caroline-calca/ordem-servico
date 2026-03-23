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
  frmConfig,
  frmListaClientes,
  frmListaOrdemServico, Vcl.StdCtrls, Vcl.Buttons;

type
  TfMain = class(TForm)
    pnlMain: TPanel;
    mmMain: TMainMenu;
    Cadastros1: TMenuItem;
    mnClientes: TMenuItem;
    N1: TMenuItem;
    mnOrdensServico: TMenuItem;
    Sistema1: TMenuItem;
    mnConfiguracoes: TMenuItem;
    Configuraes2: TMenuItem;
    mnSobre: TMenuItem;
    GroupBox1: TGroupBox;
    btnClientes: TBitBtn;
    btnOrdemServico: TBitBtn;
    btnConfiguracoes: TBitBtn;
    procedure mnConfiguracoesClick(Sender: TObject);
    procedure mnClientesClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mnSobreClick(Sender: TObject);
    procedure mnOrdensServicoClick(Sender: TObject);
    procedure btnClientesClick(Sender: TObject);
    procedure btnOrdemServicoClick(Sender: TObject);
    procedure btnConfiguracoesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

procedure TfMain.btnClientesClick(Sender: TObject);
begin
  mnClientesClick(Sender);
end;

procedure TfMain.btnConfiguracoesClick(Sender: TObject);
begin
  mnConfiguracoesClick(Sender);
end;

procedure TfMain.btnOrdemServicoClick(Sender: TObject);
begin
  mnOrdensServicoClick(Sender);
end;

procedure TfMain.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    vk_escape:
    begin
      if (ShowMsg('Deseja realmente sair do sistema?', mtQuest) <> mrYes) then
        Exit;

      Application.Terminate;
    end;
  end;
end;

procedure TfMain.mnClientesClick(Sender: TObject);
begin
  if not Assigned(fListaClientes) then
    fListaClientes := TfListaClientes.Create(Self);

  fListaClientes.Show;
end;

procedure TfMain.mnConfiguracoesClick(Sender: TObject);
begin
  if TfConfig.Executar = mrOk then
  begin
    ShowMsg('As configurações foram alteradas.' + sLineBreak +
            'O sistema será encerrado para aplicar as mudanças.', mtInfo);

    Application.Terminate;
  end;
end;

procedure TfMain.mnOrdensServicoClick(Sender: TObject);
begin
  if not Assigned(fListaOrdemServico) then
    fListaOrdemServico := TfListaOrdemServico.Create(Self);

  fListaOrdemServico.Show;
end;

procedure TfMain.mnSobreClick(Sender: TObject);
const TempoTotalDev = '36 horas';
begin
  ShowMsg('Sistema de Ordens de Serviço' + sLineBreak +
          'Versão: 1.0' + sLineBreak +
          sLineBreak +
          'Desenvolvido como prova técnica para vaga de Desenvolvedor Delphi.' + sLineBreak +
          sLineBreak +
          'Tecnologias utilizadas:' + sLineBreak +
          '- Delphi 12 Community Edition' + sLineBreak +
          '- FireDAC' + sLineBreak +
          '- Fortes Report Community Edition' + sLineBreak +
          '- Banco de dados Firebird 3.0' + sLineBreak +
          sLineBreak +
          'Funcionalidades:' + sLineBreak +
          '- Cadastro de clientes' + sLineBreak +
          '- Cadastro de ordens de serviço e itens' + sLineBreak +
          '- Filtros dinâmicos' + sLineBreak +
          '- Relatório de ordens de serviço' + sLineBreak +
          '- Tela de configurações' + sLineBreak +
          '- Criação automatizada de banco de dados' + sLineBreak +
          sLineBreak +
          'Arquitetura:' + sLineBreak +
          '- Separação em camadas (Repository, Service, UI)' + sLineBreak +
          '- Uso de filtros tipados para escalabilidade' + sLineBreak +
          '- Aplicação de princípios SOLID e Clean Code' + sLineBreak +
          sLineBreak +
          'Tempo total de desenvolvimento: ' + TempoTotalDev + sLineBreak +
          sLineBreak +
          'Autor: Caroline Calça' + sLineBreak +
          'Ano: 2026', mtInfo);
end;

end.
