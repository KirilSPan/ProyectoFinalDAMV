namespace GCP.GCP;

using System.Text;


codeunit 50100 KPRFuncionesGCP
{
    SingleInstance = false;
    Subtype = Normal;

    /// <summary>
    /// ImportacionMapeoDatosF.
    /// </summary>
    /// <param name="pConfiguracion">Text.</param>
    /// <param name="pImportarTodasConf">Boolean.</param>
    // procedure ImportacionMapeoDatosF(pConfiguracion: Text; pImportarTodasConf: Boolean)
    // var
    //     rlField: Record "Field";
    //     TempLTCNTempBlob: Record TCN_TempBlob temporary;
    //     rlTCNMapeoEnviosATR: Record TCNMapeoEnviosATR;
    //     xRec: Record TCNMapeoEnviosATR;
    //     culMemory: Codeunit "MemoryStream Wrapper";
    //     culTCNFuncionesComunes: Codeunit TCN_FuncionesComunes;
    //     culTCNFncsCapturarErrorCOM: Codeunit TCNCapturaErrorCOM;
    //     culTCNErroresCOM: Codeunit TCNErroresCOM;
    //     pglTCNGestionMasivaDatosCOM: Page TCNGestionMasivaDatosCOM;
    //     xlRecordId: Recordid;
    //     xlRecordRef: RecordRef;
    //     xlFieldRef: FieldRef;
    //     IsHandled: Boolean;
    //     xlFicheroLeido: Boolean;
    //     xlImportar: Boolean;
    //     xlRegistroAbierto: Boolean;
    //     xlRegistroInsertado: Boolean;
    //     Ventana: Dialog;
    //     xlInStream: InStream;
    //     xlIdTabla: Integer;
    //     xlCampos: JsonObject;
    //     xlObjetoJson: JsonObject;
    //     xlRegistro: JsonToken;
    //     xlRegistros: JsonToken;
    //     xlTokenJson: JsonToken;
    //     clErrorFinal: Label 'Proceso cancelado por el sistema. Ha ocurrido algun problema al importar';
    //     clEt01: Label '%1:%2', Locked = true;
    //     clImportarFichero: label 'Seleccione fichero a importar';
    //     clParametro1: label '<>%1';
    //     clStr1: label '%1 tabla %2 no existe.';
    //     clStr2: label 'No existe campo %1 en tabla %2';
    //     clVentana1: label 'Importado tabla #1########################\';
    //     clVentana2: label 'Campo #2##########\';
    //     clVentana3: label 'Clave #3############################################\';
    //     xlCampo: Text;
    //     xlError: Text;
    //     xlFicheroCte: Text;
    //     xlKey: Text;
    //     xlKeysCampo: Text;
    //     xlLinea: Text;
    //     xlTexto: text;
    //     xlTB: TextBuilder;
    //     xlTextEncoding: TextEncoding;
    // begin
    //     // gTCNMapeoEnviosATR.OnBeforeImportacionMapeoDatosF(rlTCNMapeoEnviosATR, xRec, rlField, culMemory, culTCNFncsCapturarErrorCOM, culTCNFuncionesComunes, culTCNErroresCOM, pglTCNGestionMasivaDatosCOM, xlRecordId, xlRecordRef, xlFieldRef, xlImportar, xlRegistroAbierto, xlInStream, xlIdTabla, xlCampos, xlObjetoJson, xlRegistro, xlRegistros, xlTokenJson, xlCampo, xlError, xlFicheroCte, xlKey, xlKeysCampo, xlLinea, xlTexto, IsHandled);

    //     if not pImportarTodasConf then begin
    //         TempLTCNTempBlob.Blob.CreateInStream(xlInStream, xlTextEncoding::UTF8);
    //         xlFicheroLeido := seleccionarFicheroCliente(rlTCNMapeoEnviosATR, rlTCNMapeoEnviosATR, clImportarFichero, '', '', xlFicheroCte, xlInStream);
    //         while not xlInStream.EOS do begin
    //             xlInStream.ReadText(xlTexto);
    //             xlTB.Append(xlTexto);
    //         end;
    //         xlTexto := xlTB.ToText();
    //     end else begin
    //         xlTexto := pConfiguracion;
    //     end;

    //     if xlFicheroLeido or pImportarTodasConf then begin

    //         if xlObjetoJson.ReadFrom(xlTexto) then begin
    //             xlImportar := true;
    //         end else begin
    //             culTCNErroresCOM.ProcesoCanceladoF();
    //             xlImportar := false;
    //         end;
    //         if xlImportar then begin
    //             Ventana.Open(clVentana1 + clVentana2 + clVentana3);
    //             foreach xlKey in xlObjetoJson.Keys do begin
    //                 xlObjetoJson.Get(xlKey, xlRegistros);
    //                 xlRecordId := rlTCNMapeoEnviosATR.RecordId;
    //                 xlIdTabla := xlRecordId.TableNo;
    //                 xlRegistroAbierto := abreRecordRef(xlRecordRef, xlIdTabla);

    //                 if xlRegistroAbierto then begin

    //                     foreach xlRegistro in xlRegistros.AsArray() do begin
    //                         xlRegistroInsertado := false;
    //                         xlCampos := xlRegistro.AsObject();
    //                         xlRecordRef.Close();
    //                         xlRegistroAbierto := abreRecordRef(xlRecordRef, xlIdTabla);
    //                         foreach xlKeysCampo in xlCampos.Keys do begin
    //                             //         // BUCLE PARA RECORRER E INSERTAR CAMPOS DE LA TABLA
    //                             xlCampos.Get(xlKeysCampo, xlTokenJson);
    //                             xlLinea := xlTokenJson.AsValue().AsText();
    //                             rlField.SetRange(FieldName, xlKeysCampo);
    //                             rlField.SetRange(TableNo, xlIdTabla);

    //                             if rlField.FindFirst() then begin
    //                                 Evaluate(xlCampo, xlKeysCampo);
    //                                 rlField.SetRange(FieldName, xlCampo);
    //                                 rlField.SetFilter(ObsoleteState, clParametro1, rlField.ObsoleteState::Removed);
    //                                 xlFieldRef := xlRecordRef.Field(culTCNFuncionesComunes.NumCampoPorNombreF(xlRecordRef.Number, xlKeysCampo));
    //                                 Ventana.Update(2, xlFieldRef.Name);
    //                                 if not pglTCNGestionMasivaDatosCOM.AsignaFieldRefF(xlRecordRef.Number, xlFieldRef, xlLinea) then begin
    //                                     insertaIncidencia(rlTCNMapeoEnviosATR, rlTCNMapeoEnviosATR, xlRecordRef, StrSubstNo(clEt01, GetLastErrorText(), xlLinea));
    //                                 end;
    //                             end else begin
    //                                 xlError := StrSubstNo(clStr2, xlKeysCampo, xlKey);
    //                                 insertaIncidencia(rlTCNMapeoEnviosATR, rlTCNMapeoEnviosATR, xlRecordRef, xlError);
    //                             end;
    //                             Ventana.Update(3, valorCamposClave(rlTCNMapeoEnviosATR, rlTCNMapeoEnviosATR, xlRecordRef));

    //                             // antes de insertar o modificar el recordref comprobamos que los campos que componen la clave primaria esten rellenos en el recordref  
    //                             if Format(xlRecordRef.Field(rlTCNMapeoEnviosATR.FieldNo(Codigo)).Value) <> '' then begin
    //                                 if Format(xlRecordRef.Field(rlTCNMapeoEnviosATR.FieldNo(NumCampoEnvio)).Value) <> '0' then begin
    //                                     // comprobamos que el registro del cual estamos leyendo los campos este insertado si esta insertado modificamos el recordref 
    //                                     if not xlRegistroInsertado then begin
    //                                         xlRegistroInsertado := insertaRecordRef(xlRecordRef, false);
    //                                     end else begin
    //                                         if not modificaRecordRef(xlRecordRef, false) then begin
    //                                             insertaIncidencia(rlTCNMapeoEnviosATR, rlTCNMapeoEnviosATR, xlRecordRef, GetLastErrorText);
    //                                         end;
    //                                     end;
    //                                 end;
    //                             end;
    //                         end;
    //                     end;
    //                 end else begin
    //                     insertaIncidencia(rlTCNMapeoEnviosATR, rlTCNMapeoEnviosATR, xlRecordRef, STRSUBSTNO(clStr1, GETLASTERRORTEXT, xlIdTabla));
    //                 end;

    //                 xlRecordRef.Close();
    //             end;
    //             if TempIncidencias.FindFirst() then begin
    //                 culTCNFuncionesComunes.MensajeF('Se han producido incidencias en la importacion de la configuracion');
    //                 PAGE.Run(0, TempIncidencias);
    //             end;
    //         end else begin
    //             culTCNFuncionesComunes.ErrorF(clErrorFinal);
    //         end;
    //     end;
    //     // gTCNMapeoEnviosATR.OnAfterImportacionMapeoDatosF(rlTCNMapeoEnviosATR, xRec, rlField, culMemory, culTCNFncsCapturarErrorCOM, culTCNFuncionesComunes, culTCNErroresCOM, pglTCNGestionMasivaDatosCOM, xlRecordId, xlRecordRef, xlFieldRef, xlImportar, xlRegistroAbierto, IsHandled, xlInStream, xlIdTabla, xlCampos, xlObjetoJson, xlRegistro, xlRegistros, xlTokenJson, xlCampo, xlError, xlFicheroCte, xlKey, xlKeysCampo, xlLinea, xlTexto);
    // end;

    // procedure ImportCarData(): Boolean
    // var
    //     FileManagement: Codeunit "JSON Management";
    //     JsonText: Text;
    //     JsonObject: JsonObject;
    //     JsonArrayBrands: JsonArray;
    //     JsonArrayModels: JsonArray;
    //     JsonToken: JsonToken;
    //     CarBrandRec: Record "Car Brand";
    //     CarModelRec: Record "Car Model";
    //     OpenedFileName: Text;
    // begin
    //     // Seleccionar el archivo JSON
    //     if not FileManagement.GetArrayPropertyValueAsStringByName('Import Car Data', OpenedFileName) then
    //         exit(false);

    //     // Leer el contenido del archivo
    //     FileManagement.ReadAllTextFromFile(OpenedFileName, JsonText);

    //     // Parsear el contenido JSON
    //     if not JsonObject.ReadFrom(JsonText) then begin
    //         Message('No se pudo leer el archivo JSON. Verifique el formato.');
    //         exit(false);
    //     end;

    //     // Obtener las marcas del archivo JSON
    //     if JsonObject.Get('Brands', JsonToken) and JsonToken.IsArray() then begin
    //         JsonArrayBrands := JsonToken.AsArray();

    //         // Iterar a través de las marcas en el JSON
    //         foreach Brand in JsonArrayBrands do begin
    //             CarBrandRec.Init();
    //             CarBrandRec."Brand Code" := Brand.GetValue('BrandCode').AsText();
    //             CarBrandRec."Brand Name" := Brand.GetValue('BrandName').AsText();

    //             if not CarBrandRec.Insert(true) then
    //                 Error('Error al insertar la marca %1.', CarBrandRec."Brand Name");

    //             // Obtener los modelos correspondientes a esta marca
    //             if Brand.Get('Models', JsonToken) and JsonToken.IsArray() then begin
    //                 JsonArrayModels := JsonToken.AsArray();

    //                 foreach Model in JsonArrayModels do begin
    //                     CarModelRec.Init();
    //                     CarModelRec."Model Code" := Model.GetValue('ModelCode').AsText();
    //                     CarModelRec."Model Name" := Model.GetValue('ModelName').AsText();
    //                     CarModelRec."Brand Code" := CarBrandRec."Brand Code";

    //                     if not CarModelRec.Insert(true) then
    //                         Error('Error al insertar el modelo %1 para la marca %2.', CarModelRec."Model Name", CarBrandRec."Brand Name");
    //                 end;
    //             end;
    //         end;
    //     end;

    //     Message('Datos importados correctamente.');
    //     exit(true);
    // end;
}
