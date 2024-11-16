namespace KPR.GCP;

using Microsoft.Inventory.Item;
using System.Environment;

page 50101 KPRImagenFactboxGCP
{
    ApplicationArea = All;
    Caption = 'Imagen del Coches';
    PageType = CardPart;
    SourceTable = KPRCocheGCP;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {

            field(Foto; Rec.Foto)
            {
                ShowCaption = false; // Ocultar el caption
                ToolTip = 'Specifies the value of the Foto del Coche field.', Comment = '%';
            }
        }
    }
}
