pageextension 50117 SalesOrderAddField extends "Sales Order"
{

    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field(No; Rec."No.")
            {
                ApplicationArea = All;
                TableRelation = Customer."No.";


            }
            field(N_name; Rec.CustNickName)
            {
                ApplicationArea = all;
                Caption = 'Nickname';
            }
            field(Project_code; Rec."Project Category Code")
            {
                Caption = 'Project Code';
                ApplicationArea = All;

                // trigger OnValidate()
                // var
                //     item: page "Item Card";
                // begin
                //     CurrPage.Update(false);
                // end;

                trigger OnLookup(var Text: Text): Boolean
                var
                    // Proj_Cate: Page ProjectCategoryListPage;
                    Proj_rec: Record ProjectCategory;
                begin

                    if Page.RunModal(Page::ProjectCategoryListPage, Proj_rec) = Action::LookupOK then begin
                        Rec."Project Category Code" := Proj_rec.Code;
                        Rec."Project Category Description" := Proj_rec.Description;
                        CurrPage.Update();
                        ;
                        // Rec.Modify(true);

                    end
                end;



            }
            field(Project_Desc; Rec."Project Category Description")
            {
                Caption = 'Project Description';
                ApplicationArea = All;
                DrillDown = true;


                trigger OnDrillDown()


                begin
                    P_rec.Reset();
                    P_rec.Get(Rec."Project Category Code");
                    if Page.RunModal(Page::ProjectCatCard, P_rec) = Action::LookupOK then begin
                        Rec."Project Category Code" := P_rec.Code;
                        Rec."Project Category Description" := P_rec.Description;

                    end
                end;


            }
            field(AnyProjectsExist; Rec.AnyProjectsExist1)
            {
                ApplicationArea = all;
                Caption = 'Any Projects Exist?';
                Editable = false;


                trigger OnValidate()
                begin
                    if P_rec.Get(Rec."Project Category Code") then begin
                        Rec.AnyProjectsExist1 := Rec.AnyProjectsExist1;
                    end
                    else
                        Rec.AnyProjectsExist1 := false;
                end;
            }
            field(ProjectsCount; Rec.ProjectsCount1)
            {
                ApplicationArea = all;
                Caption = 'Projects Count';
                trigger OnValidate()

                begin
                    // Project.Reset();
                    // if Project.Get(rec."Project Category Code") then begin
                    //     // Project.SetRange(Project."Proj_Cat_Code");
                    //     Rec.ProjectsCount := Project.Count();
                    // end
                    // else
                    //     Rec.ProjectsCount := 0;
                    Rec.ProjectsCount := Project.Count();
                end;
            }
            field(TotalAmountOfProjects; Rec.TotalAmountOfProjects1)
            {
                ApplicationArea = all;
                Caption = 'Total Amount of Projects';
            }
            field(AverageAmountOfProjects; Rec.AverageAmountOfProjects1)
            {
                ApplicationArea = all;
                Caption = 'Average Amount of Projects';
                trigger OnValidate()
                begin
                    if P_rec.Get(Rec."Project Category Code") then begin
                        Rec.AverageAmountOfProjects1 := Rec.AverageAmountOfProjects1;
                    end
                    else
                        Rec.AverageAmountOfProjects1 := 0;
                end;
            }
            field(ProjectWithMinimumAmount; Rec.ProjectWithMinimumAmount1)
            {
                ApplicationArea = all;
                Caption = 'Project with Minimum Amount';
            }
            field(ProjectWithMaximumAmount; Rec.ProjectWithMaximumAmount1)
            {
                ApplicationArea = all;
                Caption = 'Project with Maximum Amount';

            }
            field(x; x)
            {
                ApplicationArea = all;
                ExtendedDatatype = URL;
                Caption = 'Url';

                trigger OnValidate()
                var
                    client: HttpClient;
                    Rsp: HttpResponseMessage;
                    Txt: Text;
                    customer: Record Customer;
                    jsonObj: JsonObject;
                begin

                    // client.Get(x, Rsp);
                    // if Rsp.IsSuccessStatusCode then begin
                    //     Rsp.Content.ReadAs(Txt);
                    //     Message(Txt);
                    // end;

                end;


            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnAfterGetRecord()
    var

    begin
        Cust.Get(Rec."Sell-to Customer No.");
        Rec.CustNickName := Cust.Nickname;

    end;


    //#### FIELDREF AND RECORDREF ###########
    // trigger OnOpenPage()
    // var
    //     RecRef: RecordRef;
    //     val: Text;
    //     fieldRef: FieldRef;
    //     i: Integer;
    // begin
    //     // RecRef.SetRecFilter();
    //     RecRef.Open(Database::Item);

    //     // RecRef.Find('-');    //'-' forward ,'+' backword

    //     if RecRef.FindSet() then begin
    //         repeat
    //             if Format(RecRef.Field(3).Value) = 'Pencil Body' then begin
    //                 Message('Item No. is  :%1', Format(RecRef.Field(1).Value))
    //             end
    //             else begin
    //                 Message('No value is present!!');
    //                 break;
    //             end;
    //         until RecRef.Next() = 0;
    //     end;
    //     i := 0;
    //     // repeat
    //     //     if RecRef.Find('-') then begin
    //     //         Message('value of the field %1 : %2', RecRef.Field(i).Caption, RecRef.Field(i).Value);
    //     //     end;
    //     //     i += 1;
    //     // until RecRef.Next() = 20;
    // end;


    //########## HTTPCLIENE ###############

    // trigger OnOpenPage()
    // var
    //     client: HttpClient;
    //     Rsp: HttpResponseMessage;
    //     Txt: Text;
    // begin
    //     client.Get('https://jsonplaceholder.typicode.com/users/1', Rsp);
    //     if Rsp.IsSuccessStatusCode then begin
    //         Rsp.Content.ReadAs(Txt);
    //         Message(Txt);
    //     end;
    // end;




    // trigger OnModifyRecord(): Boolean
    // begin
    //     CurrPage.Update();
    // end;


    // local procedure ClearRecords()
    // var
    //     SalesHea: Record "Sales Header";
    // begin
    //     SalesHea."Project Category Description" := '';
    //     SalesHea.ProjectsCount1 := 0;
    //     SalesHea.ProjectWithMaximumAmount1 := 0;
    //     SalesHea.ProjectWithMinimumAmount1 := 0;
    //     SalesHea.AnyProjectsExist1 := false;
    //     SalesHea.AverageAmountOfProjects1 := 0;
    // end;

    // trigger OnModifyRecord(): Boolean
    // var
    //     client: HttpClient;
    //     Rsp: HttpResponseMessage;
    //     Txt: Text;
    // begin

    //     client.Get(x, Rsp);
    //     if Rsp.IsSuccessStatusCode then begin
    //         Rsp.Content.ReadAs(Txt);
    //         Message(Txt);
    //     end;
    // end;


    var
        N_name: Text;
        bool: Boolean;
        salesName: Record "Sales Header";
        Cust: Record Customer;
        Project_code: Code[20];
        Project_Desc: Text[50];
        No: Code[20];
        Project: Record Project;
        AnyProjectsExist: Text[10];
        P_rec: Record ProjectCategory;
        x: Text;



}
