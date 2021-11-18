library AttributeContainerLib
{
    public struct AttributeContainer
    {
        integer pid;

        IMinorAttribute attackDamage;
        IMinorAttribute attackSpeed;
        IMinorAttribute armour;
        IMinorAttribute str;
        IMinorAttribute dex;
        IMinorAttribute intel;

        
   
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