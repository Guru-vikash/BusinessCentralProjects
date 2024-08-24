pageextension 50123 ItemPicExt extends "Item Picture"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(ImportPicture)
        {
            action(ImportPictureFromURL)
            {
                ApplicationArea = All;
                Caption = 'Import From URL';
                Image = Import;

                trigger OnAction()
                var
                    PictureUrlDialog: Page "PicURLDialog";
                    so: Report "Sales Order";
                begin
                    PictureUrlDialog.SetItemInfo(Rec."No.", Rec.Description);
                    if PictureUrlDialog.RunModal() = Action::OK then
                        PictureUrlDialog.ImportItemPicFromURL();
                end;
            }

        }
    }



}