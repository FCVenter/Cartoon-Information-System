unit frm_PAT_Admin_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Math, Vcl.ComCtrls;
const
  Max = 18;
type
    arrsort = array[1..Max] of integer;
    arrsortnames = array[1..Max ] of string;
    TfrmAdmin = class(TForm)
    btnBack: TButton;
    lblUsers: TLabel;
    lblElement: TLabel;
    lblCharacter: TLabel;
    lblBonus: TLabel;
    lblGender: TLabel;
    procedure btnBackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    ArrVisits : arrsort;  // Parallel arays which are used to calculate the amount of visits per character
    ArrNames : arrsortnames;    // these arrays are sorted with a quicsort algorithm in frmAdmin, which is then displayed to the admin
    procedure Swap(var A, B: integer);
    procedure Quicksort(var arr : Arrsort;var arr2 : arrsortnames; l, r : integer);
    function Partition(var arr: Arrsort;var arr2 : arrsortnames; l, r: integer): integer;
    procedure Swap2(var A, B: string);
    function isBiggest(A, B, C, D : integer) : boolean;

  end;

var
  frmAdmin: TfrmAdmin;

implementation

{$R *.dfm}

uses frmPAT_u;

procedure TfrmAdmin.btnBackClick(Sender: TObject);
begin
  frmLogin.Show;
  frmAdmin.Hide;
end;

procedure TfrmAdmin.FormActivate(Sender: TObject);
var
   rPercFemale, rPercmale, rPercOther : real;
   sCaption, sNames, sVisits, sElement, sCharacter : string;
   K: Integer;
begin
  try
  sElement := '';
  sCaption := '';
  sNames := '';
  sVisits := '';
  sCharacter := ''; 
  rPercFemale :=  0;
  rPercMale :=  0;
  rPercOther :=  0;
  
    if NOT((frmLogin.iFemale = 0) AND (frmLogin.iMale = 0) AND (frmLogin.iOther = 0)) then
    begin
      rPercFemale :=  (frmLogin.iFemale / frmLogin.iTotalGender) * 100;
      rPercMale :=  (frmLogin.iMale / frmLogin.iTotalGender) * 100;
      rPercOther :=  (frmLogin.iOther / frmLogin.iTotalGender) * 100;
      sCaption := '% Female: ' + floattostrf(rPercFemale, ffNumber, 10, 0) +  #13 + '% Male: ' +
      floattostrf(rPercMale, ffNumber, 10, 0) + #13 + '% Other: ' + floattostrf(rPercOther, ffNumber, 10, 0);

    end;
  lblGender.Caption := sCaption;



    if isBiggest(frmLogin.iWater, frmLogin.iFire, frmLogin.iAir, frmLogin.iEarth)  then
       sElement := 'Water'
       else if isBiggest(frmLogin.iFire, frmLogin.iWater, frmLogin.iAir, frmLogin.iEarth) then
          sElement := 'Fire'
          else  if isBiggest(frmLogin.iAir, frmLogin.iFire, frmLogin.iWater, frmLogin.iEarth) then
            sElement := 'Air'
            else if isBiggest(frmLogin.iEarth, frmLogin.iFire, frmLogin.iAir, frmLogin.iWater)  then
              sElement := 'Earth';

  Quicksort(ArrVisits, ArrNames, 1, 18);


  if ArrVisits[18] <> 0 then
    sCharacter := ArrNames[18];
  
  
  lblCharacter.Caption := 'Most visited character today: ' + sCharacter;
  lblUsers.Caption := 'Users logged in today: ' + inttostr(frmLogin.iTotalLogins);
  lblBonus.Caption := 'Users who have watched ATLA: ' + inttostr(frmLogin.iTotalWatched);
  lblElement.Caption := 'Most visited element today: ' + sElement;

  except
    Messagedlg('Oops! Something went wrong :(', mtError, mbYesNo, 0);
  end;
end;

procedure TfrmAdmin.FormCreate(Sender: TObject);
var
  k : integer;
