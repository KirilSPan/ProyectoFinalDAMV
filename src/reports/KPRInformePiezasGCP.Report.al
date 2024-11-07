namespace GCP.GCP;

using KPR.GCP;
using Microsoft.Sales.Customer;

report 50100 KPRInformePiezasGCP
{
    ApplicationArea = All;
    Caption = 'KPRInformePiezasGCP';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './layouts/InformePiezas.rdlc';



    dataset
    {
        dataitem(KPRPiezaGCP; KPRPiezaGCP)
        {
            DataItemTableView = sorting(Matricula); // Ordena por matrícula para el filtro
            dataitem(KPRCocheGCP; KPRCocheGCP)
            {
                DataItemLinkReference = KPRPiezaGCP;
                DataItemLink = "Matrícula" = field("Matricula");

                dataitem(Customer; Customer)
                {
                    DataItemLink = "No." = field("Cliente ID"); // Relaciona la tabla `Customer` con `KPRCocheGCP` usando `Cliente ID`
                    DataItemLinkReference = KPRCocheGCP;

                    column(ClienteNombre; Name)
                    {
                    }
                    column(ClienteDireccion; Address)
                    {
                    }
                    column(City_Customer; City)
                    {
                    }
                    column(County_Customer; County)
                    {
                    }
                    column(CountryRegionCode_Customer; "Country/Region Code")
                    {
                    }


                }
            }
            column(Matricula; Matricula)
            {
            }
            column(Nombre; Nombre)
            {
            }
            column(Estado; Estado)
            {
            }
            column(ProveedorPieza; ProveedorPieza)
            {
            }
            column(ResponsableSustitucion; ResponsableSustitucion)
            {
            }
            column(FechaCambio; FechaCambio)
            {
            }
            column(Precio; Precio)
            {
            }

            trigger OnPreDataItem()
            begin
                if FiltroMatricula <> '' then
                    SetRange(Matricula, FiltroMatricula);
            end;
        }


    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Filtros del Informe';
                    field("Filtro por Matrícula"; FiltroMatricula)
                    {
                        TableRelation = KPRCocheGCP."Matrícula";
                        ApplicationArea = All;
                        Caption = 'Filtros del Informe';
                        ToolTip = 'Filtra por matrícula.';
                    }
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    var
        FiltroMatricula: Text[10]; // Variable para almacenar la matrícula seleccionada
}
