namespace DefaultPublisher.ALProject;
using Microsoft.Sales.Customer;
using Microsoft.Finance.RoleCenters;
using System.Visualization;
using Microsoft.CRM.BusinessRelation;
using System.IO;
pageextension 50101 CustomerList extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
        addlast(content)
        {
            field(Total; Total)
            {
                ApplicationArea = All;
                Editable = false;


            }

        }

    }

    actions
    {
        // Add changes to page actions here
        addafter(ApplyTemplate)
        {
            action("Import Customer Data")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Image = Import;

                trigger OnAction()
                var
                    progress: Dialog;
                    count: Integer;
                    Msg: Label 'Import .........#1#####\ ';
                begin
                    Xmlport.Run(50132, false, true);
                    Clear(count);
                    count := 0;
                    progress.Open(Msg, count);
                    repeat
                        count := count + 1;
                        progress.Update();
                        Sleep(20);
                    until count = 100;
                    progress.Close();

                end;
            }
            action("Export Customer Data ")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Image = Export;

                trigger OnAction()

                begin
                    Xmlport.Run(50132, true, false);
                end;
            }
            action("Clear Record")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Delete;
                trigger OnAction()
                var
                    CustomerData: Record Customer;
                begin
                    CustomerData.Reset();
                    CustomerData.DeleteAll();
                    Sleep(50);
                    Message('Customer Records are Deleted Successfully.');
                    CurrPage.Update;
                    Total := 0;

                end;
            }
        }

    }

    trigger OnOpenPage()
    var
        customer: Record Customer;
        Count: Integer;
    begin
        Count := customer.Count;
        if Count > 0 then begin
            Total := Count;
        end
        else
            Total := 0;
    end;

    trigger OnAfterGetRecord()
    var
        customer: Record Customer;
        Count: Integer;
    begin

        Count := customer.Count;
        if Count > 0 then begin
            Total := Count;
        end
        else
            Total := 0;
    end;


    //     procedure CaptureAndSearchByVoice(language: Text)
    //     begin
    //     var
    //         http: HttpClient;
    //         audioData: Text;  // Replace with appropriate data type for your service
    //         response: HttpResponseMessage;
    //         recognizedText: Text;
    // begin

    //   if (audioData <> '') then


    //     http.(, '<Service API Endpoint>');  // Replace with actual URL


    //     http.AddHeader('Authorization', 'Bearer <Your Subscription Key>');  // Replace with actual key
    //     http.AddHeader('Content-Type', 'audio/wav');  // Replace if needed

    //     http.SetContent(audioData);

    //     response := http.SendRequest();

    //     if (response.HttpStatusCode = 200) then
    //       recognizedText := JSON.Decode(response.ReadContentAsString())['text']; // Replace with actual key for text

    //     else
    //       Message('Error during speech recognition: ' + response.StatusCode);
    //     end;
    //   else
    //     Message('Failed to capture audio data.');
    // end;






    var
        Glob_var: Date;
        G_name: Text;
        Total: Integer;



    // trigger OnOpenPage()
    // var
    //     Name: Text;
    //     a, b : BigInteger;
    // begin
    //     // Name := 'Bikash';
    //     // G_name := 'Pradhan';
    //     // a := 10;
    //     // b := 30;
    //     // Message('Hello %1 %2 ', Name + ' Sum of a+b= ', a + b);
    //     // Message('Global %1 ', G_name);
    //     Message('Hello World');
    // end;



    // trigger OnClosePage()

    // begin
    //     Glob_var := DMY2Date(01, 03, 2024);
    //     G_name := 'Pradhan';
    //     Message('Today Date is : %1', Glob_var);
    //     Message('Global %1 ', G_name);
    // end;
    local procedure CsvFileRecordCount(FileName: Text): Integer
    var
        FileMng: Codeunit "File Management";
        File: File;
        count: Integer;
    begin
        // FileMng.Run(FileName,File)
    end;

}






