library AreaModifierLib
{
    public struct AreaModifier
    {
        public static method modify(SpikeSlamAbility ab)
        {
            if(ab != -1) // NULL POINTER!!!
            {
               ab.modifyAreaOvertime();
               ab.modifyProjectile(true);
               ab.modifyMaxUnitCount();
               ab.modifyMultistrike(true);
            }

        }
    }
}