library ItemPickTriggers
{
    function onPickedItem()
    {
        integer pid = GetPlayerId(GetOwningPlayer(GetTriggerUnit()));
        integer index;
        itemtype currentItemType = GetItemType(GetManipulatedItem());
        if(currentItemType == ITEM_TYPE_CAMPAIGN)
        {
            BJDebugMsg("item type Equipable");
            index = EquipableItemDetails.getEquipableItemByRawCode(GetItemTypeId(GetManipulatedItem()));
            if(index >= 0)
            {
                if(PlayerEntity.instances[pid].tryEquipItem(EquipableItemDetails.data[index]) == false)
                {
                    UnitRemoveItemSwapped(GetManipulatedItem(),PlayerEntity.instances[pid].actor);
                }
            }
        }
        else if(currentItemType == ITEM_TYPE_PERMANENT)
        {
            BJDebugMsg("item type Ability");
            index =  AbilityItemDetails.getIndexByItemRawCode(GetItemTypeId(GetManipulatedItem()));
            BJDebugMsg(I2S(index));
            if(index >=0)
            {
                if(PlayerEntity.instances[pid].addAbility(AbilityItemDetails.data[index]))
                {
                    RemoveItem(GetManipulatedItem());
                }
            } 
        }
        else if (currentItemType == ITEM_TYPE_POWERUP)
        {
            BJDebugMsg("item type powerUp!");
            PlayerEntity.instances[pid].pickPowerup(PowerUpItemDetails.getPowerUpByRawCode(GetItemTypeId(GetManipulatedItem())));
        }
        
        currentItemType = null;
    }

    function onDropItem()
    {
        integer pid =  GetPlayerId(GetOwningPlayer(GetTriggerUnit()));
        integer index;
        itemtype currentItemType = GetItemType(GetManipulatedItem());
        if(currentItemType == ITEM_TYPE_CAMPAIGN)
        {
            BJDebugMsg("item type Equipable");
            index = EquipableItemDetails.getEquipableItemByRawCode(GetItemTypeId(GetManipulatedItem()));
            if(index >= 0)
            {
                PlayerEntity.instances[pid].dropItem(EquipableItemDetails.data[index]);
            }
        }
        currentItemType = null;

    }


    function onInit()
    {
        trigger t = CreateTrigger();
        trigger tDrop = CreateTrigger();
        integer i = 0;
        for(i=0;i< 11;i+=1)
        {
            TriggerRegisterPlayerUnitEvent(t,Player(i),EVENT_PLAYER_UNIT_PICKUP_ITEM,null);
            TriggerRegisterPlayerUnitEvent(tDrop,Player(i),EVENT_PLAYER_UNIT_DROP_ITEM,null);
        }
        TriggerAddAction(t,function onPickedItem);
        TriggerAddAction(tDrop,function onDropItem);
    }
}