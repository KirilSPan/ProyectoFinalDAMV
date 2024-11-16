table 50103 KPRModeloCocheGCP
{
    Caption = 'KPRModeloCocheGCP';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Model Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Model Code';
            Editable = false;
        }

        field(2; "Model Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Model Name';

            trigger OnValidate()
            var
                culKPRFuncionesGCP: Codeunit KPRFuncionesGCP;
            begin
                // Verificar que el nombre del modelo no esté vacío
                if "Model Name" = '' then
                    Error('El nombre del modelo no puede estar vacío.');

                // Verificar que la marca esté seleccionada
                if "Brand Code" = '' then
                    Error('Debe seleccionar una marca antes de definir el modelo.');

                // Generar el código como combinación de marca y modelo
                "Model Code" := culKPRFuncionesGCP.GenerateCodeFromBrandAndModel("Brand Code", "Model Name");
            end;
        }

        field(3; "Brand Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Brand Code';
            TableRelation = KPRMarcaCocheGCP."Brand Code"; // Relación con la tabla de Marcas
        }
    }

    keys
    {
        key(PK; "Model Code")
        {
            Clustered = true;
        }

        key(Brand; "Brand Code")
        {
            Clustered = false;
        }
    }

}
