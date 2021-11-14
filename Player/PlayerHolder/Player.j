library PlayerLib
{
    public struct PlayerEntity
    {
        public static PlayerEntity instances[];
        integer pid;
        unit actor;
        ActiveAbilityContainer castAbilityList;

        public method cast(integer abilityRawCode,real x,real y,real facing)
        {
            castAbilityList.get(abilityRawCode).invoke(x,y,facing);
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

        public method getActiveAbility(integer rawCode)->IActiveAbility
        {
           return castAbilityList.get(rawCode);
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