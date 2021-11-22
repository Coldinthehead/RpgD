library StrModifiersLib
{
    public struct AttackDamageFromStr extends IMajorModifier
    {
        IMinorAttribute attribute;

        public method onAdd(real amount)
        {
            attribute.addValue(amount / 2);
        }
        public method onRemove(real amount)
        {
            attribute.addValue(amount / 2);
        }

        public method modifyValue(real amount)
        {
            attribute.addValue(amount / 2);
        }


        public static method getObject(IMinorAttribute attribute)->thistype
        {
            thistype result = thistype.create();
            result.attribute = attribute;
            return result;
        }
    }

    public struct HealthFromStr extends IMajorModifier
    {
        IMinorAttribute attribute;

        public method onAdd(real amount)
        {
            attribute.addValue(amount * 10);
        }
        public method onRemove(real amount)
        {
            attribute.addValue(amount * 10);
        }

        public method modifyValue(real amount)
        {
            attribute.addValue(amount * 10);
        }


        public static method getObject(IMinorAttribute attribute)->thistype
        {
            thistype result = thistype.create();
            result.attribute = attribute;
            return result;
        }
    }
}