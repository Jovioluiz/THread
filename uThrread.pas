unit uThrread;

interface

uses
  System.Classes;

type
  TArquivoTextoThread = class(TThread)
  private
    FLinhasAImprimir: integer;
    FDirArquivo: String;
    procedure escreverArquivoDeTexto();
    function gerarNomeArquivo():string;
  protected
    procedure Execute; override;
  public
    constructor Create (const CreateSuspended : boolean; const linhasAImprimir : integer; const dirArquivo : string);

end;

implementation

uses
  System.SysUtils;

{ 
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);  

  and UpdateCaption could look like,

    procedure uTArquivoTextoThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; 
    
    or 
    
    Synchronize(
      procedure 
      begin
        Form1.Caption := 'Updated in thread via an anonymous method' 
      end
      )
    );
    
  where an anonymous method is passed.
  
  Similarly, the developer can call the Queue method with similar parameters as 
  above, instead passing another TThread class as the first parameter, putting
  the calling thread in a queue with the other thread.
    
}

{ uTArquivoTextoThread }

function TArquivoTextoThread.gerarNomeArquivo: string;
begin
  Result := Format('%s\%s_total_linhas_%d.txt', [Self.FDirArquivo, FormatDateTime('hh-mm-ss-zzz', Now), self.FLinhasAImprimir]);
end;

constructor TArquivoTextoThread.Create(const CreateSuspended: boolean; const linhasAImprimir: integer; const dirArquivo: string);
begin
  FLinhasAImprimir := linhasAImprimir;
  FDirArquivo := dirArquivo;
  FreeOnTerminate := True;
  inherited Create(CreateSuspended);
end;

procedure TArquivoTextoThread.escreverArquivoDeTexto;
var
  linhasArquivoTexto: TStringList;
  I: Integer;
begin
  linhasArquivoTexto := TStringList.Create;
  try
    for I := 1 to Self.FLinhasAImprimir do
    begin
      linhasArquivoTexto.Add(format('Linha numero %d',[i]));
      Sleep(1);
    end;
    linhasArquivoTexto.SaveToFile(Self.gerarNomeArquivo());
  finally
    linhasArquivoTexto.Free;
  end;
end;

procedure TArquivoTextoThread.Execute;
begin
  NameThreadForDebugging('TArquivoTextoThread');
  escreverArquivoDeTexto;
end;

end.
