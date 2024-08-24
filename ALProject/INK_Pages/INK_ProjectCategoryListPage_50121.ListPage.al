page 50121 ProjectCategoryListPage
{
    PageType = List;
    ApplicationArea = Basic, Suite;
    UsageCategory = Lists;
    SourceTable = ProjectCategory;
    Caption = 'Project Category List Page';
    AdditionalSearchTerms = 'Project Category Card, ABC';
    CardPageId = ProjectCatCard;
    AutoSplitKey = true;
    // RefreshOnActivate = true;
    Editable = false;



    layout
    {
        area(Content)
        {
            repeater(ProjectList)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                    // trigger OnDrillDown()
                    // var
                    //     Record: Record ProjectCategory;
                    // begin
                    //     if Page.RunModal(Page::ProjectCatCard, Record) = Action::LookupOK then begin
                    //         Record.Get(Rec.Code);
                    //         Rec.Code := Record.Code;
                    //         Rec.Description := Record.Description;
                    //     end;
                    // end;

                    // trigger OnAfterLookup(Selected: RecordRef)
                    // var
                    //     Record: Record ProjectCategory;
                    // begin
                    //     Rec.Code := Record.Code;
                    //     Rec.Description := Record.Description;
                    // end;

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';

                }
                field(RecordCount; Rec.ProjectCount1)
                {

                    ApplicationArea = All;
                    Caption = 'No. Of Records';

                    // trigger OnValidate()
                    // var
                    //     cust: Page "Customer List";
                    // begin

                    // end;

                }


            }
            field(Total; Total)
            {
                ApplicationArea = All;
                Editable = false;
            }

        }

    }

    actions
    {
        area(Processing)
        {
            action("No. of Records")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    ProListPage: Record ProjectCategory;
                    Count: Integer;
                begin
                    Count := ProListPage.Count;
                    Message('No. of Records : %1', Count);
                end;
            }
        }
    }

    trigger OnInit()
    begin
        Total := RecCount();
    end;

    local procedure RecCount(): Integer
    var
        ProListPage: Record ProjectCategory;
        Count: Integer;
    begin
        Count := ProListPage.Count;
        exit(Count);
    end;

    var
        Total: Integer;
}


