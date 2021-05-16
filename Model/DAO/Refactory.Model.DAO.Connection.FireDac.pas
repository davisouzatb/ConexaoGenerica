unit Refactory.Model.DAO.Connection.FireDac;

interface

uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.DApt,
  FireDAC.Stan.Param,
  FireDAC.Comp.Client,
  Refactory.Model.DAO.Interfaces;

type
  TModelDAOConnection = class(TInterfacedObject, iModelDAOConnection)
      private
        FConnection : TFDConnection;
        FQuery : TFDQuery;
      public
        constructor Create;
        Destructor Destroy; override;
        class function New : iModelDAOConnection;
        function Active( aValue : Boolean) : iModelDAOConnection;
        function DataSet : TDataSet;
        function SQLClear : iModelDAOConnection;
        function SQL( aValue : String) : iModelDAOConnection;
        function AddParam( aParam: String; aValue : Variant): iModelDAOConnection;
        function Open : iModelDAOConnection;

  end;

implementation

{ TModelDAOConnection }

function TModelDAOConnection.Active(aValue: Boolean): iModelDAOConnection;
begin
  Result := Self;
  FQuery.Active := aValue;
end;

function TModelDAOConnection.AddParam(aParam: String; aValue: Variant): iModelDAOConnection;
begin
  Result := Self;
  FQuery.ParamByName(aParam).Value := aValue;
end;

constructor TModelDAOConnection.Create;
begin
  FConnection := TFDConnection.Create(nil);
  FConnection.DriverName := 'SQLite';
  FConnection.Params.Database := 'D:\Programas\Refactory\Data\banco.db';
  FConnection.Params.Add('LockingMode = Normal');
  FConnection.Connected := True;
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FConnection;
end;

destructor TModelDAOConnection.Destroy;
begin
  FQuery.DisposeOf;
  FConnection.DisposeOf;
  inherited;
end;

class function TModelDAOConnection.New: iModelDAOConnection;
begin
  Result := Self.Create;
end;

function TModelDAOConnection.Open: iModelDAOConnection;
begin
  FQuery.Open;
end;

function TModelDAOConnection.DataSet: TDataSet;
begin
  Result := FQuery;
end;

function TModelDAOConnection.SQL(aValue: String): iModelDAOConnection;
begin
  Result := Self;
  FQuery.SQL.Add(aValue);
end;

function TModelDAOConnection.SQLClear: iModelDAOConnection;
begin
  Result := Self;
  FQuery.SQL.Clear;
end;

end.
