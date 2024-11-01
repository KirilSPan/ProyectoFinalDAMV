namespace GCP.GCP;

page 50106 KPRListaModeloGCP
{
    ApplicationArea = All;
    Caption = 'KPRListaModeloGCP';
    PageType = List;
    SourceTable = KPRModeloCocheGCP;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("Model Name"; Rec."Model Name")
                {
                    ToolTip = 'Specifies the value of the Model Name field.', Comment = '%';
                }
                field("Brand Code"; Rec."Brand Code")
                {
                    ToolTip = 'Specifies the value of the Brand Code field.', Comment = '%';
                }
            }
        }


    }
}
