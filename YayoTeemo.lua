
    --[[
     
    DjEagle`s Teemo
     
    This script is based on Akira`s ADC series and Valdorian`s old Teemo
	Credits to all developers from LeagueBot.net
     
    ]]
     
    require 'vals_lib'
    require 'Utils'
    require 'winapi'
    require 'SKeys'
    local yayo = require 'yayo'
    local uiconfig = require 'uiconfig'
    local Q,W,E,R = 'Q','W','E','R'
    local send = require 'SendInputScheduled'
	local myHero = GetSelf()

	
	
     
    TeemoConfig, menu = uiconfig.add_menu('AutoCarry')
    menu.keytoggle('autoQ', 'Auto Q', Keys.T, true)
	
     
	
     
    function Init()
            yayo.RegisterBeforeAttackCallback(BeforeAttack)
            yayo.RegisterOnAttackCallback(OnAttack)
            yayo.RegisterAfterAttackCallback(AfterAttack)
    end
     
    function Core()
            GetCD()
     DrawCircleObject(myHero, yayo.MyRange(target), Color.Green)
    end
	
	
     
    function OnDraw()
           
    end
	
	
	----------------
     
    function BeforeAttack(target)
    if TeemoConfig.autoQ then
    if yayo.Config.AutoCarry and ValidTarget(target,580) then
           UseAllItems(target)
                     if QRDY == 1 and GetDistance(myHero, target) <= 580 then
            CastSpellTarget('Q', target)
        end
       end
      end
    end
     
    function OnAttack(target)
     
    end
     
    function AfterAttack(target)
	 if TeemoConfig.autoQ then
		if yayo.Config.AutoCarry then
			if QRDY == 1 and GetDistance (myHero, target) <= 580 then
				CastSpellTarget ('Q', target)
			end
		end
	end
	end
	
   

     
    Init()
    SetTimerCallback('Core')

