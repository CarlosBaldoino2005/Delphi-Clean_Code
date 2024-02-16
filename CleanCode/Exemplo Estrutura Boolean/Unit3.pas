unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FNome : String;
  public
    { Public declarations }
    function SetarNome1(aValue : String) : Boolean;
    procedure SetarNome2(avalue : String);
  end;

var
  Form3: TForm3;

implementation

uses
  Vcl.Dialogs;

{$R *.dfm}







procedure TForm3.Button1Click(Sender: TObject);
begin
  if not SetarNome1(Edit1.Text) then
    MessageDlg('Nome não pode ser Nulo', mtError, [mbOk], 0);
end;

















function TForm3.SetarNome1(aValue: String): Boolean;
begin
  Result := True;

  if aValue = '' then
    Result := False;

  FNome := avalue;
end;












procedure TForm3.Button2Click(Sender: TObject);
begin
  SetarNome2(Edit1.Text);
end;


function TForm3.Dividir(aValue1, aValue2: Double): Double;
begin
  Result := 0;

  if aValue2 > 0 then
    Result := aValue1 / aValue2;
end;

function TForm3.NomeProduto(aId: Integer): String;
begin
  Result := 'Produto Inválido';

  if aId > 0 then
    Result := 'Produto ' + IntToStr(aId);
end;

procedure TForm3.SetarNome2(avalue: String);
begin
  if aValue = '' then
    raise Exception.Create('Nome não pode ser nulo');

  FNome := aValue;
end;

end.
