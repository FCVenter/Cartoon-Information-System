unit frm_PAT_Fire2_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.GIFImg,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmFire = class(TForm)
    btnBack: TButton;
    tFire: TImage;
    lstFire: TListBox;
    tZuko: TImage;
    tAzula: TImage;
    tIroh: TImage;
    tKorraF: TImage;
    tAangF: TImage;
    tOzai: TImage;
    tSymbol: TImage;
    btnDisplay: TButton;
    dbgFire: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tAangFMouseEnter(Sender: TObject);
    procedure tAangFMouseLeave(Sender: TObject);
    procedure tIrohClick(Sender: TObject);
    procedure tAzulaClick(Sender: TObject);
    procedure tZukoClick(Sender: TObject);
    procedure tOzaiClick(Sender: TObject);
    procedure tAangFClick(Sender: TObject);
    procedure tKorraFClick(Sender: TObject);
    procedure btnDisplayClick(Sender: TObject);
    procedure tSymbolClick(Sender: TObject);
  private
    sName : string;
    iPos : integer;
  public
    { Public declarations }
  end;

var
  frmFire: TfrmFire;

implementation

{$R *.dfm}

uses frmPAT_u, frm_PAT_Admin_u;

procedure TfrmFire.btnBackClick(Sender: TObject);
begin
  (tFire.Picture.Graphic as TGIFImage).Animate := False;
  frmLogin.Show;
  frmFire.Hide;


end;

procedure TfrmFire.btnDisplayClick(Sender: TObject);
begin
  try
  dbgFire.Hide;
  frmLogin.tblCharacters.Open;
  frmLogin.tblCharacters.First;

  lstFire.Items.Clear;

  while NOT frmLogin.tblCharacters.Eof do
    Begin
      if frmLogin.tblCharacters['Name'] = sName then
        begin
          lstFire.Items.Add('Name: ' + frmLogin.tblCharacters['Name']);
          lstFire.Items.Add('Bending: ' + frmLogin.tblCharacters['Bending']);
          lstFire.Items.Add('Sub-bending styles: ' + frmLogin.tblCharacters['Sub-bending styles']);
          lstFire.Items.Add('Love interests: ' + frmLogin.tblCharacters['Love interests']);
          lstFire.Items.Add('Alias: ' + frmLogin.tblCharacters['Alias']);
          lstFire.Items.Add('Nationality: ' + frmLogin.tblCharacters['Nationality']);
          lstFire.Items.Add('Age: ' + inttostr(frmLogin.tblCharacters['Age']));
          lstFire.Items.Add('Gender: ' + frmLogin.tblCharacters['Gender']);
          lstFire.Items.Add('Eye Colour: ' + frmLogin.tblCharacters['Eye Colour']);
          lstFire.Items.Add('Hair Colour: ' + frmLogin.tblCharacters['Hair Colour']);
          lstFire.Items.Add('Skin Color: ' + frmLogin.tblCharacters['Skin Color']);
          lstFire.Items.Add('Weapon of choice: ' + frmLogin.tblCharacters['Weapon of choice']);
          lstFire.Items.Add('Profession: ' + frmLogin.tblCharacters['Profession']);
        end;
      frmLogin.tblCharacters.Next;
    End;

   frmLogin.tblCharacters.Close;
  except
    Messagedlg('Oops! Something went wrong :(', mtError, mbYesNo, 0);
  end;
end;

procedure TfrmFire.FormActivate(Sender: TObject);
begin
  (tFire.Picture.Graphic as TGIFImage).Animate := True;


end;

procedure TfrmFire.FormCreate(Sender: TObject);
var
  iRight : integer;
