--------------------		[[ K2LINGROUP Universal No-Recoil Script ]]			--------------------
------------------------------------------------		Settings			--------------------------------------------------
local Master    = true				------ Masterswitch status defaults to at script start.   	[ true = on, false = off ]	Default = off
local debug = true 				------ See Extra Function Details. 								Default = false
local masterswitch = 13				------ Button to toggle main switch, set it to 13 to disable it					Default = 7	
local modeswitch = 11				------ Button to switch modes									Default = 9			
local Recoil = true 				------ This is what the recoil defaults to at script start.   	[ true = on, false = off ]	Default = off
local Automatic = false				------ This is what the rapid-fire defaults to at script start.	[ true = on, false = off ]	Default = off
local Y_level = 1				------ Vertical move per step. 									Default = 1(=<0 to work)
local Delay = 21 				------ Default delay on startup. 								Default = 1			
local mode_change_button = 10 			------ Button to cycle the config								Default = 8					
local mode_change_enabled = true		------ This allows you switch between configs							Default = true
local mode_selected = 1 			------ Default config selected upon loading the script						Default = 1
local rapid_Y_level = 10			------ Rapid-Fire Recoil Settings 								Default = 4-10
local rapid_delay = 50				------ Rapid-Fire Delay Settings (standing alone)						Default = 10-20
local rapid_firerate = 200			------ Rapid-Fire Click Speed (Lower = Faster) changeable in config				Default = 100-800
local autotag = true				------ Auto spot enemies when you're firing			[ true = on, false = off ]	Default = true
local tagbutton = "z"				------ "Spot" key in game									Default = z
local ReleseDate = "2020 01 14"			------ Type whatever you want
local show_controls = true			------ Not Working(WIP func)
------------------------------------------------	Anti-Recoil CONFIG		--------------------------------------------------
local mode_1_name = "Chick" 			------ Set custom names for each config you are running
local mode_1_default_delay = 26
local mode_2_name = "Strong"
local mode_2_default_delay = 20
local mode_3_name = "HARD"
local mode_3_default_delay = 14
local mode_4_name = "Ultra"
local mode_4_default_delay = 9
local mode_5_name = "Lord"
local mode_5_default_delay = 6
local mode_6_name = "Tachanka"
local mode_6_default_delay = 3
------------------------------------------------	Rapid-Fire CONFIG		--------------------------------------------------
local mode_rapid_1_name = "AutoFire-Slow"
local mode_rapid_1_default_delay = 500		------ Rapid-Fire Click Speed (Lower = Faster)
local mode_rapid_1_default_Y_level = -1
local mode_rapid_2_name = "AutoFire-Quick"
local mode_rapid_2_default_delay = 100
local mode_rapid_2_default_Y_level = -1
local mode_rapid_3_name = "Pistol-Slow"
local mode_rapid_3_default_delay = 500
local mode_rapid_3_default_Y_level = 3
local mode_rapid_4_name = "Pistol-Fast"
local mode_rapid_4_default_delay = 100
local mode_rapid_4_default_Y_level = 3
local mode_rapid_5_name = "OTG-41-Slow"
local mode_rapid_5_default_delay = 500
local mode_rapid_5_default_Y_level = 6
local mode_rapid_6_name = "OTG-41-Fast"
local mode_rapid_6_default_delay = 200
local mode_rapid_6_default_Y_level = 6
------------------------------------------------		Main Module			--------------------------------------------------
--						DONT TOUCH IF U DONT KNOW WHAT THEY'RE DOING!!!							--
local Mode      = "Recoil"
local Stat      = "False"
local time
local timer = 0
local timerlast = 0
local rsleep = 50
local DELAYMAX = 100
local power = 1
local firstinterval = 0
local Recoil_Step = math.random(1,11)
local Recoil_Step1 = math.random(1,2)
local delayint = 100
local count = 0
local finalcount = 7
local firsttrigger = false
local mode_1_delay = mode_1_default_delay
local mode_2_delay = mode_2_default_delay
local mode_3_delay = mode_3_default_delay
local mode_4_delay = mode_4_default_delay
local mode_5_delay = mode_5_default_delay
local mode_6_delay = mode_6_default_delay

 function mode(event, num) ---events: change
    if (mode_change_enabled == true and event == "change")then
    	if(mode_selected == 1)then
    		mode_selected = 2
    		Delay = mode_2_default_delay
    		rapid_Y_level = mode_rapid_2_default_Y_level
			rapid_firerate = mode_rapid_2_default_delay
    	elseif(mode_selected == 2)then
    		mode_selected = 3
    		Delay = mode_3_default_delay
			rapid_Y_level = mode_rapid_3_default_Y_level
			rapid_firerate = mode_rapid_3_default_delay
    		elseif(mode_selected == 3)then
    		mode_selected = 4
    		Delay = mode_4_default_delay		
			rapid_Y_level = mode_rapid_4_default_Y_level	
			rapid_firerate = mode_rapid_4_default_delay
   		elseif(mode_selected == 4)then
    		mode_selected = 5
    		Delay = mode_5_default_delay
			rapid_Y_level = mode_rapid_5_default_Y_level
			rapid_firerate = mode_rapid_5_default_delay
    	elseif(mode_selected ==5)then
    		mode_selected = 6
    		Delay = mode_6_default_delay
			rapid_Y_level = mode_rapid_6_default_Y_level
			rapid_firerate = mode_rapid_6_default_delay
		elseif(mode_selected ==6)then
			mode_selected = 1
    		Delay = mode_1_default_delay
			rapid_Y_level = mode_rapid_1_default_Y_level
			rapid_firerate = mode_rapid_1_default_delay
    	end
    	log()
    end
