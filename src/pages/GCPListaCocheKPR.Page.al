namespace ALProject.ALProject;

page 50100 "GCPListaCocheKPR"
{
    PageType = List;
    SourceTable = GCPCocheKPR;
    ApplicationArea = All;
    Caption = 'Lista de Coches';
    UsageCategory = Lists;


    layout
    {
        area(content)
        {
            repeater(Group)
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
                field(FotoUrl; Rec.FotoUrl)
                {
                    ToolTip = 'Specifies the value of the FotoUrl field.', Comment = '%';
                }
            }
        }
    }
}
