pageextension 50116 AddFiedl extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addfirst(General)
        {
            field(Nick_name; Rec.Nickname)
            {
                Caption = 'Nickname';
                ApplicationArea = All;

            }

        }
        addfirst(factboxes)
        {
            part(xyz; "Sales Hist. Sell-to FactBox")
            {
                ApplicationArea = all;
                Caption = 'xyz';
            }
        }
    }


    actions
    {
        // Add changes to page actions here
        addafter("Sent Emails")
        {
            action("Open Customer Card")
            {
                // Caption = 'Open Customer Card';
                ApplicationArea = all;
                PromotedCategory = Process;
                Promoted = true;
                Image = Open;

                trigger OnAction()
                begin
                    Hyperlink(GetUrl(ClientType::Current, CompanyName, ObjectType::Page, Page::"Customer Card", Rec));
                end;
            }
            action("Customer Card Barcode")
            {
                ApplicationArea = all;
                PromotedCategory = Process;
                Promoted = true;
                Image = Report;

                trigger OnAction()
                begin

                end;
            }

        }
    }





    var
        Nick_name: Text;
}