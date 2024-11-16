namespace KPR.GCP;

using Microsoft.Sales.Customer;
using GCP.GCP;
table 50100 KPRCocheGCP
{
    Caption = 'KPRCocheGCP';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Matrícula"; Text[10])
        {
            Caption = 'Matrícula';
            DataClassification = CustomerContent;
            NotBlank = true;

            trigger OnValidate()
            var
                culKPRFuncionesGCP: Codeunit KPRFuncionesGCP;
            begin
                if culKPRFuncionesGCP.IsValidSpanishPlate(Rec."Matrícula") then
                    Message('La matrícula es válida.')
                else
                    Error('La matrícula no es válida. Debe seguir el formato español.');
            end;
        }
        field(2; "Marca"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Modelo"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Fecha de Matriculación"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Año';
        }
        field(5; "TipoTransmision"; Enum KPRTipoTransmisionGCP)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "NumeroPuertas"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "2 Puertas","3 Puertas","4 Puertas","5 Puertas";
            OptionCaption = '2 Puertas,3 Puertas,4 Puertas,5 Puertas';
            Caption = 'Número de Puertas';
        }
        field(7; "Foto"; Media) // Campo de tipo MediaSet para almacenar la imagen del coche
        {
            DataClassification = ToBeClassified;
            Caption = 'Foto del Coche';
            ToolTip = 'Specifies the value of the Foto field.', Comment = '%';
        }
        field(8; "Kilometros"; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Rec.Kilometros < 0 then
                    Error('Este campo solo acepta números positivos.');
            end;
        }
        field(9; "Cliente ID"; Code[20])
        {
            Caption = 'Cliente ID';
            TableRelation = Customer."No."; // Relacionar con el campo "No." de la tabla de clientes
            DataClassification = CustomerContent;
        }

    }

    keys
    {
        key(PK; "Matrícula")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if Rec."Matrícula" = '' then
            Rec.Delete(false);
    end;

}
