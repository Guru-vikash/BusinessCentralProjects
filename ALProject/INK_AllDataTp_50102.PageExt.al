pageextension 50102 AllDataTp extends "Vendor Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        Big_int: BigInteger;
        Big_text: BigText;
        varSubText: Text;   //return type

        InStream: InStream;
        OutStream: OutStream;
        Post_text: Text;
        k: Integer;
        item: Record Item;
        Bool: Boolean;

        Char: Char;
        CharInteger: Integer;

    // begin
    //     Big_int := -9223372036854775807L;

    //     //BigInt
    // Message('BigInt :'+Big_int);   //can't concatenate
    // Message('BigInt : %1 \ BigInt :%2', Big_int + 1, Big_int - 1);

    //     //BigText
    //     Big_text.AddText('Bikash is currently pracitce AL code .');
    //     // Big_text.AddText(' Pradhan', 7);
    //     // // // Big_text.AddText('Mr.', 0);
    //     // Message('%1', Big_text);

    //     Big_text.GetSubText(varSubText, 3, 5);  //kash
    //     //Big_text.GetSubText(varSubText, 0, 5); //if u are using position no. is 0 show error or length can't be -ve
    //     Message('SubTest value is : %1', varSubText);  //this is return the value 

    //     //Message('Length of BigText : %1', Big_text.Length());


    //     // Big_text.Read(InStream);
    //     // Message('Read : %1', Big_text);

    //     //Big_text.AddText('Hy,This is Bikas Pradhan.');
    //     Post_text := 'This';
    //     // k := Big_text.TextPos(Post_text);
    //     // Message('TextPos value is :%1', k); //return 4 because start match value is 4


    //     // Bool := Big_text.Write(OutStream);
    //     // if Bool then
    //     //     Message('OutStream value is :%1', Bool)
    //     // else
    //     //     Message('Not convert into OutStream');



    // end;



    // var
    //     bool1, bool2 : Boolean;
    // trigger OnOpenPage()

    // begin
    //     bool1 := true;
    //     bool2 := false;

    //     if bool1 then
    //         Message('Boolean value is :%1', bool1)
    //     else
    //         Message('Boolean value is :%1', bool2)


    // end;

    // var
    //     B: Byte;

    // trigger OnOpenPage()
    // begin
    //     B := 'A';
    //     Message('Byte value : %1', B);

    // end;



    // var
    //     Fname: Code[10];
    //     Lname: Code[20];
    //     sub: text;

    // trigger OnOpenPage()
    // begin
    //     Fname := 'Bikash ';
    //     Lname := ' Pradhan';
    //     Message('Code values := %1 %2', Fname, Lname);
    // end;


    //Date
    var
        date1: Date;
        date2: Date;
        DateTim: DateTime;


    // var
    //     decimal: Decimal;

    // trigger OnOpenPage()
    // begin
    //     decimal := 3749.798;
    //     Message('Decimal value is :%1', decimal);
    // end;


    var
        dialog_con: Boolean;
        Qust: Text;
        Error_msg: Label 'Your are selecting wrong geneder,Bikash is boy acc. no. is #1###';
        acc_no: Integer;
        Msg: ErrorInfo;

        text: Text;
        Num: Decimal;
        text001: Label 'This is message window :\';

        option: Text[30];
        selected: Integer;
        mydialog: Dialog;


    // trigger OnOpenPage()
    // begin

    // acc_no := 1234;
    // Qust := 'Bikash is a boy?';
    // dialog_con := Dialog.Confirm(Qust, true);
    // Msg.Message('This is Errorinfo message ');
    // if dialog_con then
    //     Message('Bikash is a boy ?, %1', dialog_con)
    // else
    //     Error(Error_msg, acc_no);
    // Error(Msg);
    // Message('This line is not run.');

    // Message('App publisher :Hello world');
    // text := 'Akash';
    // Num := 123.78;
    // Message(text001 + 'The no. is %1 and name is %2', Num, text);


    // option := 'save,delete,exit ,find';

    // selected := Dialog.StrMenu(option, 2);
    // mydialog.Open('Dialog open');
    // message('Selected menu :%1', selected);
    // Sleep(1000);
    // mydialog.Close();

    // HttpTest();

    // end;

    var
        SalData: Record "Sales Header";

    // trigger OnOpenPage()
    // begin

    //     // CharInteger := 23484;
    //     //     Char := CharInteger;

    //     //     Message('Byte value : %1', Char);

    //     // date1 := 20300305D;
    //     // date2 := System.Today();
    //     // DateTim := CreateDateTime(date2, 0T);
    //     // Message('Defalut date :%1 ', date1);
    //     // Message('Today date : %1 \ Today DateTime is :%2 ', Format(date2), DateTim);

    //     // JsonTest(SalData);
    //     // ReadJson();
    // end;


    // local procedure HttpTest()
    // var
    //     http: HttpClient;
    //     request: HttpRequestMessage;
    //     response: HttpResponseMessage;
    //     Content: HttpContent;
    //     url: Text;
    //     txt: Text;
    // begin
    //     // url := 'https://jsonplaceholder.typicode.com/users';  //https://jsonplaceholder.typicode.com/users
    //     // // request.SetRequestUri(url);
    //     // // Message('Successfly Send to url.')
    //     // http.Get(url, response);
    //     // if response.IsSuccessStatusCode() then
    //     //     Content := response.Content
    //     // else
    //     //     Error('Response was negative %1 ,%2', response.HttpStatusCode, response.ReasonPhrase);
    //     // response.Content.ReadAs(txt);
    //     // Message(txt);

    //     //Method 2
    //     // request.SetRequestUri('https://jsonplaceholder.typicode.com/users');
    //     // request.Method('Get');
    //     // http.Send(request, response);
    //     // JsonTest();
    // end;


    // local procedure JsonTest(SalesHeader: Record "Sales Header")
    // var
    //     jsonObj: JsonObject;
    //     JsonArr: JsonArray;
    //     data: Record "Sales Line";
    //     HeaderJson: JsonObject;
    //     jsontok: JsonToken;
    //     jsonTxt: Text;
    // begin
    //     HeaderJson.Add('DocumentType', SalesHeader."Document Type".AsInteger());
    //     HeaderJson.Add('No.', SalesHeader."No.");
    //     HeaderJson.add('SellToCustNo', SalesHeader."Sell-to Customer No.");

    //     data.SetRange("Document Type", SalesHeader."Document Type");
    //     data.SetRange("Document No.", SalesHeader."No.");

    //     if data.FindSet() then
    //         repeat
    //             Clear(jsonObj);
    //             jsonObj.Add('Line no.', data."Line No.");
    //             jsonObj.Add('Type.', data.Type.AsInteger());
    //             jsonObj.Add('No.', data."No.");

    //             JsonArr.Add(jsonObj);

    //         until data.Next() = 0;


    //     HeaderJson.Add('Line', JsonArr);
    //     HeaderJson.WriteTo(jsonTxt);
    //     // Message(jsonTxt);
    //     // Message(Format(HeaderJson));


    //     // JsonArr.Add('Black');
    //     // JsonArr.Add('Blue');

    //     // jsonObj.add('Color', JsonArr);

    //     // Message('Json Object :%1', Format(jsonObj));
    //     // Message('Json Object wiht string :%1', str);

    // end;

    // local procedure ReadJson()
    // var
    //     JsonResp: JsonObject;
    //     jsonToken: JsonToken;
    //     jsonObj: JsonObject;
    //     txt: Text;
    // begin
    //     // if JsonResp.ReadFrom(String) then begin
    //     //     JsonResp.Get('data', jsonToken);

    //     //     jsonToken.AsObject().Get('DocumentType', jsonToken);
    //     // end;
    //     jsonObj.Add('Name', 'bikash');

    //     if jsonObj.Get('Name', jsonToken) then
    //         txt := jsonToken.AsValue().AsText();
    //     // Message(Format(txt));

    // end;


    trigger OnOpenPage()

    begin
        // IFelse();
        // nestIf();
        // whileText();
        // ForEac();
        // CaseState();
        // Repeat_Until();
        // ALlDataType_Ranges();
        // LWS();
        // Conversion();
        // DateFormate();
        // RemoveSpace();
        // String8();
        // Time_test();
        // Dict_Test();
        Arr_str();
        // Unique_val();
    end;

    // trigger OnClosePage()

    // begin


    // end;

    local procedure ReapFile()
    var
        TesFile: File;
    begin

        // TesFile.Open('E:\AllCodes\ALProject\INK_Enum50108.al',TextEncoding::Windows);

    end;

    // local procedure cal()
    // var
    //     list: List of [Text];
    // begin
    //     list.add('5');
    //     list.add('+');
    //     list.add('10');
    //     list.add('-');
    //     list.add('3');
    //     Message('List values :- ', list);
    // end;

    local procedure IFelse()

    var
        City1, City2 : Text;
        no1, no2 : Integer;
    begin
        City1 := 'Ber';
        City2 := 'Ber';
        no1 := 12;
        no2 := 13;
        if (City1 = City2) and (no1 = no2) then begin
            Message('match');
        end
        else begin
            Message('not match');
        end;
    end;

    local procedure nestIf() intge: Boolean
    var
        a: Integer;
        x: Integer;
        y: Integer;
        z: Integer;
    begin



        x := 10;
        y := 15;
        for x := 10 to 20 do begin
            x += 1;
            if x = y then
                Message('%1', x);
            exit(true);


        end;



        // if (x <> y) and (x = z) then
        //     y -= z;

        // Message('Y value := %1', y);
        // exit(true);
    end;



    local procedure whileText()
    var
        myInt: Integer;
        names: array[5] of Text;
        index: Integer;
        x: Integer;
        y: Integer;
    begin
        names[1] := 'Abhi';
        names[2] := 'Bikash';
        names[3] := 'Vedant';
        names[4] := 'Sankat';

        while index < 5 do begin
            index += 1;
            Message('Name :%1', names[index]);
        end;


    end;

    local procedure CaseState()
    var
        level: Integer;
        Msg: Text;

    begin
        level := 5;
        case level of
            1 .. 3:
                begin
                    Msg := 'Easy mode ';
                    Message(Msg);
                end;
            4 .. 6:
                begin
                    Msg := 'Meduim mode ';
                    Message(Msg);
                end;
            7 .. 10:
                begin
                    Msg := 'Difficulty mode ';
                    Message(Msg);
                end;
            else
                Msg := 'Not select any mode !!';
                Message(Msg);

        end;
    end;

    local procedure ForEac()
    var
        cusName: Text;
        names: List of [Text];
    begin
        names.Add('Abhi');
        names.Add('Akash');
        names.Add('Rakes');
        names.Add('Smruti');
        foreach cusName in names do
            Message(cusName);
    end;

    local procedure Repeat_Until()
    var
        x: Integer;
        y: Integer;
    begin
        x := 10;
        y := 15;
        if x < y then begin
            repeat
                x += 1;
            until x = y;
            Message('Repeat values are  matched :%1,%2', x, y);
        end;

    end;


    procedure Mycal(box: List of [Text])
    var
    // box: List of [Text]
    begin
        box.Add('1');
        box.Add('+');
        box.Add('10');
        box.Add('-');
        box.Add('1');

    end;

    local procedure ALlDataType_Ranges()
    var
        Text: Text;
        BigText: BigText;
        Char: Char;
        Code: Code[10];
        Label: Label 'Range infinite';
        Byte: Byte;
        Integer: Integer;
        BigInteger: BigInteger;
        Decimal: Decimal;
        boolean: Boolean;
        Date: Date;
        Time: Time;
        DateTime: DateTime;
        Duration: Duration;
        Guid: Guid;
        Option: Option A,B,C,D;
        Enum: Enum YesNo;
    begin
        Text := 'This is text field';
        Message(Text);
        BigText.AddText('Add');
        BigText.AddText('large text with methd AddText', 4);
        Message(Format(BigText));
        Char := 'A';
        Message('Char range 0 to 65535.:=%1', Char);
        code := 'bikash';
        Message('Code value :-%1', code);
        Message('Lable value ', Label);
        Byte := 123;
        Message('Byte is 8-bit character as a value in the range 0 to 255.value := %1', Byte);
        Integer := 2147483647;
        Message('Ingeter := Stores whole numbers with values that range from -2,147,483,647 to 2,147,483,647.\ value:=%1', Integer);
        Message('BigInteger := Stores very large whole numbers that range from -9,223,372,036,854,775,807 to 9,223,372,036,854,775,807 ');
        Decimal := 999999999999999.99;
        Message('Decimal := Denotes decimal numbers ranging from -999,999,999,999,999.99 to +999,999,999,999,999.99.\ value :=%1', Decimal);
        boolean := true;
        Message('Boolean := Indicates true or false .\value := %1', boolean);
        Date := 89001223D;
        Message('Date := ranging from January 1, 1753 to December 31, 9999.Example is %1', Date);
        Time := 235959.999T;
        Message('Time := Denotes a time ranging from 00:00:00.000 to 23:59:59.999. An undefined or blank time is specified by 0T. \ value :=%1', Time);
        Message('DateTime := Denotes a date and time ranging from January 1, 1753, 00:00:00.000 to December 31, 9999, 23:59:59.999. An undefined or blank DateTime is specified by 0DT');
        Message('Duration :=It is stored as a 64-bit integer');
        Message('Guid :=Represents a 16 byte binary data type (User of Unique ID)');
        Option := Option::D;
        Message('Option value :=%1', Option);
        Message('Enum value := %1', Enum);

    end;

    local procedure LWS()
    var
        example: Text;
        code: Text;
        stirng: Text;
        New_string: Text;
        position: Integer;
        string2: Text;

    begin
        example := 'L,W,S';
        stirng := 'Adjusting prices - Please wait';
        string2 := 'Account no. 99 does not balance';
        position := StrLen('Adjusting prices');

        Code := example.ToLower();
        message('L,W,S to lowecase :=%1', code);
        dialog_con := Dialog.Confirm('Do you want to leave without saving ?', true);
        Message('%1', dialog_con);
        New_string := DelStr(stirng, position);
        Message('New stirng :=%1', New_string);
        Message('Account no. changed := %1', IncStr(string2));

    end;

    local procedure RemoveSpace()
    var
        String: Text;
        i, j : Integer;
        String_ws: Text;
        string_w: Text;
        string_s: Text;
        string_spa: Text;
    begin
        String := 'Windy West Solutions';
        // String_Space := '';
        // j := 1;
        // for i := 1 to StrLen(String) do
        //     if String[i] <> ' ' then begin
        //         String_Space[j] := String[i];
        //         j += 1;
        //     end;
        // String := String_Space.ToLower();
        String_ws := DelChr(String, '<>', 'Ws');  //other symboles =,>,<
        string_w := DelChr(String, '<', 'W');
        string_s := DelChr(String, '>', 's');
        string_spa := DelChr(String, '=', 'W,w,s');
        Message(' <>:%1 \ <:=%2 \ >:=%3 \ = :=%4', String_ws, string_w, string_s, string_spa);

    end;

    local procedure String8()
    var
        String: Text[50];
        Str_len: Integer;
        pos: Integer;
        Sting2: Text;
        se: Integer;
        Last_ind: Integer;
    begin
        String := 'This is an example.';
        // Str_len := StrLen(String);                         // find string length
        Str_len := MaxStrLen(String);
        pos := StrPos(String, 'example.');
        message('New String Length : %1 \ Acutal String length :%2 \ position of example :%3', Str_len, String, pos);
        Sting2 := 'She sells seashells by the seashore';
        // se := StrPos(Sting2, 'se');
        Last_ind := Sting2.LastIndexOf('se');
        Message('Last occurance of (se) is := %1', Last_ind);
        Message('Bikas');
    end;

    //Task : 10
    local procedure Conversion()
    var
        Byte: Byte;
        Integer: Integer;
        BigInteger: BigInteger;
        decimal: Decimal;
        Date: Date;
        time: Time;
        DateTime: DateTime;
        DateTime2: DateTime;
        Duration: Duration;
        Guid: Guid;

        By_txt: Text;
        Int_txt: Text;
        big_txt: Text;
        dec_txt: Text;
        date_txt: Text;
        time_txt: Text;
        DT_text: Text;
        dura_text: Text;
        guid_txt: text;
    begin
        Byte := 123;
        By_txt := System.Format(Byte);
        Integer := 29384;
        Int_txt := Format(Integer);
        BigInteger := 922337203;
        big_txt := Format(BigInteger);
        decimal := 844.78;
        dec_txt := Format(decimal);
        Date := 12340911D;
        date_txt := Format(Date);
        time := 115900T;
        time_txt := Format(time);
        // DateTime := 123409DT;
        DateTime := CreateDateTime(20090101D, 080000T); // January 1, 2009 at 08:00:00 AM  
        DateTime2 := CreateDateTime(20090505D, 133001T);
        Duration := DateTime2 - DateTime;
        DT_text := Format(DateTime);
        dura_text := Format(Duration);
        Guid := '8BD8A4D1-4540-4A49-B808-1DBF8A999F42';
        Message('%1 \ %2 \ %3 \ %4 \%5 \ %6 \ %7 \ %8 \ %9 ', By_txt, Int_txt, big_txt, dec_txt, date_txt, time_txt, DT_text, dura_text, Guid);
    end;

    local procedure DateFormate()
    var
        date: Date;
        Txt: Text;
    begin
        Message('12/16/23 formate := %1', Format(20231216D, 0, '<Month,2>/<Day,2>/<Year,2>'));
        // Message('12/16/23 formate := %1', Format(20231216D, 0, '<Closing><Month,2>/<Day,2>/<Year,2>'));
        // Message('12/16/23 formate := %1', Format(20231216D, 0, '<Month,2>/<Closing><Day,2>/<Year,2>'));
        // Message('12/16/23 formate := %1', Format(20231216D, 0, '<Month,2>/<Day,2>/<Closing><Year,2>'));  // for analysis
        Message('16-12-2023 formate := %1', Format(20231216D, 0, '<Day,2>-<Month,2>-<Year4>'));
        Message('2023-16-12 formate := %1', Format(20231216D, 0, '<Year4>-<Day,2>-<Month,2>'));
        Message('6.Dec 2023 formate := %1', Format(20231206D, 0, '<Day,1>.<Month Text,3> <Year4>'));
    end;


    local procedure Time_test()
    var
        time: Time;
    begin
        time := 023638T;//3836
        Message('2:36 formate := %1', Format(time, 0, '<Hours24,1>:<Minutes,2>'));
        Message('2:36:38 formate := %1', Format(time, 0, '<Hours24,2>:<Minutes,2>:<Seconds,2>'));
        Message('2:36 PM formate := %1', Format(143638T, 0, '<Hours24,2>:<Minutes,2> <AM/PM>'));
        Message('2:36:38.305 PM formate := %1', Format(143638.305T, 0, '<Hours24,2>:<Minutes,2>:<Seconds,2><Second dec.> <AM/PM>'));
    end;

    local procedure Dict_Test()
    var
        CustomersDictonary: Dictionary of [Text, List of [text]];
        i: Integer;
        k: Text;
        val: Text;
        list: List of [Text];
        list2: List of [Text];
        name1: Text;
        name2: Text;
        str1: Text;
        str2: Text;
    begin
        list.Add('Abhi');
        list.Add('Sankat');
        list.Add('Siba');
        list2.Add('Radha');
        list2.Add('Somya');
        list2.Add('Payal');
        CustomersDictonary.Add('USA', list);
        CustomersDictonary.Add('CAD', list2);
        // Message('key : %1', CustomersDictonary.Keys);
        // Message('val : %1', CustomersDictonary.Values);
        // Message('key : %1', CustomersDictonary.Count);
        if CustomersDictonary.Get('USA', list) or CustomersDictonary.Get('CAD', list2) then begin
            foreach name1 in list do begin
                str1 += name1 + ',';
            end;
            foreach name2 in list2 do begin
                str2 += name2 + ',';
            end;
            Message('USA := %1\ CAD:= %2', str1, str2);


        end;
        // foreach CustomersDictonary to 
    end;

    var
        Final_txt: Text;
        ConStr: Text;

    local procedure Arr_str()
    var
        arr1: array[4] of integer;  //12, 34, 56, 24
        arr2: array[5] of Integer;       //12,56,89,56,23   //it can't define array due to 5 out of array range
        arr3: array[4] of integer;        //12, 34, 22, 34
        arr1_txt: Text;
        arr2_txt: Text;
        arr3_txt: Text;
        len: Integer;
        len2: Integer;
        len3: Integer;
        i, F_val, L_val, j : Integer;
        txt: Text;

        li: List of [Integer];
        New_list: List of [Integer];
        count: Integer;
        remove: Integer;

    begin
        arr1[1] := 12;           //array1
        arr1[2] := 34;
        arr1[3] := 56;
        arr1[4] := 24;

        arr2[1] := 12;
        arr2[2] := 56;
        arr2[3] := 89;
        arr2[4] := 56;
        arr2[5] := 23;

        arr3[1] := 12;
        arr3[2] := 34;
        arr3[3] := 22;
        arr3[4] := 34;

        len := ArrayLen(arr1);
        len2 := ArrayLen(arr2);
        len3 := ArrayLen(arr3);

        for i := 1 to len do begin
            arr1_txt := arr1_txt + Format(arr1[i]) + ',';
            // li.Add(arr1[i]);
        end;

        for i := 1 to len2 do begin
            arr2_txt := arr2_txt + Format(arr2[i]) + ',';
            // li.Add(arr2[i]);
        end;

        for i := 1 to len3 do begin
            arr3_txt := arr3_txt + Format(arr3[i]) + ',';
            // li.Add(arr1[i]);
        end;
        // Final_txt := arr1_txt + '|' + arr2_txt + '|' + arr3_txt;


        Final_txt := CopyStr(arr1_txt, 1, StrLen(arr1_txt) - 1) + '|' +
        CopyStr(arr2_txt, 1, StrLen(arr2_txt) - 1) + '|' +
        CopyStr(arr3_txt, 1, StrLen(arr3_txt) - 1);

        Message('New string := %1', Final_txt);                     // add Strring  

        ConStr := ConvertStr(Final_txt, '|', ',');
        Unique_val(ConStr);
        // k := li.IndexOf(12);
        // j := li.LastIndexOf(12);
        // remove := li.RemoveAt(j);
        // Message('K:%1,J: %2', k, j);
        // txt := SelectStr(1, Final_txt);
        // Message('%1', txt);
        // for i := 1 to li.Count do begin
        //     if li.IndexOf(i)
        // end;

    end;

    local procedure Unique_val(NewArr: Text)
    var
        I: Integer;
        J, k, l, z : Integer;
        tem_arr: array[20] of Text;
        newTemp: array[20] of Text;
        fText: text;
        count: Integer;
        New_final_string: Text;
    begin
        i := 1;

        k := 1;
        l := 1;

        while l <= 13 do begin
            tem_arr[l] := SelectStr(l, NewArr);
            l += 1;
        end;
        count := 0;


        while I <= 12 do begin
            J := I + 1;
            while J <= 13 do begin
                if tem_arr[I] = tem_arr[J] then begin
                    System.Clear(tem_arr[J]);
                    count += 1;
                end;
                j += 1;
            end;
            I += 1;
        end;

        for z := 1 to ArrayLen(tem_arr) do begin
            fText += tem_arr[z];
        end;
        // New_final_string := DelChr(fText, '=', ',,');
        Message('New unique value String  :{%1}', fText);

    end;


}



