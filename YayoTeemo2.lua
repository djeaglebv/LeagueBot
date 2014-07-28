
--[[
 
***********************
**  AKIRA'S SCRIPTS  **
**     - Teemo -     **
***********************
 
This script took some time to code, if you like it please give feedback in the forum thread!
Thanks from Akira
 
]]
 
local yayo = require 'yayo'
local uiconfig = require 'uiconfig'
 
TeemoConfig, menu = uiconfig.add_menu('AutoCarry')
menu.checkbutton('qq', 'Use Q')
menu.checkbutton('ww', 'Use W')
 
 
function Init()
        yayo.RegisterBeforeAttackCallback(BeforeAttack)
        yayo.RegisterOnAttackCallback(OnAttack)
        yayo.RegisterAfterAttackCallback(AfterAttack)
end
 
function Core()
       
end
 
function OnDraw()
CustomCircle(yayo.MyRange(target),2,4,myHero)
end
 
function BeforeAttack(target)
    if TeemoConfig.qq then
        if yayo.Config.AutoCarry then
            if QRDY == 1 then
           CastSpellTarget('Q',target,1)
           end
	end
     end
   if GetDistance(myHero, Target) > yayo.MyRange(target) and TeemoConfig.ww then
       if yayo.Config.AutoCarry then 
          if WRDY == 1 then
         CastSpellTarget('W', myHero)
      end
    end
  end
end	
 
function OnAttack(target)
       
end
 
function AfterAttack(target)

end

OnDraw()
Init()
SetTimerCallback('Core')

