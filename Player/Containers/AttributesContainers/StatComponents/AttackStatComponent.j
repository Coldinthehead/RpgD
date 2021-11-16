library AttackStatComponentLib
{
    public struct AttributeComponent extends IStatComponent
    {
        integer pid;
        BaseAttribute attackDamage;
        PassiveAbilityStat attackAbility;

        method getValue()->real
        {
            return attackDamage.getValue();
        }
        method getMultiplier()->real
        {
            return attackDamage.getMultiplier();
        }
        method addValue(real value)
        {
            attackDamage.addValue(value);
            overrideAbility();
        }
        method addMultiplier(real multiplier)
        {
            attackDamage.addMultiplier(multiplier);
            overrideAbility();
        }

        private method overrideAbility()
        {
            integer abilityValue = R2I(attackDamage.getValue());
            attackAbility.overrideAbility(abilityValue);
        }


        public static method getObject(integer pid)->thistype
        {
            thistype result = thistype.create();
            result.attackDamage = BaseAttribute.getObject();
            result.attackAbility = PassiveAbilityStat.getObject(pid);
            return result;
        }
    }
}