begin
  btnDisplay.Hide;
  sName := '';
  BorderStyle := bsNone;
  WindowState := wsMaximized;
  frmFire.Top := 0;
  frmFire.Left := 0;
  frmFire.Height := screen.Height;
  frmFire.Width := screen.Width;
  frmFire.Color := clBlack;

  tFire.Height := 500;
  tFire.Height:= screen.Height;
  tFire.Width := 400;
  iRight := screen.Width - tFire.Width;
  tFire.Top := 0;
  tFire.Left := iRight;
  tFire.Stretch := True;
  lstFire.Height := 200;
  lstFire.Width := screen.Width - tFire.Width;
  lstFire.Top := 0;
  lstFire.Left := 0;
  lstFire.Font.Size := 20;

  dbgFire.Hide;
  dbgFire.Left := 0;
  dbgFire.Top := 0;
  dbgFire.Width := screen.Width - tFire.Width;
  dbgFire.Height := 200;
  dbgFire.Font.Size := 20;

  tAangF.Stretch := True;
  tKorraF.Stretch := True;
  tZuko.Stretch := True;
  tOzai.Stretch := True;
  tAzula.Stretch := True;
  tIroh.Stretch := True;

  tAangF.Width := 130;
  tKorraF.Width := 130;
  tOzai.Width := 130;
  tZuko.Width := 130;
  tAzula.Width := 130;
  tIroh.Width := 130;

  tAangF.Height := 130;
  tKorraF.Height := 130;
  tOzai.Height := 130;
  tZuko.Height := 130;
  tAzula.Height := 130;
  tIroh.Height := 130;

  tAangF.Left := 400;
  tKorraF.Left := 400;
  tOzai.Left := 710;
  tZuko.Left := 400;
  tAzula.Left := 710;
  tIroh.Left := 710;

  tAangF.Top := 230;
  tKorraF.Top := tAangF.Top + 180;
  tOzai.Top := tAangF.Top;
  tZuko.Top := tKorraF.Top + 180;
  tAzula.Top := tKorraF.Top + 180;
  tIroh.Top := tAangF.Top + 180;

  tSymbol.Stretch := True;
  tSymbol.Width := 300;
  tSymbol.Height := 300;
  tSymbol.Top := 300;
  tSymbol.Left := 50;

  iPos := 0;

end;

procedure TfrmFire.tAangFClick(Sender: TObject);
begin
  sName := 'Aang';
  btnDisplay.Click;
  inc(frmAdmin.arrVisits[2]);
end;

procedure TfrmFire.tAangFMouseEnter(Sender: TObject);
begin
  {tAangF.Width := 220;
  tAangF.Height := 220;
  tAangF.Left := 400;
  tAangF.Top := 20;}
end;

procedure TfrmFire.tAangFMouseLeave(Sender: TObject);
begin
  tAangF.Width := 130;
  tAangF.Height := 130;
  tAangF.Left := 400;
  tAangF.Top := 230;

end;

procedure TfrmFire.tAzulaClick(Sender: TObject);
begin
  sName := 'Azula';
  btnDisplay.Click;
  iPos := frmLogin.ArrayIndex(frmAdmin.ArrNames, sName);
  inc(frmAdmin.arrVisits[iPos]);
end;

procedure TfrmFire.tIrohClick(Sender: TObject);
begin
  sName := 'Iroh';
  btnDisplay.Click;
  iPos := frmLogin.ArrayIndex(frmAdmin.ArrNames, sName);
  inc(frmAdmin.arrVisits[iPos]);
end;

procedure TfrmFire.tKorraFClick(Sender: TObject);
begin
  sName := 'Korra';
  btnDisplay.Click;
  iPos := frmLogin.ArrayIndex(frmAdmin.ArrNames, sName);
  inc(frmAdmin.arrVisits[iPos]);
end;

procedure TfrmFire.tOzaiClick(Sender: TObject);
begin
  sName := 'Ozai';
  btnDisplay.Click;
  iPos := frmLogin.ArrayIndex(frmAdmin.ArrNames, sName);
  inc(frmAdmin.arrVisits[iPos]);
end;

procedure TfrmFire.tSymbolClick(Sender: TObject);
begin
  dbgFire.Show;
  frmLogin.qryCharacters.Active := false;
  frmLogin.qryCharacters.SQL.Clear;
  frmLogin.qryCharacters.SQL.Text := 'SELECT Name FROM Characters WHERE (Element = ''Fire'') ORDER BY Name';
  frmLogin.qryCharacters.Active := true;
  frmLogin.qryCharacters.Open;
end;

procedure TfrmFire.tZukoClick(Sender: TObject);
begin
  sName := 'Zuko';
  btnDisplay.Click;
  iPos := frmLogin.ArrayIndex(frmAdmin.ArrNames, sName);
  inc(frmAdmin.arrVisits[iPos]);
end;

end.
