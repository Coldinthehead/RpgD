library AttributeWithAbilityComponentLib
{
    public struct AttributeWithAbilityComponent extends IStatComponent
    {
        integer pid;
        BaseAttribute numericValue;
        PassiveAbilityStat abilityValue;

        method getValue()->real
        {
            return numericValue.getValue();
        }
        method getMultiplier()->real
        {
            return numericValue.getMultiplier();
        }
        method addValue(real value)
        {
            numericValue.addValue(value);
            BJDebugMsg("current value : " + R2S(numericValue.getValue()));
            overrideAbility();
        }
        method addMultiplier(real multiplier)
        {
            numericValue.addMultiplier(multiplier);
            overrideAbility();
        }

        private method overrideAbility()
        {
            integer abilityValue = R2I(numericValue.getValue());
            this.abilityValue.overrideAbility(abilityValue);
        }


        public static method getObject(integer pid)->thistype
        {
            thistype result = thistype.create();
           // result.numericValue = BaseAttribute.getObject();
            //result.abilityValue = PassiveAbilityStat.getObject(pid);
            return result;
        }
    }
}