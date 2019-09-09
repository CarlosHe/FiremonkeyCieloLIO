program CieloLIO;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {Main},
  Android.CieloLIO in 'Android.CieloLIO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
