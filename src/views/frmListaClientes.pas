unit frmListaClientes;

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
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,

  untUtils,
  uDMCliente,
  untClienteServiceFactory,
  untClienteFiltro,

  frmCadCliente, Vcl.Samples.Spin;

type
  TfListaClientes = class(TForm)
    pnlTopo: TPanel;
    pnlGrade: TPanel;
    pnlInferior: TPanel;
    Label1: TLabel;
    edtNome: TEdit;
    btnPesquisar: TBitBtn;
    dbgClientes: TDBGrid;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblTotalPaginas: TLabel;
    spnPaginaAtual: TSpinEdit;
    spnRegPorPagina: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure dbgClientesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgClientesDblClick(Sender: TObject);
    procedure spnRegPorPaginaChange(Sender: TObject);
    procedure spnPaginaAtualChange(Sender: TObject);
  private
    FTotalPaginas: Integer;

    procedure Listar;
    procedure AtualizarTotalPaginas;
    procedure InicializarPaginacao;
  public
    { Public declarations }
  end;

var
  fListaClientes: TfListaClientes;

implementation

{$R *.dfm}

procedure TfListaClientes.btnExcluirClick(Sender: TObject);
begin
  if DMCliente.qryClientes.IsEmpty then
  begin
    ShowMsg('Selecione um cliente para exclusão.', mtWarn);
    Exit;
  end;

  if (ShowMsg('Deseja realmente excluir esse cliente?', mtQuest) <> mrYes) then
    Exit;

  try
    ClienteService.Excluir(DMCliente.qryClientesID.AsInteger);
    Listar;
  except
    on E: Exception do
      ShowMsg('Erro ao excluir o cliente: ' +sLineBreak+ E.Message, mtErr);
  end;
end;

procedure TfListaClientes.btnNovoClick(Sender: TObject);
begin
  if TfCliente.Novo then
    Listar;
end;

procedure TfListaClientes.btnEditarClick(Sender: TObject);
begin
  if DMCliente.qryClientes.IsEmpty then
  begin
    ShowMsg('Selecione um cliente para edição.', mtWarn);
    Exit;
  end;

  if TfCliente.Editar(DMCliente.qryClientesID.AsInteger) then
    Listar;
end;

procedure TfListaClientes.btnPesquisarClick(Sender: TObject);
begin
  Listar;
end;

procedure TfListaClientes.dbgClientesDblClick(Sender: TObject);
begin
  btnEditarClick(Sender);
end;

procedure TfListaClientes.dbgClientesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    vk_return: btnEditarClick(Sender);
  end;
end;

procedure TfListaClientes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    vk_insert: btnNovoClick(Sender);
    vk_f2: btnEditarClick(Sender);
    vk_escape: Close;

    vk_delete:
    begin
      if not (ActiveControl is TEdit) then
        btnExcluirClick(Sender);
    end;

    vk_up: dbgClientes.Datasource.Dataset.Prior;
    vk_down: dbgClientes.Datasource.Dataset.Next;
  end;
end;

procedure TfListaClientes.edtNomeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_return then
    btnPesquisarClick(Sender);
end;

procedure TfListaClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fListaClientes := nil;
end;

procedure TfListaClientes.FormCreate(Sender: TObject);
begin
  InicializarPaginacao;
end;

procedure TfListaClientes.InicializarPaginacao;
begin
  FTotalPaginas := 1;

  spnPaginaAtual.Value := cPaginaPadrao;
  spnPaginaAtual.MinValue := 1;
  spnPaginaAtual.MaxValue := FTotalPaginas;

  spnRegPorPagina.Value := cRegPorPaginaPadrao;
  spnRegPorPagina.MinValue := 1;

  Listar;
end;

procedure TfListaClientes.Listar;
var
  PaginaAtual,
  RegPorPagina: Integer;
begin
  PaginaAtual := spnPaginaAtual.Value;
  RegPorPagina := spnRegPorPagina.Value;

  DMCliente.Listar(TClienteFiltro.PorNome(edtNome.Text),
    RetornarOffset(PaginaAtual, RegPorPagina),
    RegPorPagina
  );

  AtualizarTotalPaginas;
end;

procedure TfListaClientes.spnPaginaAtualChange(Sender: TObject);
begin
  if (spnPaginaAtual.Value < spnPaginaAtual.MinValue) then
    spnPaginaAtual.Value := spnPaginaAtual.MinValue;

  if (spnPaginaAtual.Value > spnPaginaAtual.MaxValue) then
    spnPaginaAtual.Value := spnPaginaAtual.MaxValue;

  Listar;
end;

procedure TfListaClientes.spnRegPorPaginaChange(Sender: TObject);
begin
  if (spnRegPorPagina.Value < spnRegPorPagina.MinValue) then
    spnRegPorPagina.Value := spnRegPorPagina.MinValue;

  if (spnRegPorPagina.Value > spnRegPorPagina.MaxValue) then
    spnRegPorPagina.Value := spnRegPorPagina.MaxValue;

  spnPaginaAtual.Value := cPaginaPadrao;
  Listar;
end;

procedure TfListaClientes.AtualizarTotalPaginas;
var
  RegPorPagina,
  TotalRegistros: Integer;
begin
  RegPorPagina := spnRegPorPagina.Value;
  TotalRegistros := DMCliente.Contar(TClienteFiltro.PorNome(edtNome.Text));

  FTotalPaginas := RetornarTotalPaginas(TotalRegistros, RegPorPagina);

  spnPaginaAtual.MaxValue := FTotalPaginas;

  if (spnPaginaAtual.Value > FTotalPaginas) then
    spnPaginaAtual.Value := cPaginaPadrao;

  lblTotalPaginas.Caption := 'de ' + IntToStr(FTotalPaginas);
end;

end.
