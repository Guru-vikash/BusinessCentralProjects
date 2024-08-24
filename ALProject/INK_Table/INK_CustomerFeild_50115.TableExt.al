tableextension 50115 Custemer_filed extends "Customer Templ."
{
    fields
    {

        field(50115; Nickname; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Nikname';
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
        Nickname: Text;
}