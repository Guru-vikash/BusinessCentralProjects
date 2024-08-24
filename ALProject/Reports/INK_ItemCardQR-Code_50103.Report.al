report 50103 ItemCardQRCode
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Item Card Barcodes';
    // DefaultRenderingLayout = ItemQRcode;
    DefaultLayout = RDLC;
    RDLCLayout = 'ItemCardBarcode.rdl';


    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = sorting("No.");

            RequestFilterFields = "No.";
            column(ItemNo; Item."No.")
            {
                IncludeCaption = true;
            }
            column(ItemDesc; Item.Description)
            {
                IncludeCaption = true;
            }
            column(ItemPrice; Item."Unit Price")
            {
                IncludeCaption = true;
            }
            column(ItemAssBom; Item."Assembly BOM")
            {
                IncludeCaption = true;
            }
            column(BarcodeURL; BarcodeURL)
            {

            }
            column(QRCode; QRCode)
            {

            }
            column(QRCode1; QRCode1)
            {

            }
            trigger OnAfterGetRecord()
            begin

                QRCodeGenerate();
                Message('TLVStr:= %1 ', TLVStr);
                Message('Barcide String:%1', BarCodeStr);

            end;

            trigger OnPreDataItem()
            begin
                SetFilter(Item."No.", ItemNo);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                group(URL)
                {
                    field(BarcodeURL; BarcodeURL)
                    {
                        ApplicationArea = All;
                        Caption = 'Barcode';
                        MultiLine = true;
                        Editable = false;

                    }
                    field(ItemNo; ItemNo)
                    {
                        ApplicationArea = All;
                        Caption = 'Item No.';
                        MultiLine = true;
                        Editable = false;

                    }
                    field(ItemDesc; ItemDesc)
                    {
                        ApplicationArea = All;
                        Caption = 'Item Description';
                        MultiLine = true;
                        Editable = false;

                    }

                }
            }


        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {
                    ApplicationArea = All;

                }
            }
        }
        trigger OnOpenPage()
        begin
            ItemNo := Item."No.";
            ItemDesc := Item.Description;
            ItemPrice := Item."Unit Price";
            ItemAssBom := Item."Assembly BOM";
        end;
    }

    // rendering
    // {
    //     layout(ItemQRcode)
    //     {
    //         Type = RDLC;
    //         LayoutFile = 'ItemCardBarcode.rdl';
    //     }
    // }

    procedure QRCodeGenerate()
    var
        BarcodeSymbolgy2D: Enum "Barcode Symbology 2D";
        BarcodeFontProvider2D: Interface "Barcode Font Provider 2D";
        Base64: Codeunit "Base64 Convert";

        PriceStr: Text;
        ItemAB: Integer;

        T1: Byte;
        T2: Byte;
        T3: Byte;
        T4: Byte;

        len1: Byte;
        len2: Byte;
        len3: Byte;
        len4: Byte;

    begin
        BarcodeFontProvider2D := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
        BarcodeSymbolgy2D := Enum::"Barcode Symbology 2D"::"QR-Code";

        T1 := 01;
        len1 := StrLen(ItemNo);
        Ino := Format(T1) + Format(len1) + Format(ItemNo);


        T2 := 02;
        len2 := StrLen(Item.Description);
        // input := Item.Description;
        // for i := 1 to StrLen(Item.Description) do begin
        //     b := input[i];
        //     output += TypeHelper.IntToHex(b);
        // end;
        IDesc := Format(T2) + Format(len2) + Format(Item.Description);

        T3 := 03;
        len3 := StrLen(Format(Item."Unit Price"));
        // val3 := TypeHelper.IntToHex(Item."Unit Price");
        IPrice := Format(T3) + Format(len3) + Format(Item."Unit Price");

        T4 := 04;
        len4 := StrLen(Format(Item."Assembly BOM"));
        IAssBom := Format(T4) + Format(len4) + Format(Item."Assembly BOM");



        BarCodeStr := Ino + IDesc + IPrice + IAssBom;
        TLVStr := Base64.ToBase64(BarCodeStr);
        QRCode1 := BarcodeFontProvider2D.EncodeFont(TLVStr, BarcodeSymbolgy2D);

    end;

    procedure AssignBarcode(ItemNo: Code[20]; ItemDesc: Text[100]; NewBarcodeURL: Text)//NewBarcodeURL: Text
    var
        Base64: Codeunit "Base64 Convert";
    begin
        Item."No." := ItemNo;
        Item.Description := ItemDesc;
        // Item."Unit Price" := ItemPrice;
        // Item."Assembly BOM" := ItemAssBom;
        // BarcodeURL := Base64.ToBase64(NewBarcodeURL);
        BarcodeURL := Base64.ToBase64(NewBarcodeURL);

    end;

    var
        ItemNo: Code[20];
        ItemDesc: Text[100];
        ItemPrice: Integer;
        ItemAssBom: Boolean;
        BarcodeURL: Text;
        QRCode1: Text;
        BarCodeStr: Text;
        TLVStr: Text;
        Ino: Text;
        IDesc: Text;
        IPrice: Text;
        IAssBom: Text;


}