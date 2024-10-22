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
            begin
                // Verificar que el nombre del modelo no esté vacío
                if "Model Name" = '' then
                    Error('El nombre del modelo no puede estar vacío.');

                // Verificar que la marca esté seleccionada
                if "Brand Code" = '' then
                    Error('Debe seleccionar una marca antes de definir el modelo.');

                // Generar el código como combinación de marca y modelo
                "Model Code" := GenerateCodeFromBrandAndModel("Brand Code", "Model Name");
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

    local procedure GenerateCodeFromBrandAndModel(BrandCode: Code[10]; ModelName: Text[50]): Code[10]
    var
        BrandAndModelCode: Text;
    begin
        // Eliminar espacios y combinar marca y modelo
        BrandAndModelCode := UpperCase(DelChr(BrandCode, '=', ' ')) + '-' + UpperCase(DelChr(ModelName, '=', ' '));
        exit(CopyStr(BrandAndModelCode, 1, 10)); // Limitar a 10 caracteres
    end;
}
