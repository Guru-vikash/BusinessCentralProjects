pageextension 50107 ItemQRCode extends "Item Card"
{
    layout
    {
        // Add changes to page layout here
        addbefore("No.")
        {
            // field(TLVString; TLVString)
            // {
            //     ApplicationArea = all;
            //     Caption = 'TLV String';
            // }
        }

        addafter(EntityTextFactBox)
        {
            part(QRCodePage; QRCodePage)
            {
                Caption = 'QR Code';
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");

            }

        }


    }
    actions
    {
        // Add changes to page actions here
        addafter(ApplyTemplate)
        {

            // action("Get QR-Code in FactBox")
            // {
            //     ApplicationArea = all;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     Image = Picture;


            //     trigger OnAction()


            //     begin
            //         // Hyperlink(GetUrl(ClientType::Current, Rec.CurrentCompany, ObjectType::Page, Page::"Item Card"));
            //         if Item.Get(Rec."No.") then begin
            //             SetItemInfo(Rec."No.", Rec.Description);
            //             // PictEncodedText := ItemCardQRCodeRep.QRCodeGenerate();
            //             // Base64ToQRCode();
            //             Message('PictEncodedText:=%1', PictEncodedText);
            //         end;

            //     end;
            // }
            action("Generate Item QR-Code")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                Image = Report;
                trigger OnAction()
                var
                    item: page "Item Card";
                    Pur: Record "Purchase Header";

                    ItemCardQRCodeRep: Report ItemCardQRCode;
                    Role: Page "Role Center Overview";
                    Role1: Page "Business Manager Role Center";
                begin

                    ItemCardQRCodeRep.AssignBarcode(Rec."No.", Rec.Description, GetUrl(ClientType::Current, CompanyName, ObjectType::Page, Page::"Item Card", Rec));
                    ItemCardQRCodeRep.Run();

                end;

            }
        }
    }



    // local procedure Base64ToQRCode()
    // var
    //     fileMng: Codeunit "File Management";
    //     Tempblob: Codeunit "Temp Blob";
    //     instr: InStream;
    //     OutStr: OutStream;
    //     Base64Cvt: Codeunit "Base64 Convert";
    //     fileName: Text;
    //     TenantMedia: Record "Tenant Media";
    //     ImageLbl1: Label '%1_image.jpg';


    // begin

    //     PictEncodedText := ItemCardQRCodeRep.QRCodeGenerate();
    //     fileName := ItemDesc + '.png';
    //     TempBlob.CreateOutStream(OutStr);
    //     Base64Cvt.FromBase64(PictEncodedText, OutStr);
    //     TempBlob.CreateInStream(InStr);

    //     Clear(Item.Picture);
    //     Item.Picture.ImportStream(InStr, fileName);
    //     Item.Modify(true);


    // end;








    // local procedure QRCodeGenerate()
    // var
    //     BarcodeSymbolgy2D: Enum "Barcode Symbology 2D";
    //     BarcodeFontProvider2D: Interface "Barcode Font Provider 2D";
    //     BarCodeStr: Text;
    // begin
    //     BarcodeFontProvider2D := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
    //     BarcodeSymbolgy2D := Enum::"Barcode Symbology 2D"::"QR-Code";
    //     QRCode := BarcodeFontProvider2D.EncodeFont(BarcodeURL, BarcodeSymbolgy2D);
    //     // Message('%1', QRCode);
    // end;
    // local procedure QRCodeGenerate()
    // var
    //     OutStr: OutStream;
    //     InStr: InStream;
    //     Item: Record Item;
    //     QRCode: Codeunit "Swiss QR Code Helper";
    //     QRStr64: Text;
    //     Tempblob: Codeunit "Temp Blob";
    // begin
    //     QRStr64 := Item."No." + '|' + Item.Description;

    //     Tempblob.CreateInStream(InStr);
    //     QRCode.GenerateQRCodeImage(QRStr64, Tempblob);
    //     Comp_info.Reset();
    //     Comp_info.DeleteAll();

    //     Comp_info.Init();
    //     Comp_info.Picture.CreateOutStream(OutStr);
    //     CopyStream(OutStr, InStr);
    //     Comp_info.Insert(true);
    //     Comp_info.CalcFields(Picture);
    //     Comp_info.Picture.CreateInStream(InStr);
    //     // InStr.Read(x);
    //     // Message('%1', x);

    //     Clear(Item.Picture);
    //     Item.Picture.ImportStream(InStr, 'Demo picture for Item' + Format(Item."No."));
    //     Item.Modify(true);

    // end;

    // local procedure AssignBarcode(ItemNo: Code[20]; ItemDesc: Text[100]; NewBarcodeURL: Text)
    // begin
    //     Item."No." := ItemNo;
    //     Item.Description := ItemDesc;
    //     BarcodeURL := NewBarcodeURL;

    // end;

    var


        Brcode: Text;

        BarcodeURL: Text;
        Comp_info: Record "Company Information" temporary;
        Item: Record Item;
        ItemNo: Code[20];
        ItemDesc: Text;
        PictEncodedText: Text;
        ItemCardQRCodeRep: Report ItemCardQRCode;

        TLVString: Text;


}