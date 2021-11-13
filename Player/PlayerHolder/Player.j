library PlayerLib
{
    public struct PlayerEntity
    {
        public static PlayerEntity instances[];
        integer pid;
        unit actor;
        ActiveAbilityContainer castAbilityList;

        public method cast(integer abilityRawCode,real x,real y)
        {
            // BJDebugMsg("cast : ");
            // BJDebugMsg(I2S(abilityRawCode));
            // BJDebugMsg(R2S(x) + " / " + R2S(y));
            castAbilityList.get(abilityRawCode).invoke(x,y);
        }

        public method addAbility(AbilityData data)->boolean
        {
            boolean isAdded = castAbilityList.tryAddAbility(data);
            if(isAdded)
            {
                UnitAddAbility(this.actor,data.abilityRawCode);
            }
            return isAdded;
        }


        public static method BuildPlayer(integer pid, unit actor)
        {
            thistype result = thistype.create();
            result.actor = actor;
            result.pid = pid;
            result.castAbilityList = ActiveAbilityContainer.getObject(pid);
            thistype.instances[pid] = result;
        }

    }
}