end ----end func mode()

function OnEvent(event, arg)
    --OutputLogMessage("Key: ".. arg.. "\n")
 	if ( event == "PROFILE_ACTIVATED" ) then
		math.randomseed(GetRunningTime()*Recoil_Step)
		EnablePrimaryMouseButtonEvents(true)
		ClearLog()	
		print"its working"
		OutputLogMessage("[[________________________________________________________]]\n")
		OutputLogMessage("                                                              \n")
		OutputLogMessage("     K2LINTECH - Universal Multi Function Anti-Recoil Script     \n")
		OutputLogMessage("     Made by K2LinN Aka Daniel24971                                          \n")  
		OutputLogMessage("     Function works in many FPS games!                                                      ")
		OutputLogMessage("\n[[________________________________________________________]]\n")
		OutputLogMessage("\n")
		Sleep(1000)
		OutputLogMessage("Loading Modules     ")
		Sleep(250)
		ClearLog()
		OutputLogMessage("Loading Modules.    ")
		Sleep(250)
		ClearLog()
		OutputLogMessage("Loading Modules..   ")
		Sleep(250)
		ClearLog()
		OutputLogMessage("Loading Modules...  ")
		Sleep(500)
		ClearLog()
		OutputLogMessage("Loading Modules.... ")
		Sleep(250)
		ClearLog()
		OutputLogMessage("[			#===K2LINTECH V6 ===||[_G-series Lua API _]||===#			]\n");
		OutputLogMessage("Checking Anti-Recoil Function			--Complete				|\n")
		Sleep(100)
		OutputLogMessage("Checking Rapid-Fire Function			--Complete				|\n")
		Sleep(100)
		OutputLogMessage("Checking Synchronization Function			--Complete				|\n")
		Sleep(100)
		OutputLogMessage("Checking Config Function				--Complete				|\n")
		Sleep(100)
		OutputLogMessage("Checking Loader Function				--Complete				|\n")
		Sleep(100)
		OutputLogMessage(" 			All Checked! Scripts ready to go!				|\n")
		OutputLogMessage("[#			===||[_ Made  by     K2Lin24971_]||===				#\n");
		Sleep(1050)
		ClearLog()
		log()
		end
		
	if ( event == "MOUSE_BUTTON_PRESSED" and arg == modeswitch) then
		if ( Recoil ) then
			Recoil    = false
			Automatic = true
			Mode      = "Rapid-Fire & Anti-Recoil"
			log()
		elseif ( Automatic ) then
			Recoil    = true
			Automatic = false
			Mode      = "Anti-Recoil"
			log()
		else
		end
		
	elseif ( event == "MOUSE_BUTTON_PRESSED" and arg == masterswitch) then
		if ( Master ) then
			Master    = false
			log()
		else
			Master    = true
			log()
		end
	end

	if (event == "MOUSE_BUTTON_PRESSED" and arg == mode_change_button) then
		mode("change")
		log()
		end

power = math.floor(((1)/(Delay)) * (10^3) + 0.5)/(10^3)
 
	if(not IsMouseButtonPressed(4)) then
		firing (0,Y_level,Delay) --Calls macro function
		log()-- Calls the log every event
		if (event == "MOUSE_BUTTON_PRESSED") then
			OutputLogMessage("You pressed Mouse-G")
			OutputLogMessage(arg)
		elseif(event == "MOUSE_BUTTON_RELEASED") then
			OutputLogMessage("You released Mouse-G")
			OutputLogMessage(arg)
		end
	end---end onevent()
end


