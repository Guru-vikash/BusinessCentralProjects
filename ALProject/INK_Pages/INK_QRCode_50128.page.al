page 50128 QRCodePage
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Item;

    layout
    {
        area(Content)
        {

            field(QRCode; Rec.QRCode)
            {
                ApplicationArea = Invoicing, Basic, Suite;
                ShowCaption = false;

            }

        }


    }

    actions
    {
        area(Processing)
        {
            action("Generate QR-Code")
            {
                ApplicationArea = All;
                Image = Picture;

                trigger OnAction()
                var
                    inStr: InStream;
                    Base64Cvt: Codeunit "Base64 Convert";
                    TM: Record "Tenant Media";
                    OutStr: OutStream;
                    Client: HttpClient;
                    res: HttpResponseMessage;
                    req: HttpRequestMessage;
                    url: Text;
                begin
                    // TM.Init();
                    // TM.ID := CreateGuid();
                    // TM.Description := StrSubstNo('Signature%1', Format(CurrentDateTime));
                    // TM."Mime Type" := 'image/jpeg';
                    // TM."Company Name" := 'Cronus';
                    // TM."File Name" := TM.Description + '.jpg';
                    // TM.Height := 250;
                    // TM.Width := 250;

                    // TM.CalcFields(Content);


                    if item.Get(Rec."No.") then begin

                        Data := QRCodeGenerate();
                        // Message(Data);
                        url := 'https://api.qrserver.com/v1/create-qr-code/?size=160x160&data=' + Data;

                        if Client.Get(url, res) then begin
                            if res.IsSuccessStatusCode() then begin
                                res.Content.ReadAs(inStr);
                                Clear(Rec.QRCode);

                                Rec.QRCode.ImportStream(inStr, url);
                                Rec.Modify(true);

                            end;
                        end;
                    end;

                    // TM.Content.CreateOutStream(Outstr);
                    // Base64Cvt.FromBase64(PictEncodedText, OutStr);
                    // TM.Insert;
                    // Item.Get(Rec."No.");

                    // Clear(Item.QRCode);
                    // TempBlob.CreateOutStream(OutStr);
                    // Base64Cvt.FromBase64(PictEncodedText, OutStr);
                    // TempBlob.CreateInStream(InStr);
                    // mediaSetId := Rec.QRCode.ImportStream(inStr, fileName);
                    // Item.QRCode.Insert(TM.ID);
                    // Item.Modify(true);







                    //Image Import 

                    // ClientFileName := '';
                    // UploadIntoStream('Import', '', 'All Files(*.*)|*.*', ClientFileName, inStr);
                    // if ClientFileName <> '' then begin
                    //     fileName := fileMng.GetFileName(ClientFileName);
                    //     Clear(Rec.QRCode);
                    //     Rec.QRCode.ImportStream(inStr, fileName);
                    //     // Rec.QRCode.ImportFile(inStr, ClientFileName);        (OnPrem)
                    //     Rec.Modify(true);
                    // end;



                end;
            }
            action("Clera QR-Code")
            {
                trigger OnAction()
                begin
                    if not Confirm('Are yount want to Delete ?') then
                        exit;

                    Clear(Rec.QRCode);
                    Rec.Modify(true);
                end;
            }
        }
    }
    var
        item: Record Item;
        ItemCardQRCode: Report ItemCardQRCode;
        Data: Text;
        ItemNo: Code[20];
        ItemDesc: Text[100];
        ItemPrice: Integer;
        ItemAssBom: Boolean;

        QRCode1: Text;
        BarCodeStr: Text;
        TLVStr: Text;
        Ino: Text;
        IDesc: Text;
        IPrice: Text;
        IAssBom: Text;

    local procedure QRCodeGenerate(): Text
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
        len1 := StrLen(Rec."No.");
        Ino := Format(T1) + Format(len1) + Format(Rec."No.");


        T2 := 02;
        len2 := StrLen(Rec.Description);
        IDesc := Format(T2) + Format(len2) + Format(Rec.Description);

        T3 := 03;
        len3 := StrLen(Format(Rec."Unit Price"));
        // val3 := TypeHelper.IntToHex(Item."Unit Price");
        IPrice := Format(T3) + Format(len3) + Format(Rec."Unit Price");

        T4 := 04;
        len4 := StrLen(Format(Rec."Assembly BOM"));
        IAssBom := Format(T4) + Format(len4) + Format(Rec."Assembly BOM");



        BarCodeStr := Ino + IDesc + IPrice + IAssBom;
        TLVStr := Base64.ToBase64(BarCodeStr);
        QRCode1 := BarcodeFontProvider2D.EncodeFont(TLVStr, BarcodeSymbolgy2D);
        exit(TLVStr);
    end;
}
