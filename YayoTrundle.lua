---	DjEAGLE`s Yayo Trundle
--- version 0.0.1 alpha
---
---	Thanks for help to all devs !! ( yonder , vald , lua , Malbert and the rest )
---	Thanks for Ult function to koolkaracter
---	Thanks for useW and useE function to Valdo :D
--- Don`t yell at me .... it`s my first script ever :-ss


	require 'Utils'
	require 'winapi'
	require 'SKeys'
	require 'vals_lib'

    local yayo = require 'yayo'
    local uiconfig = require 'uiconfig'
	local send = require 'SendInputScheduled'
     
    TrundleCfg, menu = uiconfig.add_menu('AutoCarry')
    menu.checkbutton('useQ', 'Use Q')
	menu.keydown('useW', 'Use W' , Keys.W)
	menu.keydown('useE' , 'Use E' , Keys.E)
	menu.checkbutton('useR', 'Use R')
	--menu.checkbutton('items', 'Use items')
	
	menu.permashow('useQ')
	menu.permashow('useW')
	menu.permashow('useE')
	menu.permashow('useR')
	--menu.permashow('items')
	
     

    
	

     
    function Init()
            yayo.RegisterBeforeAttackCallback(BeforeAttack)
            yayo.RegisterOnAttackCallback(OnAttack)
            yayo.RegisterAfterAttackCallback(AfterAttack)
    end
     
    function Core()
	
         if TrundleCfg.useW and GetDistance(myHero, mousePos) <= 895 then ----- W in 895 Range to mouse position
	CastSpellXYZ('W',mousePos.x,mousePos.y,mousePos.z) end 
	
		
		 if TrundleCfg.useE and GetDistance(myHero, mousePos) <= 999 then
	CastSpellXYZ('E',mousePos.x,mousePos.y,mousePos.z) end
	
    end
    
	
	
	
    function OnDraw()
           
    end
     
    function BeforeAttack(target)
        if yayo.Config.AutoCarry then
			if target~=nil then
				if TrundleCfg.useQ and target.type==20 then CastSpellTarget("Q",myHero) end --- uses Q after checking if target is valid
				end 
		end
    end
     
    function OnAttack(target)
		--if target~=nil then
			--if yayo.Config.AutoCarry and GetDistance(myHero, target) <= 650 and ValidTarget(target) and target.type == 20 and TrundleCfg.items then UseAllItems(target)
			--end
		--end
    end
    function AfterAttack(target)
	if target~=nil then
		if TrundleCfg.useR then
		if myHero.SpellTimeR > 1.0 and GetDistance(myHero, target) < 700 then CastSpellTarget('R', target) end -- uses R after checking if target and distance are valid
	end
		end
    end
	
    
   
    
     
    Init()
    SetTimerCallback('Core')

