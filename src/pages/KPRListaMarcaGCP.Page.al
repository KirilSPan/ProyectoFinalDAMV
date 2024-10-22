namespace GCP.GCP;

using KPR.GCP;

page 50105 KPRListaMarcaGCP
{
    ApplicationArea = All;
    Caption = 'KPRListaMarcaGCP';
    PageType = List;
    SourceTable = KPRMarcaCocheGCP;
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Brand Code"; Rec."Brand Code")
                {
                    ToolTip = 'Specifies the value of the Brand Code field.', Comment = '%';
                }
                field("Brand Name"; Rec."Brand Name")
                {
                    ToolTip = 'Specifies the value of the Brand Name field.', Comment = '%';
                }
            }
        }
    }
}
