program frmPAT_p;

uses
  Vcl.Forms,
  frmPAT_u in 'frmPAT_u.pas' {frmLogin},
  frm_PAT_Water_u in 'frm_PAT_Water_u.pas' {frmWater},
  frm_PAT_Fire2_u in 'frm_PAT_Fire2_u.pas' {frmFire},
  frm_PAT_Earth_u in 'frm_PAT_Earth_u.pas' {frmEarth},
  frm_PAT_Air_u in 'frm_PAT_Air_u.pas' {frmAir},
  frm_PAT_Admin_u in 'frm_PAT_Admin_u.pas' {frmAdmin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmWater, frmWater);
  Application.CreateForm(TfrmFire, frmFire);
  Application.CreateForm(TfrmEarth, frmEarth);
  Application.CreateForm(TfrmAir, frmAir);
  Application.CreateForm(TfrmAdmin, frmAdmin);
  Application.Run;
end.
