namespace KPR.GCP;
table 50100 KPRCocheGCP
{
    Caption = 'KPRCocheGCP';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Id"; GUID)
        {
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(2; "Marca"; Enum KPRCocheMarcaGCP)
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
        field(7; "Foto"; MediaSet) // Campo de tipo MediaSet para almacenar la imagen del coche
        {
            DataClassification = ToBeClassified;
            Caption = 'Foto del Coche';
            ToolTip = 'Specifies the value of the Foto field.', Comment = '%';
        }
        field(8; "Kilometros"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Id")
        {
            Clustered = true;
        }
    }
}
