unit MainFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, Vcl.StdCtrls, Data.FMTBcd, Data.SqlExpr, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    cbConnDefs: TComboBox;
    Label2: TLabel;
    dlgOpen: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure cbConnDefsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
 FDConnection1.Open;
end;

procedure TForm1.cbConnDefsClick(Sender: TObject);
begin
  if not dlgOpen.Execute then
    Exit;
  with FDConnection1 do begin
    Close;
    // create temporary connection definition
    with Params do begin
      Clear;
      Add('DriverID=SQLite');
      Add('Database=' + dlgOpen.FileName);
    end;
    Open;
    FDQuery1.Open;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  cbConnDefs.Clear;
  cbConnDefs.Items.Add('<Откройте базу данных...>');

  dlgOpen.InitialDir := FDManager.ActualConnectionDefFileName;
end;

end.
