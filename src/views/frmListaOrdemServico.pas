unit frmListaOrdemServico;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Generics.Collections,
  System.UITypes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  FireDAC.Comp.Client,

  untUtils,
  uDMOrdemServico,
  untOrdemServico,
  untOrdemServicoServiceFactory,
  untOrdemServicoFiltro,
  frmCadOrdemServico,
  frmRelOrdemServico, Vcl.Samples.Spin;

type
  TfListaOrdemServico = class(TForm)
    pnlTopo: TPanel;
    pnlOS: TPanel;
    dbgOS: TDBGrid;
    pnlInferior: TPanel;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    Label2: TLabel;
    pnlFiltros: TPanel;
    edtNomeCliente: TEdit;
    Label1: TLabel;
    btnPesquisar: TBitBtn;
    btnImprimir: TBitBtn;
    gbStatus: TGroupBox;
    chkStatusAberta: TCheckBox;
    chkStatusEmAndamento: TCheckBox;
    chkStatusConcluida: TCheckBox;
    chkStatusCancelada: TCheckBox;
    gbId: TGroupBox;
    edtIdInicial: TEdit;
    edtIdFinal: TEdit;
    Label3: TLabel;
    Label8: TLabel;
    gbDtAbertura: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    dtpDtAberturaInicial: TDateTimePicker;
    dtpDtAberturaFinal: TDateTimePicker;
    gbDtPrevista: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    dtpDtPrevistaInicial: TDateTimePicker;
    dtpDtPrevistaFinal: TDateTimePicker;
    gbDtFechamento: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    dtpDtFechamentoInicial: TDateTimePicker;
    dtpDtFechamentoFinal: TDateTimePicker;
    gbVlrTotal: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    edtVlrTotalInicial: TEdit;
    edtVlrTotalFinal: TEdit;
    pnlItens: TPanel;
    dbgItens: TDBGrid;
    Splitter1: TSplitter;
    Label13: TLabel;
    spnRegPorPagina: TSpinEdit;
    lblTotalPaginas: TLabel;
    spnPaginaAtual: TSpinEdit;
    Label15: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    pnlCorEmAtraso: TPanel;
    stbTotais: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtNomeClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgOSKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtVlrTotalInicialExit(Sender: TObject);
    procedure edtVlrTotalInicialKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dbgOSDblClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure spnPaginaAtualChange(Sender: TObject);
    procedure spnRegPorPaginaChange(Sender: TObject);
    procedure dbgOSDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    FTotalPaginas: Integer;

    procedure Listar;
    procedure ListarRelatorio;
    procedure AtualizarTotalPaginas;
    procedure AtualizarTotais;
    procedure InicializarPaginacao;
    function ObterStatusSelecionados: TArray<TStatusOS>;
    function MontarFiltro: TOrdemServicoFiltro;
  public
    { Public declarations }
  end;

var
  fListaOrdemServico: TfListaOrdemServico;

implementation

{$R *.dfm}

procedure TfListaOrdemServico.btnEditarClick(Sender: TObject);
begin
  if DMOrdemServico.qryOS.IsEmpty then
  begin
    ShowMsg('Selecione uma Ordem de Serviço.', mtWarn);
    Exit;
  end;

  if TfOrdemServico.Editar(DMOrdemServico.qryOSID.AsInteger) then
    Listar;
end;

procedure TfListaOrdemServico.btnExcluirClick(Sender: TObject);
begin
  if DMOrdemServico.qryOS.IsEmpty then
  begin
    ShowMsg('Selecione uma Ordem de Serviço para exclusão.', mtWarn);
    Exit;
  end;

  if (ShowMsg('Deseja realmente excluir essa Ordem de Serviço?', mtQuest) <> mrYes) then
    Exit;

  try
    OSService.Excluir(DMOrdemServico.qryOSID.AsInteger);
    Listar;
  except
    on E: Exception do
      ShowMsg('Erro ao excluir a ordem de serviço: ' +sLineBreak+ E.Message, mtErr);
  end;
end;

procedure TfListaOrdemServico.btnImprimirClick(Sender: TObject);
var
  frmRelOS: TfRelOrdemServico;
begin
  ListarRelatorio;

  frmRelOS := TfRelOrdemServico.Create(nil);
  try
    frmRelOS.rlRelOrdemServico.Preview;
  finally
    frmRelOS.Free;
  end;
end;

procedure TfListaOrdemServico.btnNovoClick(Sender: TObject);
begin
  if TfOrdemServico.Novo then
    Listar;
end;

procedure TfListaOrdemServico.btnPesquisarClick(Sender: TObject);
begin
  Listar;
