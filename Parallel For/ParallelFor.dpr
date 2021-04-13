program ParallelFor;

uses
  Vcl.Forms,
  Parallel_for in 'Parallel_for.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
