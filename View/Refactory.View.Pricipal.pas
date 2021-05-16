unit Refactory.View.Pricipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Refactory.Model.DAO.Interfaces,
  Refactory.Model.DAO.Connection.FireDac, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TPrincipal = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FQuery : iModelDAOConnection;
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

{$R *.dfm}

procedure TPrincipal.Button1Click(Sender: TObject);
begin
  FQuery
    .SQLClear
    .SQL('select * from TAB_LANCAMENTO')
    .Open;
end;

procedure TPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;

  FQuery := TModelDAOConnection.New;
  DataSource1.DataSet := FQuery.DataSet
end;

end.
