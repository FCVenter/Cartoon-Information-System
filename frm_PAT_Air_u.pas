unit frm_PAT_Air_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.GIFImg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmAir = class(TForm)
    btnBack: TButton;
    tAir: TImage;
    lstAir: TListBox;
    tZaheer: TImage;
    tJinora: TImage;
    tTenzin: TImage;
    tBumi: TImage;
    tKorraA: TImage;
    tAangA: TImage;
    tSymbol: TImage;
    btnDisplay: TButton;
    dbgAir: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tAangAClick(Sender: TObject);
    procedure tKorraAClick(Sender: TObject);
    procedure tZaheerClick(Sender: TObject);
    procedure tBumiClick(Sender: TObject);
    procedure tTenzinClick(Sender: TObject);
    procedure tJinoraClick(Sender: TObject);
    procedure btnDisplayClick(Sender: TObject);
    procedure tSymbolClick(Sender: TObject);
  private
    sName : string;
    iPos : integer;
  public
    { Public declarations }
  end;

var
  frmAir: TfrmAir;

implementation

{$R *.dfm}

uses frmPAT_u, frm_PAT_Admin_u;

procedure TfrmAir.btnBackClick(Sender: TObject);
begin
  (tAir.Picture.Graphic as TGIFImage).Animate := False;
  frmLogin.Show;
  frmAir.Hide;
end;

procedure TfrmAir.btnDisplayClick(Sender: TObject);
begin
  try
  dbgAir.Hide;
  frmLogin.tblCharacters.Open;
  frmLogin.tblCharacters.First;

  lstAir.Items.Clear;

  while NOT frmLogin.tblCharacters.Eof do
    Begin
      if frmLogin.tblCharacters['Name'] = sName then
        begin
          lstAir.Items.Add('Name: ' + frmLogin.tblCharacters['Name']);
          lstAir.Items.Add('Bending: ' + frmLogin.tblCharacters['Bending']);
          lstAir.Items.Add('Sub-bending styles: ' + frmLogin.tblCharacters['Sub-bending styles']);
          lstAir.Items.Add('Love interests: ' + frmLogin.tblCharacters['Love interests']);
          lstAir.Items.Add('Alias: ' + frmLogin.tblCharacters['Alias']);
          lstAir.Items.Add('Nationality: ' + frmLogin.tblCharacters['Nationality']);
          lstAir.Items.Add('Age: ' + inttostr(frmLogin.tblCharacters['Age']));
          lstAir.Items.Add('Gender: ' + frmLogin.tblCharacters['Gender']);
          lstAir.Items.Add('Eye Colour: ' + frmLogin.tblCharacters['Eye Colour']);
          lstAir.Items.Add('Hair Colour: ' + frmLogin.tblCharacters['Hair Colour']);
          lstAir.Items.Add('Skin Color: ' + frmLogin.tblCharacters['Skin Color']);
          lstAir.Items.Add('Weapon of choice: ' + frmLogin.tblCharacters['Weapon of choice']);
          lstAir.Items.Add('Profession: ' + frmLogin.tblCharacters['Profession']);
        end;
      frmLogin.tblCharacters.Next;
    End;

   frmLogin.tblCharacters.Close;
  except
    Messagedlg('Oops! Something went wrong :(', mtError, mbYesNo, 0);
  end;
end;

procedure TfrmAir.FormActivate(Sender: TObject);
begin
  (tAir.Picture.Graphic as TGIFImage).Animate := True;

end;

procedure TfrmAir.FormCreate(Sender: TObject);
var
  iRight : integer;
