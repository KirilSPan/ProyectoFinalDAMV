namespace KPR.GCP;

page 50102 KPRImagenListaGCP
{
    ApplicationArea = All;
    Caption = 'KPRImagenListaGCP';
    PageType = List;
    SourceTable = KPRCocheGCP;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field(Foto; Rec.Foto)
                {
                    ToolTip = 'Specifies the value of the Foto del Coche field.', Comment = '%';
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
    }
}