end;

procedure TfListaOrdemServico.dbgOSDblClick(Sender: TObject);
begin
  btnEditarClick(Sender);
end;

procedure TfListaOrdemServico.dbgOSDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if DMOrdemServico.qryOS.FieldByName('EM_ATRASO').AsInteger = 1 then
    dbgOS.Canvas.Brush.Color := TColors.Tomato;

  if gdSelected in State then
  begin
    dbgOS.Canvas.Brush.Color := clHighlight;
    dbgOS.Canvas.Font.Color := clHighlightText;
  end;

  dbgOS.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfListaOrdemServico.dbgOSKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_return: btnEditarClick(Sender);
  end;
end;

procedure TfListaOrdemServico.edtNomeClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
    btnPesquisarClick(Sender);
end;

procedure TfListaOrdemServico.edtVlrTotalInicialExit(Sender: TObject);
begin
  FormatarValorEdit(TEdit(Sender), True);
end;

procedure TfListaOrdemServico.edtVlrTotalInicialKeyPress(Sender: TObject; var Key: Char);
begin
  NumbersOnlyValorEdit(TEdit(Sender), Key);
end;

procedure TfListaOrdemServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  fListaOrdemServico := nil;
end;

procedure TfListaOrdemServico.FormCreate(Sender: TObject);
begin
  InicializarPaginacao;
  LimparDateTimePickers(Self);
end;

procedure TfListaOrdemServico.InicializarPaginacao;
begin
  FTotalPaginas := 1;

  spnPaginaAtual.Value := cPaginaPadrao;
  spnPaginaAtual.MinValue := 1;
  spnPaginaAtual.MaxValue := FTotalPaginas;

  spnRegPorPagina.Value := cRegPorPaginaPadrao;
  spnRegPorPagina.MinValue := 1;

  Listar;
end;

procedure TfListaOrdemServico.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    vk_insert: btnNovoClick(Sender);
    vk_f2: btnEditarClick(Sender);
    vk_escape: Close;

    vk_delete:
    begin
      if not (ActiveControl is TEdit) and
         not (ActiveControl is TComboBox) and
         not (ActiveControl is TDateTimePicker) then
        btnExcluirClick(Sender);
    end;

    vk_up: dbgOS.Datasource.Dataset.Prior;
    vk_down: dbgOS.Datasource.Dataset.Next;
  end;
end;

procedure TfListaOrdemServico.FormShow(Sender: TObject);
begin
  edtIdInicial.SetFocus;
end;

function TfListaOrdemServico.MontarFiltro: TOrdemServicoFiltro;
var
  vVlrInicial, vVlrFinal: Double;
begin
  Result := TOrdemServicoFiltro.Create;

  TryStrToFloat(StringReplace(edtVlrTotalInicial.Text, '.', EmptyStr, [rfReplaceAll]), vVlrInicial);
  TryStrToFloat(StringReplace(edtVlrTotalFinal.Text, '.', EmptyStr, [rfReplaceAll]), vVlrFinal);

  //Id
  if Trim(edtIDInicial.Text) <> '' then
    Result.IDInicial := StrToIntDef(edtIDInicial.Text, 0);

  if Trim(edtIDFinal.Text) <> '' then
    Result.IDFinal := StrToIntDef(edtIDFinal.Text, 0);

  //Vlr Total
  if vVlrInicial > 0 then
    Result.ValorMin := vVlrInicial;

  if vVlrFinal > 0 then
    Result.ValorMax := vVlrFinal;

  // Status
  Result.Status := ObterStatusSelecionados;

  //Data de Abertura
  if dtpDtAberturaInicial.Checked then
    Result.DataAberturaInicial := dtpDtAberturaInicial.Date;

  if dtpDtAberturaFinal.Checked then
    Result.DataAberturaFinal := dtpDtAberturaFinal.Date;

  //Data Prevista
  if dtpDtPrevistaInicial.Checked then
    Result.DataPrevistaInicial := dtpDtPrevistaInicial.Date;

  if dtpDtPrevistaFinal.Checked then
    Result.DataPrevistaFinal := dtpDtPrevistaFinal.Date;

  //Data de Fechamento
  if dtpDtFechamentoInicial.Checked then
    Result.DataFechamentoInicial := dtpDtFechamentoInicial.Date;

  if dtpDtFechamentoFinal.Checked then
    Result.DataFechamentoFinal := dtpDtFechamentoFinal.Date;

  // Nome do Cliente
  if Trim(edtNomeCliente.Text) <> '' then
    Result.ClienteNome := edtNomeCliente.Text;
end;

