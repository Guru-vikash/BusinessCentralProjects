table 50128 Project1
{
    DataClassification = ToBeClassified;

    fields
    {
        field(100; "No."; Code[20])
        {
            DataClassification = ToBeClassified;


        }
        field(200; "Proj_Cat_Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(300; "Name"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(400; "Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 2;

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
        myInt: Integer;

    trigger OnInsert()
    begin
        if "No." <> '' then begin
            "No." := '100';
        end;

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