function log()
	if(not IsMouseButtonPressed(1) or not IsMouseButtonPressed(3))then
		ClearLog()
		OutputLogMessage("#=========K2LINTECH MENU =========||[_G-series Lua API_]||=========#\n");
		OutputLogMessage("[G");
		OutputLogMessage(masterswitch);
		OutputLogMessage("] MainSwitch:");
		OutputLogMessage(tostring(Master));
		OutputLogMessage("  [G");
		OutputLogMessage(modeswitch);
		OutputLogMessage("] FunctionMode:");
		OutputLogMessage(Mode);
		OutputLogMessage(" , Delay(ms) = ");
		OutputLogMessage(Delay);
		OutputLogMessage("/");
		OutputLogMessage(DELAYMAX);
		OutputLogMessage("\n")
		OutputLogMessage("Power(Work/Time) = ");
		OutputLogMessage(power)
		OutputLogMessage(" ")
		end
	if(debug == true)then
		cps = 1000 / rapid_firerate
		OutputLogMessage(", Recoil_Step = ");
		OutputLogMessage(Recoil_Step)
		OutputLogMessage(", Recoil_Step1 = ");
		OutputLogMessage(Recoil_Step1)
		OutputLogMessage(", count = ");
		OutputLogMessage(count)
		OutputLogMessage(" \n")
		OutputLogMessage("Config_Loaded_# = ");
		OutputLogMessage(mode_selected.." , ")
		OutputLogMessage("Rapid-Fire Recoil : ")
		OutputLogMessage(rapid_Y_level)
		OutputLogMessage(" , ")
		OutputLogMessage("Click :")
		OutputLogMessage(cps)
		OutputLogMessage(" Per Secound \n")
		OutputLogMessage("[G"..mode_change_button.."]  Mode_change_button = ");
		OutputLogMessage(tostring(mode_change_enabled));
		OutputLogMessage(", debug = ");
		OutputLogMessage(tostring(debug))
		OutputLogMessage(", mode_change_enabled = ");
		OutputLogMessage(tostring(mode_change_enabled))
		OutputLogMessage(", Y_level = ");
		OutputLogMessage(Y_level.."\n")
		end
	if(mode_change_enabled==true)then
    	if(mode_selected == 1)then
    		OutputLogMessage("[ (# "..mode_1_name.." # - "..mode_1_delay.." / "..DELAYMAX.." ms) ]"); OutputLogMessage("	(# "..mode_2_name.." # - "..mode_2_delay.." / "..DELAYMAX.." ms)"); OutputLogMessage("	(# "..mode_3_name.." # - "..mode_3_delay.." / "..DELAYMAX.." ms)");  OutputLogMessage("	(# "..mode_4_name.." # - "..mode_4_delay.." / "..DELAYMAX.." ms)"); OutputLogMessage("	(# "..mode_5_name.." # - "..mode_5_delay.." / "..DELAYMAX.." ms)"); OutputLogMessage("	(# "..mode_6_name.." # - "..mode_6_delay.." / "..DELAYMAX.." ms)");
    	elseif(mode_selected == 2)then
    		OutputLogMessage("(# "..mode_1_name.." # - "..mode_1_delay.." / "..DELAYMAX.." ms)	"); OutputLogMessage("[ (# "..mode_2_name.." # - "..mode_2_delay.." / "..DELAYMAX.." ms) ]"); OutputLogMessage("	(# "..mode_3_name.." # - "..mode_3_delay.." / "..DELAYMAX.." ms)");   OutputLogMessage("	(# "..mode_4_name.." # - "..mode_4_delay.." / "..DELAYMAX.." ms)"); OutputLogMessage("	(# "..mode_5_name.." # - "..mode_5_delay.." / "..DELAYMAX.." ms)"); OutputLogMessage("	(# "..mode_6_name.." # - "..mode_6_delay.." / "..DELAYMAX.." ms)");
    	elseif(mode_selected == 3)then
    		OutputLogMessage("(# "..mode_1_name.." # - "..mode_1_delay.." / "..DELAYMAX.." ms)	"); OutputLogMessage("(# "..mode_2_name.." # - "..mode_2_delay.." / "..DELAYMAX.." ms)"); OutputLogMessage("	[ (# "..mode_3_name.." # - "..mode_3_delay.." / "..DELAYMAX.." ms) ]");   OutputLogMessage("	(# "..mode_4_name.." # - "..mode_4_delay.." / "..DELAYMAX.." ms)"); OutputLogMessage("	(# "..mode_5_name.." # - "..mode_5_delay.." / "..DELAYMAX.." ms)"); OutputLogMessage("	(# "..mode_6_name.." # - "..mode_6_delay.." / "..DELAYMAX.." ms)");
		elseif(mode_selected == 4)then
    		OutputLogMessage("(# "..mode_1_name.." # - "..mode_1_delay.." / "..DELAYMAX.." ms)	"); OutputLogMessage("(# "..mode_2_name.." # - "..mode_2_delay.." / "..DELAYMAX.." ms)"); OutputLogMessage("	(# "..mode_3_name.." # - "..mode_3_delay.." / "..DELAYMAX.." ms)");   OutputLogMessage("	[ (# "..mode_4_name.." # - "..mode_4_delay.." / "..DELAYMAX.." ms) ]"); OutputLogMessage("	(# "..mode_5_name.." # - "..mode_5_delay.." / "..DELAYMAX.." ms)"); OutputLogMessage("	(# "..mode_6_name.." # - "..mode_6_delay.." / "..DELAYMAX.." ms)");
    	elseif(mode_selected == 5)then
    		OutputLogMessage("(# "..mode_1_name.." # - "..mode_1_delay.." / "..DELAYMAX.." ms)	"); OutputLogMessage("(# "..mode_2_name.." # - "..mode_2_delay.." / "..DELAYMAX.." ms)"); OutputLogMessage("	(# "..mode_3_name.." # - "..mode_3_delay.." / "..DELAYMAX.." ms)");   OutputLogMessage("	(# "..mode_4_name.." # - "..mode_4_delay.." / "..DELAYMAX.." ms)"); OutputLogMessage("	[ (# "..mode_5_name.." # - "..mode_5_delay.." / "..DELAYMAX.." ms) ]"); OutputLogMessage("	(# "..mode_6_name.." # - "..mode_6_delay.." / "..DELAYMAX.." ms)");
    	elseif(mode_selected == 6)then
    		OutputLogMessage("(# "..mode_1_name.." # - "..mode_1_delay.." / "..DELAYMAX.." ms)	"); OutputLogMessage("(# "..mode_2_name.." # - "..mode_2_delay.." / "..DELAYMAX.." ms)"); OutputLogMessage("	(# "..mode_3_name.." # - "..mode_3_delay.." / "..DELAYMAX.." ms)");   OutputLogMessage("	(# "..mode_4_name.." # - "..mode_4_delay.." / "..DELAYMAX.." ms)"); OutputLogMessage("	(# "..mode_5_name.." # - "..mode_5_delay.." / "..DELAYMAX.." ms)"); OutputLogMessage("	[ (# "..mode_6_name.." # - "..mode_6_delay.." / "..DELAYMAX.." ms) ]");
		end
	OutputLogMessage("\n")
	OutputLogMessage("-----Clantag-K2LINGROUP BETA V6 	ReleseDate:"..ReleseDate.."-----\n")
	end
