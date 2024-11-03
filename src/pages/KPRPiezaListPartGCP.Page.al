namespace GCP.GCP;

using KPR.GCP;

page 50108 KPRPiezaListPartGCP
{
    ApplicationArea = All;
    Caption = 'KPRPiezaListPartGCP';
    PageType = ListPart;
    SourceTable = KPRPiezaGCP;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(IdPieza; Rec.IdPieza)
                {
                    ToolTip = 'Specifies the value of the IdPieza field.', Comment = '%';
                    Editable = false;
                }
                field(Nombre; Rec.Nombre)
                {
                    ToolTip = 'Specifies the value of the Nombre field.', Comment = '%';
                }
                field(Estado; Rec.Estado)
                {
                    ToolTip = 'Specifies the value of the Estado field.', Comment = '%';
                }
                field(FechaCambio; Rec.FechaCambio)
                {
                    ToolTip = 'Specifies the value of the FechaCambio field.', Comment = '%';
                }
                field(CambiadoPor; Rec.CambiadoPor)
                {
                    ToolTip = 'Specifies the value of the CambiadoPor field.', Comment = '%';
                }
                field(ResponsableSustitucion; Rec.ResponsableSustitucion)
                {
                    ToolTip = 'Specifies the value of the ResponsableSustitucion field.', Comment = '%';
                }
                field(Precio; Rec.Precio)
                {
                    ToolTip = 'Specifies the value of the Precio field.', Comment = '%';
                }
                field(InfoAdicional; Rec.InfoAdicional)
                {
                    ToolTip = 'Specifies the value of the InfoAdicional field.', Comment = '%';
                }
                field(Matricula; Rec.Matricula)
                {
                    ToolTip = 'Specifies the value of the Matricula field.', Comment = '%';
                }
            }
        }
    }
}
