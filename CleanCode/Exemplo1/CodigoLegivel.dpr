program CodigoLegivel;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {Form1},
  Command in 'Command.pas',
  Interfaces in 'Interfaces.pas',
  Command.Functions.Strings in 'Command.Functions.Strings.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.