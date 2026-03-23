unit frmCadOrdemServico;

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
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  untUtils,
  untOrdemServico,
  untOrdemServicoItem,
  untCliente,
  untClienteServiceFactory,
  untOrdemServicoServiceFactory;

type
  TfOrdemServico = class(TForm)
    pnlTopo: TPanel;
    Label1: TLabel;
    pnlOS: TPanel;
    Label2: TLabel;
    pnlInferior: TPanel;
    btnCancelar: TButton;
    btnSalvar: TButton;
    pnlItens: TPanel;
    dbgItens: TDBGrid;
    cmbStatus: TComboBox;
    mmDescricao: TMemo;
    Label6: TLabel;
    lblTotal: TLabel;
    edtIdCliente: TEdit;
    edtNomeCliente: TEdit;
    Label4: TLabel;
    dtpDtAbertura: TDateTimePicker;
    Label3: TLabel;
    dtpDtPrevista: TDateTimePicker;
    Label5: TLabel;
    dtpDtFechamento: TDateTimePicker;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtDescricao: TEdit;
    Label10: TLabel;
    edtQtd: TEdit;
    Label11: TLabel;
    edtValor: TEdit;
    Label13: TLabel;
    btnAdicionar: TButton;
    mtItens: TFDMemTable;
    dsItens: TDataSource;
    mtItensDESCRICAO: TWideStringField;
    mtItensQUANTIDADE: TFMTBCDField;
    mtItensVALOR_UNITARIO: TFMTBCDField;
    btnExcluir: TButton;
    mtItensTOTAL_ITEM: TFMTBCDField;
    procedure edtIdClienteExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure edtQtdExit(Sender: TObject);
    procedure edtQtdKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExcluirClick(Sender: TObject);
  private
    FOrdemServico: TOrdemServico;

    procedure CarregarDados(AID: Integer);
    procedure Salvar;
    procedure AtualizarGridItens;
    procedure LimparCamposItem;
    procedure DesabilitaCampos;
    procedure AtualizarTotal;
    procedure ExcluirItem;
    function Validar: Boolean;
  public
    class function Novo: Boolean;
    class function Editar(AID: Integer): Boolean;
  end;

var
  fOrdemServico: TfOrdemServico;

implementation

{$R *.dfm}

class function TfOrdemServico.Novo: Boolean;
var
  Frm: TfOrdemServico;
begin
  Frm := TfOrdemServico.Create(nil);
  try
    Frm.dtpDtAbertura.Checked := True;
    Result := Frm.ShowModal = mrOk;
  finally
    Frm.Free;
  end;
end;

class function TfOrdemServico.Editar(AID: Integer): Boolean;
var
  Frm: TfOrdemServico;
begin
  Frm := TfOrdemServico.Create(nil);
  try
    Frm.CarregarDados(AID);
    Result := Frm.ShowModal = mrOk;
  finally
    Frm.Free;
  end;
end;

procedure TfOrdemServico.btnAdicionarClick(Sender: TObject);
var
  Item: TOrdemServicoItem;
  vQtd, vValor: Double;
begin
  TryStrToFloat(StringReplace(edtQtd.Text, '.', EmptyStr, [rfReplaceAll]), vQtd);
  TryStrToFloat(StringReplace(edtValor.Text, '.', EmptyStr, [rfReplaceAll]), vValor);

  if Trim(edtDescricao.Text) = '' then
  begin
    ShowMsg('Informe a descrição do item.', mtWarn);
    edtDescricao.SetFocus;
    Exit;
  end;

  if vQtd <= 0 then
  begin
    ShowMsg('Informe a quantidade do item.', mtWarn);
    edtQtd.SetFocus;
    Exit;
  end;

  if vValor <= 0 then
  begin
    ShowMsg('Informe o valor do item.', mtWarn);
    edtValor.SetFocus;
    Exit;
  end;

  Item := TOrdemServicoItem.Create;
  Item.Descricao := edtDescricao.Text;
  Item.Quantidade := vQtd;
  Item.ValorUnitario := vValor;

  FOrdemServico.AdicionarItem(Item);

  AtualizarGridItens;
  AtualizarTotal;

  LimparCamposItem;
  edtDescricao.SetFocus;
end;

procedure TfOrdemServico.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfOrdemServico.btnExcluirClick(Sender: TObject);
begin
  ExcluirItem;
end;

procedure TfOrdemServico.btnSalvarClick(Sender: TObject);
begin
  try
    if not Validar then
      Exit;

    Salvar;

    ModalResult := mrOk;
  except
    on E: Exception do
      ShowMsg('Erro ao salvar OS: ' + sLineBreak + E.Message, mtErr);
  end;
