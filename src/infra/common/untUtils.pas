unit untUtils;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Forms,
  Vcl.Controls,
  Vcl.ComCtrls,
  Vcl.StdCtrls;

type
  TMsgType = (mtInfo, mtWarn, mtErr, mtQuest);

procedure FormatarValorEdit(Edit: TEdit; RetornaVazio: Boolean = False);
procedure NumbersOnlyValorEdit(Edit: TEdit; var Key: Char);
procedure LimparDateTimePickers(AParent: TWinControl);
function ShowMsg(const Msg: string; MsgType: TMsgType): TModalResult;

implementation

function ShowMsg(const Msg: string; MsgType: TMsgType): TModalResult;
var
  Handle: HWND;
  uType: UINT;
  Title: String;
  Ret: Integer;
begin
  Handle := 0;
  if Assigned(Screen.ActiveForm) then
    Handle := Screen.ActiveForm.Handle;

  uType := MB_OK or MB_ICONINFORMATION;

  case MsgType of
    mtInfo:
      begin
        uType := MB_OK or MB_ICONINFORMATION;
        Title := 'Informação';
      end;

    mtWarn:
      begin
        uType := MB_OK or MB_ICONEXCLAMATION;
        Title := 'Aviso';
      end;

    mtErr:
      begin
        uType := MB_OK or MB_ICONERROR;
        Title := 'Erro';
      end;

    mtQuest:
      begin
        uType := MB_YESNO or MB_ICONQUESTION;
        Title := 'Confirmação';
      end;
  end;

  Ret := MessageBox(Handle, PChar(Msg), PChar(Title), uType);

  case Ret of
    IDOK:  Result := mrOk;
    IDYES: Result := mrYes;
    IDNO:  Result := mrNo;
  else
    Result := mrNone;
  end;

end;

procedure FormatarValorEdit(Edit: TEdit; RetornaVazio: Boolean = False);
var
  V: Double;
begin
  if TryStrToFloat(StringReplace(Edit.Text, '.', EmptyStr, [rfReplaceAll]), V) then
    Edit.Text := FormatFloat('#,##0.00', V)
  else
  begin
    if RetornaVazio then
      Edit.Text := ''
    else
      Edit.Text := '0,00';
  end;
end;

procedure NumbersOnlyValorEdit(Edit: TEdit; var Key: Char);
begin
  if not (Key in ['0'..'9', ',', #8]) then
    Key := #0;

  if (Key = ',') and (Pos(',', Edit.Text) > 0) then
    Key := #0;
end;

procedure LimparDateTimePickers(AParent: TWinControl);
var
  i: Integer;
begin
  for i := 0 to AParent.ControlCount - 1 do
  begin
    if AParent.Controls[i] is TDateTimePicker then
    begin
      with TDateTimePicker(AParent.Controls[i]) do
      begin
        Date := Now;
        Checked := False;
      end;
    end
    else if AParent.Controls[i] is TWinControl then
    begin
      LimparDateTimePickers(TWinControl(AParent.Controls[i]));
    end;
  end;
end;

end.
