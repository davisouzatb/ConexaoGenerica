unit Refactory.Model.DAO.Interfaces;

interface

uses
  Data.DB;

type

  iModelDAOConnection = interface
    ['{4BF86541-6F52-4BBA-9EF2-38B574134410}']
    function Active( aValue : Boolean) : iModelDAOConnection;
    function DataSet : TDataSet;
    function SQLClear : iModelDAOConnection;
    function SQL( aValue : String) : iModelDAOConnection;
    function AddParam( aParam: String; aValue : Variant): iModelDAOConnection;
    function Open : iModelDAOConnection;
  end;

implementation

end.