end;

function TfOrdemServico.Validar: Boolean;
begin
  Result := False;

  if StrToIntDef(edtIdCliente.Text, 0) <= 0 then
  begin
    ShowMsg('Informe o cliente.', mtWarn);
    edtIdCliente.SetFocus;
    Exit;
  end;

  if (dtpDtAbertura.Checked = False) then
  begin
    ShowMsg('É necessário adicionar uma data de abertura à ordem de serviço.', mtWarn);
    dtpDtAbertura.SetFocus;
    Exit;
  end;

  if (cmbStatus.Text = TStatusOSUtils.ToString(soEmAndamento)) and
    (dtpDtPrevista.Checked = False) then
  begin
    ShowMsg('É necessário adicionar uma data prevista à ordem de serviço em andamento.', mtWarn);
    dtpDtPrevista.SetFocus;
    Exit;
  end;

  if (cmbStatus.Text = TStatusOSUtils.ToString(soConcluida)) and
    (dtpDtFechamento.Checked = False) then
  begin
    ShowMsg('É necessário adicionar uma data de fechamento à ordem de serviço concluída.', mtWarn);
    dtpDtFechamento.SetFocus;
    Exit;
  end;

  if (dtpDtPrevista.Checked) and
    (dtpDtPrevista.Date < dtpDtAbertura.Date) then
  begin
    ShowMsg('Data prevista deve ser superior à data de abertura.', mtWarn);
    dtpDtPrevista.SetFocus;
    Exit;
  end;

  if (dtpDtFechamento.Checked) and
    (dtpDtFechamento.Date < dtpDtAbertura.Date) then
  begin
    ShowMsg('Data de fechamento deve ser superior à data de abertura.', mtWarn);
    dtpDtFechamento.SetFocus;
    Exit;
  end;

  if (dtpDtFechamento.Checked) and
    (dtpDtFechamento.Date > Now) then
  begin
    ShowMsg('Data de fechamento não pode ser superior à data de hoje.', mtWarn);
    dtpDtFechamento.SetFocus;
    Exit;
  end;

  if (FOrdemServico.Itens.Count = 0) then
  begin
    ShowMsg('Adicione ao menos um item.', mtWarn);
    edtDescricao.SetFocus;
    Exit;
  end;

  Result := True;
end;

procedure TfOrdemServico.edtDescricaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    vk_return: btnAdicionarClick(Sender);
  end;
end;

procedure TfOrdemServico.edtIdClienteExit(Sender: TObject);
var
  Cliente: TCliente;
  ID: Integer;
begin
  edtNomeCliente.Clear;

  if Trim(edtIdCliente.Text) = '' then
    Exit;

  ID := StrToIntDef(edtIdCliente.Text, 0);
  if ID <= 0 then
    Exit;

  try
    Cliente := ClienteService.ObterPorID(ID);
    try
      edtNomeCliente.Text := Cliente.Nome;
    finally
      Cliente.Free;
    end;
  except
    on E: Exception do
    begin
      ShowMsg('Cliente não encontrado.', mtWarn);
      edtIdCliente.SetFocus;
      edtIdCliente.SelectAll;
    end;
  end;
end;

procedure TfOrdemServico.edtQtdExit(Sender: TObject);
begin
  FormatarValorEdit(TEdit(Sender));
end;

procedure TfOrdemServico.edtQtdKeyPress(Sender: TObject; var Key: Char);
begin
  NumbersOnlyValorEdit(TEdit(Sender), Key);
end;

procedure TfOrdemServico.FormCreate(Sender: TObject);
begin
  FOrdemServico := TOrdemServico.Create;
  mtItens.CreateDataSet;
  LimparDateTimePickers(Self);
end;

procedure TfOrdemServico.FormDestroy(Sender: TObject);
begin
  FOrdemServico.Free;
end;

procedure TfOrdemServico.FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  case Key of
    vk_escape: btnCancelarClick(Sender);
    vk_f1: btnSalvarClick(Sender);

    vk_delete:
    begin
      if not (ActiveControl is TEdit) and
         not (ActiveControl is TComboBox) and
         not (ActiveControl is TDateTimePicker) and
         not (ActiveControl is TMemo) then
        btnExcluirClick(Sender);
    end;

    vk_up: mtItens.Prior;
    vk_down: mtItens.Next;
  end;
end;

procedure TfOrdemServico.LimparCamposItem;
begin
  edtDescricao.Clear;
  edtQtd.Text := '0,00';
  edtValor.Text := '0,00';
end;

