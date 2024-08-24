page 50103 MyDataTypePage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = BLOB;
    Caption = 'Data Type Card';
    Editable = false;

    layout
    {
        area(Content)
        {
            group("Fundamentral of DataType")
            {
                field(No; No)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'No.(Int)';
                    ToolTip = 'This is number.';

                    trigger OnAssistEdit()
                    begin

                    end;

                }
                field(myInt; myInt)
                {
                    ApplicationArea = All;
                    Caption = 'Integer';

                }
                field(myInt2; myInt2)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Integer(BigInt)';

                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                    Caption = 'Name(Text)';
                    Visible = false;


                }
                field(Name2; Name2)
                {
                    ApplicationArea = All;
                    Caption = 'Name2(BigText)';

                }
                field(Type; Type)
                {
                    ApplicationArea = All;
                    Caption = 'Type(Yes/No)';

                }
                field(YesNo; YesNo)
                {
                    ApplicationArea = All;
                    Caption = 'Type';


                }
                field(code; codes)
                {
                    ApplicationArea = All;
                    Caption = 'Code';

                }
                field(Date; Date)
                {
                    ApplicationArea = All;
                    Caption = 'Date';

                }
                field(DateTim; DateTim)
                {
                    ApplicationArea = All;
                    Caption = 'DateTime';

                }
                field(Guid; Guid)
                {
                    ApplicationArea = All;
                    Caption = 'Guid';

                }
                field(Time; Time)
                {
                    ApplicationArea = All;
                    Caption = 'Time';

                    trigger OnAfterLookup(Selected: RecordRef)
                    begin
                        "Time" := System.Time();
                    end;

                }
                field(Byte; Byte)
                {
                    ApplicationArea = All;
                    Caption = 'Byte';
                    AboutText = 'Only store 8 bits character';


                }
                field(option; option)
                {
                    ApplicationArea = All;
                    Caption = 'Option';

                }
                field(a; a)
                {
                    ApplicationArea = All;
                    Caption = 'Lable';
                    trigger OnAfterLookup(Selected: RecordRef)
                    begin
                        Message('Print 1');
                    end;

                }
                field(Uppercase; Uppercase)
                {
                    ApplicationArea = All;
                    Caption = 'Uppercase(Text)';

                    trigger OnValidate()
                    var
                        text: Text;
                    begin
                        Uppercase := Text.ToUpper();
                    end;

                }
                field(Lowercase; Lowercase)
                {
                    ApplicationArea = All;
                    Caption = 'Lowercase(Text)';

                    trigger OnValidate()
                    var
                        text: Text;
                    begin
                        Lowercase := Text.ToLower();
                    end;

                }
            }
            grid("NestIF")

            {
                field(val1; val1)
                {
                    ApplicationArea = All;
                    Caption = 'A';
                }
                field(val2; val2)
                {
                    ApplicationArea = All;
                    Caption = 'B';
                }
                field(val3; val3)
                {
                    ApplicationArea = All;
                    Caption = 'C';
                    trigger OnDrillDown()
                    begin
                        NestIfElse();
                    end;
                }
            }
            group("BloB Example")
            {
                field(Blob; Rec.BolbEx)
                {
                    ApplicationArea = ALl;
                    Caption = 'Pen Iamge';
                    // MultiLine = true;
                    trigger OnValidate()
                    begin

                    end;
                }
            }
            // group("ALL statements")
            // {
            //     field()
            //     {
            //         ApplicationArea = ALl;
            //         Caption = 'Pen Iamge';
            //         // MultiLine = true;
            //         trigger OnValidate()
            //         begin

            //         end;
            //     }
            // }
        }
    }

    actions
    {
        area(Processing)
        {
            action(AreaOfRect)
            {
                ApplicationArea = All;
                Caption = 'Area';

                trigger OnAction()
                begin
                    CodeUnit.Run()
                end;
            }
            action("Dialog")
            {
                ApplicationArea = All;
                // Caption = 'Post';

                trigger OnAction()
                var
                    selected: Integer;
                    mydialog: Dialog;
                    option: Text[30];
                begin
                    // option := 'save,delete,exit ,find';

                    selected := Dialog.StrMenu(option, 2);
                    mydialog.Open('Dialog open');
                    message('Selected menu :%1', selected);
                    Sleep(1000);
                    mydialog.Close();
                end;
            }
            action(Error)
            {
                ApplicationArea = All;
                Caption = 'Error';

                trigger OnAction()
                var
                    acc_no: Integer;
                    Qust: Text;
                    dialog_con: Boolean;
                    Msg: ErrorInfo;
                    Num: Decimal;
                    text001: Label 'This is message window :\';
                    Error_msg: Label 'Your are selecting wrong geneder,Bikash is boy acc. no. is #1###';
                    text: Text;

                begin
                    acc_no := 1234;
                    Qust := 'Bikash is a boy?';
                    dialog_con := Dialog.Confirm(Qust, true);
                    Msg.Message('This is Errorinfo message ');
                    if dialog_con then
                        Message('Bikash is a boy ?, %1', dialog_con)
                    else
                        Error(Error_msg, acc_no);
                    Error(Msg);
                    Message('This line is not run.');

                    Message('App publisher :Hello world');
                    text := 'Akash';
                    Num := 123.78;
                    Message(text001 + 'The no. is %1 and name is %2', Num, text);
                end;

            }
            action("HttpClient")
            {
                ApplicationArea = All;


                trigger OnAction()
                var
                    http: HttpClient;
                    request: HttpResponseMessage;
                    response: HttpResponseMessage;
                    Content: HttpContent;
                    url: Text;
                    txt: Text;
                    Header: HttpHeaders;
                    bool: Boolean;
                    jsonArr: JsonArray;
                    jsonObj: JsonObject;
                    jsonTok: JsonToken;
                    ListJsonTok: List of [JsonToken];
                    value: JsonValue;
                begin
                    url := 'https://jsonplaceholder.typicode.com/users';  //https://jsonplaceholder.typicode.com/users
                    // request.SetRequestUri(url);
                    // Message('Successfly Send to url.')
                    bool := http.Get(url, response);
                    // if response.IsSuccessStatusCode() then
                    if bool then
                        Content := response.Content
                    else
                        Error('Response was negative %1 ,%2', response.HttpStatusCode, response.ReasonPhrase);

                    response.Content.ReadAs(txt);
                    Message(txt);

                    // if jsonObj.Get('address', jsonArr) then

                    // jsonObj.ReadFrom(url);
                    // ListJsonTok := jsonObj.Values();
                    // Message('Json token value ', Format(ListJsonTok));
                    // jsonObj.Add('Name', 'bikash');

                    // if jsonObj.Get('Name', jsonTok) then
                    //     txt := jsonTok.AsValue().AsText();

                    // if ListJsonTok.Get(2).IsValue then begin
                    //     value := ListJsonTok.Get(2).AsValue();
                    //     Message(Format(value));
                    // end;

                    // http.Timeout(100);
                    // http.Clear();
                    // Message(txt);
                end;
            }
            action("All Statements")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    ForLoop();
                end;
            }
        }
    }

    // local procedure ReadJson(String: Text)
    // var
    //     JsonResp: JsonObject;
    //     jsonToken: JsonToken;
    // begin
    //     if JsonResp.ReadFrom(String) then begin
    //         JsonResp.Get('data', jsonToken);

    //         jsonToken.AsObject().Get('DocumentType', jsonToken);
    //         foreach jsonValue
    //     end;
    //     end;
    local procedure ForLoop()
    var
        val: Integer;
        List: Text;
        Array: array[5] of Integer;
    begin
        // for val := 1 to 5 do
        //     Message('%1', val);
        // foreach k in List do
        // Message()
        Array[1] := 10;
        Array[2] := 20;
        Array[3] := 30;
        Array[4] := 40;
        Array[5] := 50;

        for val := 5 downto 1 do begin
            Message('value :%1', Array[val]);
        end;
        val := 0;
        for val := 1 to 5 do begin
            val += val

        end;
        Message('Sum of ALL values :=%1', val);
    end;

    local procedure NestIfElse()
    var
        myInt: Integer;
    begin
        if val1 = val2 then
            if val1 = val3 then
                Message('All values are equal');
        if val1 > val2 then
            if val1 > val3 then
                Message('%1 is greater', val1);
        if val1 < val2 then
            if val1 < val3 then
                Message('%1 is smaller', val1);

    end;


    var
        myInt: Integer;
        myInt2: BigInteger;
        Name: Text;
        Name2: BigText;
        Type: Boolean;

        YesNo: Enum YesNo;

        codes: Code[10];

        Date: Date;

        DateTim: DateTime;
        Guid: Guid;

        Time: Time;
        Byte: Byte;

        CodeUnit: Codeunit Calculation;

        No: Integer;
        option: Option A,B,C;

        a: Label 'Jinal Maam', Comment = 'xyz', Locked = false;

        Uppercase: Text;
        Lowercase: Text;

        Http: HttpClient;

        Blob: Text;
        val1: Integer;
        val2: Integer;
        val3: Integer;



}