page 50127 Project
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Project;
    Caption = 'Project';



    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                    // trigger OnValidate()
                    // var
                    //     proj: Record Project;
                    // begin
                    //     Rec."No." := proj."No.";

                    // end;

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                    ShowMandatory = true;

                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    Caption = 'Amount';
                    ShowMandatory = true;
                }
                field("County/Region Code"; Rec."County/Region Code")
                {
                    ApplicationArea = All;
                    Caption = 'County/Region Code';

                    trigger OnValidate()
                    var
                        Country_region: Record "Country/Region";
                        curr: Record Currency;
                        val: Text;
                    begin
                        if Country_region.Get(Rec."County/Region Code") then begin
                            // if Country_region."ISO Numeric Code" = curr."ISO Numeric Code" then begin
                            //     Rec."County/Region Code" := Country_region.Code;
                            //     Rec."Currency Code" := curr.Symbol;
                            // end;

                            // Message(Country_region."ISO Numeric Code");
                            // Message(curr.FindSet(Country_region."ISO Numeric Code"));
                            curr.SetRange("ISO Numeric Code", Country_region."ISO Numeric Code");
                            curr.FindFirst();
                            // Message('%1,%2', curr, curr);
                            val := curr."ISO Numeric Code";

                            Country_region.SetRange("ISO Numeric Code", val);
                            if Country_region.FindFirst() then begin

                                Rec."Currency Code" := curr.Code;
                            end
                            else
                                Error('There is no ISO Numeric Code for this %1 country', Country_region."County Name");


                        end;
                    end;

                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    Caption = 'Currency Code';
                    // TableRelation = Currency.Code;
                }
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
            action("Record Count")
            {
                ApplicationArea = All;


            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        Rec."No." := '0';

        if Rec."No." = '' then begin
            Int := 1000;
            Rec."No." := Format(Int);
        end
        else begin
            Int += 1000;
            rec."No." := Format(Int);
        end;
    end;

    var
        Int: Integer;
}