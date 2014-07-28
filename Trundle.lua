-- DjEAGLE`s Yayo Trundle
---- version 0.0.1 alpha


	require 'Utils'
	require 'winapi'
	require 'SKeys'
	require 'vals_lib'

    local yayo = require 'yayo'
    local uiconfig = require 'uiconfig'
	local send = require 'SendInputScheduled'
     
    TrundleCfg, menu = uiconfig.add_menu('AutoCarry')
    menu.checkbutton('useQ', 'Use Q')
	---menu.keydown('useW', 'Use W' , Keys.W)
	menu.keydown('useR', 'Use R' , Keys.T)
	menu.permashow('useQ')
	---menu.permashow('useW')
	menu.permashow('useR')
	
     
  
     
    
	
	
	function UseR()
		if TrundleCfg.useR and ValidTarget(target) and target.type == 20 and RRDY==1 then
			if GetDistance(myHero, target) <= 650 then
			  CastSpellTarget("R",target)
                       end  
         end
	end
	
	function UseW()
		
	end
     
    function Init()
            yayo.RegisterBeforeAttackCallback(BeforeAttack)
            yayo.RegisterOnAttackCallback(OnAttack)
            yayo.RegisterAfterAttackCallback(AfterAttack)
    end
     
    function Core()
          
    end
     
    function OnDraw()
           
    end
     
    function BeforeAttack(target)
        if yayo.Config.AutoCarry then
             if TrundleCfg.useQ then CastSpellTarget("Q",myHero) end
             end 
			  
    end
     
    function OnAttack(target)
        
    end
     
    function AfterAttack(target)
		-- if TrundleCfg.useW then
		--SpellXYZ(W,WRDY,myHero,myHero,1000,myHero.x,myHero.z)
	--end
		
    end
	
    
   
    
     
    Init()
    SetTimerCallback('Core')

