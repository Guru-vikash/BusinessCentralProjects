tableextension 50117 CustomerAddField extends Customer
{
    fields
    {
        field(50117; "Nickname"; Text[100])
        {
            DataClassification = ToBeClassified;
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