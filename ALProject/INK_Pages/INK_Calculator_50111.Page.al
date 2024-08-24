page 50111 Calculator
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    // SourceTable = TableName;

    layout
    {
        area(Content)
        {
            // group(GroupName)
            // {

            grid(Grid1)
            {

                field(label7; label7)
                {
                    ApplicationArea = All;
                    Caption = 'N0 7';


                    trigger OnDrillDown()
                    begin
                        val := 7;
                        if op = '' then
                            int1 := 7
                        else
                            int2 := 7

                    end;

                }

                field(label8; label8)
                {
                    ApplicationArea = All;
                    Caption = 'No 8';


                    trigger OnDrillDown()
                    begin
                        val := 8;
                        if op = '' then
                            int1 := 8
                        else
                            int2 := 8
                    end;

                }
                field(label9; label9)
                {
                    ApplicationArea = All;
                    Caption = 'No 9';


                    trigger OnDrillDown()
                    begin
                        val := 9;
                        if op = '' then
                            int1 := 9
                        else
                            int2 := 9
                    end;

                }

            }
            grid(Grid2)
            {

                field(labe4; label4)
                {
                    ApplicationArea = All;
                    Caption = 'No 4';


                    trigger OnDrillDown()
                    begin
                        val := 4;
                        if op = '' then
                            int1 := 4
                        else
                            int2 := 4
                    end;

                }

                field(label5; label5)
                {
                    ApplicationArea = All;
                    Caption = 'No 5';
                    trigger OnDrillDown()
                    begin
                        val := 5;
                        if op = '' then
                            int1 := 5
                        else
                            int2 := 5
                    end;

                }
                field(label6; label6)
                {
                    ApplicationArea = All;
                    Caption = 'No6';


                    trigger OnDrillDown()
                    begin
                        val := 6;
                        if op = '' then
                            int1 := 6
                        else
                            int2 := 6
                    end;

                }

            }
            grid(Grid3)
            {

                field(label1; label1)
                {
                    ApplicationArea = All;
                    Caption = 'No1';


                    trigger OnDrillDown()
                    begin
                        val := 1;
                        if op = '' then
                            int1 := 1
                        else
                            int2 := 1

                    end;

                }

                field(label2; label2)
                {
                    ApplicationArea = All;
                    Caption = 'No2';


                    trigger OnDrillDown()
                    begin
                        val := 2;
                        if op = '' then
                            int1 := 2
                        else
                            int2 := 2


                    end;

                }
                field(label3; label3)
                {
                    ApplicationArea = All;
                    Caption = 'No3';


                    trigger OnDrillDown()
                    begin
                        val := 3;
                        if op = '' then
                            int1 := 3
                        else
                            int2 := 3

                    end;

                }

            }
            grid(Grid4)
            {
                field(Ans; Ans)
                {
                    ApplicationArea = All;
                    Caption = 'Answer';

                }
            }

            field(int1; int1)
            {
                ApplicationArea = All;
                Caption = 'First Value';
            }
            field(int2; int2)
            {
                ApplicationArea = All;
                Caption = 'Second Value';
            }
            field(op; op)
            {
                ApplicationArea = All;
                Caption = 'Operator';


            }



            // }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Operation")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    // op := '=';

                    Cal(op);

                    int1 := Ans;
                    op := '';
                    // Clear(Ans);

                end;

            }
            action("Addition")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                begin
                    op := '+';
                    // Cal(op, val);
                    Cal(op);
                    int1 := Ans;


                end;
            }
            action("Substraction")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    op := '-';
                    // Operator(op);
                    Cal(op);
                end;
            }
            action("Multiplication")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    op := '*';

                    Cal(op);
                end;
            }
            action("Division")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    op := '/';
                    // Operator(op);
                    // Cal(op, val);
                end;
            }
            action("Clear")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    int1 := 0;
                    int2 := 0;
                    Ans := 0;
                end;
            }
        }
        area(Promoted)
        {
            group(Numbers)
            {

            }
        }

    }


    // local procedure Operator(Oper: Text) return: Text

    // begin
    //     if Oper = ' ' then
    //         Message('No operator selected')
    //     else
    //         return := Oper;

    // end;

    var
        x: Integer;
        b: Integer;
        v1: Integer;
        v2: Integer;

    local procedure Cal(op: Text)


    begin

        // if op = '+''-' then

        if op = '+' then
            Ans := int1 + int2;
        if op = '-' then begin
            Ans := int1 - int2;
        end;

        if op = '*' then begin
            Ans := int1 * int2;
        end;

        if op = '/' then begin
            if int2 = 0 then
                Message('Denominator in 0 canot divided')
            else
                Ans := int1 / int2;


        end;



        // Clear(Ans);

    end;




    var

        label1: Label ' 1', Comment = '1', Locked = false;
        label2: Label ' 2', Comment = '2', Locked = false;
        label3: Label ' 3', Comment = '3', Locked = false;

        label4: Label ' 4', Comment = '4', Locked = false;
        label5: Label ' 5', Comment = '5', Locked = false;
        label6: Label ' 6', Comment = '6', Locked = false;

        label7: Label ' 7', Comment = '7', Locked = false;
        label8: Label ' 8', Comment = '8', Locked = false;
        label9: Label ' 9', Comment = '9', Locked = false;

        label0: Label ' 0', Comment = '0', Locked = false;
        Ans: Integer;
        val: Integer;
        int1: Integer;
        int2: Integer;

        op: Text;
        operand1: Integer;
        operand2: Integer;
        Answer: Integer;


    // local procedure Add(operand1: Integer; operand2: Integer): Integer
    // var
    // begin
    //     Answer := operand1 + operand2;
    //     exit(Answer);
    // end;

    // local procedure Sub(operand1: Integer; operand2: Integer): Integer
    // var
    // begin
    //     Answer := operand1 + operand2;
    //     exit(Answer);

    // end;

    // local procedure Mul(operand1: Integer; operand2: Integer): Integer
    // var
    // begin
    //     Answer := operand1 + operand2;
    //     exit(Answer);
    // end;

    // local procedure Divi(operand1: Integer; operand2: Integer): Integer
    // var
    // begin
    //     Answer := operand1 + operand2;
    //     exit(Answer);
    // end;

}