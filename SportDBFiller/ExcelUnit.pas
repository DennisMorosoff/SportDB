unit ExcelUnit;

interface

uses System.Variants, Excel_TLB, Office_TLB, VBIDE_TLB, System.SysUtils;

function GetExcelInputData(ExcelWorkbooks: Workbooks;
  InpCol, OutCol: String): HRESULT;

function DeleteEmptyRows(ASheet: ExcelWorksheet; KeyCol: String;
  Count: Integer): HRESULT;

const
  CHALLENGE_COUNT: Integer = 50;
  CHALLENGE_START: Integer = 9;

implementation

function GetExcelInputData(ExcelWorkbooks: Workbooks;
  InpCol, OutCol: String): HRESULT;
var
  i: Integer;
  ASheet: ExcelWorksheet;
  R: ExcelRange;
  StartRange: Integer;
begin
  for i := 3 to ExcelWorkbooks[1].Sheets.Count do
  begin
    StartRange := (i - 3) * 50 + 1;

    ASheet := (ExcelWorkbooks[1].Sheets.Item[i] as ExcelWorksheet);
    R := ASheet.Range[InpCol + IntToStr(CHALLENGE_START),
      InpCol + IntToStr(CHALLENGE_COUNT)];

    R.Copy(EmptyParam);

    (ExcelWorkbooks[1].Sheets.Item[1] as _Worksheet)
      .Range[OutCol + IntToStr(StartRange), OutCol + IntToStr(50 * (i - 2))
      ].PasteSpecial(xlPasteValues, xlPasteSpecialOperationNone, False, False);

    (ExcelWorkbooks[1].Sheets.Item[1] as _Worksheet)
      .Range['A' + IntToStr(StartRange), 'A' + IntToStr(50 * (i - 2))].Value2 :=
      ASheet.Name;

  end;
end;

function DeleteEmptyRows(ASheet: ExcelWorksheet; KeyCol: String;
  Count: Integer): HRESULT;
var
  CurrRow: Integer;
begin
  for CurrRow := 1 to Count do
  begin
    if ASheet.Range[KeyCol + IntToStr(CurrRow),EmptyParam].Value2 = '' then
      ASheet.Range['A' + IntToStr(CurrRow), EmptyParam].EntireRow.Delete
        (xlShiftUp);
  end;
end;

end.
