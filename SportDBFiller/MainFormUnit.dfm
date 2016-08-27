object NameForm: TNameForm
  Left = 0
  Top = 0
  Caption = #1063#1080#1089#1090#1082#1072' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 300
  ClientWidth = 619
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 536
    Top = 247
    Width = 75
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 136
    Width = 603
    Height = 105
    Caption = 'GroupBox1'
    TabOrder = 1
    object InputFilenameEdit: TEdit
      Left = 16
      Top = 28
      Width = 553
      Height = 21
      TabOrder = 0
      Text = 'c:\Users\danner\Desktop\SportDB\Input.xlsx'
    end
  end
  object Button2: TButton
    Left = 288
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
end
