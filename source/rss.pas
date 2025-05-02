{*************************************************}
{                                                 }
{                XML Data Binding                 }
{                                                 }
{         Generated on: 28-02-2014 12:24:55       }
{       Generated from: E:\Nuno\Dropbox\rss.xml   }
{                                                 }
{*************************************************}

unit RSS;

interface

uses
    xmldom
  , XMLDoc
  , XMLIntf
  , Classes
  , System.Net.HttpClient
  , System.Net.HttpClientComponent
  , SysUtils
  ;

type

{ Forward Decls }

  IXMLRssType = interface;
  IXMLChannelType = interface;
  IXMLImageType = interface;
  IXMLItemType = interface;
  IXMLItemTypeList = interface;

{ IXMLRssType }

  IXMLRssType = interface(IXMLNode)
    ['{7E7F02DF-CC0E-4B7B-9B04-0B398F67CFBD}']
    { Property Accessors }
    function Get_Version: UnicodeString;
    function Get_Channel: IXMLChannelType;
    procedure Set_Version(Value: UnicodeString);
    { Methods & Properties }
    property Version: UnicodeString read Get_Version write Set_Version;
    property Channel: IXMLChannelType read Get_Channel;
  end;

{ IXMLChannelType }

  IXMLChannelType = interface(IXMLNode)
    ['{A4EDAF0D-FE3B-4879-B3CD-5D8E7A226C0F}']
    { Property Accessors }
    function Get_Title: UnicodeString;
    function Get_Link: UnicodeString;
    function Get_Description: Integer;
    function Get_Language: Integer;
    function Get_Ttl: Integer;
    function Get_Category: Integer;
    function Get_ManagingEditor: UnicodeString;
    function Get_WebMaster: UnicodeString;
    function Get_Copyright: Integer;
    function Get_Image: IXMLImageType;
    function Get_Item: IXMLItemTypeList;
    procedure Set_Title(Value: UnicodeString);
    procedure Set_Link(Value: UnicodeString);
    procedure Set_Description(Value: Integer);
    procedure Set_Language(Value: Integer);
    procedure Set_Ttl(Value: Integer);
    procedure Set_Category(Value: Integer);
    procedure Set_ManagingEditor(Value: UnicodeString);
    procedure Set_WebMaster(Value: UnicodeString);
    procedure Set_Copyright(Value: Integer);
    { Methods & Properties }
    property Title: UnicodeString read Get_Title write Set_Title;
    property Link: UnicodeString read Get_Link write Set_Link;
    property Description: Integer read Get_Description write Set_Description;
    property Language: Integer read Get_Language write Set_Language;
    property Ttl: Integer read Get_Ttl write Set_Ttl;
    property Category: Integer read Get_Category write Set_Category;
    property ManagingEditor: UnicodeString read Get_ManagingEditor write Set_ManagingEditor;
    property WebMaster: UnicodeString read Get_WebMaster write Set_WebMaster;
    property Copyright: Integer read Get_Copyright write Set_Copyright;
    property Image: IXMLImageType read Get_Image;
    property Item: IXMLItemTypeList read Get_Item;
  end;

{ IXMLImageType }

  IXMLImageType = interface(IXMLNode)
    ['{E6FE5EBE-DA50-4E4D-AC60-92D1D90D42D2}']
    { Property Accessors }
    function Get_Url: UnicodeString;
    function Get_Title: Integer;
    function Get_Link: UnicodeString;
    function Get_Width: Integer;
    procedure Set_Url(Value: UnicodeString);
    procedure Set_Title(Value: Integer);
    procedure Set_Link(Value: UnicodeString);
    procedure Set_Width(Value: Integer);
    { Methods & Properties }
    property Url: UnicodeString read Get_Url write Set_Url;
    property Title: Integer read Get_Title write Set_Title;
    property Link: UnicodeString read Get_Link write Set_Link;
    property Width: Integer read Get_Width write Set_Width;
  end;

