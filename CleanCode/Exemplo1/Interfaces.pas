unit Interfaces;

interface

uses
  System.SysUtils,
  Vcl.StdCtrls;

type
  iCommand = interface
    ['{37986697-DAA3-40E4-B85A-34B5094F82A4}']
    function resolve (aValue : String ) : String; overload;
    function resolve (aValue : TEdit ) : iCommand; overload;
    function &then ( aValue : TFunc<string, string> ) : iCommand;
  end;

implementation

end.
