library MonsterProvider
{
    public struct MonsterProvider
    {
        public static method createMonsters(group g, SpawnPosition position,MonsterData template)
        {
            integer i;
            for(i = 0; i < position.length;i+=1)
            {
                MonsterPackProvider.createPack(position.x[i], position.y[i],template,g);
            }
        }
    }
}