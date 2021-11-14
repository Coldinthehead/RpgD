library IActiveAbilityLib
{
    public interface IActiveAbility
    {
        method invoke(real x, real y, real facing);
        method getRawCode()->integer;
       // method modify();
    }
}