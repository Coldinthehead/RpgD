library IntModifiersLib
{
     public struct ManaFromInt extends IMajorModifier
    {
        IMinorAttribute attribute;

        public method onAdd(real amount)
        {
            attribute.addValue(amount * 5);
        }
        public method onRemove(real amount)
        {
            attribute.addValue(amount * 5);
        }

        public method modifyValue(real amount)
        {
            attribute.addValue(amount * 5);
        }


        public static method getObject(IMinorAttribute attribute)->thistype
        {
            thistype result = thistype.create();
            result.attribute = attribute;
            return result;
        }
    }
}