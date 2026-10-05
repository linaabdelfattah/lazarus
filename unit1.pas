unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TEditNumero }

  TEditNumero = class(TForm)
    ButtonNuova: TButton;
    ButtonProva: TButton;
    EditNumero: TEdit;
    Label1: TLabel;
    LabelRisposta: TLabel;
    procedure ButtonNuovaClick(Sender: TObject);
    procedure ButtonProvaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  EditNumero: TEditNumero;
    segreto: Integer;     // il numero pensato dal computer
  tentativi: Integer;   // quante prove hai fatto

implementation

{$R *.lfm}

{ TEditNumero }

procedure TEditNumero.FormCreate(Sender: TObject);
begin
    Randomize;                     // mescola i numeri a caso
  segreto := Random(100) + 1;    // un numero da 1 a 100
  tentativi := 0;
end;

procedure TEditNumero.ButtonProvaClick(Sender: TObject);
var
  numero: Integer;
begin
  numero := StrToInt(EditNumero.Text);
  tentativi := tentativi + 1;
  if numero = segreto then
    begin
      LabelRisposta.Caption := 'BOOM! Beccato in ' + IntToStr(tentativi);
    end
  else
    begin
      if numero < segreto then
        begin
          LabelRisposta.Caption := 'Troppo piccolo! Spara più in alto ️';
        end
      else
        begin
          LabelRisposta.Caption := 'Troppo in alto! Vai più giù ';
        end;
    end;
  EditNumero.Clear;
end;

procedure TEditNumero.ButtonNuovaClick(Sender: TObject);
begin
  segreto := Random(100) + 1;
  tentativi := 0;
  LabelRisposta.Caption := 'Partita riavviata! Nuova sfida, nuovo numero';
end;

end.

