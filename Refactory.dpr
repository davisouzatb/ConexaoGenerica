program Refactory;

uses
  Vcl.Forms,
  Refactory.View.Pricipal in 'View\Refactory.View.Pricipal.pas' {Principal},
  Refactory.Model.DAO.Interfaces in 'Model\DAO\Refactory.Model.DAO.Interfaces.pas',
  Refactory.Model.DAO.Connection.FireDac in 'Model\DAO\Refactory.Model.DAO.Connection.FireDac.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrincipal, Principal);
  Application.Run;
end.