begin




  arrNames[1] := 'Katara';
  arrNames[2] := 'Aang';
  arrNames[3] :='Korra';
  arrNames[4] := 'Noatak';
  arrNames[5] := 'Yakone';
  arrNames[6] :='Hama';
  arrNames[7] := 'Zuko';
  arrNames[8] := 'Iroh';
  arrNames[9] := 'Ozai';
  arrNames[10] := 'Azula';
  arrNames[11] := 'Toph';
  arrNames[12] :='Bumi1';
  arrNames[13] := 'Kuvira';
  arrNames[14] := 'Kyoshi';
  arrNames[15] := 'Zaheer';
  arrNames[16] := 'Jinora';
  arrNames[17] :='Bumi2';
  arrNames[18] :='Tenzin' ;

  for k := 1 to 18 do
    arrVisits[k] := 0;

  BorderStyle := bsNone;
  WindowState := wsMaximized;
  frmAdmin.Top := 0;
  frmAdmin.Left := 0;
  frmAdmin.Height := screen.Height;
  frmAdmin.Width := screen.Width;
  frmAdmin.Color := clBlack;
  btnBack.Width := 100;
  btnBack.Height := 50;
  btnBack.Top := 0;
  btnBack.Left := screen.Width - btnBack.Width;

  lblUsers.Font.Color := clWhite;
  lblElement.Font.Color := clWhite;
  lblCharacter.Font.Color := clWhite;
  lblBonus.Font.Color := clWhite;
  lblGender.Font.Color := clWhite;

  lblUsers.Font.Size := 35;
  lblElement.Font.Size := 35;
  lblCharacter.Font.Size := 35;
  lblBonus.Font.Size := 35;
  lblGender.Font.Size := 35;

  lblUsers.Caption := 'Users logged in today: ';
  lblBonus.Caption := 'Users who have watched ATLA: ';
  lblElement.Caption := 'Most visited element today: ';
  lblCharacter.Caption := 'Most visited character today: ';



  lblUsers.Font.Name := 'Bookman Old Style';
  lblElement.Font.Name := 'Bookman Old Style';
  lblCharacter.Font.Name := 'Bookman Old Style';
  lblBonus.Font.Name := 'Bookman Old Style';
  lblGender.Font.Name := 'Bookman Old Style';

  lblUsers.Top := 50;
  lblBonus.Top := lblUsers.Top + 100;
  lblElement.Top := lblBonus.Top + 100;
  lblCharacter.Top := lblElement.Top + 100;
  lblGender.Top := lblCharacter.Top + 100;


  lblUsers.Left := 20;
  lblElement.Left := 20;
  lblCharacter.Left := 20;
  lblBonus.Left := 20;
  lblGender.Left := 615;

end;

function TfrmAdmin.isBiggest(A, B, C, D: integer): boolean;
begin
  result := false;
  if (A > B) AND (A > C) AND (A > D) then
    result := true;
end;

procedure TfrmAdmin.Swap(var A, B: integer);
var
  Temp : integer;
begin
  Temp := A;
  A := B;
  B := Temp;
end;

procedure TfrmAdmin.Swap2(var A, B: string);
var
  Temp : string;
begin
  Temp := A;
  A := B;
  B := Temp;

end;

procedure TfrmAdmin.Quicksort(var arr : Arrsort;var arr2 : arrsortnames; l, r : integer);
var	pi : integer;         // partition index
begin
		if (l < r) then
			begin
				pi := Partition(arr, arr2, l, r);
				Quicksort(arr, arr2, l, pi - 1);
				Quicksort(arr, arr2,  pi + 1, r);
			end;

end;



function TfrmAdmin.Partition(var arr: Arrsort;var arr2 : arrsortnames; l, r: integer): integer;
var
  iPivot, i, j : integer;
begin
  iPivot := arr[r];
  i := l - 1;
  for j := l to r - 1 do
    begin
      if arr[j] < iPivot then
        begin
          inc(i);
          Swap(arr[i], arr[j]);
          Swap2(arr2[i], arr2[j]);

        end;
    end;
    swap(arr[i + 1], arr[r]);
    swap2(arr2[i + 1], arr2[r]);


    Result := i + 1; // index of newly placed pivot
end;


end.
