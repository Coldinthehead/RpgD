library DexStatLib
{
    public struct DexStat extends IEquipableItemStat
    {   
        real amount;

        public method addStat(integer pid)
        {
           //BJDebugMsg("stat added!");
        //    if(PlayerEntity.instances[pid].stats.attackDamage == 0)
        //    {
        //        BJDebugMsg("null stats");
        //    }
           PlayerEntity.instances[pid].stats.dex.addValue(amount);
        }

        public method removeStat(integer pid)
        {
            // BJDebugMsg("attack removed");
            PlayerEntity.instances[pid].stats.dex.addValue(-amount);
        }

        public static method getObject(real amount)->thistype
        {
            thistype result = thistype.create();
            result.amount = amount;
            return result;
        }
    }
}