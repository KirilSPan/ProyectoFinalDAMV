namespace GCP.GCP;

using KPR.GCP;

page 50105 KPRListaMarcaGCP
{
    ApplicationArea = All;
    Caption = 'KPRListaMarcaGCP';
    PageType = List;
    SourceTable = KPRMarcaCocheGCP;
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Brand Name"; Rec."Brand Name")
                {
                    ToolTip = 'Specifies the value of the Brand Name field.', Comment = '%';
                }
            }
        }
    }
}
