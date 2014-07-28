	require 'winapi'
    require 'SKeys'
    require 'vals_lib'
    local Q,W,E,R = 'Q','W','E','R'
    local uiconfig = require 'uiconfig'
    local version = '1.3'
    local yayo = require 'yayo'
    local Minions = { }
    local SORT_CUSTOM = function(a, b) return a.maxHealth and b.maxHealth and a.maxHealth < b.maxHealth end
    local target
	local targetaa
	
    function Init()
            yayo.RegisterOnAttackCallback(OnAttack)
            yayo.RegisterAfterAttackCallback(AfterAttack)
    end
     
            CFG, menu = uiconfig.add_menu('Lucian Config', 200)
            menu.checkbutton('UseItems', 'Use Items', true)
            menu.keytoggle('AutoQ', 'Auto Q minion Harass', Keys.F1, true)
            menu.keytoggle('AutoE', 'Auto E A reset', Keys.F2, false)
			menu.keydown('ManualE', 'E to Mouse' , Keys.E)
            menu.permashow('AutoQ')
            menu.permashow('AutoE')
			menu.permashow('ManualE')
    
  
 function Manual_E()
	if CFG.ManualE then
                    if ERDY == 1 then
                            CastSpellXYZ('E',mousePos.x,0,mousePos.z)
                    end
            end
end

	
    function Main()
            GetCD()
Manual_E()
            target2 = GetWeakEnemy('PHYS',1000,'NEARMOUSE')
            Minions = GetEnemyMinions(SORT_CUSTOM)
            if not yayo.Config.AutoCarry and CFG.AutoQ then Auto_Q() end
            if yayo.Config.AutoCarry and not IsBuffed(myHero,'Lucian_P_buf',175) and target2~=nil then
                    if GetDistance(target2)<675 and QRDY==1 then CastSpellTarget('Q',target2) end
                    XX,YY,ZZ = GetFireahead(target2,1.6,16)
                    if distXYZ(myHero.x,myHero.z,XX,ZZ)<1000 and (GetDistance(target2)>675 or QRDY==0) and CreepBlock(XX,YY,ZZ)==0 then CastSpellXYZ('W',XX,YY,ZZ) end
            end
    end
     
    function Auto_Q()
            local target3 = GetWeakEnemy('PHYS',1000)
            for i, minion in pairs(Minions) do
                    if ValidTarget(target3) and ValidTarget(minion) and target3.x~=nil and target3.z~=nil and minion.x~=nil and minion.z~=nil and GetDistance(minion)<500 and GetDistance(target3,minion)<500 then
                            if IsBetween(myHero,minion,target3,50) then CastSpellTarget('Q',minion) end
                    end
            end
    end
     
    function OnAttack(target)
            if yayo.Config.AutoCarry and ValidTarget(target) and target.type == 20 and CFG.UseItems then UseAllItems(target) end
    end
     
    function AfterAttack(target)
            if yayo.Config.AutoCarry and not IsBuffed(myHero,'Lucian_P_buf',175) and target2~=nil then
                    if GetDistance(target2)<675 and QRDY==1 then CastSpellTarget('Q',target2) end
                    XX,YY,ZZ = GetFireahead(target2,1.6,16)
                    if distXYZ(myHero.x,myHero.z,XX,ZZ)<1000 and (GetDistance(target2)>675 or QRDY==0) and CreepBlock(XX,YY,ZZ)==0 then CastSpellXYZ('W',XX,YY,ZZ) end
            end
            if CFG.AutoE and ValidTarget(target) and target.type == 20 and QRDY==0 and WRDY==0 then CastSpellXYZ('E',mousePos.x,0,mousePos.z) end
    end
     
    SetScriptTimer(10)
    Init()
    SetTimerCallback('Main')

