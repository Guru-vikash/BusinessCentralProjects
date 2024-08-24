table 50126 Project
{
    DataClassification = ToBeClassified;

    fields
    {
        field(100; "No."; Code[20])
        {
            DataClassification = ToBeClassified;


        }
        field(400; "Proj_Cat_Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(200; "Name"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(300; "Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 2;

        }
        field(500; "County/Region Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region".Code;
        }
        field(600; "Currency Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }

    }

    keys
    {
        key(PK; "No.", "Proj_Cat_Code")
        {
            Clustered = true;
        }

    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        Text: Text;
        Int: Integer;

    trigger OnInsert()

    begin
        // Rec."No." := '0';

        // if Rec."No." = '' then begin
        //     Int += 1000;
        //     Rec."No." := Format(Int);

        // end
        // else begin
        //     Int += 1000;
        //     rec."No." := Format(Int);
        // end;


    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}