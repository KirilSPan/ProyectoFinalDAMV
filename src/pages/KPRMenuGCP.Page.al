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
                        //TODO Que apunte a una pagina tipo lista donde esten todos los coches y cuado se piche sobre un registro que lleve a la pagina de abajo con la ficha del coche
                        Page.run(page::KPR.GCP.KPRFichaCocheGCP);
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
