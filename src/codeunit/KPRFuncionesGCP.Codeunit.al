namespace GCP.GCP;

using KPR.GCP;
using System.Utilities;


codeunit 50100 KPRFuncionesGCP
{
    SingleInstance = true; // Ensures this Codeunit behaves like a global instance

    var
        TempExcelBuffer: Record System.IO."Excel Buffer" temporary;
        FileName: Text[100];
        SheetName: Text[250];
        UploadExcelMsg: Label 'Por favor elige el archivo Excel.';
        NoFileFoundMsg: Label 'Archivo Excel no proporcionado!';
        ExcelImportSucessMsg: Label 'Excel añadido.';
        MatriculaValue: Text[10]; // Global variable to store the Matricula

    procedure SetMatricula(NewMatricula: Text[10])
    begin
        MatriculaValue := NewMatricula;
    end;

    procedure GetMatricula(): Text[10]
    begin
        exit(MatriculaValue);
    end;



    procedure ReadExcelSheet()
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

    procedure ImportExcelData()
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

    procedure IsValidSpanishPlate(plate: Text[10]): Boolean
    var
        Regex: Codeunit Regex;
    begin
        // Valida la matrícula usando una expresión regular para el formato español
        // Formato común: 1234BCD o BCD1234 (letras y números)
        exit(Regex.IsMatch(plate, '^\d{4}?[A-Z]{3}$') or Regex.IsMatch(plate, '^[A-Z]{1,2}?\d{4}[ -]?[A-Z]{2}$'));
    end;

    procedure GenerateCodeFromName(Name: Text[50]): Code[10]
    var
        CodeText: Text[50];
    begin
        CodeText := UpperCase(DelChr(Name, '=', ' ')); // Eliminar espacios y convertir a mayúsculas
        exit(CopyStr(CodeText, 1, 10)); // Limitar a 10 caracteres
    end;

    procedure GenerateCodeFromBrandAndModel(BrandCode: Code[10]; ModelName: Text[50]): Code[10]
    var
        BrandAndModelCode: Text;
    begin
        // Eliminar espacios y combinar marca y modelo
        BrandAndModelCode := UpperCase(DelChr(BrandCode, '=', ' ')) + '-' + UpperCase(DelChr(ModelName, '=', ' '));
        exit(CopyStr(BrandAndModelCode, 1, 10)); // Limitar a 10 caracteres
    end;
}
