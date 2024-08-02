unit frm_PAT_Water_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, GIFImg, jpeg, pngimage,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmWater = class(TForm)
    btnBack: TButton;
    tWater: TImage;
    lstWater: TListBox;
    tKorraW: TImage;
    tAmon: TImage;
    tAangW: TImage;
    tYakone: TImage;
    tKatara: TImage;
    tHama: TImage;
    tSymbol: TImage;
    btnDisplay: TButton;
    dbgWater: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tKorraWClick(Sender: TObject);
    procedure btnDisplayClick(Sender: TObject);
    procedure tAangWClick(Sender: TObject);
    procedure tAmonClick(Sender: TObject);
    procedure tYakoneClick(Sender: TObject);
    procedure tHamaClick(Sender: TObject);
    procedure tKataraClick(Sender: TObject);
    procedure tSymbolClick(Sender: TObject);
  private
    sName : string;
    iPos : integer;
  public
    { Public declarations }
  end;

var
  frmWater: TfrmWater;

implementation

{$R *.dfm}

uses frmPAT_u, frm_PAT_Admin_u;

procedure TfrmWater.btnBackClick(Sender: TObject);
begin
  (tWater.Picture.Graphic as TGIFImage).Animate := False;
  frmLogin.Show;
  frmWater.Hide;

end;

procedure TfrmWater.btnDisplayClick(Sender: TObject);
begin
  try
  dbgWater.Hide;
  frmLogin.tblCharacters.Open;
  frmLogin.tblCharacters.First;

  lstWater.Items.Clear;

  while NOT (frmLogin.tblCharacters.Eof) do
    Begin
      if frmLogin.tblCharacters['Name'] = sName then
        begin
          lstwater.Items.Add('Name: ' + frmLogin.tblCharacters['Name']);
          lstwater.Items.Add('Bending: ' + frmLogin.tblCharacters['Bending']);
          lstwater.Items.Add('Sub-bending styles: ' + frmLogin.tblCharacters['Sub-bending styles']);
          lstwater.Items.Add('Love interests: ' + frmLogin.tblCharacters['Love interests']);
          lstwater.Items.Add('Alias: ' + frmLogin.tblCharacters['Alias']);
          lstwater.Items.Add('Nationality: ' + frmLogin.tblCharacters['Nationality']);
          lstwater.Items.Add('Age: ' + inttostr(frmLogin.tblCharacters['Age']));
          lstwater.Items.Add('Gender: ' + frmLogin.tblCharacters['Gender']);
          lstwater.Items.Add('Eye Colour: ' + frmLogin.tblCharacters['Eye Colour']);
          lstwater.Items.Add('Hair Colour: ' + frmLogin.tblCharacters['Hair Colour']);
          lstwater.Items.Add('Skin Color: ' + frmLogin.tblCharacters['Skin Color']);
          lstwater.Items.Add('Weapon of choice: ' + frmLogin.tblCharacters['Weapon of choice']);
          lstwater.Items.Add('Profession: ' + frmLogin.tblCharacters['Profession']);
        end;
      frmLogin.tblCharacters.Next;
    End;

   frmLogin.tblCharacters.Close;
  except
    Messagedlg('Oops! Something went wrong :(', mtError, mbYesNo, 0);
  end;
end;

procedure TfrmWater.FormActivate(Sender: TObject);
begin
  (tWater.Picture.Graphic as TGIFImage).Animate := True;

end;

