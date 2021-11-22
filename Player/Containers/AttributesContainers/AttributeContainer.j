library AttributeContainerLib
{
    public struct AttributeContainer
    {
        integer pid;

        IMinorAttribute attackDamage;
        IMinorAttribute attackSpeed;
        IMinorAttribute armour;
        IMinorAttribute health;
        IMinorAttribute mana;
        MajorAttribute str;
        MajorAttribute dex;
        MajorAttribute intel;

        
   
        public static method getObject(integer pid)->thistype
        {
            thistype result = thistype.create();
            result.pid = pid;
            result.attackDamage = ComponentBuilder.buildAttackDamageComponent(pid);
            result.attackSpeed = ComponentBuilder.buildAttackSpeedComponent(pid);
            result.armour = ComponentBuilder.buildArmourComponent(pid);

            result.health = StateStat.getObject(pid,UNIT_STATE_MAX_LIFE);
            result.mana = StateStat.getObject(pid,UNIT_STATE_MAX_MANA);

            result.str = MajorAttribute.getObject(pid);
            result.str.abilityValue.setStrCodes();
            result.str.addMofidier(HealthFromStr.getObject(result.health));
            result.str.addMofidier(AttackDamageFromStr.getObject(result.attackDamage));


            result.dex = MajorAttribute.getObject(pid);
            result.dex.abilityValue.setDexCodes();

            result.intel = MajorAttribute.getObject(pid);
            result.intel.abilityValue.setIntCodes();
            result.intel.addMofidier(ManaFromInt.getObject(result.mana));

            return result;
        }   
    }
}