report 50130 TestReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    Caption = 'Customer Report';
    // DefaultLayout =Word;
    // WordLayout='Customer Report.docx';


    dataset
    {
        dataitem(Customer; Customer)
        {
            column(Name; Name)
            {

            }
            column(City; City)
            {

            }
            column(Balance; Balance)
            {

            }
            column(Contact; Contact)
            {

            }
            column(Partner_Type; "Partner Type")
            {

            }


        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    // field(Name; SourceExpression)
                    // {
                    //     ApplicationArea = All;

                    // }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = Word;
            LayoutFile = 'Customer Report.docx';
        }
    }

    var
        myInt: Integer;
}