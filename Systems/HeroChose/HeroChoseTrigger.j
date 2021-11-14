library HeroChoserLib
{
    private
    {
        //timer data;
        timer initTimer;
        dialog playerChoseDialog[11];
        trigger playerChoseTrigger[11];

        button choseButton[11][3];

        string chosedButtonTest[3];

        // 
        real HeroStartX;
        real HeroStartY;
        integer HERO_UNIT_RAWCODE[3];
    }

    public function CreateHeroUnit(integer pid,integer unitType)
    {
        integer STARTING_GOLD = 100;
        unit actor = CreateUnit(Player(pid),HERO_UNIT_RAWCODE[unitType],HeroStartX,HeroStartY,0);

        PlayerEntity.BuildPlayer(pid,actor);
        SelectUnitForPlayerSingle(PlayerEntity.instances[pid].actor,Player(pid));
       // UnitAddItem(PlayerEntity.instances[pid].actor,CreateItem(STARTING_ITEM_RAWCODE[unitType],GetUnitX(heroPlayer[pid]),GetUnitY(heroPlayer[pid])));
        //@TODO some camera?
        AdjustPlayerStateBJ(STARTING_GOLD, Player(pid), PLAYER_STATE_RESOURCE_GOLD );
    }
    
    function onPlayerDialogChose()
    {
        integer pid = GetPlayerId(GetTriggerPlayer());
        integer i;
        integer result;
        for(i = 0; i < 3;i+=1)
        {
            if(choseButton[pid][i] == GetClickedButton())
            {
                result = i;
                break;
            }
        }
        
        BJDebugMsg(chosedButtonTest[result]);
        CreateHeroUnit(pid,i);
        DestroyTrigger(playerChoseTrigger[i]);
    

    }

    function onInitTimer()
    {
        integer i;

        PauseTimer(initTimer);
        DestroyTimer(initTimer);
        for(i=0;i< 11;i+=1)
        {
            if(GetPlayerController(Player(i)) == MAP_CONTROL_USER)
            {
                playerChoseDialog[i] = DialogCreate();
                playerChoseTrigger[i] = CreateTrigger();
                TriggerRegisterDialogEvent(playerChoseTrigger[i], playerChoseDialog[i]);
                TriggerAddAction(playerChoseTrigger[i],function onPlayerDialogChose);
                DialogSetMessage(playerChoseDialog[i],"You are borned : ");
                choseButton[i][0] = DialogAddButton(playerChoseDialog[i],"Melee ",0);
                choseButton[i][1] = DialogAddButton(playerChoseDialog[i],"Range ",0);
                choseButton[i][2] = DialogAddButton(playerChoseDialog[i],"Mage ",0);
                DialogDisplay(Player(i), playerChoseDialog[i], true);
                
            }
        }
        chosedButtonTest[0] = "Melee button chosed";
        chosedButtonTest[1] = "Range button chosed";
        chosedButtonTest[2]  = "Mage button chosed";
    }

    function onInit()
    {
        initTimer = CreateTimer();
        TimerStart(initTimer,0.5,false,function onInitTimer);
        HeroStartX = 0.0;
        HeroStartY = 0.0;
        HERO_UNIT_RAWCODE[0] = 'H000';
        HERO_UNIT_RAWCODE[1] = 'H000';
        HERO_UNIT_RAWCODE[2] = 'H000';
    }
}