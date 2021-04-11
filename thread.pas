unit thread;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uThrread;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    memo: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    procedure escreverArquivoDeTexto(const dirArquivo: string; linhasAImprimir: integer);
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
  oArquivoTextoInThread1,
  oArquivoTextoInThread2,
  oArquivoTextoInThread3: TArquivoTextoThread;
begin
//  escreverArquivoDeTexto(ExtractFileDir(ParamStr(0)), 1500);
//  escreverArquivoDeTexto(ExtractFileDir(ParamStr(0)), 1200);
//  escreverArquivoDeTexto(ExtractFileDir(ParamStr(0)), 1400);
  oArquivoTextoInThread1 := TArquivoTextoThread.Create(False, 10500, ExtractFilePath(ParamStr(0)));
  oArquivoTextoInThread2 := TArquivoTextoThread.Create(false, 10200, ExtractFilePath(ParamStr(0)));
  oArquivoTextoInThread3 := TArquivoTextoThread.Create(false, 10400, ExtractFilePath(ParamStr(0)));
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  TThread.CreateAnonymousThread(
    procedure
    begin
      TThread.Sleep(5000);
      TThread.Synchronize(TThread.CurrentThread,
      procedure
      begin
        memo.Lines.Add('Arquivo Escrito');
      end);
    end).Start;
end;

procedure TForm2.escreverArquivoDeTexto(const dirArquivo: string; linhasAImprimir: integer);
var
  linhasArquivoTexto : TStringList;
  I: Integer;
begin
  linhasArquivoTexto := TStringList.Create;
  try
    for I := 1 to linhasAImprimir do
    begin
      linhasArquivoTexto.Add(format('Linha numero %d',[i]) + '-' + FormatDateTime('hh-mm-ss-zzz',Now));
      Sleep(1);
    end;
    linhasArquivoTexto.SaveToFile(Format('%s\%s_total_linhas_%d.txt',[dirArquivo,FormatDateTime('hh-mm-ss-zzz',Now),linhasAImprimir]));
  finally
    linhasArquivoTexto.Free;
  end;
end;

end.
