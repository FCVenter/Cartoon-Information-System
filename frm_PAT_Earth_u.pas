unit frm_PAT_Earth_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.GIFImg,
  Vcl.ExtCtrls, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmEarth = class(TForm)
    btnBack: TButton;
    tEarth: TImage;
    lstEarth: TListBox;
    tBumi: TImage;
    tKorraE: TImage;
    tKyoshi: TImage;
    tAangE: TImage;
    tToph: TImage;
    tKuvira: TImage;
    tSymbol: TImage;
    btnDisplay: TButton;
    dbgEarth: TDBGrid;
    procedure btnBackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tAangEClick(Sender: TObject);
    procedure tBumiClick(Sender: TObject);
    procedure tKuviraClick(Sender: TObject);
    procedure tKyoshiClick(Sender: TObject);
    procedure tTophClick(Sender: TObject);
    procedure tKorraEClick(Sender: TObject);
    procedure btnDisplayClick(Sender: TObject);
    procedure tSymbolClick(Sender: TObject);
  private
   sName : string;
   iPos : integer;
  public
    { Public declarations }
  end;

var
  frmEarth: TfrmEarth;

implementation

{$R *.dfm}

uses frmPAT_u, frm_PAT_Admin_u;

procedure TfrmEarth.btnBackClick(Sender: TObject);
begin
  (tEarth.Picture.Graphic as TGIFImage).Animate := False;
  frmLogin.Show;
  frmEarth.Hide;
end;

procedure TfrmEarth.btnDisplayClick(Sender: TObject);
begin
  try
  dbgEarth.Hide;
  frmLogin.tblCharacters.Open;
  frmLogin.tblCharacters.First;

  lstEarth.Items.Clear;

  while NOT frmLogin.tblCharacters.Eof do
    Begin
      if frmLogin.tblCharacters['Name'] = sName then
        begin
          lstEarth.Items.Add('Name: ' + frmLogin.tblCharacters['Name']);
          lstEarth.Items.Add('Bending: ' + frmLogin.tblCharacters['Bending']);
          lstEarth.Items.Add('Sub-bending styles: ' + frmLogin.tblCharacters['Sub-bending styles']);
          lstEarth.Items.Add('Love interests: ' + frmLogin.tblCharacters['Love interests']);
          lstEarth.Items.Add('Alias: ' + frmLogin.tblCharacters['Alias']);
          lstEarth.Items.Add('Nationality: ' + frmLogin.tblCharacters['Nationality']);
          lstEarth.Items.Add('Age: ' + inttostr(frmLogin.tblCharacters['Age']));
          lstEarth.Items.Add('Gender: ' + frmLogin.tblCharacters['Gender']);
          lstEarth.Items.Add('Eye Colour: ' + frmLogin.tblCharacters['Eye Colour']);
          lstEarth.Items.Add('Hair Colour: ' + frmLogin.tblCharacters['Hair Colour']);
          lstEarth.Items.Add('Skin Color: ' + frmLogin.tblCharacters['Skin Color']);
          lstEarth.Items.Add('Weapon of choice: ' + frmLogin.tblCharacters['Weapon of choice']);
          lstEarth.Items.Add('Profession: ' + frmLogin.tblCharacters['Profession']);
        end;
      frmLogin.tblCharacters.Next;
    End;

   frmLogin.tblCharacters.Close;
  except
    Messagedlg('Oops! Something went wrong :(', mtError, mbYesNo, 0);
  end;
end;

procedure TfrmEarth.FormActivate(Sender: TObject);
begin
  (tEarth.Picture.Graphic as TGIFImage).Animate := True;
end;

procedure TfrmEarth.FormCreate(Sender: TObject);
var
  iRight :integer;