procedure TfOrdemServico.AtualizarTotal;
begin
  lblTotal.Caption := FormatFloat('R$ #,##0.00', FOrdemServico.ValorTotal);
end;

procedure TfOrdemServico.AtualizarGridItens;
var
  Item: TOrdemServicoItem;
begin
  mtItens.DisableControls;
  try
    mtItens.EmptyDataSet;

    for Item in FOrdemServico.Itens do
    begin
      mtItens.Append;
      mtItens.FieldByName('DESCRICAO').AsString := Item.Descricao;
      mtItens.FieldByName('QUANTIDADE').AsFloat := Item.Quantidade;
      mtItens.FieldByName('VALOR_UNITARIO').AsFloat := Item.ValorUnitario;
      mtItens.FieldByName('TOTAL_ITEM').AsFloat := Item.Quantidade * Item.ValorUnitario;
      mtItens.Post;
    end;
  finally
    mtItens.EnableControls;
  end;
end;

procedure TfOrdemServico.CarregarDados(AID: Integer);
var
  OS: TOrdemServico;
begin
  OS := OSService.ObterPorID(AID);
  try
    FOrdemServico.Free;
    FOrdemServico := OS;

    edtIdCliente.Text := OS.ClienteID.ToString;
    edtIdClienteExit(nil);

    dtpDtAbertura.Checked := OS.DataAbertura <> 0;
    if dtpDtAbertura.Checked then
      dtpDtAbertura.Date := OS.DataAbertura;

    dtpDtPrevista.Checked := OS.DataPrevista <> 0;
    if dtpDtPrevista.Checked then
      dtpDtPrevista.Date := OS.DataPrevista;

    dtpDtFechamento.Checked := OS.DataFechamento <> 0;
    if dtpDtFechamento.Checked then
      dtpDtFechamento.Date := OS.DataFechamento;

    cmbStatus.ItemIndex := Ord(OS.Status);
    mmDescricao.Text := OS.DescricaoProblema;

    DesabilitaCampos;
    AtualizarGridItens;
    AtualizarTotal;
  except
    OS.Free;
    raise;
  end;
end;

procedure TfOrdemServico.Salvar;
begin
  FOrdemServico.ClienteID := StrToIntDef(edtIdCliente.Text, 0);

  if dtpDtAbertura.Checked then
    FOrdemServico.DataAbertura := dtpDtAbertura.Date
  else
    FOrdemServico.DataAbertura := 0;

  if dtpDtPrevista.Checked then
    FOrdemServico.DataPrevista := dtpDtPrevista.Date
  else
    FOrdemServico.DataPrevista := 0;

  if dtpDtFechamento.Checked then
    FOrdemServico.DataFechamento := dtpDtFechamento.Date
  else
    FOrdemServico.DataFechamento := 0;

  FOrdemServico.Status := TStatusOS(cmbStatus.ItemIndex);
  FOrdemServico.DescricaoProblema := mmDescricao.Text;

  OSService.Salvar(FOrdemServico);
end;

procedure TfOrdemServico.DesabilitaCampos;
var
  CanceladaConcluida: Boolean;
begin
  // Se estiver Cancelada ou Concluída, pode apenas visualizar
  CanceladaConcluida := ((cmbStatus.Text = TStatusOSUtils.ToString(soConcluida)) or (cmbStatus.Text = TStatusOSUtils.ToString(soCancelada)));

  edtIdCliente.Enabled := not CanceladaConcluida;
  cmbStatus.Enabled := not CanceladaConcluida;
  dtpDtPrevista.Enabled := not CanceladaConcluida;
  dtpDtFechamento.Enabled := not CanceladaConcluida;
  mmDescricao.Enabled := not CanceladaConcluida;

  edtDescricao.Enabled := not CanceladaConcluida;
  edtQtd.Enabled := not CanceladaConcluida;
  edtValor.Enabled := not CanceladaConcluida;
  btnAdicionar.Enabled := not CanceladaConcluida;

  // Campos sempre desabilitados em edição
  dtpDtAbertura.Enabled := False;
end;

procedure TfOrdemServico.ExcluirItem;
begin
  if mtItens.IsEmpty then
  begin
    ShowMsg('Selecione um item para exclusão.', mtWarn);
    Exit;
  end;

  if (ShowMsg('Deseja realmente excluir esse item?', mtQuest) <> mrYes) then
    Exit;

  try
    FOrdemServico.Itens.Delete(mtItens.RecNo - 1);
    mtItens.Delete;

    AtualizarTotal;
  except
    on E: Exception do
      ShowMsg('Erro ao excluir o item: ' +sLineBreak+ E.Message, mtErr);
  end;
end;

end.
