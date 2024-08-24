page 50101 INK_Student
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = INK_StudentTable;
    AdditionalSearchTerms = 'Student';

    layout
    {
        area(Content)
        {
            repeater(StudentList)
            {
                field(EnrollNo; Rec.EnrollNo)
                {
                    ApplicationArea = All;
                    Caption = 'Student Enroll No.';

                }
                field(S_no; Rec.S_no)
                {
                    ApplicationArea = All;
                    Caption = 'Roll No.';


                }
                field(Name; Rec.S_Name)
                {
                    ApplicationArea = All;
                    Caption = 'Student Name';


                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action("Student Register")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    Message('Student successfuly Register.' + Rec.S_Name);
                end;
            }
        }
    }
}