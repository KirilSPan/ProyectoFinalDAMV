namespace KPR.GCP;

enum 50100 KPRTipoTransmisionGCP
{
    Caption = 'Tipo de Transmision';
    Extensible = true; // Permite que otros desarrolladores puedan extender el Enum con nuevas opciones
    value(0; "")
    {
        Caption = 'Default';
    }
    value(1; "Manual")
    {
        Caption = 'Manual';
    }
    value(2; "Automatica")
    {
        Caption = 'Automática';
    }

}
