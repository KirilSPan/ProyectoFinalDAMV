namespace ALProject.ALProject;

permissionset 50100 GCPPermisosKPR
{
    Assignable = true;
    Caption = 'GCPPermisosKPR', MaxLength = 30;
    Permissions =
        table GCPCocheKPR = X,
        tabledata GCPCocheKPR = RMID;
}
