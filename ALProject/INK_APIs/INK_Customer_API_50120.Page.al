page 50120 ApiPageName
{
    PageType = API;
    Caption = 'apiPageName';
    APIPublisher = 'publisherName';
    APIGroup = 'groupName';
    APIVersion = 'v1.0';
    EntityName = 'entityName';
    EntitySetName = 'entitySetName';
    SourceTable = Customer;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            // repeater(GroupName)
            // {
            //     field(fieldName; NameSource)
            //     {
            //         Caption = 'fieldCaption';

            //     }
            // }
        }
    }
}