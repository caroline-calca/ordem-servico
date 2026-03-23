unit untClienteFiltro;

interface

uses
  System.SysUtils;

type
  TClienteFiltro = class
  public
    Nome: string;

    function TemNome: Boolean;

    class function PorNome(const ANome: string): TClienteFiltro;
  end;

implementation

function TClienteFiltro.TemNome: Boolean;
begin
  Result := Trim(Nome) <> '';
end;

class function TClienteFiltro.PorNome(const ANome: string): TClienteFiltro;
begin
  Result := TClienteFiltro.Create;
  Result.Nome := ANome;
end;

end.
