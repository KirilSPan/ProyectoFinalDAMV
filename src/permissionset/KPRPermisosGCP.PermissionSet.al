namespace KPR.GCP;

permissionset 50100 KPRPermisosGCP
{
    Assignable = true;
    Caption = 'KPRPermisosGCP', MaxLength = 30;
    Permissions =
        table KPRCocheGCP = X,
        tabledata KPRCocheGCP = RMID;
}
