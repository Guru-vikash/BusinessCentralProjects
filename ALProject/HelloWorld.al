// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.ALProject;

using Microsoft.Sales.Customer;
using System.IO;


pageextension 50100 CustomerListExt extends "Customer List - Order Status"
{
    trigger OnOpenPage();
    // var
    //     conf: page "Config. Package Card";
    begin
        Message('App published: Hello world');
    end;


}