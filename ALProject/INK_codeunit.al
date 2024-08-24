codeunit 50106 Calculation
{
    trigger OnRun()
    var
        cust: Record Customer;
    begin
        // Lenght := 20;
        // Width := 30;

        // Txt := 'Success Fully Request';

        // Area_rec(Lenght, Width);
        // HttpTest(Txt, Resp);
        cust.Init();
        cust.Validate("Name 2", 'Execute through Job Queue');
        cust.Insert(true);
    end;

    procedure Area_rec(Length: Integer; Width: Integer)
    var
        RectangeArea: Integer;
    begin
        RectangeArea := Length * Width;
        Message('Area of the rectangel :=%1', RectangeArea);
    end;

    procedure HttpTest(Txt: Text; Resp: HttpResponseMessage)
    var

    begin
        Client.Get('https://learn.microsoft.com', Resp);
        if Resp.IsSuccessStatusCode() then
            Resp.Content().ReadAs(Txt);
        Message(Txt);
    end;

    local procedure SetLargText(NewLargeText: Text)
    var
        Ots: OutStream;

    begin
        // Clear(R);

    end;


    var
        Lenght: Integer;
        Width: Integer;

        Client: HttpClient;
        Resp: HttpResponseMessage;
        Txt: Text;
}





