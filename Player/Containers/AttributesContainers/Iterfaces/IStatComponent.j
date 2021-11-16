library IStatComponentLib
{
    public interface IStatComponent
    {
        method getValue()->real;
        method getMultiplier()->real;
        method addValue(real value);
        method addMultiplier(real multiplier);
    }
}
