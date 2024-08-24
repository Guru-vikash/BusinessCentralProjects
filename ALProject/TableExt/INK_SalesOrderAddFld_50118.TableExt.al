tableextension 50118 SalesOrderAddFld extends "Sales Header"
{
    fields
    {
        field(50118; CustNickName; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50123; "Project Category Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = ProjectCategory;

            trigger OnValidate()
            var
                ProjectCat: Record ProjectCategory;
            begin
                if "Project Category Code" <> '' then begin
                    if ProjectCat.Get("Project Category Code") then begin
                        "Project Category Description" := ProjectCat.Description;
                    end;
                end;

            end;
        }
        field(50124; "Project Category Description"; Code[70])
        {
            Editable = false;
        }
        field(1001; "AnyProjectsExist"; Boolean)
        {
            // CalcFormula = exist(Project where("No." = field("Project Category Code")));

            Editable = false;
            // FieldClass = FlowField;
        }
        field(1002; "ProjectsCount"; Integer)
        {
            Editable = false;
        }
        field(1003; "TotalAmountOfProjects"; Decimal)
        {
            Editable = false;
            DecimalPlaces = 2;
        }
        field(1004; "AverageAmountOfProjects"; Decimal)
        {
            Editable = false;
            DecimalPlaces = 2;
        }
        field(1005; "ProjectWithMinimumAmount"; Decimal)
        {
            Editable = false;
            DecimalPlaces = 2;
        }
        field(1006; "ProjectWithMaximumAmount"; Decimal)
        {
            Editable = false;
            DecimalPlaces = 2;
        }
        field(1007; "AnyProjectsExist1"; Boolean)
        {
            CalcFormula = exist(Project where(Proj_Cat_Code = field("Project Category Code")));

            Editable = false;
            FieldClass = FlowField;
        }
        field(1008; "ProjectsCount1"; Integer)
        {
            CalcFormula = count(Project where(Proj_Cat_Code = field("Project Category Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(1009; "TotalAmountOfProjects1"; Decimal)
        {
            CalcFormula = sum(Project.Amount where(Proj_Cat_Code = field("Project Category Code")));
            Editable = false;
            DecimalPlaces = 2;
            FieldClass = FlowField;
        }
        field(1010; "AverageAmountOfProjects1"; Decimal)
        {
            CalcFormula = average(Project.Amount where(Proj_Cat_Code = field("Project Category Code")));
            Editable = false;
            DecimalPlaces = 2;
            FieldClass = FlowField;
        }
        field(1011; "ProjectWithMinimumAmount1"; Decimal)
        {
            CalcFormula = min(Project.Amount where(Proj_Cat_Code = field("Project Category Code")));
            Editable = false;
            DecimalPlaces = 2;
            FieldClass = FlowField;
        }
        field(1012; "ProjectWithMaximumAmount1"; Decimal)
        {
            CalcFormula = max(Project.Amount where(Proj_Cat_Code = field("Project Category Code")));
            Editable = false;
            DecimalPlaces = 2;
            FieldClass = FlowField;
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
        CustNickName: Text;
}