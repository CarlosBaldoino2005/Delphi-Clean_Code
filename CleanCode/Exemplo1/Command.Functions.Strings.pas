unit Command.Functions.Strings;

interface

function removeLettersAndSpecialCharacters ( aValue : String ) : String;
function validateZipCode ( aValue : String ) : String;

implementation

uses
  System.SysUtils;

function removeLettersAndSpecialCharacters ( aValue : String ) : String;
var
  vText : PChar;
  vRetorno : String;
begin
  vText := PChar(aValue);
  while (vText^ <> #0) do
  begin
    if CharInSet(vText^, ['0'..'9']) then
      vRetorno := vRetorno + vText^;

    Inc(vText);
  end;
  Result := vRetorno;
end;

function validateZipCode ( aValue : String ) : String;
begin
  if Length(aValue) <> 8 then
    raise Exception.Create('Entrada Inválida');

  Result := Format('%s.%s-%s', [Copy(aValue, 1, 2), Copy(aValue, 3, 3), Copy(aValue, 6, 3)]);
end;

end.
