library ManaSphereLib
{
    public struct ManaSphere extends IPowerUpItem
    {

        public method onPick(integer pid)
        {
            processMana(PlayerEntity.instances[pid].actor);
        }

        private method processMana(unit u)
        {
            group g = CreateGroup();
            unit n;
            integer pid;
            GroupEnumUnitsInRange(g,GetUnitX(u),GetUnitY(u),1000,null);
            n = FirstOfGroup(g);
            while(n != null)
            {
                pid = GetPlayerId(GetOwningPlayer(n));
                if(pid != 11 && IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true)
                {
                    processManaSingle(pid);
                }
                GroupRemoveUnit(g,n);
                n = FirstOfGroup(g);
            }
            GroupClear(g);
            DestroyGroup(g);
            g = null;
            n = null;
        }

        private method processManaSingle(integer pid)
        {
            real currentHealth = GetUnitState(PlayerEntity.instances[pid].actor,UNIT_STATE_MANA );
            real maxHealth = GetUnitState(PlayerEntity.instances[pid].actor,UNIT_STATE_MAX_MANA);
            real healAmount = maxHealth / 7;
            real targetHealth = currentHealth + healAmount;
            // if(targetHealth > maxHealth)
            // {
            //     SetUnitState(PlayerEntity.instances[pid].actor,UNIT_STATE_LIFE,maxHealth);
            //     BJDebugMsg("Health = " + R2S(maxHealth));
            // }
            // else 
            // {
                SetUnitState(PlayerEntity.instances[pid].actor,UNIT_STATE_MANA,targetHealth);
                BJDebugMsg("Mana = " + R2S(healAmount));
            //} 
        }

        public static method getObject()->thistype
        {
            thistype result = thistype.create();
            return result;
        }
    }
}