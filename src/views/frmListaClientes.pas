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

  frmCliente;

type
  TfListaClientes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    edtNome: TEdit;
    btnPesquisar: TBitBtn;
    dbgClientes: TDBGrid;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    Label2: TLabel;
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
  private
    procedure Listar;
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
      ShowMsg('Erro ao excluir o cliente: ' +#13#10+ E.Message, mtErr);
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

procedure TfListaClientes.dbgClientesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    vk_return: btnEditarClick(Sender);
    vk_delete: btnExcluirClick(Sender);
  end;
end;

procedure TfListaClientes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    vk_insert: btnNovoClick(Sender);
    vk_f2: btnEditarClick(Sender);
    vk_delete: btnExcluirClick(Sender);
    vk_escape: Close;

    vk_up: dbgClientes.Datasource.Dataset.Prior;
    vk_down: dbgClientes.Datasource.Dataset.Next;
  end;
end;

procedure TfListaClientes.edtNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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
  Listar;
end;

procedure TfListaClientes.Listar;
begin
  DMCliente.Listar(TClienteFiltro.PorNome(edtNome.Text));
end;

end.
