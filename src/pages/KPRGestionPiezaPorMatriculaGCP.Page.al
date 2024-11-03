namespace GCP.GCP;

using KPR.GCP;

page 50109 KPRGestionPiezaPorMatriculaGCP
{
    ApplicationArea = All;
    Caption = 'Gestión de Piezas Por Matrícula';
    PageType = Card;
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            group("Seleccionar Matrícula")
            {
                field("Matrícula Seleccionada"; gMatriculaSeleccionada)
                {
                    Caption = 'Matrícula';
                    ToolTip = 'Selecciona la matrícula para ver y gestionar sus piezas.';
                    TableRelation = KPRCocheGCP."Matrícula"; // Relacionar con la tabla de coches para el desplegable

                    trigger OnValidate()
                    begin
                        CurrPage.PiezasListPart.PAGE.SetMatrículaFiltro(gMatriculaSeleccionada);
                    end;

                }
            }
            group("Piezas del Coche")
            {
                part(PiezasListPart; KPRPiezaListPartGCP)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    var
        gMatriculaSeleccionada: Text[10]; // Variable para almacenar la matrícula seleccionada

}
