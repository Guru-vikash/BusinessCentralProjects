xmlport 50132 CustomerXml
{
    Format = VariableText;
    Direction = Both;
    TextEncoding = UTF8;
    UseRequestPage = false;
    TableSeparator = '';
    schema
    {
        textelement(Root)
        {
            tableelement(Customer; Customer)
            {
                // fieldattribute("No."; Customer."No.")
                // {

                // }
                XmlName = 'CustomerDataXMLPort';
                RequestFilterFields = "No.";
                fieldelement("No."; Customer."No.")
                {

                }
                fieldelement("Name"; Customer.Name)
                {

                }
                fieldelement("E-Mail"; Customer."E-Mail")
                {

                }
                fieldelement("PhoneNo."; Customer."Phone No.")
                {

                }
                fieldelement("Address"; Customer.Address)
                {

                }
                fieldelement("TaxAreaCode"; Customer."Tax Area Code")
                {

                }
                fieldelement("GenBusPostingGroup"; Customer."Gen. Bus. Posting Group")
                {

                }
                fieldelement("CustomerPostingGroup"; Customer."Customer Posting Group")
                {

                }
                fieldelement("PaymentTermsCode"; Customer."Payment Terms Code")
                {

                }


            }
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    // field(Name; SourceExpression)
                    // {

                    // }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {

                }
            }
        }
    }

    // trigger OnPreXmlPort()
    // begin
    //     Filename := currXMLport.Filename;


    // end;

    var
        myInt: Integer;
}