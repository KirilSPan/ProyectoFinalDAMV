namespace KPR.GCP;
using System.Environment;
using System.Utilities;
using KPR.GCP;
using System.IO;
using GCP.GCP;

page 50100 "KPRFichaCocheGCP"
{
    PageType = Card;
    SourceTable = KPRCocheGCP;
    ApplicationArea = All;
    Caption = 'Ficha del Coche';
    UsageCategory = Administration;


    layout
    {
        area(content)
        {
            group("Detalles del Coche")
            {

                field(Marca; Rec.Marca)
                {
                    ToolTip = 'Specifies the value of the Marca field.', Comment = '%';


                    trigger OnLookup(var Text: Text): Boolean
                    var
                        CarBrandRec: Record KPRMarcaCocheGCP;
                    begin
                        // Mostrar la lista de marcas para seleccionar
                        if PAGE.RunModal(PAGE::KPRListaMarcaGCP, CarBrandRec) = ACTION::LookupOK then begin
                            Rec.Marca := CarBrandRec."Brand Name";
                            Rec.Modify(true);

                        end;
                    end;

                    trigger OnValidate()
                    begin
                        if Rec.Marca <> xRec.Marca then begin
                            // Si la marca ha cambiado, limpiamos el campo del modelo
                            Rec.Modelo := '';
                            CurrPage.Update(false); // Refrescar la página para aplicar cambios
                        end;
                    end;
                }
                field(Modelo; Rec.Modelo)
                {
                    ToolTip = 'Specifies the value of the Modelo field.', Comment = '%';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        CarModelRec: Record KPRModeloCocheGCP;
                    begin
                        // Filtrar modelos por la marca seleccionada
                        CarModelRec.SetRange("Brand Code", Rec.Marca);
                        if PAGE.RunModal(PAGE::KPRListaModeloGCP, CarModelRec) = ACTION::LookupOK then begin
                            Rec.Modelo := CarModelRec."Model Name";
                            Rec.Modify(true);
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        if Rec.Modelo = '' then
                            Error('Seleccione un modelo válido para la marca seleccionada.');
                    end;

                }
                field(Id; Rec.Id)
                {
                    ToolTip = 'Specifies the value of the Id field.', Comment = '%';
                }
                field(TipoTransmision; Rec.TipoTransmision)
                {
                    ToolTip = 'Specifies the value of the TipoTransmision field.', Comment = '%';
                }
                field(NumeroPuertas; Rec.NumeroPuertas)
                {
                    ToolTip = 'Specifies the value of the NumeroPuertas field.', Comment = '%';
                }
                field(Kilometros; Rec.Kilometros)
                {
                    ToolTip = 'Specifies the value of the Kilometros field.', Comment = '%';
                }
                field(Anio; Rec.Anio)
                {
                    ToolTip = 'Specifies the value of the Anio field.', Comment = '%';
                }

            }
            // group("Imagen del Coche") // Grupo para mostrar la imagen del coche
            // {
            //     field(Foto; Rec."Foto")
            //     {
            //         ApplicationArea = All;
            //         ShowCaption = false; // Mostrar la etiqueta "Foto"
            //     }
            // }
            group("Piezas Sustituidas")
            {

                Caption = 'Piezas Sustituidas';

                //TODO Este campo se quitara y se añadira una lista de las piezas que se guardara en otra tabla
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
            }
        }

        area(FactBoxes)
        {
            part(MediaFactbox; KPRImagenFactboxGCP)
            {
                ApplicationArea = all;
                SubPageLink = Id = field(Id);

            }
        }

        //TODO Hacer un lispart para incluir las piezas

    }
    actions
    {
        area(processing)
        {
            action("Importar Imagen")
            {
                ApplicationArea = All;
                Caption = 'Importar Imagen';
                Image = Import;
                ToolTip = 'Importar imagen para el coche.';
                Promoted = true;
                PromotedIsBig = true;
                // PromotedCategory = Category4;
                PromotedOnly = true;

                trigger OnAction()
                var
                    FromFileName: Text;
                    InStreamPic: InStream;
                begin
                    if UploadIntoStream('Import', '', 'All Files (*.*)|*.*', FromFileName, InStreamPic) then begin
                        Rec.Foto.ImportStream(InStreamPic, FromFileName);
                        Rec.Modify(true);
                    end;
                    Message('Imagen Añadida.');
                end;
            }
            action("Exportar Imagen")
            {
                ApplicationArea = All;
                Caption = 'Exportar Imagen';
                Image = Export;
                ToolTip = 'Exportar imagen del coche.';
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    TenantMedia: Record "Tenant Media";
                    DataCompression: Codeunit "Data Compression";
                    TempBlob: Codeunit "Temp Blob";
                    InStreamPic: InStream;
                    i: Integer;
                    ImageLbl: Label '%1_Image_%2.jpg', Comment = 'Imagen', Locked = true;
                    OutStream: OutStream;
                    FileName: Text;
                    ZipFileName: Text;
                begin
                    ZipFileName := 'Image.zip';
                    DataCompression.CreateZipArchive();
                    for i := 1 to Rec.Foto.Count do begin
                        if TenantMedia.Get(Rec.Foto.Item(i)) then
                            TenantMedia.CalcFields(Content);
                        if TenantMedia.Content.HasValue then begin
                            Clear(InStreamPic);
                            TenantMedia.Content.CreateInStream(InStreamPic);
                            FileName := StrSubstNo(ImageLbl, Rec.TableCaption, i);
                            DataCompression.AddEntry(InStreamPic, FileName);
                        end;

                    end;
                    TempBlob.CreateOutStream(OutStream);
                    DataCompression.SaveZipArchive(OutStream);
                    TempBlob.CreateInStream(InStreamPic);
                    DownloadFromStream(InStreamPic, '', '', '', ZipFileName);
                    Message('Imagen Exportada.');
                end;
            }


            action("Eliminar Imagen")
            {
                ApplicationArea = All;
                Caption = 'Eliminar Imagen';
                Image = Delete;
                ToolTip = 'Eliminar imagen del coche.';
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    rlKPRCocheGCP: Record KPRCocheGCP;
                    mediasetId: GUID;
                begin
                    if not Confirm('¿Estás seguro de que deseas eliminar la imagen?', false) then
                        exit;
                    rlKPRCocheGCP.Get(Rec.Id);
                    mediasetId := Rec.Foto.MediaId;

                    Rec.Foto.Remove(mediasetId); // Limpiar el campo `MediaSet`
                    Rec.Modify(true);
                    Clear(Rec.Foto);
                    CurrPage.Update(true); // Actualiza la página para reflejar el cambio
                    Message('Imagen eliminada.');
                end;
            }

        }
    }



}
