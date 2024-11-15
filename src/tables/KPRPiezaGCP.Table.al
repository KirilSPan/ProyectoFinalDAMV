namespace KPR.GCP;

using GCP.GCP;
using Microsoft.Purchases.Vendor;
using Microsoft.HumanResources.Employee;
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
        field(3; "Estado"; Enum KPREstadoPiezaGCP)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "ProveedorPieza"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No."; // Relación con la tabla Vendor por el campo No.
            ToolTip = 'Proveedor de la pieza.';
        }
        field(5; "ResponsableSustitucion"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No."; // Relación con la tabla de Empleados por el campo No.
            ToolTip = 'El empleado responsable de realizar la sustitución de la pieza.';
        }
        field(6; "FechaCambio"; Date)
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
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
            DataClassification = ToBeClassified;
            TableRelation = KPRCocheGCP."Matrícula" where("Matrícula" = field(Matricula));
        }
    }

    keys
    {
        key(PK; "IdPieza") { }
        key(SecondKey; Matricula) { }
    }
}
