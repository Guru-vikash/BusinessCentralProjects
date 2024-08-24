tableextension 50124 ItemQRCode extends Item
{
    fields
    {
        // Add changes to table fields here
        field(250; QRCode; MediaSet)
        {
            DataClassification = ToBeClassified;
            Caption = 'QR Code';

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

}