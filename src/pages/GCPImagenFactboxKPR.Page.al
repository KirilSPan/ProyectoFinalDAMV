namespace GCP.GCP;

page 50101 GCPImagenFactboxKPR
{
    ApplicationArea = All;
    Caption = 'ImagenFactbox';
    PageType = CardPart;
    SourceTable = GCPCocheKPR;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {

            field(Foto; Rec.Foto)
            {
                ToolTip = 'Specifies the value of the Foto del Coche field.', Comment = '%';
            }
        }
    }
}
