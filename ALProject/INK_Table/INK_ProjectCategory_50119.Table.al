table 50119 ProjectCategory
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = ToBeClassified;


        }
        field(2; Description; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(3; ProjectCount; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(4; ProjectCount1; Integer)
        {
            CalcFormula = count(Project where(Proj_Cat_Code = field(Code)));
            FieldClass = FlowField;

        }


    }

    keys
    {
        key(PK; Code)
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