procedure TfListaOrdemServico.Listar;
var
  PaginaAtual,
  RegPorPagina: Integer;
  Filtro: TOrdemServicoFiltro;
begin
  PaginaAtual := spnPaginaAtual.Value;
  RegPorPagina := spnRegPorPagina.Value;

  Filtro := MontarFiltro;
  try
    DMOrdemServico.Listar(Filtro,
      RetornarOffset(PaginaAtual, RegPorPagina),
      RegPorPagina);

    AtualizarTotalPaginas;
    AtualizarTotais;
  finally
    Filtro.Free;
  end;
end;

procedure TfListaOrdemServico.ListarRelatorio;
var
  Filtro: TOrdemServicoFiltro;
begin
  Filtro := MontarFiltro;
  try
    DMOrdemServico.ListarRelatorio(Filtro);
  finally
    Filtro.Free;
  end;
end;

procedure TfListaOrdemServico.AtualizarTotalPaginas;
var
  RegPorPagina,
  TotalRegistros: Integer;
  Filtro: TOrdemServicoFiltro;
begin
  Filtro := MontarFiltro;
  try
    RegPorPagina := spnRegPorPagina.Value;
    TotalRegistros := DMOrdemServico.Contar(Filtro);

    FTotalPaginas := RetornarTotalPaginas(TotalRegistros, RegPorPagina);

    spnPaginaAtual.MaxValue := FTotalPaginas;

    if (spnPaginaAtual.Value > FTotalPaginas) then
      spnPaginaAtual.Value := cPaginaPadrao;

    lblTotalPaginas.Caption := 'de ' + IntToStr(FTotalPaginas);
  finally
    Filtro.Free;
  end;
end;

procedure TfListaOrdemServico.AtualizarTotais;
var
  PaginaAtual,
  RegPorPagina: Integer;
  Filtro: TOrdemServicoFiltro;
  Qry: TFDQuery;
begin
  PaginaAtual := spnPaginaAtual.Value;
  RegPorPagina := spnRegPorPagina.Value;

  Filtro := MontarFiltro;
  try
    DMOrdemServico.ObterTotais(Filtro, Qry);

    try
      stbTotais.Panels[0].Text := 'Total de OSs: ' + Qry.FieldByName('TOTAL').AsString;
      stbTotais.Panels[1].Text := 'Abertas: ' + Qry.FieldByName('TOTAL_ABERTAS').AsString;
      stbTotais.Panels[2].Text := 'Em andamento: ' + Qry.FieldByName('TOTAL_ANDAMENTO').AsString;
      stbTotais.Panels[3].Text := 'Concluídas: ' + Qry.FieldByName('TOTAL_CONCLUIDAS').AsString;
      stbTotais.Panels[4].Text := 'Atrasadas: ' + Qry.FieldByName('TOTAL_ATRASADAS').AsString;
    finally
      Qry.Free;
    end;
  finally
    Filtro.Free;
  end;
end;

function TfListaOrdemServico.ObterStatusSelecionados: TArray<TStatusOS>;
var
  Lista: TList<TStatusOS>;
begin
  Result := nil;

  Lista := TList<TStatusOS>.Create;
  try
    if chkStatusAberta.Checked then
      Lista.Add(soAberta);

    if chkStatusEmAndamento.Checked then
      Lista.Add(soEmAndamento);

    if chkStatusConcluida.Checked then
      Lista.Add(soConcluida);

    if chkStatusCancelada.Checked then
      Lista.Add(soCancelada);

    if (Lista.Count = 0) or (Lista.Count = 4) then
      Lista.Clear;

    Result := Lista.ToArray;
  finally
    Lista.Free;
  end;
end;

procedure TfListaOrdemServico.spnPaginaAtualChange(Sender: TObject);
begin
  if (spnPaginaAtual.Value < spnPaginaAtual.MinValue) then
    spnPaginaAtual.Value := spnPaginaAtual.MinValue;

  if (spnPaginaAtual.Value > spnPaginaAtual.MaxValue) then
    spnPaginaAtual.Value := spnPaginaAtual.MaxValue;

  Listar;
end;

procedure TfListaOrdemServico.spnRegPorPaginaChange(Sender: TObject);
begin
  if (spnRegPorPagina.Value < spnRegPorPagina.MinValue) then
    spnRegPorPagina.Value := spnRegPorPagina.MinValue;

  if (spnRegPorPagina.Value > spnRegPorPagina.MaxValue) then
    spnRegPorPagina.Value := spnRegPorPagina.MaxValue;

  spnPaginaAtual.Value := cPaginaPadrao;
  Listar;
end;

end.
