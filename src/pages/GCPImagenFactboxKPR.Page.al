namespace GCP.GCP;

using Microsoft.Inventory.Item;
using System.Environment;

page 50101 GCPImagenFactboxKPR
{
    ApplicationArea = All;
    Caption = 'Imagen Factbox';
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

    actions
    {
        //TODO Hacer que las acciones funciones para ver todas las imagenes
        area(Processing)
        {
            action(Next)
            {
                ApplicationArea = All;
                Image = NextRecord;
                // Promoted = true;
                // PromotedOnly = true;
                ToolTip = 'Muestra la siguiente imagen';
                trigger OnAction()
                var
                    ct: Integer;
                    steps: Integer;
                begin
                    ct := Rec.Count;
                    if Rec.Next(1) = 0 then
                        steps := Rec.Next((ct * -1) + 1); //return to first
                    reloadRecords := false;
                    CurrPage.Update(false);
                end;
            }
            action(Previous)
            {
                ApplicationArea = All;
                Image = PreviousRecord;
                // Promoted = true;
                // PromotedOnly = true;
                ToolTip = 'Muestra la anterior imagen';
                trigger OnAction()
                var
                    ct: Integer;
                    steps: Integer;
                begin
                    ct := Rec.Count;
                    if Rec.Next(-1) = 0 then
                        steps := Rec.Next(ct); //Go to last.
                end;
            }
        }
    }

    //     trigger OnAfterGetCurrRecord()
    //     begin
    //         // LoadRelatedRecords();
    //     end;

    //     local procedure LoadRelatedRecords()
    //     var
    //         recMediaSet: Record "Tenant Media Set";
    //         recMedia: Record "Tenant Media";
    //         recItem: Record Item;
    //         i: Integer;
    //         res: Boolean;
    //     begin
    //         //Check to see if the temp table needs repopulated
    //         if (itemNo = Rec.Id) and (not reloadRecords) then
    //             exit;

    //         itemNo := Rec.Id;
    //         reloadRecords := false;

    //         //use the SubPageLink fields to get record
    //         if not recItem.Get(Rec.Id) then
    //             exit;

    //         for i := 1 to recItem.Picture.Count do begin
    //             if not recMedia.Get(recItem.Picture.Item(i)) then
    //                 break;
    //             Rec.Init();
    //             Rec.Id := recItem."No.";
    //             // Rec.Description := recMedia.Description;
    //             // Rec.CreatedBy := recMedia."Creating User";
    //             // Rec.CreatedOn := recMedia.SystemCreatedAt;
    //             // Rec.Index := i;
    //             recMediaSet.Get(recItem.Picture.MediaId, recItem.Picture.Item(i));
    //             // Rec.Foto := recMediaSet."Media ID";
    //             res := Rec.Insert();
    //         end;

    //     end;

    var
        reloadRecords: Boolean;
    //         itemNo: Code[20];
}
