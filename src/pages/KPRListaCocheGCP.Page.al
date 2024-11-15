namespace GCP.GCP;

using KPR.GCP;
using System.Utilities;

page 50107 KPRListaCocheGCP
{
    ApplicationArea = All;
    Caption = 'KPRListaCocheGCP';
    PageType = List;
    SourceTable = KPRCocheGCP;
    UsageCategory = Lists;
    RefreshOnActivate = true;
    ModifyAllowed = false;
    InsertAllowed = false;
    Editable = false;
    //TODO mirar si se puede el view de forma predeterminada sea lista

    layout
    {
        area(Content)
        {
            repeater(Group)
            {

                field(Id; Rec."Matrícula")
                {
                    ToolTip = 'Specifies the value of the Id field.', Comment = '%';
                    Caption = 'Matrícula del Coche';

                    trigger OnDrillDown()
                    begin
                        PAGE.Run(PAGE::KPRFichaCocheGCP, Rec); // Abre la página de ficha del coche
                    end;
                }
                field(Marca; Rec.Marca)
                {
                    ToolTip = 'Specifies the value of the Marca field.', Comment = '%';
                }
                field(Modelo; Rec.Modelo)
                {
                    ToolTip = 'Specifies the value of the Modelo field.', Comment = '%';
                }
                field(Kilometros; Rec.Kilometros)
                {
                    ToolTip = 'Specifies the value of the Kilometros field.', Comment = '%';
                }
                field(Anio; Rec."Fecha de Matriculación")
                {
                    ToolTip = 'Specifies the value of the Anio field.', Comment = '%';
                }
                field(NumeroPuertas; Rec.NumeroPuertas)
                {
                    ToolTip = 'Specifies the value of the NumeroPuertas field.', Comment = '%';
                }
                field(TipoTransmision; Rec.TipoTransmision)
                {
                    ToolTip = 'Specifies the value of the TipoTransmision field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        // Agregar acciones para crear un nuevo coche o gestionar otros elementos

        area(Creation)
        {
            action(CocheNuevo)
            {
                Caption = 'Nuevo Coche';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = New;
                PromotedOnly = true;
                Image = Add;
                ToolTip = 'Para agregar un nuevo coche.';
                RunObject = page KPRFichaCocheGCP;
                RunPageMode = Create;
            }
        }
        area(processing)
        {


            // Acción personalizada para eliminar un coche
            action(DeleteCar)
            {
                Caption = 'Eliminar';
                ApplicationArea = All;
                Promoted = true;
                Image = Delete;
                PromotedCategory = Process;
                PromotedOnly = true;
                ToolTip = 'Para eliminar un coche.';

                trigger OnAction()
                var
                    ConfirmDelete: Boolean;
                begin
                    // Confirmación antes de eliminar
                    ConfirmDelete := Confirm('¿Está seguro de que desea eliminar el coche seleccionado?');
                    if ConfirmDelete then
                        Rec.Delete();
                end;
            }

            action(ImportMarcasYModelos)
            {
                Caption = 'Importar Marcas y sus modelos';
                ToolTip = 'Para importar Marcas de vehiculos y sus modelos.';
                Image = Excel;

                trigger OnAction()
                begin
                    ReadExcelSheet();
                    ImportExcelData();
                end;
            }
        }

        area(Reporting)
        {
            action("Generar Informe de Piezas")
            {
                Caption = 'Generar Informe de Piezas';
                ApplicationArea = All;
                Image = Print;
                Promoted = true;
                PromotedCategory = Report;
                PromotedOnly = true;
                ToolTip = 'Genera un informe de piezas asociadas a este coche.';

                trigger OnAction()
                begin
                    // Ejecuta el informe mostrando primero la RequestPage para seleccionar filtros
                    REPORT.RunModal(Report::KPRInformePiezasGCP);
                end;
            }
        }
    }

    trigger OnInsertRecord(Below: Boolean): Boolean
    begin
        if Rec."Matrícula" = '' then
            Rec.Delete(false);
    end;


    var
        TempExcelBuffer: Record System.IO."Excel Buffer" temporary;
        FileName: Text[100];
        SheetName: Text[250];
        UploadExcelMsg: Label 'Por favor elige el archivo Excel.';
        NoFileFoundMsg: Label 'Archivo Excel no proporcionado!';
        ExcelImportSucessMsg: Label 'Excel añadido.';

    local procedure ReadExcelSheet()
    var
        FileMgt: Codeunit System.IO."File Management";
        IStream: InStream;
        FromFile: Text;
    begin
        UploadIntoStream(UploadExcelMsg, '', '', FromFile, IStream);
        if FromFile <> '' then begin
            FileName := Format(FileMgt.GetFileName(FromFile));
            SheetName := TempExcelBuffer.SelectSheetsNameStream(IStream);
        end else
            Error(NoFileFoundMsg);
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.OpenBookStream(IStream, SheetName);
        TempExcelBuffer.ReadSheet();
    end;

    local procedure ImportExcelData()
    var
        MarcaRec: Record KPRMarcaCocheGCP;
        ModeloRec: Record KPRModeloCocheGCP;
        RowNo: Integer;
        MaxRowNo: Integer;
        MarcaCode: Text;
        MarcaName: Text;
        ModelCode: Text;
        ModelName: Text;
    begin
        RowNo := 0;
        MaxRowNo := 0;

        TempExcelBuffer.Reset();
        if TempExcelBuffer.FindLast() then
            MaxRowNo := TempExcelBuffer."Row No.";


        for RowNo := 2 to MaxRowNo do begin
            MarcaCode := GetValueAtCell(RowNo, 1);
            MarcaName := GetValueAtCell(RowNo, 2);
            ModelCode := GetValueAtCell(RowNo, 3);
            ModelName := GetValueAtCell(RowNo, 4);

            // Insertar o actualizar Marca
            if not MarcaRec.Get(MarcaCode) then begin
                MarcaRec.Init();
                MarcaRec."Brand Code" := Format(MarcaCode);
                MarcaRec."Brand Name" := Format(MarcaName);
                MarcaRec.Insert();
            end;

            // Insertar Modelo asociado a la Marca
            ModeloRec.Init();
            ModeloRec."Model Code" := Format(ModelCode);
            ModeloRec."Model Name" := Format(ModelName);
            ModeloRec."Brand Code" := Format(MarcaCode);
            ModeloRec.Insert();
        end;
        Message(ExcelImportSucessMsg);
    end;

    local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text
    begin

        TempExcelBuffer.Reset();
        if TempExcelBuffer.Get(RowNo, ColNo) then
            exit(TempExcelBuffer."Cell Value as Text")
        else
            exit('');
    end;
}
