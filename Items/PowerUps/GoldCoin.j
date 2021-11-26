library GoldCoinLib
{
    public struct GoldCoin extends IPowerUpItem
    {
        integer amount;

        public method onPick(integer pid)
        {
            integer rand = GetRandomInt(0,amount * GetUnitLevel(PlayerEntity.instances[pid].actor));
           AdjustPlayerStateBJ(amount + rand, Player(pid), PLAYER_STATE_RESOURCE_GOLD);
        }

        public static method getObject(integer amount)->thistype
        {
            thistype result = thistype.create();
            result.amount = amount;
            return result;
        }
    }
}