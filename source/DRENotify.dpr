program DRENotify;

uses
  Vcl.Forms,
  uMain in 'uMain.pas',
  rss in 'rss.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  if ProcessRSS > 0
    then Application.Run;
end.
