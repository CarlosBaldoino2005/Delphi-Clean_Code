unit Command;

interface

uses
  Interfaces,
  System.SysUtils,
  System.Generics.Collections, Vcl.StdCtrls;

type
  TCommand = class(TInterfacedObject, iCommand)
    private
      FListCommandsString : TList<TFunc<String, String>>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iCommand;
      function resolve (aValue : String ) : String; overload;
      function resolve (aValue : TEdit ) : iCommand; overload;
      function &then ( aValue : TFunc<string, string> ) : iCommand;
  end;

implementation

uses
  System.Classes;

{ TCommand }

function TCommand.&then(aValue: TFunc<string, string>): iCommand;
begin
  Result := Self;
  FListCommandsString.Add(aValue);
end;

constructor TCommand.Create;
begin
  FListCommandsString := TList<TFunc<String, String>>.Create;
end;

destructor TCommand.Destroy;
begin
  FListCommandsString.Free;
  inherited;
end;

class function TCommand.New: iCommand;
begin
  Result := Self.Create;
end;

function TCommand.resolve(aValue: TEdit): iCommand;
var
  I: Integer;
begin
  Result := Self;

  for I := 0 to Pred(FListCommandsString.Count) do
    aValue.Text := FListCommandsString[I](aValue.Text);

end;

function TCommand.resolve(aValue: String): String;
var
  I: Integer;
begin
  for I := 0 to Pred(FListCommandsString.Count) do
    aValue := FListCommandsString[I](aValue);

  Result := aValue;
end;

end.