begin
  btnDisplay.Hide;
  sName := '';
  BorderStyle := bsNone;
  WindowState := wsMaximized;
  frmEarth.Top := 0;
  frmEarth.Left := 0;
  frmEarth.Height := screen.Height;
  frmEarth.Width := screen.Width;
  frmEarth.Color := clBlack;

  tEarth.Height := 500;
  tEarth.Height:= screen.Height;
  tEarth.Width := 400;
  iRight := screen.Width - tEarth.Width;
  tEarth.Top := 0;
  tEarth.Left := iRight;
  tEarth.Stretch := True;
  lstEarth.Height := 200;
  lstEarth.Width := screen.Width - tEarth.Width;
  lstEarth.Top := 0;
  lstEarth.Left := 0;
  lstEarth.Font.Size := 20;

  dbgEarth.Hide;
  dbgEarth.Left := 0;
  dbgEarth.Top := 0;
  dbgEarth.Width := screen.Width - tEarth.Width;
  dbgEarth.Height := 200;
  dbgEarth.Font.Size := 20;

  tAangE.Stretch := True;
  tKorraE.Stretch := True;
  tBumi.Stretch := True;
  tKyoshi.Stretch := True;
  tToph.Stretch := True;
  tKuvira.Stretch := True;

  tAangE.Width := 130;
  tKorraE.Width := 130;
  tBumi.Width := 130;
  tKyoshi.Width := 130;
  tToph.Width := 130;
  tKuvira.Width := 130;

  tAangE.Height := 130;
  tKorraE.Height := 130;
  tBumi.Height := 130;
  tKyoshi.Height := 130;
  tToph.Height := 130;
  tKuvira.Height := 130;

  tAangE.Left := 400;
  tKorraE.Left := 400;
  tBumi.Left := 710;
  tKyoshi.Left := 400;
  tToph.Left := 710;
  tKuvira.Left := 710;

  tAangE.Top := 230;
  tKorraE.Top := tAangE.Top + 180;
  tBumi.Top := tAangE.Top;
  tKyoshi.Top := tKorraE.Top + 180;
  tToph.Top := tKorraE.Top + 180;
  tKuvira.Top := tAangE.Top + 180;

  tSymbol.Stretch := True;
  tSymbol.Width := 300;
  tSymbol.Height := 300;
  tSymbol.Top := 300;
  tSymbol.Left := 50;

  iPos := 0;
end;

procedure TfrmEarth.tAangEClick(Sender: TObject);
begin
  sName := 'Aang';
  btnDisplay.Click;
  iPos := frmLogin.ArrayIndex(frmAdmin.ArrNames, sName);
  inc(frmAdmin.arrVisits[iPos]);
end;

procedure TfrmEarth.tBumiClick(Sender: TObject);
begin
  sName := 'Bumi';
  btnDisplay.Click;
  iPos := frmLogin.ArrayIndex(frmAdmin.ArrNames, sName);
  inc(frmAdmin.arrVisits[iPos]);
end;

procedure TfrmEarth.tKorraEClick(Sender: TObject);
begin
  sName := 'Korra';
  btnDisplay.Click;
  iPos := frmLogin.ArrayIndex(frmAdmin.ArrNames, sName);
  inc(frmAdmin.arrVisits[iPos]);
end;

procedure TfrmEarth.tKuviraClick(Sender: TObject);
begin
  sName := 'Kuvira';
  btnDisplay.Click;
  iPos := frmLogin.ArrayIndex(frmAdmin.ArrNames, sName);
  inc(frmAdmin.arrVisits[iPos]);
end;

procedure TfrmEarth.tKyoshiClick(Sender: TObject);
begin
  sName := 'Kyoshi';
  btnDisplay.Click;
  iPos := frmLogin.ArrayIndex(frmAdmin.ArrNames, sName);
  inc(frmAdmin.arrVisits[iPos]);
end;

procedure TfrmEarth.tSymbolClick(Sender: TObject);
begin
  dbgEarth.Show;
  frmLogin.qryCharacters.Active := false;
  frmLogin.qryCharacters.SQL.Clear;
  frmLogin.qryCharacters.SQL.Text := 'SELECT Name FROM Characters WHERE (Element = ''Earth'') ORDER BY Name';
  frmLogin.qryCharacters.Active := true;
  frmLogin.qryCharacters.Open;

end;

procedure TfrmEarth.tTophClick(Sender: TObject);
begin
  sName := 'Toph';
  btnDisplay.Click;
  iPos := frmLogin.ArrayIndex(frmAdmin.ArrNames, sName);
  inc(frmAdmin.arrVisits[iPos]);
end;
end.
