namespace KPR.GCP;
using GCP.GCP;

permissionset 50100 KPRPermisosGCP
{
    Assignable = true;
    Caption = 'KPRPermisosGCP', MaxLength = 30;
    Permissions =
        table KPRCocheGCP = X,
        tabledata KPRCocheGCP = RMID,
        page KPRFichaCocheGCP = X,
        table KPRPiezaGCP = X,
        tabledata KPRPiezaGCP = RMID,
        table KPRMarcaCocheGCP = X,
        tabledata KPRMarcaCocheGCP = RMID,
        page KPRListaMarcaGCP = X,
        table KPRModeloCocheGCP = X,
        tabledata KPRModeloCocheGCP = RMID,
        page KPRListaModeloGCP = X;
}
