unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Command.Functions.Strings;

type
  TForm1 = class(TForm)
    Button1: TButton;
    EditInputZipCode: TEdit;
    Edit2: TEdit;
    Button3: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Command;

{$R *.dfm}





procedure TForm1.Button1Click(Sender: TObject);
var
  vText : PChar;
  vRetorno : String;
begin

  vText := PChar(Edit1.Text);
  while (vText^ <> #0) do
  begin
    if CharInSet(vText^, ['0'..'9']) then
      vRetorno := vRetorno + vText^;

    Inc(vText);
  end;

  if Length(vRetorno) <> 8 then
    raise Exception.Create('Entrada Inv�lida');


  Edit1.Text := Copy(vRetorno, 1, 2) + '.' + Copy(vRetorno, 3, 3) + '-' + Copy(vRetorno, 6, 3);
end;
























procedure TForm1.Button3Click(Sender: TObject);
begin
  TCommand
    .New
      .&then(removeLettersAndSpecialCharacters)
      .&then(validateZipCode)
    .resolve(EditInputZipCode);
end;

end.
