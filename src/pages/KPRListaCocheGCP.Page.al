namespace GCP.GCP;

using KPR.GCP;

page 50107 KPRListaCocheGCP
{
    ApplicationArea = All;
    Caption = 'KPRListaCocheGCP';
    PageType = List;
    SourceTable = KPRCocheGCP;
    UsageCategory = Lists;
    RefreshOnActivate = true;
    ModifyAllowed = false;
    InsertAllowed = false;
    Editable = false;
    //TODO mirar si se puede el view de forma predeterminada sea lista

    layout
    {
        area(Content)
        {
            repeater(Group)
            {

                field(Id; Rec.Id)
                {
                    ToolTip = 'Specifies the value of the Id field.', Comment = '%';
                    Caption = 'ID del Coche';

                    trigger OnDrillDown()
                    begin
                        PAGE.Run(PAGE::KPRFichaCocheGCP, Rec); // Abre la página de ficha del coche
                    end;
                }
                field(Marca; Rec.Marca)
                {
                    ToolTip = 'Specifies the value of the Marca field.', Comment = '%';
                }
                field(Modelo; Rec.Modelo)
                {
                    ToolTip = 'Specifies the value of the Modelo field.', Comment = '%';
                }
                field(Kilometros; Rec.Kilometros)
                {
                    ToolTip = 'Specifies the value of the Kilometros field.', Comment = '%';
                }
                field(Anio; Rec.Anio)
                {
                    ToolTip = 'Specifies the value of the Anio field.', Comment = '%';
                }
                field(NumeroPuertas; Rec.NumeroPuertas)
                {
                    ToolTip = 'Specifies the value of the NumeroPuertas field.', Comment = '%';
                }
                field(TipoTransmision; Rec.TipoTransmision)
                {
                    ToolTip = 'Specifies the value of the TipoTransmision field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        // Agregar acciones para crear un nuevo coche o gestionar otros elementos

        area(Creation)
        {
            action(CocheNuevo)
            {
                Caption = 'Nuevo Coche';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = New;
                PromotedOnly = true;
                Image = Add;
                ToolTip = 'Para agregar un nuevo coche.';
                RunObject = page KPRFichaCocheGCP;
                RunPageMode = Create;
            }
        }
        area(processing)
        {


            // Acción personalizada para eliminar un coche
            action(DeleteCar)
            {
                Caption = 'Eliminar';
                ApplicationArea = All;
                Promoted = true;
                Image = Delete;
                PromotedCategory = Process;
                PromotedOnly = true;
                ToolTip = 'Para eliminar un coche.';

                trigger OnAction()
                var
                    ConfirmDelete: Boolean;
                begin
                    // Confirmación antes de eliminar
                    ConfirmDelete := Confirm('¿Está seguro de que desea eliminar el coche seleccionado?');
                    if ConfirmDelete then
                        Rec.Delete();
                end;
            }
        }
    }

}
