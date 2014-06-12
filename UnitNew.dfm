object newPJ: TnewPJ
  Left = 200
  Top = 115
  BorderStyle = bsSingle
  Caption = 'FC/NES Maker - '#26032#24314#24037#31243
  ClientHeight = 530
  ClientWidth = 563
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 24
    Top = 16
    Width = 513
    Height = 449
    BevelOuter = bvNone
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 513
      Height = 136
      Align = alTop
      Caption = #20301#32622#19982#21629#21517
      TabOrder = 0
      object PJ_path: TLabeledEdit
        Left = 8
        Top = 40
        Width = 377
        Height = 21
        EditLabel.Width = 60
        EditLabel.Height = 13
        EditLabel.Caption = '* '#24037#31243#36335#24452
        TabOrder = 0
      end
      object PJ_file: TLabeledEdit
        Left = 8
        Top = 88
        Width = 377
        Height = 21
        EditLabel.Width = 80
        EditLabel.Height = 13
        EditLabel.Caption = '* '#24037#31243#25991#20214#21517
        TabOrder = 1
        Text = 'Project1'
      end
      object TrackPath: TButton
        Left = 414
        Top = 40
        Width = 75
        Height = 25
        Caption = '...'
        TabOrder = 2
        OnClick = TrackPathClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 0
      Top = 136
      Width = 513
      Height = 313
      Align = alClient
      Caption = #20869#23481
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 41
        Height = 13
        AutoSize = False
        Caption = '* '#27169#29256
      end
      object Bevel1: TBevel
        Left = 8
        Top = 40
        Width = 241
        Height = 169
      end
      object Label2: TLabel
        Left = 280
        Top = 24
        Width = 41
        Height = 13
        AutoSize = False
        Caption = #23646#24615
      end
      object Label3: TLabel
        Left = 8
        Top = 240
        Width = 169
        Height = 13
        AutoSize = False
        Caption = #20961#24102'*'#21495#65292#24517#39035#22635#20889#12290
      end
      object Label4: TLabel
        Left = 56
        Top = 24
        Width = 145
        Height = 13
        AutoSize = False
        Caption = #26410#36873#25321
      end
      object ListBox1: TListBox
        Left = 16
        Top = 48
        Width = 225
        Height = 153
        ItemHeight = 13
        TabOrder = 0
      end
      object ListBox2: TListBox
        Left = 280
        Top = 48
        Width = 209
        Height = 241
        ItemHeight = 13
        TabOrder = 1
      end
    end
  end
  object Button1: TButton
    Left = 352
    Top = 488
    Width = 75
    Height = 25
    Caption = #25552#20132
    TabOrder = 1
  end
  object Button2: TButton
    Left = 456
    Top = 488
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
  end
end
