namespace KPR.GCP;

using GCP.GCP;
table 50101 KPRPiezaGCP
{
    Caption = 'KPRPiezaGCP';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "IdPieza"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Nombre"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Estado"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "CambiadoPor"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "ResponsableSustitucion"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "FechaCambio"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Precio"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "InfoAdicional"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Matricula"; Text[10])
        {
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(PK; "IdPieza") { }
    }

}
