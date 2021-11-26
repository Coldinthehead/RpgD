library PlayerLib
{
    public struct PlayerEntity
    {
        public static PlayerEntity instances[];
        integer pid;
        unit actor;
        ActiveAbilityContainer castAbilityList;
        SlotContainer equippedItemList;
        AttributeContainer stats;


        // //======poweruups
        public method pickPowerup(IPowerUpItem consumable)
        {
            consumable.onPick(pid);
        }

        // Actrive Ability
        //==========================================================================================================
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
        //==========================================================================================================
        //Equipable items
        //===========================================================================================================
        public method tryEquipItem(EquipableItemData data)->boolean
        {
            boolean canPick = data.slot.canPick(this.pid);
            integer i;
            data.slot.pick(this.pid);
            if(canPick)
            {
                for(i = 0; i < EquipableItemData.statLength; i+=1)
                {
                    data.stat[i].addStat(this.pid);
                }
            }
            return canPick;
        }

        public method dropItem(EquipableItemData data)->boolean
        {
            boolean canPick;
            integer i;
            data.slot.drop(this.pid);
            canPick = data.slot.canPick(this.pid);
            if(canPick)
            {
                for(i = 0; i < EquipableItemData.statLength; i+=1)
                {
                    data.stat[i].removeStat(this.pid);
                }
            }
            return canPick;
        }
        //============================================================================================================
        //PlayerStats
        //============================================================================================================
        public static method BuildPlayer(integer pid, unit actor)
        {
            thistype result = thistype.create();
            result.actor = actor;
            result.pid = pid;
            result.castAbilityList = ActiveAbilityContainer.getObject(pid);
            result.equippedItemList = SlotContainer.getObject(pid);
            result.stats = AttributeContainer.getObject(pid);
            thistype.instances[pid] = result;
        }

       

    }
}