library IMinorAttributeLib
{
    public interface IMinorAttribute
    {
        method getValue()->real;
        method getMultiplier()->real;
        method addValue(real value);
        method addMultiplier(real multiplier);
    }
}