{ IXMLItemType }

  IXMLItemType = interface(IXMLNode)
    ['{BFB8DFDC-DE16-41CA-9906-7A85E7D3C4A2}']
    { Property Accessors }
    function Get_Title: UnicodeString;
    function Get_Link: UnicodeString;
    function Get_Description: UnicodeString;
    function Get_Author: Integer;
    function Get_Category: Integer;
    procedure Set_Title(Value: UnicodeString);
    procedure Set_Link(Value: UnicodeString);
    procedure Set_Description(Value: UnicodeString);
    procedure Set_Author(Value: Integer);
    procedure Set_Category(Value: Integer);
    { Methods & Properties }
    property Title: UnicodeString read Get_Title write Set_Title;
    property Link: UnicodeString read Get_Link write Set_Link;
    property Description: UnicodeString read Get_Description write Set_Description;
    property Author: Integer read Get_Author write Set_Author;
    property Category: Integer read Get_Category write Set_Category;
  end;

{ IXMLItemTypeList }

  IXMLItemTypeList = interface(IXMLNodeCollection)
    ['{B4A0AE14-A606-4BF7-81FC-E83472706FD8}']
    { Methods & Properties }
    function Add: IXMLItemType;
    function Insert(const Index: Integer): IXMLItemType;

    function Get_Item(Index: Integer): IXMLItemType;
    property Items[Index: Integer]: IXMLItemType read Get_Item; default;
  end;

{ Forward Decls }

  TXMLRssType = class;
  TXMLChannelType = class;
  TXMLImageType = class;
  TXMLItemType = class;
  TXMLItemTypeList = class;

{ TXMLRssType }

  TXMLRssType = class(TXMLNode, IXMLRssType)
  protected
    { IXMLRssType }
    function Get_Version: UnicodeString;
    function Get_Channel: IXMLChannelType;
    procedure Set_Version(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLChannelType }

  TXMLChannelType = class(TXMLNode, IXMLChannelType)
  private
    FItem: IXMLItemTypeList;
  protected
    { IXMLChannelType }
    function Get_Title: UnicodeString;
    function Get_Link: UnicodeString;
    function Get_Description: Integer;
    function Get_Language: Integer;
    function Get_Ttl: Integer;
    function Get_Category: Integer;
    function Get_ManagingEditor: UnicodeString;
    function Get_WebMaster: UnicodeString;
    function Get_Copyright: Integer;
    function Get_Image: IXMLImageType;
    function Get_Item: IXMLItemTypeList;
    procedure Set_Title(Value: UnicodeString);
    procedure Set_Link(Value: UnicodeString);
    procedure Set_Description(Value: Integer);
    procedure Set_Language(Value: Integer);
    procedure Set_Ttl(Value: Integer);
    procedure Set_Category(Value: Integer);
    procedure Set_ManagingEditor(Value: UnicodeString);
    procedure Set_WebMaster(Value: UnicodeString);
    procedure Set_Copyright(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLImageType }

  TXMLImageType = class(TXMLNode, IXMLImageType)
  protected
    { IXMLImageType }
    function Get_Url: UnicodeString;
    function Get_Title: Integer;
    function Get_Link: UnicodeString;
    function Get_Width: Integer;
    procedure Set_Url(Value: UnicodeString);
    procedure Set_Title(Value: Integer);
    procedure Set_Link(Value: UnicodeString);
    procedure Set_Width(Value: Integer);
  end;

{ TXMLItemType }

  TXMLItemType = class(TXMLNode, IXMLItemType)
  protected
    { IXMLItemType }
    function Get_Title: UnicodeString;
    function Get_Link: UnicodeString;
    function Get_Description: UnicodeString;
    function Get_Author: Integer;
    function Get_Category: Integer;
    procedure Set_Title(Value: UnicodeString);
    procedure Set_Link(Value: UnicodeString);
    procedure Set_Description(Value: UnicodeString);
    procedure Set_Author(Value: Integer);
    procedure Set_Category(Value: Integer);
  end;

{ TXMLItemTypeList }

  TXMLItemTypeList = class(TXMLNodeCollection, IXMLItemTypeList)
  protected
    { IXMLItemTypeList }
    function Add: IXMLItemType;
    function Insert(const Index: Integer): IXMLItemType;

    function Get_Item(Index: Integer): IXMLItemType;
  end;

