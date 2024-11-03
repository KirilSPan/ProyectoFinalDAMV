namespace GCP.GCP;
using Microsoft.Foundation.Company;


page 50103 KPRMenuGCP
{
    ApplicationArea = All;
    Caption = 'KPR Menú GCP';
    PageType = Card;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    RefreshOnActivate = true;
    ShowFilter = true;
    UsageCategory = Administration;
    PromotedActionCategories = 'Administrar,Proceso,Informes,Listas,Tareas,Informes y análisis,Administración,Archivos,Objetos';

    layout
    {
        area(Content)
        {
            usercontrol(logo; KPRLogoGCP)
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        area(processing)
        {

            group(Coches)
            {
                action(ListaCoches)
                {
                    ApplicationArea = All;
                    Caption = 'Lista de Coches';
                    ToolTip = 'Para ver lista coches y añadir/modificar o eliminar registro';
                    Image = ShipmentLines;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    trigger OnAction()
                    begin
                        Page.run(page::KPRListaCocheGCP);
                    end;
                }

                action(ListaPiezas)
                {
                    ApplicationArea = All;
                    Caption = 'Lista de Piezas';
                    ToolTip = 'Para ver lista de piezas por matrícula y añadir/modificar o eliminar registro';
                    Image = PutawayLines;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    trigger OnAction()
                    begin
                        Page.run(page::KPRGestionPiezaPorMatriculaGCP);
                    end;
                }
            }

            group(administracion)
            {
                action(ConfAddonGCP)
                {
                    ApplicationArea = All;
                    Caption = 'Configuración AddOn GCP';
                    ToolTip = 'Para configurar el AddOn de GCP';
                    Image = Administration;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    trigger OnAction()
                    begin
                        Page.run(page::KPRConfAddOnGCP);
                    end;
                }
                action(CompanyInf)
                {
                    ApplicationArea = All;
                    Caption = 'Info. Empresa';
                    ToolTip = 'Información de mi propia Compañia';
                    Image = CompanyInformation;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    trigger OnAction()
                    begin
                        Page.run(page::"Company Information");
                    end;
                }
            }


        }
    }
}
