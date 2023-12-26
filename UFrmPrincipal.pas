unit UFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, DateUtils, ClipBrd;

type
  TFrmGerarSenha = class(TForm)
    edtSenha: TEdit;
    btnGerar: TButton;
    procedure btnGerarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GerarSenha: string;
  end;

var
  FrmGerarSenha: TFrmGerarSenha;

implementation

{$R *.dfm}

procedure TFrmGerarSenha.btnGerarClick(Sender: TObject);
begin
  edtSenha.Text := GerarSenha;
end;

procedure TFrmGerarSenha.FormCreate(Sender: TObject);
begin
  btnGerarClick(Self);
  Clipboard.AsText := edtSenha.Text;
end;

function TFrmGerarSenha.GerarSenha: string;
var
  Senha, Aux: string;
  Soma: Integer;
  Data: TDateTime;
begin
  Data := Now;

  Soma := 0;
  //Texto padrão
  Senha := 'VIASOFTGP';
  //Soma do dia+mês atual. Ex: 16/11/2020 = 27
  Senha := Senha + FormatFloat('00', DayOf(Data) + MonthOf(Data));
  //Numero da hora atual. Ex: 08:42:35 = 08
  Senha := Senha + FormatFloat('00', HourOf(Data));
  Aux := FormatFloat('00', DayOf(Data) + MonthOf(Data));
  //Soma dos algarismos da soma do dia+mês. Ex: 16/11/2020 = 27 = 2+7 = 09
  Soma := StrToInt(Copy(Aux, 1, 1)) + StrToInt(Copy(Aux, 2, 1));
  Senha := Senha + FormatFloat('00', Soma);

  Result := Senha;
end;

end.
