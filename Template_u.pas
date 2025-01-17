unit Template_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  arrSort = array[1..50] of integer;
  tAuxMethods = class
    private

    public
    procedure ReadFile(pFileName : string);
    function Partition(l, r : integer; var arr : arrsort) : integer;
    procedure SwapInt(var a, b : integer);
    procedure SwapString(var a, b : string);
    procedure Quicksort(var arr : Arrsort; l, r : integer);


  end;

var
  objClass1 : tAuxmethods;

implementation

{ tAuxMethods }

function tAuxMethods.Partition(l, r: integer; var arr: arrsort): integer;
var
  i, j, iPivot : integer;
begin
  iPivot := arr[r];
  i := l - 1;
  for j := l to r - 1 do
    begin
      if arr[j] < iPivot then
        begin
          inc(i);
          Swap(arr[i], arr[j]);

        end;
    end;
    swap(arr[i + 1], arr[r]);
    Result := i + 1; // index of newly placed pivot

end;

procedure tAuxMethods.Quicksort(var arr: Arrsort; l, r: integer);
  var	pi : integer;         // partition index
begin
		if (l < r) then
			begin
				pi := Partition(arr, l, r);
				Quicksort(arr, l, pi - 1);
				Quicksort(arr, pi + 1, r);
			end;
end;

procedure tAuxMethods.ReadFile(pFileName: string);
var
  sLine : string;
  tFile : textfile;
begin
  if fileexists(pFileName + '.txt') = false then
    begin
      MessageDLG('File does not exist.', mtError, mbOKCancel, 0);
      exit;
    end;

  Assignfile(tFile, pFileName + '.txt');
  reset(tfile);

  while NOT EOF(tFile) do
    begin
      readln(sLine);
    end;

  Closefile(tFile);

end;

procedure tAuxMethods.SwapInt(var a, b: integer);
var
  c : integer;
begin
  c := a;
  a := b;
  b := c;
end;

procedure tAuxMethods.SwapString(var a, b: string);
var
  c : string;
begin
  c := a;
  a := b;
  b := c;
end;

end.
