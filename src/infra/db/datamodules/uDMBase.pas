unit uDMBase;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Comp.Client,
  untConnectionManager;

type
  TDMBase = class(TDataModule)
  private
    FExternalConnection: TFDConnection;
    function GetConnection: TFDConnection;
  public
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; AConnection: TFDConnection); reintroduce; overload;

    property Connection: TFDConnection read GetConnection;

    procedure StartTransaction;
    procedure Commit;
    procedure Rollback;
  end;

var
  DMBase: TDMBase;

implementation

{$R *.dfm}

{ TdmBase }

constructor TdmBase.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FExternalConnection := nil;
end;

constructor TdmBase.Create(AOwner: TComponent; AConnection: TFDConnection);
begin
  inherited Create(AOwner);
  FExternalConnection := AConnection;
end;

function TdmBase.GetConnection: TFDConnection;
begin
  if Assigned(FExternalConnection) then
    Result := FExternalConnection
  else
    Result := FConnectionManager.Connection;
end;

procedure TdmBase.StartTransaction;
begin
  if not Connection.InTransaction then
    Connection.StartTransaction;
end;

procedure TdmBase.Commit;
begin
  if Connection.InTransaction then
    Connection.Commit;
end;

procedure TdmBase.Rollback;
begin
  if Connection.InTransaction then
    Connection.Rollback;
end;

end.
