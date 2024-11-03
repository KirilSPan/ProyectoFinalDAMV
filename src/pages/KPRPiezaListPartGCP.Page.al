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
                field(ProveedorPieza; Rec.ProveedorPieza)
                {
                    ToolTip = 'Specifies the value of the ProveedorPieza field.', Comment = '%';
                    Lookup = true;
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
                    Caption = 'Matrícula';
                    Editable = false;
                }
            }
        }
    }

    var
        MatriculaFiltro: Text[10];

    procedure SetMatrículaFiltro(pMatricula: Text[10])
    begin
        Clear(Rec); // Limpia cualquier filtro previo en los registros
        Rec.SetRange(Matricula, pMatricula); // Aplica el filtro de matrícula
        CurrPage.Update(false);
        MatriculaFiltro := pMatricula;
    end;

    procedure getMatrículaFiltro(): Text[10]
    begin
        exit(MatriculaFiltro);
    end;

    trigger OnNewRecord(Belowxrec: Boolean)
    var
        xlMatricula: Text[10];
    begin
        xlMatricula := getMatrículaFiltro();
        if Rec.Matricula = '' then begin
            Rec.Matricula := xlMatricula;
            Rec.Modify(false);
            CurrPage.Update(false);
        end;
    end;

}
