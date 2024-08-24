codeunit 50113 Caluclator_Unit
{


    local procedure Add(operand1: Integer; operand2: Integer)
    var
    begin
        Answer := operand1 + operand2
    end;

    local procedure Sub(operand1: Integer; operand2: Integer): Integer
    var
    begin
        Answer := operand1 + operand2;

    end;

    local procedure Mul(operand1: Integer; operand2: Integer)
    var
    begin
        Answer := operand1 + operand2
    end;

    local procedure Divi(operand1: Integer; operand2: Integer)
    var
    begin
        Answer := operand1 + operand2
    end;

    var
        operand1: Integer;
        operand2: Integer;
        Answer: Integer;
}