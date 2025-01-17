unit frmPAT_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, jpeg, Vcl.StdCtrls,
  Vcl.MPlayer, Vcl.Buttons, Vcl.Menus, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, Vcl.Imaging.pngimage, Vcl.Samples.Spin;

const
  Max = 18;
type
    arrsort = array[1..Max] of integer;
    arrsortnames = array[1..Max ] of string;
    TfrmLogin = class(TForm)
    tWater: TImage;
    tFire: TImage;
    tEarth: TImage;
    tAir: TImage;
    lblAvatar: TLabel;
    Music: TMediaPlayer;
    pnlLogin: TPanel;
    lblNo: TLabel;
    lblID: TLabel;
    lblName: TLabel;
    lblSurname: TLabel;
    edtName: TEdit;
    edtSurname: TEdit;
    edtNo: TEdit;
    edtID: TEdit;
    lblAvatar2: TLabel;
    chkBonus: TCheckBox;
    btnContinue: TButton;
    lblDate: TLabel;
    MmAdmin: TMainMenu;
    Login1: TMenuItem;
    lblGender: TLabel;
    rgpGender: TRadioGroup;
    tblCharacters: TADOTable;
    qryCharacters: TADOQuery;
    ds1: TDataSource;
    Back2: TMenuItem;
    Cklose1: TMenuItem;
    tLogin: TImage;
    tLogin2: TImage;
    btnAdd: TButton;
    pnlAdd: TPanel;
    rgpAdd: TRadioGroup;
    lblNameadd: TLabel;
    edtNameadd: TEdit;
    sedAdd: TSpinEdit;
    lblAgeadd: TLabel;
    Button1: TButton;
    btnDelete: TButton;
    procedure FormCreate(Sender: TObject);
    procedure tWaterMouseEnter(Sender: TObject);
    procedure tWaterMouseLeave(Sender: TObject);
    procedure tAirMouseEnter(Sender: TObject);
    procedure tAirMouseLeave(Sender: TObject);
    procedure tFireMouseEnter(Sender: TObject);
    procedure tFireMouseLeave(Sender: TObject);
    procedure tEarthMouseEnter(Sender: TObject);
    procedure tEarthMouseLeave(Sender: TObject);
    procedure btnContinueClick(Sender: TObject);
    procedure tWaterClick(Sender: TObject);
    procedure tFireClick(Sender: TObject);
    procedure tEarthClick(Sender: TObject);
    procedure tAirClick(Sender: TObject);
    procedure Login1Click(Sender: TObject);
    procedure Back2Click(Sender: TObject);
    procedure Cklose1Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    sWrite : string;
    bFlag : boolean;
    sName: string;
  public
    sID : string;
    iMale, iFemale, iTotalGender, iOther, iTotalLogins, iTotalWatched, iEarth, iWater, iAir, iFire : integer;
    arrElements : array[1..4] of integer;
    function ArrayIndex(arr: array of string; pName: string): integer;

  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses frm_PAT_Water_u, frm_PAT_Fire2_u, frm_PAT_Earth_u, frm_PAT_Air_u,
  frm_PAT_Admin_u;



function TfrmLogin.ArrayIndex(arr: array of string; pName: string): integer;
var
  K: Integer;
begin
  Result := 0;
  for K := 1 to 18 do
    if arr[K] = pName then
    Result := K;
end;

procedure TfrmLogin.Back2Click(Sender: TObject);
begin
  pnlLogin.Show;
  tWater.Hide;
  tAir.Hide;
  tFire.Hide;
  tEarth.Hide;
  lblAvatar.Hide;
  btnContinue.Show;
  chkBonus.Show;
  frmLogin.Color := clBlack;
  rgpGender.Show;
  frmLogin.Color := clSkyBlue;
  btnAdd.Hide;
  chkBonus.Checked := False;
  pnlAdd.Hide;
end;

procedure TfrmLogin.btnAddClick(Sender: TObject);
begin
  if bflag = true then
    bflag := false
    else if bflag = false then
         bflag := true;



  if bflag = true then
   begin
    lblAvatar.Hide;
    tWater.Hide;
    tFire.Hide;
    tEarth.Hide;
    tAir.Hide;
    pnlAdd.Show;
    frmLogin.Color := clWhite;
   end
  else if bflag = false then
  begin
    tWater.Show;
    tFire.Show;
    tEarth.Show;
    tAir.Show;
    lblAvatar.Show;
    pnlAdd.Hide;
    frmLogin.Color := clBlack;
    btnDelete.Enabled := False;
  end;

end;

procedure TfrmLogin.btnContinueClick(Sender: TObject);
var
  tFile : TextFile;
