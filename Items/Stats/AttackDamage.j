library AttackDamageStatLib
{
    public struct AttackDamageStat extends IEquipableItemStat
    {   
        real amount;

        public method addStat(integer pid)
        {
           // PlayerEntity.instances[pid].stats.addAttackDamage(amoune);
           BJDebugMsg("attack added");
        }

        public method removeStat(integer pid)
        {
            BJDebugMsg("attack removed");
        }

        public static method getObject(real amount)->thistype
        {
            thistype result = thistype.create();
            result.amount = amount;
            return result;
        }
    }
}