begin
  btnDisplay.Hide;
  sName := '';
  BorderStyle := bsNone;
  WindowState := wsMaximized;
  frmAir.Top := 0;
  frmAir.Left := 0;
  frmAir.Height := screen.Height;
  frmAir.Width := screen.Width;
  frmAir.Color := clBlack;

  tAir.Height := 500;
  tAir.Height:= screen.Height;
  tAir.Width := 400;
  iRight := screen.Width - tAir.Width;
  tAir.Top := 0;
  tAir.Left := iRight;
  tAir.Stretch := True;
  lstAir.Height := 200;
  lstAir.Width := screen.Width - tAir.Width;
  lstAir.Top := 0;
  lstAir.Left := 0;
  lstAir.Font.Size := 20;

  dbgAir.Hide;
  dbgAir.Left := 0;
  dbgAir.Top := 0;
  dbgAir.Width := screen.Width - tAir.Width;
  dbgAir.Height := 200;
  dbgAir.Font.Size := 20;

  tAangA.Stretch := True;
  tKorraA.Stretch := True;
  tBumi.Stretch := True;
  tTenzin.Stretch := True;
  tJinora.Stretch := True;
  tZaheer.Stretch := True;

  tAangA.Width := 130;
  tKorraA.Width := 130;
  tBumi.Width := 130;
  tTenzin.Width := 130;
  tJinora.Width := 130;
  tZaheer.Width := 130;

  tAangA.Height := 130;
  tKorraA.Height := 130;
  tBumi.Height := 130;
  tTenzin.Height := 130;
  tJinora.Height := 130;
  tZaheer.Height := 130;

  tAangA.Left := 400;
  tKorraA.Left := 400;
  tBumi.Left := 710;
  tTenzin.Left := 400;
  tJinora.Left := 710;
  tZaheer.Left := 710;

  tAangA.Top := 230;
  tKorraA.Top := tAangA.Top + 180;
  tBumi.Top := tAangA.Top;
  tTenzin.Top := tKorraA.Top + 180;
  tJinora.Top := tKorraA.Top + 180;
  tZaheer.Top := tAangA.Top + 180;

  tSymbol.Stretch := True;
  tSymbol.Width := 300;
  tSymbol.Height := 300;
  tSymbol.Top := 300;
  tSymbol.Left := 50;

  iPos := 0;

end;

procedure TfrmAir.tAangAClick(Sender: TObject);
begin
  sName := 'Aang';
  btnDisplay.Click;
  iPos := frmLogin.ArrayIndex(frmAdmin.ArrNames, sName);
  inc(frmAdmin.arrVisits[iPos]);
end;

procedure TfrmAir.tBumiClick(Sender: TObject);
begin
  sName := 'Bumi';
  btnDisplay.Click;
  iPos := frmLogin.ArrayIndex(frmAdmin.ArrNames, sName);
  inc(frmAdmin.arrVisits[iPos]);
end;

procedure TfrmAir.tJinoraClick(Sender: TObject);
begin
  sName := 'Jinora';
  btnDisplay.Click;
  iPos := frmLogin.ArrayIndex(frmAdmin.ArrNames, sName);
  inc(frmAdmin.arrVisits[iPos]);
end;

procedure TfrmAir.tKorraAClick(Sender: TObject);
begin
  sName := 'Korra';
  btnDisplay.Click;
  iPos := frmLogin.ArrayIndex(frmAdmin.ArrNames, sName);
  inc(frmAdmin.arrVisits[iPos]);
end;

procedure TfrmAir.tSymbolClick(Sender: TObject);
begin
  dbgAir.Show;
  frmLogin.qryCharacters.Active := false;
  frmLogin.qryCharacters.SQL.Clear;
  frmLogin.qryCharacters.SQL.Text := 'SELECT Name FROM Characters WHERE (Element = ''Air'') ORDER BY Name';
  frmLogin.qryCharacters.Active := true;
  frmLogin.qryCharacters.Open;

end;

procedure TfrmAir.tTenzinClick(Sender: TObject);
begin
  sName := 'Tenzin';
  btnDisplay.Click;
  iPos := frmLogin.ArrayIndex(frmAdmin.ArrNames, sName);
  inc(frmAdmin.arrVisits[iPos]);
end;

procedure TfrmAir.tZaheerClick(Sender: TObject);
begin
  sName := 'Zaheer';
  btnDisplay.Click;
  iPos := frmLogin.ArrayIndex(frmAdmin.ArrNames, sName);
  inc(frmAdmin.arrVisits[iPos]);
end;

end.
