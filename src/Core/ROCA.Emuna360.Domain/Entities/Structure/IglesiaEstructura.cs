namespace ROCA.Emuna360.Domain.Entities.Structure;

public class IglesiaEstructura
{
    // The SPEC-002 section 10 lists "IglesiaEstructura" entity but section 8 does not list its properties.
    // I will assume it's a many to many table between Iglesia and EstructuraDenominacion based on typical naming.
    // However, I will create an empty/basic entity for now since I lack the SQL table definition.
    public int IglesiaId { get; set; }
    public int EstructuraId { get; set; }
}
