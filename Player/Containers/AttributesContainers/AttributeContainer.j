library AttributeContainerLib
{
    public struct AttributeContainer
    {
        integer pid;

        IStatComponent attackDamage;
        IStatComponent attackSpeed;
        IStatComponent armour;
        IStatComponent str;
        IStatComponent dex;
        IStatComponent intel;

        public static method getObject(integer pid)->thistype
        {
            thistype result = thistype.create();
            result.pid = pid;
            result.attackDamage = ComponentBuilder.buildAttackDamageComponent(pid);
            result.attackSpeed = ComponentBuilder.buildAttackSpeedComponent(pid);
            result.armour = ComponentBuilder.buildArmourComponent(pid);
            result.str = ComponentBuilder.buildStrComponent(pid);
            result.dex = ComponentBuilder.buildDexComponent(pid);
            result.intel = ComponentBuilder.buildIntCodes(pid);

            return result;
        }   
    }
}