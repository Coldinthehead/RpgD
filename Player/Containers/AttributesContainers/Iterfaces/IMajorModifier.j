library IMajorModifierLib
{
    public interface IMajorModifier
    {
        public method onAdd(real amount);
        public method onRemove(real amount);
        public method modifyValue(real amount);
    }
}