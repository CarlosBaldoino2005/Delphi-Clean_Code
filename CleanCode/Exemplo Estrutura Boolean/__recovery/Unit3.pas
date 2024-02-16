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
    FTelefone: String;
    procedure SetTelefone(const Value: String);
    function GetTelefone: String;
  public
    { Public declarations }
    function SetarNome1(aValue : String) : Boolean;
    procedure SetarNome2(avalue : String);
    property Telefone : String read FTelefone write FTelefone;
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

function TForm3.GetTelefone: String;
begin
  Result := FTelefone;
end;

procedure TForm3.SetarNome2(avalue: String);
begin
  if aValue = '' then
    raise Exception.Create('Nome não pode ser nulo');

  FNome := aValue;
end;

procedure TForm3.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

end.
