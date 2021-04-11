program TThread;

uses
  Vcl.Forms,
  thread in 'thread.pas' {Form2},
  uThrread in 'uThrread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
