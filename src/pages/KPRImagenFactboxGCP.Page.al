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

    actions
    {
        //TODO Hacer que las acciones funciones para ver todas las imagenes
        area(Processing)
        {
            // action(Next)
            // {
            //     ApplicationArea = All;
            //     Image = NextRecord;
            //     // Promoted = true;
            //     // PromotedOnly = true;
            //     ToolTip = 'Muestra la siguiente imagen';
            //     trigger OnAction()
            //     var
            //         ct: Integer;
            //         steps: Integer;
            //     begin
            //         ct := Rec.Count;
            //         if Rec.Next(1) = 0 then
            //             steps := Rec.Next((ct * -1) + 1); //return to first
            //         reloadRecords := false;
            //         CurrPage.Update(false);
            //     end;
            // }
            // action(Previous)
            // {
            //     ApplicationArea = All;
            //     Image = PreviousRecord;
            //     // Promoted = true;
            //     // PromotedOnly = true;
            //     ToolTip = 'Muestra la anterior imagen';
            //     // trigger OnAction()
            //     // var
            //     //     ct: Integer;
            //     //     steps: Integer;
            //     // begin
            //     //     ct := Rec.Count;
            //     //     if Rec.Next(-1) = 0 then
            //     //         // steps := Rec.Next(ct); //Go to last.
            //     // end;
            // }
        }
    }

}
