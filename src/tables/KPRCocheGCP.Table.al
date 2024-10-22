namespace KPR.GCP;
table 50100 KPRCocheGCP
{
    Caption = 'KPRCocheGCP';
    DataClassification = ToBeClassified;

    fields
    {
        //TODO cambiar que sea Code que coge siglas marca y modelo y le añade un numero
        field(1; "Id"; Integer)
        {
            DataClassification = SystemMetadata;
            Editable = false;
            AutoIncrement = true;
        }
        field(2; "Marca"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Modelo"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Anio"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Año';
        }
        field(5; "TipoTransmision"; Enum KPRTipoTransmisionGCP)
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

    trigger OnModify()
    begin
        // Comprobar si la marca ha cambiado
        if Rec.Marca <> xRec.Marca then begin
            // Limpiar el modelo porque la marca ha cambiado
            Validate(Modelo, '');
            Rec.Modelo := '';
            Rec.Modify(true);
        end;
    end;
}