begin
  if (edtSurname.Text = '') OR (edtName.Text = '') OR (edtNo.Text = '') OR (edtID.Text = '') OR (rgpGender.ItemIndex = -1) then
  begin
    Messagedlg('Please enter all the necessary infornation.', mtWarning, mbYesNo, 0);
    Exit;
  end
  else begin
    if length(edtID.Text) = 13 then
    begin
      sWrite := edtName.Text + #9 + edtSurname.Text + #9 + edtNo.Text + #9 + edtID.Text;
      sID := edtID.Text;
      pnlLogin.Hide;
      tWater.Show;
      tAir.Show;
      tFire.Show;
      tEarth.Show;
      lblAvatar.Show;
      btnContinue.Hide;
      chkBonus.Hide;
      frmLogin.Color := clBlack;
      rgpGender.Hide;
      inc(iTotalGender);
      inc(iTotalLogins);

     if rgpGender.ItemIndex = 0 then
      inc(iFemale)
      else if rgpGender.ItemIndex = 1 then
      inc(iMale)
      else inc(iOther);

      if chkBonus.Checked then
        begin
          inc(iTotalWatched);
          btnAdd.Show;
        end;


      AssignFile(tFile, 'UsersInfo.txt');

      if (FileExists('UsersInfo.txt') = False) then
        Rewrite(tFile)
        else Append(tFile);

      Writeln(tFile, sWrite);

      Closefile(tfile);



    end
    else begin
      Messagedlg('Please enter a correct ID.', mtWarning, mbYesNo, 0);
      Exit;
    end;

  end;
end;
procedure TfrmLogin.btnDeleteClick(Sender: TObject);
begin
  tblCharacters.Open;
  while NOT tblCharacters.Eof do
  Begin
    if tblCharacters['Name'] = sName then
      tblCharacters.Delete
      else tblCharacters.Next;
  End;
  tblCharacters.Close;
end;

procedure TfrmLogin.Button1Click(Sender: TObject);
var
  sAge, sElement : string;
begin
  sName := edtNameadd.Text;
  sAge := inttostr(sedAdd.Value);

  if (sName <> '') OR (sAge <> '') OR (rgpAdd.ItemIndex <> -1) then
  begin
    case rgpAdd.ItemIndex of
    0 : sElement := 'Water';
    1 : sElement := 'Earth';
    2 : sElement := 'Fire';
    3 : sElement := 'Air';
    end;
    tblCharacters.Open;
    tblCharacters.Insert;
    tblCharacters['Element'] := sElement;
    tblCharacters['Name'] := sName;
    tblCharacters['Age'] := sAge;
    tblCharacters['Bending'] := '-';
    tblCharacters['Sub-bending styles'] := '-';
    tblCharacters['Love interests']:= '-';
    tblCharacters['Alias'] := '-';
    tblCharacters['Nationality'] := '-';
    tblCharacters['Gender'] := '-';
    tblCharacters['Eye Colour'] := '-';
    tblCharacters['Hair Colour'] := '-';
    tblCharacters['Skin Color'] := '-';
    tblCharacters['Weapon of choice'] := '-';
    tblCharacters['Profession'] := '-';

    tblCharacters.Post;
    tblCharacters.Close;

    btnDelete.Enabled := True;
  end
  else Messagedlg('Please enter information before continueing.', mtWarning, mbYesNo, 0);

end;

