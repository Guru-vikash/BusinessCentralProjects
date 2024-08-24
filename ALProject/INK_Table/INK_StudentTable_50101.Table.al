table 50101 INK_StudentTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; EnrollNo; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; S_no; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; S_Name; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Address; Text[500])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; EnrollNo, S_no)
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