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
  Vcl.ExtCtrls;

type
  TfMain = class(TForm)
    pnlMain: TPanel;
    mmMain: TMainMenu;
    Cadastros1: TMenuItem;
    mnClientes: TMenuItem;
    mnItens: TMenuItem;
    N1: TMenuItem;
    mnOrdensServico: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

end.