{ Global Functions }

function Getrss(Doc: IXMLDocument): IXMLRssType;
function Loadrss(const FileName: string): IXMLRssType;
function Newrss: IXMLRssType;
function LoadRSSFromURL(const URL, RSSPath:String): IXMLRSSType;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function Getrss(Doc: IXMLDocument): IXMLRssType;
begin
  Result := Doc.GetDocBinding('rss', TXMLRssType, TargetNamespace) as IXMLRssType;
end;

function Loadrss(const FileName: string): IXMLRssType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('rss', TXMLRssType, TargetNamespace) as IXMLRssType;
end;

function Newrss: IXMLRssType;
begin
  Result := NewXMLDocument.GetDocBinding('rss', TXMLRssType, TargetNamespace) as IXMLRssType;
end;

{ TXMLRssType }

procedure TXMLRssType.AfterConstruction;
begin
  RegisterChildNode('channel', TXMLChannelType);
  inherited;
end;

function TXMLRssType.Get_Version: UnicodeString;
begin
  Result := AttributeNodes['version'].Text;
end;

procedure TXMLRssType.Set_Version(Value: UnicodeString);
begin
  SetAttribute('version', Value);
end;

function TXMLRssType.Get_Channel: IXMLChannelType;
begin
  Result := ChildNodes['channel'] as IXMLChannelType;
end;

{ TXMLChannelType }

procedure TXMLChannelType.AfterConstruction;
begin
  RegisterChildNode('image', TXMLImageType);
  RegisterChildNode('item', TXMLItemType);
  FItem := CreateCollection(TXMLItemTypeList, IXMLItemType, 'item') as IXMLItemTypeList;
  inherited;
end;

function TXMLChannelType.Get_Title: UnicodeString;
begin
  Result := ChildNodes['title'].Text;
end;

procedure TXMLChannelType.Set_Title(Value: UnicodeString);
begin
  ChildNodes['title'].NodeValue := Value;
end;

function TXMLChannelType.Get_Link: UnicodeString;
begin
  Result := ChildNodes['link'].Text;
end;

procedure TXMLChannelType.Set_Link(Value: UnicodeString);
begin
  ChildNodes['link'].NodeValue := Value;
end;

function TXMLChannelType.Get_Description: Integer;
begin
  Result := ChildNodes['description'].NodeValue;
end;

procedure TXMLChannelType.Set_Description(Value: Integer);
begin
  ChildNodes['description'].NodeValue := Value;
end;

function TXMLChannelType.Get_Language: Integer;
begin
  Result := ChildNodes['language'].NodeValue;
end;

procedure TXMLChannelType.Set_Language(Value: Integer);
begin
  ChildNodes['language'].NodeValue := Value;
end;

function TXMLChannelType.Get_Ttl: Integer;
begin
  Result := ChildNodes['ttl'].NodeValue;
end;

procedure TXMLChannelType.Set_Ttl(Value: Integer);
begin
  ChildNodes['ttl'].NodeValue := Value;
end;

function TXMLChannelType.Get_Category: Integer;
begin
  Result := ChildNodes['category'].NodeValue;
end;

procedure TXMLChannelType.Set_Category(Value: Integer);
begin
  ChildNodes['category'].NodeValue := Value;
end;

function TXMLChannelType.Get_ManagingEditor: UnicodeString;
begin
  Result := ChildNodes['managingEditor'].Text;
end;

procedure TXMLChannelType.Set_ManagingEditor(Value: UnicodeString);
begin
  ChildNodes['managingEditor'].NodeValue := Value;
end;

function TXMLChannelType.Get_WebMaster: UnicodeString;
begin
  Result := ChildNodes['webMaster'].Text;
end;

procedure TXMLChannelType.Set_WebMaster(Value: UnicodeString);
begin
  ChildNodes['webMaster'].NodeValue := Value;
end;

function TXMLChannelType.Get_Copyright: Integer;
begin
  Result := ChildNodes['copyright'].NodeValue;
end;

procedure TXMLChannelType.Set_Copyright(Value: Integer);
begin
  ChildNodes['copyright'].NodeValue := Value;
