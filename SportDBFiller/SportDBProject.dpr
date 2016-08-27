program SportDBProject;

uses
  Vcl.Forms,
  MainFormUnit in 'MainFormUnit.pas' {NameForm} ,
  Excel_TLB in 'Excel_TLB.pas',
  Graph_TLB in 'Graph_TLB.pas',
  Office_TLB in 'Office_TLB.pas',
  VBIDE_TLB in 'VBIDE_TLB.pas',
  ExcelUnit in 'ExcelUnit.pas';

{$R *.res}

begin
  Vcl.Forms.Application.Initialize;
  Vcl.Forms.Application.MainFormOnTaskbar := True;
  Vcl.Forms.Application.CreateForm(TNameForm, NameForm);
  Vcl.Forms.Application.Run;

end.