end

function firing(a,b,rsleep)
    if (Master and Recoil) then
		if IsMouseButtonPressed(3) then
			if(IsMouseButtonPressed(1)) then
				if(autotag) then
					PressKey(tagbutton)
					Sleep(math.random(5,25))
					ReleaseKey(tagbutton)
					Sleep(math.random(5,25))
					end
				repeat
					Recoil_Step1 = math.random(1,2)
					if (Recoil == true) then
						time = GetRunningTime()
							if(Delay >= 3)then
							if(Recoil_Step == 1)then
								MoveMouseRelative(a,b)
								Sleep(rsleep)
								Recoil_Step = math.random(1,7)
							elseif(Recoil_Step == 2)then
								MoveMouseRelative(a,b+1)
								Sleep(rsleep+2)
								Recoil_Step = math.random(3,7)
							elseif(Recoil_Step == 3)then
								MoveMouseRelative(a,b-1)
								Sleep(rsleep+2)
								Recoil_Step = math.random(4,7)
							elseif(Recoil_Step == 4)then
								MoveMouseRelative(a,b+1)
								Sleep(math.random(rsleep-2,rsleep+2))
								Recoil_Step = math.random(5,7)
							elseif(Recoil_Step == 5)then
								MoveMouseRelative(a,b-1)
								Sleep(rsleep)
								Recoil_Step = math.random(1,4)
							elseif(Recoil_Step == 6)then
								MoveMouseRelative(a,b)
								Sleep(rsleep-2)
								Recoil_Step = math.random(2,5)
							elseif(Recoil_Step == 7)then
								MoveMouseRelative(a,b)
								Sleep(rsleep+4)
								Recoil_Step = math.random(3,6)
							elseif(Recoil_Step == 8)then
								MoveMouseRelative(a,b)
								Sleep(math.random(rsleep-2,rsleep+2))
								Recoil_Step = math.random(5,11)
							elseif(Recoil_Step == 9)then
								MoveMouseRelative(a,b)
								Sleep(rsleep)
								Recoil_Step = math.random(8,11)
							elseif(Recoil_Step == 10)then
								MoveMouseRelative(a,b)
								Sleep(rsleep-2)
								Recoil_Step = math.random(9,12)
							elseif(Recoil_Step == 11)then
								MoveMouseRelative(a,b)
								Sleep(math.random(rsleep-2,rsleep+2))
								Recoil_Step = math.random(3,14)
							end
							else
								MoveMouseRelative(a,b)
								Sleep(math.random(rsleep-2,rsleep+2))
								Recoil_Step = math.random(1,11)
							end
						timer = GetRunningTime()-time
						if(timer >= timerlast)then 
							Recoil_Step1 = math.random(1,2)
						end
						ClearLog()
						OutputLogMessage("Function Cycle runs in : ")
						OutputLogMessage(timer+rapid_firerate)
						OutputLogMessage(" millisecond(s)\n")
					end
				until (not IsMouseButtonPressed(1) or not IsMouseButtonPressed(3))
				firstinterval = 0
				timerlast = timer
			end
		end
    elseif ( Master and Automatic) then
		if IsMouseButtonPressed(3) then
			if(IsMouseButtonPressed(5)) then
				if(autotag) then
					PressButton(tagbutton)
					Sleep(math.random(5,25))
					ReleaseButton(tagbutton)
					Sleep(math.random(5,25))
					end
				repeat
					Recoil_Step1 = math.random(1,2)
					if (Automatic == true) then
					PressMouseButton(1)
						time = GetRunningTime()
							if(Delay >= 3)then
							if(Recoil_Step == 1)then
								MoveMouseRelative(a,rapid_Y_level-2)
								Sleep(rapid_delay)
								Recoil_Step = math.random(1,7)
							elseif(Recoil_Step == 2)then
								MoveMouseRelative(a,rapid_Y_level-1)
								Sleep(rapid_delay)
								Recoil_Step = math.random(3,7)
							elseif(Recoil_Step == 3)then
								MoveMouseRelative(a,rapid_Y_level)
								Sleep(rapid_delay-1)
								Recoil_Step = math.random(4,7)
							elseif(Recoil_Step == 4)then
								MoveMouseRelative(a,rapid_Y_level+3)
								Sleep(rapid_delay-1)
								Recoil_Step = math.random(5,7)
							elseif(Recoil_Step == 5)then
								MoveMouseRelative(a,rapid_Y_level+5)
								Sleep(rapid_delay)
								Recoil_Step = math.random(1,4)
							elseif(Recoil_Step == 6)then
								MoveMouseRelative(a,rapid_Y_level+2)
								Sleep(rapid_delay+2)
								Recoil_Step = math.random(2,5)
							elseif(Recoil_Step == 7)then
								MoveMouseRelative(a,rapid_Y_level-2)
								Sleep(rapid_delay-1)
								Recoil_Step = math.random(3,6)
							elseif(Recoil_Step == 8)then
								MoveMouseRelative(a,rapid_Y_level+5)
								Sleep(rapid_delay)
								Recoil_Step = math.random(3,11)
							elseif(Recoil_Step == 9)then
								MoveMouseRelative(a,rapid_Y_level+2)
								Sleep(rapid_delay+1)
								Recoil_Step = math.random(2,9)
							elseif(Recoil_Step == 10)then
								MoveMouseRelative(a,rapid_Y_level-2)
								Sleep(rapid_delay-1)
								Recoil_Step = math.random(1,6)
							elseif(Recoil_Step == 11)then
								MoveMouseRelative(a,rapid_Y_level-2)
								Sleep(rapid_delay+2)
								Recoil_Step = math.random(3,14)
							end
							else
								MoveMouseRelative(a,rapid_Y_level+1)
								Sleep(rapid_delay-1)
								Recoil_Step = math.random(1,11)
							end
						timer = GetRunningTime()-time
						if(timer >= timerlast)then
							Recoil_Step1 = math.random(1,2)
						end
					Sleep(rapid_delay)
					ReleaseMouseButton(1)
					Sleep(math.random(rapid_firerate-30,rapid_firerate+30))
						ClearLog()
						OutputLogMessage("Function Cycle runs in : ")
						OutputLogMessage(timer+rapid_firerate)
						OutputLogMessage(" millisecond(s)\n")
					end
				until (not IsMouseButtonPressed(5) or not IsMouseButtonPressed(3))
				firstinterval = 0
				timerlast = timer
				end
			end
		end --END AT HERE!
	end
