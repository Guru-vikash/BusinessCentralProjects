table 50112 Demo
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; Name; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; Name2; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        // field(4;Type; Enum )
        // {
        //     DataClassification = ToBeClassified;

        // }
        // field(4;Option; OptionMembers)
        // {
        //     DataClassification = ToBeClassified;

        // }
    }

    keys
    {
        key(PK; No)
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