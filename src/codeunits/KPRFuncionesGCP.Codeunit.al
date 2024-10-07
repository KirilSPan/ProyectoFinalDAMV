namespace GCP.GCP;

using System.Text;


codeunit 50100 KPRFuncionesGCP
{
    SingleInstance = false;
    Subtype = Normal;


    procedure ImportCarData(): Boolean
    var
        FileManagement: Codeunit "JSON Management";
        JsonText: Text;
        JsonObject: JsonObject;
        JsonArrayBrands: JsonArray;
        JsonArrayModels: JsonArray;
        JsonToken: JsonToken;
        CarBrandRec: Record "Car Brand";
        CarModelRec: Record "Car Model";
        OpenedFileName: Text;
    begin
        // Seleccionar el archivo JSON
        if not FileManagement.GetArrayPropertyValueAsStringByName('Import Car Data', OpenedFileName) then
            exit(false);

        // Leer el contenido del archivo
        FileManagement.ReadAllTextFromFile(OpenedFileName, JsonText);

        // Parsear el contenido JSON
        if not JsonObject.ReadFrom(JsonText) then begin
            Message('No se pudo leer el archivo JSON. Verifique el formato.');
            exit(false);
        end;

        // Obtener las marcas del archivo JSON
        if JsonObject.Get('Brands', JsonToken) and JsonToken.IsArray() then begin
            JsonArrayBrands := JsonToken.AsArray();

            // Iterar a través de las marcas en el JSON
            foreach Brand in JsonArrayBrands do begin
                CarBrandRec.Init();
                CarBrandRec."Brand Code" := Brand.GetValue('BrandCode').AsText();
                CarBrandRec."Brand Name" := Brand.GetValue('BrandName').AsText();

                if not CarBrandRec.Insert(true) then
                    Error('Error al insertar la marca %1.', CarBrandRec."Brand Name");

                // Obtener los modelos correspondientes a esta marca
                if Brand.Get('Models', JsonToken) and JsonToken.IsArray() then begin
                    JsonArrayModels := JsonToken.AsArray();

                    foreach Model in JsonArrayModels do begin
                        CarModelRec.Init();
                        CarModelRec."Model Code" := Model.GetValue('ModelCode').AsText();
                        CarModelRec."Model Name" := Model.GetValue('ModelName').AsText();
                        CarModelRec."Brand Code" := CarBrandRec."Brand Code";

                        if not CarModelRec.Insert(true) then
                            Error('Error al insertar el modelo %1 para la marca %2.', CarModelRec."Model Name", CarBrandRec."Brand Name");
                    end;
                end;
            end;
        end;

        Message('Datos importados correctamente.');
        exit(true);
    end;
}
