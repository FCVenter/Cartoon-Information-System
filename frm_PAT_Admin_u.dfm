object frmAdmin: TfrmAdmin
  Left = 0
  Top = 0
  Caption = 'frmAdmin'
  ClientHeight = 581
  ClientWidth = 990
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblUsers: TLabel
    Left = 64
    Top = 48
    Width = 3
    Height = 13
  end
  object lblElement: TLabel
    Left = 64
    Top = 88
    Width = 3
    Height = 13
  end
  object lblCharacter: TLabel
    Left = 64
    Top = 136
    Width = 3
    Height = 13
  end
  object lblBonus: TLabel
    Left = 64
    Top = 176
    Width = 3
    Height = 13
  end
  object lblGender: TLabel
    Left = 312
    Top = 160
    Width = 3
    Height = 13
  end
  object btnBack: TButton
    Left = 0
    Top = 0
    Width = 75
    Height = 25
    Caption = 'Back'
    TabOrder = 0
    OnClick = btnBackClick
  end
end
