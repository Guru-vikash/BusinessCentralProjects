// tableextension 50131 Vendor extends Vendor
// {
//     fields
//     {
//         field(300; MyField; Integer)
//         {
//             DataClassification = ToBeClassified;
//         }
//     }

//     keys
//     {
//         // Add changes to keys here
//     }

//     fieldgroups
//     {
//         // Add changes to field groups here
//     }

//     var
//         myInt: Integer;
// }
reportextension 50131 CustomerRep extends "Customer - Top 10 List"
{
    dataset
    {
        // Add changes to dataitems and columns here
        add(Customer)
        {
            column(DisplayMsg; DisplayMsg)
            {
            }
            column(Address; Customer.Address)
            {

            }
        }
    }
    requestpage
    {
        // Add changes to the requestpage here
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'CustomerTop10List.rdl';
        }
    }
    var
        DisplayMsg: Label 'External Report Version';
}
