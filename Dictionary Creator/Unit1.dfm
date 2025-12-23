object Form1: TForm1
  Left = 582
  Top = 134
  Caption = 'Dictionary Creator'
  ClientHeight = 424
  ClientWidth = 727
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object RichEdit1: TRichEdit
    Left = 0
    Top = 0
    Width = 727
    Height = 361
    TabStop = False
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    PopupMenu = PopupMenu1
    ScrollBars = ssBoth
    TabOrder = 0
    OnChange = RichEdit1Change
    OnKeyPress = RichEdit1KeyPress
    ExplicitTop = -6
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 405
    Width = 727
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Text = 'Lines :'
        Width = 45
      end
      item
        Width = 50
      end>
    ExplicitTop = 404
    ExplicitWidth = 723
  end
  object Panel2: TPanel
    Left = 0
    Top = 361
    Width = 727
    Height = 44
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 360
    ExplicitWidth = 723
    DesignSize = (
      727
      44)
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 31
      Height = 13
      Caption = 'ASCii :'
    end
    object Label1: TLabel
      Left = 216
      Top = 16
      Width = 47
      Height = 13
      Caption = 'Multiplier :'
    end
    object Label4: TLabel
      Left = 316
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Rows :'
    end
    object Label5: TLabel
      Left = 404
      Top = 16
      Width = 37
      Height = 13
      Caption = 'Space :'
    end
    object Edit1: TEdit
      Left = 45
      Top = 13
      Width = 157
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      Text = 'abc'
    end
    object Button3: TButton
      Left = 670
      Top = 13
      Width = 50
      Height = 22
      Anchors = [akTop, akRight]
      Caption = 'Create'
      TabOrder = 1
      OnClick = Button3Click
      ExplicitLeft = 666
    end
    object Button2: TButton
      Left = 614
      Top = 12
      Width = 50
      Height = 22
      Anchors = [akTop, akRight]
      Caption = 'Stop'
      TabOrder = 2
      OnClick = Button2Click
      ExplicitLeft = 610
    end
    object SpinEdit1: TSpinEdit
      Left = 268
      Top = 12
      Width = 42
      Height = 22
      Ctl3D = True
      MaxLength = 4
      MaxValue = 0
      MinValue = 0
      ParentCtl3D = False
      TabOrder = 3
      Value = 5
    end
    object Button1: TButton
      Left = 558
      Top = 12
      Width = 50
      Height = 22
      Anchors = [akTop, akRight]
      Caption = 'Save'
      TabOrder = 4
      OnClick = Button1Click
      ExplicitLeft = 554
    end
    object SpinEdit2: TSpinEdit
      Left = 355
      Top = 12
      Width = 42
      Height = 22
      Ctl3D = True
      MaxLength = 3
      MaxValue = 0
      MinValue = 0
      ParentCtl3D = False
      TabOrder = 5
      Value = 8
    end
    object SpinEdit3: TSpinEdit
      Left = 448
      Top = 12
      Width = 37
      Height = 22
      Ctl3D = True
      MaxLength = 2
      MaxValue = 30
      MinValue = 0
      ParentCtl3D = False
      TabOrder = 6
      Value = 1
    end
    object CheckBox1: TCheckBox
      Left = 496
      Top = 15
      Width = 57
      Height = 17
      Caption = 'Center'
      TabOrder = 7
    end
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 434
    Top = 90
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Textdocument (*.TXT)|*.txt'
    Left = 352
    Top = 88
  end
  object PopupMenu1: TPopupMenu
    Left = 504
    Top = 88
    object Copy1: TMenuItem
      Caption = 'Copy'
      ShortCut = 16451
      OnClick = Copy1Click
    end
    object Selectall1: TMenuItem
      Caption = 'Select all'
      ShortCut = 16449
      OnClick = Selectall1Click
    end
    object Cut1: TMenuItem
      Caption = 'Cut'
      ShortCut = 16472
      OnClick = Cut1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Clear1: TMenuItem
      Caption = 'Clear'
      OnClick = Clear1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Zebra1: TMenuItem
      AutoCheck = True
      Caption = 'Zebra'
      Enabled = False
      OnClick = Zebra1Click
    end
    object Font1: TMenuItem
      Caption = 'Font'
      OnClick = Font1Click
    end
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Left = 592
    Top = 88
  end
end
