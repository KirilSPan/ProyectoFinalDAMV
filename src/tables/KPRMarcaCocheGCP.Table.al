namespace KPR.GCP;

using GCP.GCP;
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
            var
                culKPRFuncionesGCP: Codeunit KPRFuncionesGCP;
            begin
                if "Brand Name" = '' then
                    Error('El nombre de la marca no puede estar vacío.');

                // Convertir el nombre en un código
                "Brand Code" := culKPRFuncionesGCP.GenerateCodeFromName("Brand Name");
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

}