procedure TfrmLogin.Cklose1Click(Sender: TObject);
begin
   if MessageDlg('Are you sure you want to close the application?' + #13 + 'This should only be done if maintainance is required', mtWarning, mbYesNo, 0) = 6 then
    frmLogin.Close;

end;

procedure TfrmLogin.FormCreate(Sender: TObject);
var
  sDate, sDay, sYear, sMonth : string;
  iDay, iMonth : integer;
  k: Integer;
begin
  btnDelete.Enabled := False;
  bFlag := false;
  btnAdd.Hide;
  pnlAdd.Top := 200;
  pnlAdd.Left := 325;
  pnlAdd.Height := 200;
  pnlAdd.Width := 675;
  pnlAdd.Hide;

  sWrite := '';
  iWater := 0;
  iFire := 0;
  iEarth := 0;
  iAir := 0;

  iMale := 0;
  iFemale := 0;
  iTotalGender := 0;
  iOther := 0;
  iTotalLogins := 0;
  iTotalWatched := 0;

  btnAdd.Top := 0;
  btnAdd.Height := 50;
  btnAdd.Width := 200;
  btnAdd.Left := screen.Width - btnAdd.Width;

  sDate := DateToStr(Date);
  sDay := Copy(sDate, 9, 2);
  iMonth := strtoint(Copy(sDate, 6, 2));
  sYear := Copy(sDate, 1, 4);

  case iMonth of
    1 : sMonth := 'January';
    2 : sMonth := 'February';
    3 : sMonth := 'March';
    4 : sMonth := 'April';
    5 : sMonth := 'May';
    6 : sMonth := 'June' ;
    7 : sMonth := 'July';
    8 : sMonth := 'August';
    9 : sMonth := 'September';
   10 : sMonth := 'October';
   11 : sMonth := 'November';
   12 : sMonth := 'December';
  end;

  sDate := sDay + ' ' + sMonth + ' ' + sYear;

  lblDate.Caption := sDate;
  lblDate.Font.Size := 36;
  lblDate.Font.Name := 'Viner Hand ITC';
  lblDate.Left := 500;
  lblDate.Top := 100;


  tWater.Hide;
  tAir.Hide;
  tFire.Hide;
  tEarth.Hide;
  lblAvatar.Hide;

  btnContinue.Width := 180;
  btnContinue.Height := 80;
  btnContinue.Left := 400;
  btnContinue.Top := 530;
  btnContinue.Font.Size := 26;

  pnlLogin.Left := 0;
  pnlLogin.Top := 0;
  pnlLogin.Height := Screen.Height;
  pnlLogin.Width := Screen.Width;
  pnlLogin.Brush.Color := clBlack;
  pnlLogin.Color := clSkyBlue;

  BorderStyle := bsNone;
  WindowState := wsMaximized;
  frmLogin.Top := 0;
  frmLogin.Left := 0;
  //frmLogin.Height := 720;
  //frmLogin.Width := 1280;
  frmLogin.Color := clSkyBlue;

  lblID.Font.Color := clWhite;
  lblName.Font.Color := clWhite;
  lblSurname.Font.Color := clWhite;
  lblNo.Font.Color := clWhite;
  lblID.Font.Size := 21;
  lblNo.Font.Size := 21;
  lblName.Font.Size := 21;
  lblSurname.Font.Size := 21;
  lblAvatar2.Font.Size := 21;
  lblAvatar2.Font.Color := clWhite;
  lblGender.Font.Color := clWhite;
  lblGender.Font.Size := 21;

  lblID.Caption := 'Enter your ID:';
  lblName.Caption := 'Enter your name:';
  lblSurname.Caption := 'Enter your surname:';
  lblNo.Caption := 'Enter your phone number:';
  lblAvatar2.Caption := 'Have you watched "Avatar' + #13 + 'The Last Airbender" ?';
  lblGender.Caption := 'Gender : ';

  lblName.Left := 50;
  lblName.Top := 25;
  lblSurname.Left := 50;
  lblSurname.Top := lblName.Top + 50;
  lblID.Left := 50;
  lblID.Top := lblSurname.Top + 50;
  lblNo.Left := 50;
  lblNo.Top := lblID.Top + 50;
  lblAvatar2.Left := 50;
  lblAvatar2.Top := lblNo.Top + 50;
  lblGender.Left := 50;
  lblGender.Top := lblAvatar2.Top + 135;

  rgpGender.Top := lblGender.Top;
  rgpGender.Left := edtID.Left;

  edtName.Width := 250;
  edtSurname.Width := 250;
  edtID.Width := 250;
  edtNo.Width := 250;

  edtName.Left := 400;
  edtName.Top := 40;
  edtSurname.Left := 400;
  edtSurname.Top := edtName.Top + 50;
  edtID.Left := 400;
  edtID.Top := edtSurname.Top + 50;
  edtNo.Left := 400;
  edtNo.Top := edtID.Top + 50;

  edtName.ScaleBy(2, 2);

  chkBonus.Left := 550;
  chkBonus.Top := 260;
  chkBonus.Font.Size := 15;


  tWater.Picture.LoadFromFile('Water.jpg');
  tFire.Picture.LoadFromFile('Fire.jpg');
  tEarth.Picture.LoadFromFile('Earth.jpg');
  tAir.Picture.LoadFromFile('Air.jpg');

  tWater.Stretch := true;
  tFire.Stretch := true;
  tEarth.Stretch := true;
  tAir.Stretch := true;

  tWater.Height := 300;
  tWater.Width := 300;
  tWater.Top := 75;
  tWater.Left := 225;

  tFire.Height := 300;
  tFire.Width := 300;
  tFire.Top := 75;
  tFire.Left := 900;

  tEarth.Height := 300;
  tEarth.Width := 300;
  tEarth.Top := 450;
  tEarth.Left := 225;

  tAir.Height := 300;
  tAir.Width := 300;
  tAir.Top := 450;
  tAir.Left := 900;

  tLogin.Top := 0;
  tLogin.Width := 400;
  tLogin.Left := screen.Width - tLogin.Width - 250;
  tLogin.Height := Screen.Height;
  tLogin2.Top := 0;
  tLogin2.Width := 350;
  tLogin2.Left := tLogin.Left + tLogin.Width - 50;
  tLogin2.Height := Screen.Height;



  lblAvatar.Caption := 'Avatar';
  lblAvatar.Font.Name := 'Viner Hand ITC';
  lblAvatar.Font.Color := clWhite;
  lblAvatar.Font.Size := 100;
  lblAvatar.Left := 480;
  lblAvatar.Top := 320;











end;

procedure TfrmLogin.Login1Click(Sender: TObject);
var
  sUsername, sPassword, sLine, sCorrectUsername, sCorrectPassword : string;
  tFile : Textfile;
  iPos : integer;
begin
  try
  sUsername := Inputbox('Admin', 'Username:', '');
  sPassword := Inputbox('Admin', 'Password:', '');

  if (FileExists('Admin.txt') = False) then
    begin
      MessageDlg('File Does not Exist',mtCustom, mbOKCancel,0);
      Exit;
    end;

    AssignFile(tFile, 'Admin.txt');

    Reset(tFile);

    while NOT EOF(tFile) do
    Begin
      Readln(tFile, sLine);
      iPos := Pos('#', sLine);
      sCorrectUsername := Copy(sLine, 1, iPos - 1);
      Delete(sLine, 1, iPos);

      sCorrectPassword := Copy(sLine, 1, Length(sLine));

      if sUsername = sCorrectUsername then
          begin
            if sPassword = sCorrectPassword then
              begin
                frmAdmin.Show;
                frmLogin.Hide;
              end
              else begin
                MessageDlg('Wrong username/password', mtError, mbOKCancel, 0);
                Exit;
              end;

          end
          else begin
            MessageDlg('Wrong username/password', mtError, mbOKCancel, 0);
            Exit;
          end;

    End;


  except
  Messagedlg('Oops! Something went wrong :(', mtError, mbYesNo, 0);
  end;
end;




procedure TfrmLogin.tAirClick(Sender: TObject);
begin
  frmAir.Show;
  frmLogin.Hide;
  inc(iAir);
end;

procedure TfrmLogin.tAirMouseEnter(Sender: TObject);
begin
  tAir.Height := 380;
  tAir.Width := 380;
  tAir.Top := 430;
  tAir.Left := 880;
end;

procedure TfrmLogin.tAirMouseLeave(Sender: TObject);
begin
  tAir.Height := 300;
  tAir.Width := 300;
  tAir.Top := 450;
  tAir.Left := 900;
end;

procedure TfrmLogin.tEarthClick(Sender: TObject);
begin
  frmEarth.Show;
  frmLogin.Hide;
  inc(iEarth);
end;

procedure TfrmLogin.tEarthMouseEnter(Sender: TObject);
begin
  tEarth.Height := 380;
  tEarth.Width := 380;
  tEarth.Top := 430;
  tEarth.Left := 205;
end;

procedure TfrmLogin.tEarthMouseLeave(Sender: TObject);
begin
  tEarth.Height := 300;
  tEarth.Width := 300;
  tEarth.Top := 450;
  tEarth.Left := 225;
end;

procedure TfrmLogin.tFireClick(Sender: TObject);
begin
  frmFire.Show;
  frmLogin.Hide;
  inc(iFire);
end;

procedure TfrmLogin.tFireMouseEnter(Sender: TObject);
begin
  tFire.Height := 380;
  tFire.Width := 380;
  tFire.Top := 55;
  tFire.Left := 880;
end;

procedure TfrmLogin.tFireMouseLeave(Sender: TObject);
begin
  tFire.Height := 300;
  tFire.Width := 300;
  tFire.Top := 75;
  tFire.Left := 900;
end;

procedure TfrmLogin.tWaterClick(Sender: TObject);
begin
  frmWater.Show;
  frmLogin.Hide;
  inc(iWater);

end;

procedure TfrmLogin.tWaterMouseEnter(Sender: TObject);
begin
  tWater.Height := 380;
  tWater.Width := 380;
  tWater.Top := 55;
  tWater.Left := 205;
end;

procedure TfrmLogin.tWaterMouseLeave(Sender: TObject);
begin
  tWater.Height := 300;
  tWater.Width := 300;
  tWater.Top := 75;
  tWater.Left := 225;
end;

end.
