namespace ALProject.ALProject;

page 50100 "GCPListaCocheKPR"
{
    PageType = Card;
    SourceTable = GCPCocheKPR;
    ApplicationArea = All;
    Caption = 'Ficha del Coche';
    UsageCategory = Lists;


    layout
    {
        area(content)
        {
            group("Detalles del Coche")
            {

                field(Marca; Rec.Marca)
                {
                    ToolTip = 'Specifies the value of the Marca field.', Comment = '%';
                }
                field(TipoTransmision; Rec.TipoTransmision)
                {
                    ToolTip = 'Specifies the value of the TipoTransmision field.', Comment = '%';
                }
                field(NumeroPuertas; Rec.NumeroPuertas)
                {
                    ToolTip = 'Specifies the value of the NumeroPuertas field.', Comment = '%';
                }
                field(Modelo; Rec.Modelo)
                {
                    ToolTip = 'Specifies the value of the Modelo field.', Comment = '%';
                }
                field(Kilometros; Rec.Kilometros)
                {
                    ToolTip = 'Specifies the value of the Kilometros field.', Comment = '%';
                }
                field(Id; Rec.Id)
                {
                    ToolTip = 'Specifies the value of the Id field.', Comment = '%';
                }
                field(Anio; Rec.Anio)
                {
                    ToolTip = 'Specifies the value of the Anio field.', Comment = '%';
                }

            }
            group("Imagen del Coche") // Grupo para mostrar la imagen del coche
            {
                field(Foto; Rec."Foto")
                {
                    ApplicationArea = All;
                    ShowCaption = false; // Mostrar la etiqueta "Foto"


                }
            }




        }
    }
    actions
    {
        area(processing)
        {
            //     action("Eliminar Imagen")
            //     {
            //         ApplicationArea = All;
            //         Caption = 'Eliminar Imagen';
            //         Image = Delete;

            //         // trigger OnAction()
            //         // begin
            //         //     if not Confirm('¿Estás seguro de que deseas eliminar la imagen?', false) then
            //         //         exit;

            //         //     Rec.Foto; // Limpiar el campo `MediaSet`
            //         //     CurrPage.Update(false); // Actualiza la página para reflejar el cambio
            //         //     Message('Imagen eliminada.');
            //         // end;
            //     }
        }
    }
}
