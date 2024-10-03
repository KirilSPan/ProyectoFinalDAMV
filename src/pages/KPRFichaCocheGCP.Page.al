namespace ALProject.ALProject;
using System.Environment;
using System.Utilities;
using GCP.GCP;
using System.IO;

page 50100 "KPRFichaCocheGCP"
{
    PageType = Card;
    SourceTable = KPRCocheGCP;
    ApplicationArea = All;
    Caption = 'Ficha del Coche';
    UsageCategory = Lists;


    layout
    {
        area(content)
        {
            group("Detalles del Coche")
            {

                field(Marca; Rec.Marca)
                {
                    ToolTip = 'Specifies the value of the Marca field.', Comment = '%';
                }
                field(TipoTransmision; Rec.TipoTransmision)
                {
                    ToolTip = 'Specifies the value of the TipoTransmision field.', Comment = '%';
                }
                field(NumeroPuertas; Rec.NumeroPuertas)
                {
                    ToolTip = 'Specifies the value of the NumeroPuertas field.', Comment = '%';
                }
                field(Modelo; Rec.Modelo)
                {
                    ToolTip = 'Specifies the value of the Modelo field.', Comment = '%';
                }
                field(Kilometros; Rec.Kilometros)
                {
                    ToolTip = 'Specifies the value of the Kilometros field.', Comment = '%';
                }
                field(Id; Rec.Id)
                {
                    ToolTip = 'Specifies the value of the Id field.', Comment = '%';
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
        }

        area(FactBoxes)
        {
            part(MediaFactbox; KPRImagenFactboxGCP)
            {
                ApplicationArea = all;
                SubPageLink = Id = field(Id);
            }
        }
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

        }
    }
}
