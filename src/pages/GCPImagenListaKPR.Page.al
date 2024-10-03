namespace GCP.GCP;

page 50102 GCPImagenListaKPR
{
    ApplicationArea = All;
    Caption = 'GCPImagenListaKPR';
    PageType = List;
    SourceTable = GCPCocheKPR;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field(Foto; Rec.Foto)
                {
                    ToolTip = 'Specifies the value of the Foto del Coche field.', Comment = '%';
                }
            }
        }

        area(FactBoxes)
        {
            part(MediaFactbox; GCPImagenFactboxKPR)
            {
                ApplicationArea = all;
                SubPageLink = Id = field(Id);
            }
        }
    }
}
