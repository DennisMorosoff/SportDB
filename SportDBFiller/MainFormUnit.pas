unit MainFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TNameForm = class(TForm)
    Button1: TButton;
    InputFilenameEdit: TEdit;
    GroupBox1: TGroupBox;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NameForm: TNameForm;

implementation

{$R *.dfm}

uses Excel_TLB, ExcelUnit, Data.DB, Data.SqlExpr, Data.DbxSqlite;

procedure TNameForm.Button1Click(Sender: TObject);
var
  ExcelApp: ExcelApplication;
  ExcelWB: Workbooks;
begin
  ExcelApp := CoExcelApplication.Create;

  ExcelApp.Visible[0] := False;

  ExcelApp.Application.ReferenceStyle[0] := xlA1;

  // ExcelApp.Workbooks.Add(xlWBatWorkSheet, 0);

  ExcelApp.Workbooks.Open(InputFilenameEdit.Text, EmptyParam, EmptyParam,
    EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
    EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0);

  ExcelWB := ExcelApp.Workbooks;

  GetExcelInputData(ExcelWB, 'B', 'B');
  GetExcelInputData(ExcelWB, 'C', 'C');
  GetExcelInputData(ExcelWB, 'E', 'D');
  GetExcelInputData(ExcelWB, 'F', 'E');
  GetExcelInputData(ExcelWB, 'H', 'F');
  GetExcelInputData(ExcelWB, 'I', 'G');
  GetExcelInputData(ExcelWB, 'K', 'E');
  GetExcelInputData(ExcelWB, 'L', 'F');
  GetExcelInputData(ExcelWB, 'M', 'G');
  GetExcelInputData(ExcelWB, 'O', 'H');
  GetExcelInputData(ExcelWB, 'P', 'I');
  GetExcelInputData(ExcelWB, 'Q', 'J');
  GetExcelInputData(ExcelWB, 'S', 'K');
  GetExcelInputData(ExcelWB, 'T', 'L');
  GetExcelInputData(ExcelWB, 'U', 'M');
  GetExcelInputData(ExcelWB, 'AA', 'N');
  GetExcelInputData(ExcelWB, 'AB', 'O');
  GetExcelInputData(ExcelWB, 'AC', 'P');

  ExcelApp.Visible[0] := True;
end;

procedure TNameForm.Button2Click(Sender: TObject);
var
  FSQLiteConnection: TSQLConnection;
  Query: TQuery;
begin
  FSQLiteConnection := TSQLConnection.Create(self);
  FSQLiteConnection.DriverName := 'Sqlite';
  // параметры соединения//
  FSQLiteConnection.Params.Values['Database']
    = 'c:\Users\danner\Desktop\SportDBFiller\SportDD.db';
  FSQLiteConnection.Open;
  FSQLiteConnection.ExecuteDirect('CREATE TABLE [Plan] ( [asd] CHAR); ');

  FSQLiteConnection.Close;
end;

end.