end;

function TXMLChannelType.Get_Image: IXMLImageType;
begin
  Result := ChildNodes['image'] as IXMLImageType;
end;

function TXMLChannelType.Get_Item: IXMLItemTypeList;
begin
  Result := FItem;
end;

{ TXMLImageType }

function TXMLImageType.Get_Url: UnicodeString;
begin
  Result := ChildNodes['url'].Text;
end;

procedure TXMLImageType.Set_Url(Value: UnicodeString);
begin
  ChildNodes['url'].NodeValue := Value;
end;

function TXMLImageType.Get_Title: Integer;
begin
  Result := ChildNodes['title'].NodeValue;
end;

procedure TXMLImageType.Set_Title(Value: Integer);
begin
  ChildNodes['title'].NodeValue := Value;
end;

function TXMLImageType.Get_Link: UnicodeString;
begin
  Result := ChildNodes['link'].Text;
end;

procedure TXMLImageType.Set_Link(Value: UnicodeString);
begin
  ChildNodes['link'].NodeValue := Value;
end;

function TXMLImageType.Get_Width: Integer;
begin
  Result := ChildNodes['width'].NodeValue;
end;

procedure TXMLImageType.Set_Width(Value: Integer);
begin
  ChildNodes['width'].NodeValue := Value;
end;

{ TXMLItemType }

function TXMLItemType.Get_Title: UnicodeString;
begin
  Result := ChildNodes['title'].Text;
end;

procedure TXMLItemType.Set_Title(Value: UnicodeString);
begin
  ChildNodes['title'].NodeValue := Value;
end;

function TXMLItemType.Get_Link: UnicodeString;
begin
  Result := ChildNodes['link'].Text;
end;

procedure TXMLItemType.Set_Link(Value: UnicodeString);
begin
  ChildNodes['link'].NodeValue := Value;
end;

function TXMLItemType.Get_Description: UnicodeString;
begin
  Result := ChildNodes['description'].Text;
end;

procedure TXMLItemType.Set_Description(Value: UnicodeString);
begin
  ChildNodes['description'].NodeValue := Value;
end;

function TXMLItemType.Get_Author: Integer;
begin
  Result := ChildNodes['author'].NodeValue;
end;

procedure TXMLItemType.Set_Author(Value: Integer);
begin
  ChildNodes['author'].NodeValue := Value;
end;

function TXMLItemType.Get_Category: Integer;
begin
  Result := ChildNodes['category'].NodeValue;
end;

procedure TXMLItemType.Set_Category(Value: Integer);
begin
  ChildNodes['category'].NodeValue := Value;
end;

{ TXMLItemTypeList }

function TXMLItemTypeList.Add: IXMLItemType;
begin
  Result := AddItem(-1) as IXMLItemType;
end;

function TXMLItemTypeList.Insert(const Index: Integer): IXMLItemType;
begin
  Result := AddItem(Index) as IXMLItemType;
end;

function TXMLItemTypeList.Get_Item(Index: Integer): IXMLItemType;
begin
  Result := List[Index] as IXMLItemType;
end;

function LoadRSSFromURL(const URL, RSSPath: string): IXMLRSSType;
var
  HTTPClient   : TNetHTTPClient;
  RSSFile      : TStringList;
  RSSFileName  : string;
begin
  HTTPClient  := TNetHTTPClient.Create(nil);
  RSSFile     := TStringList.Create;
  try
    RSSFile.Text := HTTPClient.Get(URL).ContentAsString();

    if RSSFile.Count > 0
      then begin
        ForceDirectories(RSSPath);
        RSSFileName := IncludeTrailingPathDelimiter(RSSPath) + 'DRE' + FormatDateTime('yyyy-mm-dd', Date) + '.xml';
        RSSFile.SaveToFile(RSSFileName, TEncoding.UTF8);
        Result := LoadRSS(RSSFileName); // Presumo que esta função existe noutro lado
      end;
  finally
    RSSFile.Free;
    HTTPClient.Free;
  end;

  // Se quiseres apagar o ficheiro logo a seguir, assegura-te que já foi processado
  DeleteFile(RSSFileName);
end;

end.