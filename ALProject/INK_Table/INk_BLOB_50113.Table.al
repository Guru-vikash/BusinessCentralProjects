table 50113 BLOB
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
        field(3; BolbEx; Blob)
        {
            DataClassification = ToBeClassified;
            Subtype = Bitmap;
        }
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
        Instream: InStream;
        outStream: OutStream;


    trigger OnInsert()
    begin
        BolbEx.CreateInStream(Instream);
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