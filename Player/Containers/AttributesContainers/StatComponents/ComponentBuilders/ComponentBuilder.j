library ComponentBuilderLib
{
    public struct ComponentBuilder
    {
        private static method buildDefaultComponent(integer pid)->AttributeWithAbilityComponent
        {
            AttributeWithAbilityComponent result = AttributeWithAbilityComponent.getObject(pid);
            result.numericValue = BaseAttribute.getObject();
            result.abilityValue = PassiveAbilityStat.getObject(pid);
            return result;
        }

        public static method buildAttackDamageComponent(integer pid)->IMinorAttribute
        {
            AttributeWithAbilityComponent result = thistype.buildDefaultComponent(pid);
            result.abilityValue.setAttackCodes();
           //BJDebugMsg("attribute Builed!");
            return result;
        }

        public static method buildArmourComponent(integer pid)->IMinorAttribute
        {
            AttributeWithAbilityComponent result = thistype.buildDefaultComponent(pid);
            result.abilityValue.setArmourCodes();
            return result;
        }

        public static method buildAttackSpeedComponent(integer pid)->IMinorAttribute
        {
            AttributeWithAbilityComponent result = thistype.buildDefaultComponent(pid);
            result.abilityValue.setAttackSpeedCodes();
            return result;
        }

        public static method buildHealthRegenComponent(integer pid)->IMinorAttribute
        {
            AttributeWithAbilityComponent result = thistype.buildDefaultComponent(pid);
            result.abilityValue.setHealthRegenCodes();
            return result;
        }
        
    }
}