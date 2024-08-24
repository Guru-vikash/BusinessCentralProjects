xmlport 50133 ExportData
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

                XmlName = 'CustomerHeader';
                // SourceTableView = sorting("No.") where();
                textelement(CustomerNo)
                {
                    trigger OnBeforePassVariable()
                    begin
                        CustomerNo := Customer.FieldCaption("No.");
                    end;
                }
                textelement(CustomerName)
                {
                    trigger OnBeforePassVariable()
                    begin
                        CustomerName := Customer.FieldCaption(Name);
                    end;
                }
                textelement(CustomerEmail)
                {
                    trigger OnBeforePassVariable()
                    begin
                        CustomerEmail := Customer.FieldCaption("E-Mail");
                    end;
                }
                textelement(CustomerPhoneno)
                {
                    trigger OnBeforePassVariable()
                    begin
                        CustomerPhoneno := Customer.FieldCaption("Phone No.");
                    end;
                }
                textelement(CustomerAddress)
                {
                    trigger OnBeforePassVariable()
                    begin
                        CustomerAddress := Customer.FieldCaption(Address);
                    end;
                }
                // textelement(CustomerName)
                // {
                //     trigger OnBeforePassVariable()
                //     begin
                //         CustomerName := Customer.Name;
                //     end;
                // }
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

    var
        myInt: Integer;
}