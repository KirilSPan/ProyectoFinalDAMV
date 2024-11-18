namespace GCP.GCP;

using KPR.GCP;
using Microsoft.Sales.Customer;
using Microsoft.Foundation.Company;

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
                column(Marca_KPRCocheGCP; Marca)
                {
                }
                column(Modelo_KPRCocheGCP; Modelo)
                {
                }
                column(FechadeMatriculacin_KPRCocheGCP; "Fecha de Matriculación")
                {
                }

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

            column(Picture; gCompanyInformation.Picture)
            {
            }
            column(CompanyName; gCompanyInformation.Name)
            {
            }
            column(CompanyAddress; gCompanyInformation.Address)
            {
            }

            trigger OnPreDataItem()
            var
                culKPRFuncionesGCP: Codeunit KPRFuncionesGCP;
            begin
                SetRange(Matricula, culKPRFuncionesGCP.GetMatricula());
            end;
        }

    }
    requestpage
    {
        layout
        {
            area(Content)
            {
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    trigger OnInitReport()
    begin
        gCompanyInformation.Get();
        gCompanyInformation.SetAutoCalcFields(Picture);
    end;

    var
        gCompanyInformation: Record "Company Information";

}
