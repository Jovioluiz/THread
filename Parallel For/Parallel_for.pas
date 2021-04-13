unit Parallel_for;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.SyncObjs, System.Threading;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Memo2: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  FSession: TCriticalSection;
begin
  FSession := TCriticalSection.Create;

  TThread.CreateAnonymousThread(
    procedure
    begin
      FSession.Enter;     //semaforo
      try
        TThread.Sleep(1000);
        TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
          Memo1.Lines.Add('Teste thread 1');
        end);

      finally
        FSession.Leave;
      end;

    end).Start;

    TThread.CreateAnonymousThread(
    procedure
    begin
      FSession.Enter;
      try
        TThread.Sleep(10000);
        TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
          Memo1.Lines.Add('Teste thread 2');
        end);

      finally
        FSession.Leave;
      end;

    end).Start;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Memo2.Lines.Clear;
  TTask.Run(
    procedure
    begin
       TParallel.For(0,9,
        procedure(Index: Integer)
        begin
          sleep(100);
          TThread.Queue(TThread.CurrentThread,
          procedure
          begin
            Memo2.Lines.Add(Index.ToString);
          end);
        end);
    end);
end;

end.
