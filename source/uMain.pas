unit uMain;

interface

uses
    System.SysUtils
  , System.Classes
  , Vcl.Forms
  , rss
  , Vcl.StdCtrls
  , SHDocVw
  , Vcl.Controls
  , Vcl.OleCtrls
  ;

type
  TfMain = class(TForm)
    lst: TListBox;
    Preview: TWebBrowser;
    procedure lstClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
  end;

var
  fMain : TfMain;
  rss   : IXMLRSSType;

function ProcessRSS: Integer;

implementation

uses
    ActiveX
  ;

{$R *.dfm}

function ProcessRSS: Integer;
const
  FilterFN = '\filter.txt';
var
  i, j    : Integer;
  Filter  : TStringList;
  Valid   : Boolean;
begin
  if FileExists(ExtractFilePath(Application.ExeName) + FilterFN)
    then begin
      Filter := TStringList.Create;
      Filter.LoadFromFile(ExtractFilePath(Application.ExeName) + FilterFN);
    end;

  // Série 1
  rss := LoadRSSFromURL('https://files.diariodarepublica.pt/rss/serie1-html.xml', ExtractFilePath(Application.ExeName));
  for i:=0 to rss.Channel.Item.Count-1 do
    begin
      if
          Assigned(Filter) and
          (Filter.Count > 0)
        then begin
          Valid := False;
          for j := 0 to Filter.Count - 1 do
            if Pos(AnsiUpperCase(Filter[j]), AnsiUpperCase(rss.Channel.Item[i].Title + rss.Channel.Item[i].Description)) > 0
              then begin
                Valid := True;
                Break;
              end;
        end
        else Valid := True;

      if Valid
        then fMain.lst.AddItem(rss.Channel.Item[i].Title, TObject(i));
    end;

  // Série 2
  rss := LoadRSSFromURL('https://files.diariodarepublica.pt/rss/serie2-html.xml', ExtractFilePath(Application.ExeName));
  for i:=0 to rss.Channel.Item.Count-1 do
    begin
      if
          Assigned(Filter) and
          (Filter.Count > 0)
        then begin
          Valid := False;
          for j := 0 to Filter.Count - 1 do
            if Pos(AnsiUpperCase(Filter[j]), AnsiUpperCase(rss.Channel.Item[i].Title + rss.Channel.Item[i].Description)) > 0
              then begin
                Valid := True;
                Break;
              end;
        end
        else Valid := True;

      if Valid
        then fMain.lst.AddItem(rss.Channel.Item[i].Title, TObject(i));
    end;

  Result := fMain.Lst.Items.Count;

  if Assigned(Filter)
    then Filter.Free;
end;

procedure WBLoadHTML(WebBrowser: TWebBrowser; HTMLCode: string);
var
  sl: TStringList;
  ms: TMemoryStream;
begin
  WebBrowser.Navigate('about:blank');
  while WebBrowser.ReadyState < READYSTATE_INTERACTIVE do
    Application.ProcessMessages;

  if Assigned(WebBrowser.Document)
    then begin
      sl := TStringList.Create;
      try
        ms := TMemoryStream.Create;
        try
          sl.Text := HTMLCode;
          sl.SaveToStream(ms);
          ms.Seek(0, 0);
          (WebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(ms));
        finally
          ms.Free;
        end;
      finally
        sl.Free;
      end;
    end;
end;

procedure TfMain.FormShow(Sender: TObject);
begin
  if lst.Items.Count > 0
    then begin
      lst.ItemIndex := 0;
      lstClick(Sender);
    end;
  Caption := Caption + FormatDateTime('yyyy-mm-dd', Date);
end;

procedure TfMain.lstClick(Sender: TObject);
begin
  if
      (lst.ItemIndex >= 0) and
      (lst.ItemIndex < rss.Channel.Item.Count)
    then WBLoadHTML(Preview,rss.Channel.Item[Integer(lst.Items.Objects[lst.ItemIndex])].Description);
end;

end.

