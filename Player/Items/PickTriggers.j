library ItemPickTriggers
{
    function onPickedAbilityItem()
    {
        integer pid = GetPlayerId(GetOwningPlayer(GetTriggerUnit()));
        integer index;
        BJDebugMsg("item Picked");
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


    function onInit()
    {
        trigger t = CreateTrigger();
        integer i = 0;
        for(i=0;i< 11;i+=1)
        {
            TriggerRegisterPlayerUnitEvent(t,Player(i),EVENT_PLAYER_UNIT_PICKUP_ITEM,null);
        }
        TriggerAddAction(t,function onPickedAbilityItem);
    }
}