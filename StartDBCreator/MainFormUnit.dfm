object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1047#1072#1087#1086#1083#1085#1077#1085#1080#1077' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 477
  ClientWidth = 1141
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 21
    Top = 434
    Width = 66
    Height = 13
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = #1057#1086#1077#1076#1080#1085#1077#1085#1080#1077':'
  end
  object Button1: TButton
    Left = 1034
    Top = 427
    Width = 99
    Height = 25
    Caption = #1057#1086#1077#1076#1080#1085#1080#1090#1100#1089#1103
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1141
    Height = 421
    Align = alTop
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'id_sorevnovanie'
        Title.Alignment = taCenter
        Title.Caption = #8470
        Width = 30
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'disciplina_name'
        Title.Alignment = taCenter
        Title.Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sorevnovanie_name'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_name'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'people_count'
        Title.Alignment = taCenter
        Title.Caption = #1063#1077#1083'.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hotel_count'
        Title.Alignment = taCenter
        Title.Caption = #1044#1085#1077#1081' '#1087#1088#1086#1078
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'proezd_cost'
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1086#1077#1079#1076
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hotel_cost'
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1086#1078#1080#1074
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sut_count'
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1090#1086#1082
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pitanie_cost'
        Title.Alignment = taCenter
        Title.Caption = #1055#1080#1090#1072#1085
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sut_cost'
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1090#1086#1095#1085#1099#1077
        Visible = True
      end>
  end
  object cbConnDefs: TComboBox
    Left = 91
    Top = 431
    Width = 214
    Height = 21
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Style = csDropDownList
    TabOrder = 2
    OnClick = cbConnDefsClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'Database=..\SportDB.db')
    Connected = True
    Left = 640
    Top = 432
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 488
    Top = 432
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT id_sorevnovanie,disciplina_name, sorevnovanie_name,date_n' +
        'ame,people_count,hotel_count,proezd_cost,hotel_cost,sut_count,pi' +
        'tanie_cost,sut_cost FROM sorevnovanie'
      
        'INNER JOIN disciplina ON sorevnovanie.id_disciplina = disciplina' +
        '.id_disciplina'
      'INNER JOIN date ON date.id_date = sorevnovanie.id_date'
      'INNER JOIN plan ON plan.id_plan = sorevnovanie.id_plan')
    Left = 560
    Top = 432
  end
  object dlgOpen: TOpenDialog
    DefaultExt = '*.db'
    Filter = 'SQLite|*.db'
    Left = 704
    Top = 432
  end
end
