unit frmCliente;

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
  Vcl.ExtCtrls,

  untUtils,
  untCliente,
 // untClienteRepository,
  untClienteRepositoryFirebird,
  untClienteService,
  untClienteServiceImpl;

type
  TfCliente = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    edtNome: TEdit;
    edtDocumento: TEdit;
    edtEmail: TEdit;
    edtTelefone: TEdit;
    Panel4: TPanel;
    btnCancelar: TButton;
    btnSalvar: TButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FClienteID: Integer;

    procedure CarregarDados(AID: Integer);
    procedure Salvar;
    function Validar: Boolean;
  public
    class function Novo: Boolean;
    class function Editar(AID: Integer): Boolean;
  end;

var
  fCliente: TfCliente;

implementation

{$R *.dfm}

class function TfCliente.Novo: Boolean;
var
  Frm: TfCliente;
begin
  Frm := TfCliente.Create(nil);
  try
    Frm.FClienteID := 0;
    Result := Frm.ShowModal = mrOk;
  finally
    Frm.Free;
  end;
end;

class function TfCliente.Editar(AID: Integer): Boolean;
var
  Frm: TfCliente;
begin
  Frm := TfCliente.Create(nil);
  try
    Frm.FClienteID := AID;
    Frm.CarregarDados(AID);
    Result := Frm.ShowModal = mrOk;
  finally
    Frm.Free;
  end;
end;

procedure TfCliente.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    vk_escape: btnCancelarClick(Sender);
    vk_f1: btnSalvarClick(Sender);
  end;
end;

procedure TfCliente.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfCliente.btnSalvarClick(Sender: TObject);
begin
  try
    if not Validar then
      Exit;

    Salvar;
    ModalResult := mrOk;
  except
    on E: Exception do
      ShowMsg('Erro ao salvar o cliente: ' +#13#10+ E.Message, mtErr);
  end;
end;

procedure TfCliente.CarregarDados(AID: Integer);
var
  Service: IClienteService;
  Cliente: TCliente;
begin
  Service := TClienteService.Create(TClienteRepositoryFirebird.Create);

  Cliente := Service.ObterPorID(AID);
  try
    if not Assigned(Cliente) then
      raise Exception.Create('Cliente não encontrado.');

    edtNome.Text := Cliente.Nome;
    edtDocumento.Text := Cliente.Documento;
    edtEmail.Text := Cliente.Email;
    edtTelefone.Text := Cliente.Telefone;
  finally
    Cliente.Free;
  end;
end;

procedure TfCliente.Salvar;
var
  Service: IClienteService;
  Cliente: TCliente;
begin
  Service := TClienteService.Create(TClienteRepositoryFirebird.Create);

  Cliente := TCliente.Create;
  try
    Cliente.ID := FClienteID;
    Cliente.Nome := edtNome.Text;
    Cliente.Documento := edtDocumento.Text;
    Cliente.Email := edtEmail.Text;
    Cliente.Telefone := edtTelefone.Text;

    Service.Salvar(Cliente);
  finally
    Cliente.Free;
  end;
end;

function TfCliente.Validar: Boolean;
begin
  Result := False;

  if Trim(edtNome.Text) = '' then
  begin
    ShowMsg('Informe o nome do cliente.', mtWarn);
    edtNome.SetFocus;
    Exit;
  end;

  if Trim(edtEmail.Text) <> '' then
  begin
    if Pos('@', edtEmail.Text) = 0 then
      raise Exception.Create('E-mail inválido.');
  end;

  Result := True;
end;

end.