procedure TfrmWater.FormCreate(Sender: TObject);
var iRight : integer;
begin


  btnDisplay.Hide;

  sName := '';
  BorderStyle := bsNone;
  WindowState := wsMaximized;
  frmWater.Top := 0;
  frmWater.Left := 0;
  frmWater.Height := screen.Height;
  frmWater.Width := screen.Width;
  frmWater.Color := clBlack;


  tWater.Height := 500;
  tWater.Height:= screen.Height;
  tWater.Width := 400;
  iRight := screen.Width - tWater.Width;
  tWater.Top := 0;
  tWater.Left := iRight;
  tWater.Stretch := True;
  lstWater.Height := 200;
  lstWater.Width := screen.Width - tWater.Width;
  lstWater.Top := 0;
  lstWater.Left := 0;
  lstWater.Font.Size := 20;

  dbgWater.Hide;
  dbgWater.Left := 0;
  dbgWater.Top := 0;
  dbgWater.Width := screen.Width - tWater.Width;
  dbgWater.Height := 200;
  dbgWater.Font.Size := 20;

  tAangW.Stretch := True;
  tKorraW.Stretch := True;
  tHama.Stretch := True;
  tKatara.Stretch := True;
  tYakone.Stretch := True;
  tAmon.Stretch := True;

  tAangW.Width := 130;
  tKorraW.Width := 130;
  tHama.Width := 130;
  tKatara.Width := 130;
  tYakone.Width := 130;
  tAmon.Width := 130;

  tAangW.Height := 130;
  tKorraW.Height := 130;
  tHama.Height := 130;
  tKatara.Height := 130;
  tYakone.Height := 130;
  tAmon.Height := 130;

  tAangW.Left := 400;
  tKorraW.Left := 400;
  tHama.Left := 710;
  tKatara.Left := 400;
  tYakone.Left := 710;
  tAmon.Left := 710;

  tAangW.Top := 230;
  tKorraW.Top := tAangW.Top + 180;
  tHama.Top := tAangW.Top;
  tKatara.Top := tKorraW.Top + 180;
  tYakone.Top := tKorraW.Top + 180;
  tAmon.Top := tAangW.Top + 180;

  tSymbol.Stretch := True;
  tSymbol.Width := 300;
  tSymbol.Height := 300;
  tSymbol.Top := 300;
  tSymbol.Left := 50;

  iPos := 0;

end;

procedure TfrmWater.tAangWClick(Sender: TObject);
begin
  sName := 'Aang';
  btnDisplay.Click;

  iPos := frmLogin.ArrayIndex(frmAdmin.ArrNames, sName);
  inc(frmAdmin.arrVisits[iPos]);

end;

procedure TfrmWater.tAmonClick(Sender: TObject);
begin
  sName := 'Noatak';
  btnDisplay.Click;
  iPos := frmLogin.ArrayIndex(frmAdmin.ArrNames, sName);
  inc(frmAdmin.arrVisits[iPos]);
end;

procedure TfrmWater.tHamaClick(Sender: TObject);
begin
  sName := 'Hama';
  btnDisplay.Click;
  iPos := frmLogin.ArrayIndex(frmAdmin.ArrNames, sName);
  inc(frmAdmin.arrVisits[iPos]);
end;

procedure TfrmWater.tKataraClick(Sender: TObject);
begin
  sName := 'Katara';
  btnDisplay.Click;
  iPos := frmLogin.ArrayIndex(frmAdmin.ArrNames, sName);
  inc(frmAdmin.arrVisits[iPos]);
end;

procedure TfrmWater.tKorraWClick(Sender: TObject);
begin
  sName := 'Korra';
  btnDisplay.Click;
  iPos := frmLogin.ArrayIndex(frmAdmin.ArrNames, sName);
  inc(frmAdmin.arrVisits[iPos]);
end;



procedure TfrmWater.tSymbolClick(Sender: TObject);
begin
  dbgWater.Show;
  frmLogin.qryCharacters.Active := false;
  frmLogin.qryCharacters.SQL.Clear;
  frmLogin.qryCharacters.SQL.Text := 'SELECT Name FROM Characters WHERE (Element = ''Water'') ORDER BY Name';
  frmLogin.qryCharacters.Active := true;
  frmLogin.qryCharacters.Open;
end;

procedure TfrmWater.tYakoneClick(Sender: TObject);
begin
  sName := 'Yakone';
  btnDisplay.Click;
  iPos := frmLogin.ArrayIndex(frmAdmin.ArrNames, sName);
  inc(frmAdmin.arrVisits[iPos]);
end;

end.
