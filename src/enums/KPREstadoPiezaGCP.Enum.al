namespace GCP.GCP;

enum 50101 KPREstadoPiezaGCP
{
    Extensible = true;
    value(0; Disponible)
    {
        Caption = 'Disponible';
    }
    value(1; Instalada)
    {
        Caption = 'Instalada';
    }
    value(2; Defectuosa)
    {
        Caption = 'Defectuosa';
    }
    value(3; EnReparacion)
    {
        Caption = 'En reparación';
    }
    value(4; PendienteDeInspeccion)
    {
        Caption = 'Pendiente de inspección';
    }
    value(5; Reemplazada)
    {
        Caption = 'Reemplazada';
    }
    value(6; Descontinuada)
    {
        Caption = 'Descontinuada';
    }
    value(7; Devuelta)
    {
        Caption = 'Devuelta';
    }
    value(8; Reservada)
    {
        Caption = 'Reservada';
    }
    value(9; EnTransito)
    {
        Caption = 'En tránsito';
    }
}
