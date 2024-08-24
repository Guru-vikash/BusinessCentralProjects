page 50125 ProjectCatCard
{
    PageType = Card;
    // ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Project Category Card';
    SourceTable = ProjectCategory;
    // RefreshOnActivate = true;



    layout
    {


        area(Content)
        {

            group(GroupName)
            {
                field(Project_Cat_Code; Rec.Code)
                {
                    ApplicationArea = All;
                    // trigger OnValidate()
                    // var
                    //     rec: Record "Sales Header";
                    // begin
                    //     xRec.Code := rec."Project Category Code"
                    // end;

                }
                field(Proj_Cat_Desc; Rec.Description)
                {
                    ApplicationArea = All;
                    // trigger OnValidate()
                    // var
                    //     rec: Record "Sales Header";
                    // begin
                    //     xRec.Description := rec."Project Category Description";
                    // end;

                }
                // part("Attached Documents"; "Document Attachment Factbox")
                // {
                //     ApplicationArea = All;
                //     Caption = 'Attachments';
                //     SubPageLink = "Table ID" = const(36), "No." = field(Code);
                // }
                // systempart(Notes; Notes)
                // {
                //     ApplicationArea = Notes;
                //     // nottable=2000000068;
                // }

            }
            part(Project; Project)
            {
                SubPageLink = Proj_Cat_Code = field(Code);
                UpdatePropagation = Both;
                ApplicationArea = All;



            }

        }
        area(FactBoxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                // SubPageLink = "Table ID" = const(2000000068), "No." = field(Code);
            }

            systempart(Notes; Notes)
            {
                ApplicationArea = Notes;
                // nottable=2000000068;

            }
            systempart(mynotes; MyNotes)
            {
                ApplicationArea = mynotes;
            }
            systempart(Links; Links)
            {

            }

        }
    }


    actions
    {
        area(Processing)
        {

            action("Print")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    RecLink: Record "Record Link";
                    Notes: Text;
                    // recRef: RecordRef;
                    RecLinkMng: Codeunit "Record Link Management";
                    count: Integer;

                begin
                    // NoteData.SetFilter(Note, Format(NoteData.Note));
                    // NoteData.Note.CreateInStream(Mystream);
                    // Notes := Format(NoteData.Note);
                    // Mystream.Read(Notes);

                    Clear(RecLink);
                    Clear(Notes);

                    RecLink.SetRange("Record ID", Rec.RecordId);
                    RecLink.SetRange(Type, RecLink.Type::Note);
                    count := 1;
                    if RecLink.FindSet() then begin
                        repeat
                            RecLink.CalcFields(Note);
                            Notes := Notes + Format(count) + '. ' + RecLinkMng.ReadNote(RecLink) + '\';
                            count += 1;
                        until RecLink.Next() = 0;
                        Message(Notes);
                    end;
                end;
            }

        }

    }

    var
        Project_Cat_Code: Code[20];
        Proj_Cat_Desc: Text[50];

}