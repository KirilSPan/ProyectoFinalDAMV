table 50100 GCPCocheKPR
{
    Caption = 'GCPCocheKPR';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Id"; GUID)
        {
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(2; "Marca"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Modelo"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Anio"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "TipoTransmision"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "NumeroPuertas"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "FotoUrl"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Kilometros"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Id") { }
    }
}
