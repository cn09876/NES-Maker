object newCode: TnewCode
  Left = 264
  Top = 133
  BorderStyle = bsSingle
  Caption = #26032#24314#20195#30721#21644#36164#28304
  ClientHeight = 322
  ClientWidth = 460
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClick = FormClick
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 224
    Top = 120
    Width = 30
    Height = 13
    Caption = #35299#35828'  '
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 16
    Width = 201
    Height = 281
    Caption = #25991#20214#31867#22411
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 303
    Width = 460
    Height = 19
    Panels = <
      item
        Text = #24212#29992#31243#24207
        Width = 60
      end
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object LabeledEdit1: TLabeledEdit
    Left = 216
    Top = 32
    Width = 217
    Height = 21
    EditLabel.Width = 72
    EditLabel.Height = 13
    EditLabel.Caption = #36755#20837#25991#20214#21517'    '
    ImeName = #26497#21697#20116#31508#36755#20837#27861' '#29256#26412' 6.9'
    TabOrder = 2
    Text = 'noname'
    OnChange = LabeledEdit1Change
    OnDblClick = LabeledEdit1DblClick
  end
  object BitBtn2: TBitBtn
    Left = 360
    Top = 264
    Width = 75
    Height = 25
    TabOrder = 3
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object Memo1: TMemo
    Left = 216
    Top = 136
    Width = 217
    Height = 89
    BevelKind = bkFlat
    Color = clMenuBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImeName = #26497#21697#20116#31508#36755#20837#27861' '#29256#26412' 6.9'
    ParentFont = False
    TabOrder = 4
  end
  object Button1: TButton
    Left = 264
    Top = 264
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 5
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 216
    Top = 80
    Width = 97
    Height = 17
    Caption = #33258#21160#25193#23637#21517
    Checked = True
    State = cbChecked
    TabOrder = 6
    OnClick = LabeledEdit1Change
  end
end
