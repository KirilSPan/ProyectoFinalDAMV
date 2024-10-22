namespace KPR.GCP;
table 50102 KPRMarcaCocheGCP
{
    Caption = 'KPRMarcaCocheGCP';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "Brand Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Brand Code';
            Editable = false;
        }

        field(2; "Brand Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Brand Name';

            trigger OnValidate()
            begin
                if "Brand Name" = '' then
                    Error('El nombre de la marca no puede estar vacío.');

                // Convertir el nombre en un código
                "Brand Code" := GenerateCodeFromName("Brand Name");
            end;
        }
    }

    keys
    {
        key(PK; "Brand Code")
        {
            Clustered = true;
        }
    }

    local procedure GenerateCodeFromName(Name: Text[50]): Code[10]
    var
        CodeText: Text[50];
    begin
        CodeText := UpperCase(DelChr(Name, '=', ' ')); // Eliminar espacios y convertir a mayúsculas
        exit(CopyStr(CodeText, 1, 10)); // Limitar a 10 caracteres
    end;
}
