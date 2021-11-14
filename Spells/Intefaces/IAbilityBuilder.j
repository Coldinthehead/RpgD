library IAbilityBuilderlib
{
    public interface IAbilityBuilder
    {
        public method build(integer pid, integer rawCode)->IActiveAbility;
    }
}