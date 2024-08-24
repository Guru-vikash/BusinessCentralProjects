page 50122 PicURLDialog
{
    PageType = StandardDialog;
    Caption = 'Picture URL Dialog';

    layout
    {
        area(Content)
        {

            field(ItemNo; ItemNo)
            {
                ApplicationArea = All;
                Caption = 'Item No.';
                Editable = false;

            }

            field(ItemDesc; ItemDesc)
            {
                ApplicationArea = All;
                Caption = 'Item Description ';
                Editable = false;

            }

            field(PictureURL; PictureURL)
            {
                ApplicationArea = All;
                Caption = 'Pictuer URL ';
                ExtendedDatatype = URL;

            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        ItemNo: Code[20];
        ItemDesc: Text[70];
        PictureURL: Text[1000];

    procedure SetItemInfo(NewItemNo: Code[20]; NewItemDesc: Text[70])
    begin
        ItemNo := NewItemNo;
        ItemDesc := NewItemDesc;

    end;

    procedure ImportItemPicFromURL()
    var
        Item: Record Item;
        Clien: HttpClient;
        Content: HttpContent;
        Response: HttpResponseMessage;
        InStr: InStream;
    begin
        Clien.Get(PictureURL, Response);
        Response.Content.ReadAs(InStr);
        if Item.Get(ItemNo) then begin
            Clear(Item.Picture);
            Item.Picture.ImportStream(InStr, 'Demo picture for Item' + Format(Item."No."));
            Item.Modify(true);
        end;

    end;
}