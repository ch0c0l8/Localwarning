; GUI 
Gui, Show, x718 y400 w260 h230, Local Warning
Gui, Add, Tab, x0 y-1 w260 h230 , Main|Friendly|Hostile|NPC 1|NPC 2
Gui, Tab, 1
Gui, Add, Edit, x10 y30 w110 h20 vName Limit40 +Center, %name%
Gui, Add, Text, x10 y55 w70 h20 +Center, Delay(ms)
Gui, Add, Edit, x90 y55 w30 h20 vDelay Number Limit4 +Center, %Delay%
Gui, Add, Text, x130 y30 w70 h20 +Center, First X
Gui, Add, Edit, x210 y30 w30 h20 vFX Number Limit4 +Center, %FX%
Gui, Add, Text, x130 y55 w70 h20 +Center, First Y
Gui, Add, Edit, x210 y55 w30 h20 vFY Number Limit4 +Center, %FY%
Gui, Add, Text, x130 y80 w70 h20 +Center, Second X
Gui, Add, Edit, x210 y80 w30 h20 vSX Number Limit4 +Center, %SX%
Gui, Add, Text, x130 y105 w70 h20 +Center, Second Y
Gui, Add, Edit, x210 y105 w30 h20 vSY Number Limit4 +Center, %SY%
Gui, Add, Checkbox, x10 y80 vWA checked%WA%, WinActivate
Gui, Add, Text, x12 y140 w230 h20 +Center, Made by Odunen Yatolila
Gui, Tab, 2
Gui, Add,Picture,x10 y30 w12 h12, image/Friendly/Fleet.gif
Gui, Add, Checkbox, x25 y30 vFleet checked%Fleet%, Fleet
Gui, Add,Picture,x10 y50 w12 h12, image/Friendly/ExcellentStanding.gif
Gui, Add, Checkbox, x25 y50 vExcellentStanding checked%ExcellentStanding%, Deep blue
Gui, Add,Picture,x10 y70 w12 h12, image/Friendly/GoodStanding.gif
Gui, Add, Checkbox, x25 y70 vGoodStanding checked%GoodStanding%, Blue
Gui, Add,Picture,x130 y30 w12 h12, image/Friendly/Corporation.gif
Gui, Add, Checkbox, x145 y30 vCorporation checked%Corporation%, Corporation
Gui, Add,Picture,x130 y50 w12 h12, image/Friendly/Alliance.gif
Gui, Add, Checkbox, x145 y50 vAlliance checked%Alliance%, Alliance
Gui, Add,Picture,x130 y70 w12 h12, image/Friendly/MilitiaAlly.gif
Gui, Add, Checkbox, x145 y70 vMilitiaAlly checked%MilitiaAlly%, Militia ally
Gui, Tab, 3
Gui, Add,Picture,x10 y30 w12 h12, image/Hostiles/TerribleStanding.gif
Gui, Add, Checkbox, x25 y30 vTerribleStanding checked%TerribleStanding%, Deep red
Gui, Add,Picture,x10 y50 w12 h12, image/Hostiles/BadStanding.gif
Gui, Add, Checkbox, x25 y50 vBadStanding checked%BadStanding%, Red
Gui, Add,Picture,x10 y70 w12 h12, image/Hostiles/Neutral.gif
Gui, Add, Checkbox, x25 y70 vNeutral checked%Neutral%, Neutral
Gui, Add,Picture,x10 y90 w12 h12, image/Hostiles/War.gif
Gui, Add, Checkbox, x25 y90 vWar checked%War%, War
Gui, Add,Picture,x10 y110 w12 h12, image/Hostiles/MilitiaWar.gif
Gui, Add, Checkbox, x25 y110 vMilitiaWar checked%MilitiaWar%, Militia war
Gui, Add,Picture,x10 y130 w12 h12, image/Hostiles/AvailableKillRight.gif
Gui, Add, Checkbox, x25 y130 vAvailableKillRight checked%AvailableKillRight%, Kill right
Gui, Add,Picture,x130 y30 w12 h12, image/Hostiles/LimitedEngagement.gif
Gui, Add, Checkbox, x145 y30 vLimitedEngagement checked%LimitedEngagement%, Engagement
Gui, Add,Picture,x130 y50 w12 h12, image/Hostiles/Criminal.gif
Gui, Add, Checkbox, x145 y50 vCriminal checked%Criminal%, Criminal
Gui, Add,Picture,x130 y70 w12 h12, image/Hostiles/Suspect.gif
Gui, Add, Checkbox, x145 y70 vSuspect checked%Suspect%, Suspect
Gui, Add,Picture,x130 y90 w12 h12, image/Hostiles/Outlaw.png
Gui, Add, Checkbox, x145 y90 vOutlaw checked%Outlaw%, Below -5 sec
Gui, Add,Picture,x130 y110 w12 h12, image/Hostiles/SecurityStatusBelowZero.gif
Gui, Add, Checkbox, x145 y110 vSecurityStatusBelowZero checked%SecurityStatusBelowZero%, Below -0 sec
Gui, Add,Picture,x130 y130 w12 h12, image/Hostiles/Bounty.gif
Gui, Add, Checkbox, x145 y130 vBounty checked%Bounty%, Bounty
Gui, Tab, 4
Gui, Add,Picture,x10 y30 w12 h12, image/NPC/Icon_red_drone.png
Gui, Add, Checkbox, x25 y30 vDrone checked%drone%, Drone
Gui, Add,Picture,x10 y50 w12 h12, image/NPC/Icon_red_sentry_drone.png
Gui, Add, Checkbox, x25 y50 vSentry_drone checked%Sentry_drone%, Sentry drone
Gui, Add,Picture,x10 y70 w12 h12, image/NPC/Icon_red_fighter.png
Gui, Add, Checkbox, x25 y70 vFighter checked%Fighter%, Fighter
Gui, Add,Picture,x10 y90 w12 h12, image/NPC/Icon_red_capsule.png
Gui, Add, Checkbox, x25 y90 vCapsule checked%Capsule%, Capsule
Gui, Add,Picture,x10 y110 w12 h12, image/NPC/Icon_red_shuttle.png
Gui, Add, Checkbox, x25 y110 vShuttle checked%Shuttle%, Shuttle
Gui, Add,Picture,x10 y130 w12 h12, image/NPC/Icon_red_rookie.png
Gui, Add, Checkbox, x25 y130 vRookie checked%Rookie%, Rookie
Gui, Add,Picture,x130 y30 w12 h12, image/NPC/Icon_red_mining_frigate.png
Gui, Add, Checkbox, x145 y30 vMining_frigate checked%Mining_frigate%, Mining frigate
Gui, Add,Picture,x130 y50 w12 h12, image/NPC/Icon_red_mining_barge.png
Gui, Add, Checkbox, x145 y50 vMining_barge checked%Mining_barge%, Mining barge
Gui, Add,Picture,x130 y70 w12 h12, image/NPC/Icon_red_industrial.png
Gui, Add, Checkbox, x145 y70 vIndustrial checked%Industrial%, Industrial 1
Gui, Add,Picture,x130 y90 w12 h12, image/NPC/Icon_red_industrial_command_ship.png
Gui, Add, Checkbox, x145 y90 vIndustrial_command checked%Industrial_command%, Industrial 2
Gui, Add,Picture,x130 y110 w12 h12, image/NPC/Icon_red_industrial_capital.png
Gui, Add, Checkbox, x145 y110 vIndustrial_capital checked%Industrial_capital%, Industrial 3
Gui, Add,Picture,x130 y130 w12 h12, image/NPC/Icon_red_tower.png
Gui, Add, Checkbox, x145 y130 vSentry checked%Sentry%, Sentry
Gui, Tab, 5
Gui, Add,Picture,x10 y30 w12 h12, image/NPC/Icon_red_frigate.png
Gui, Add, Checkbox, x25 y30 vFrigate checked%Frigate%, Frigate
Gui, Add,Picture,x10 y50 w12 h12, image/NPC/Icon_red_destroyer.png
Gui, Add, Checkbox, x25 y50 vDestroyer checked%Destroyer%, Destroyer
Gui, Add,Picture,x10 y70 w12 h12, image/NPC/Icon_red_cruiser.png
Gui, Add, Checkbox, x25 y70 vCruiser checked%Cruiser%, Cruiser
Gui, Add,Picture,x10 y90 w12 h12, image/NPC/Icon_red_battlecruiser.png
Gui, Add, Checkbox, x25 y90 vBattlecruiser checked%Battlecruiser%, Battlecruiser
Gui, Add,Picture,x10 y110 w12 h12, image/NPC/Icon_red_battleship.png
Gui, Add, Checkbox, x25 y110 vBattleship checked%Battleship%, Battleship
Gui, Add,Picture,x130 y30 w12 h12, image/NPC/Icon_red_dreadnought.png
Gui, Add, Checkbox, x145 y30 vDreadnought checked%Dreadnought%, Dreadnought
Gui, Add,Picture,x130 y50 w12 h12, image/NPC/Icon_red_carrier.png
Gui, Add, Checkbox, x145 y50 vCarrier checked%Carrier%, Carrier
Gui, Add,Picture,x130 y70 w12 h12, image/NPC/Icon_red_supercarrier.png
Gui, Add, Checkbox, x145 y70 vSupercarrier checked%Supercarrier%, Supercarrier
Gui, Add,Picture,x130 y90 w12 h12, image/NPC/Icon_red_titan.png
Gui, Add, Checkbox, x145 y90 vTitan checked%Titan%, Titan
Gui, Tab
Gui, Add, Button, x12 y160 w230 h20 vSMP gSMP +Center, Set Mouse Position
Gui, Add, Button, x12 y180 w230 h20 gStart vstart +Center, Start and Save
Gui, Add, Button, x12 y180 w230 h20 gStop vstop +Center, Stop
Gui, Add, Button, x12 y200 w230 h20 gExitApp +Center, Exit App

GuiControl, hide, stop
return

; 마우스 간편 좌표 설정
SMP:
{
	gui, submit, nohide
	CoordMode, Mouse, Window
	GuiControl, Disabled, SMP
	
	; 첫번째 좌표 클릭 설정
	KeyWait, Lbutton, D
	MouseGetPos, posx1, posy1
	guicontrol,,FX, %posx1%
	guicontrol,,FY, %posy1%
	msgbox, 0, Local Warning, Set next mouse position
	
	;두번째 좌표 클릭 설정
	KeyWait, Lbutton, D
	MouseGetPos, posx2, posy2
	guicontrol,,SX, %posx2%
	guicontrol,,SY, %posy2%
	msgbox, 0, Local Warning, Setup completed
	
	GuiControl, Enabled, SMP
}
return

; 앱 종료시
ExitApp:
{
	IniWrite, %name%, data.ini, Name, Name

	IniWrite, %FX%, data.ini, Coordinate, FX
	IniWrite, %FY%, data.ini, Coordinate, FY
	IniWrite, %SX%, data.ini, Coordinate, SX
	IniWrite, %SY%, data.ini, Coordinate, SY

	IniWrite, %Delay%, data.ini, SetValue, delay
	IniWrite, %WA%, data.ini, SetValue, WA

	IniWrite, %Alliance%, data.ini, Friendly, Alliance
	IniWrite, %Corporation%, data.ini, Friendly, Corporation
	IniWrite, %ExcellentStanding%, data.ini, Friendly, ExcellentStanding
	IniWrite, %Fleet%, data.ini, Friendly, Fleet
	IniWrite, %GoodStanding%, data.ini, Friendly, GoodStanding
	IniWrite, %MilitiaAlly%, data.ini, Friendly, MilitiaAlly

	IniWrite, %AvailableKillRight%, data.ini, Hostiles, AvailableKillRight
	IniWrite, %BadStanding%, data.ini, Hostiles, BadStanding
	IniWrite, %Bounty%, data.ini, Hostiles, Bounty
	IniWrite, %Criminal%, data.ini, Hostiles, Criminal
	IniWrite, %LimitedEngagement%, data.ini, Hostiles, LimitedEngagement
	IniWrite, %MilitiaWar%, data.ini, Hostiles, MilitiaWar
	IniWrite, %Neutral%, data.ini, Hostiles, Neutral
	IniWrite, %Outlaw%, data.ini, Hostiles, Outlaw
	IniWrite, %SecurityStatusBelowZero%, data.ini, Hostiles, SecurityStatusBelowZero
	IniWrite, %Suspect%, data.ini, Hostiles, Suspect
	IniWrite, %TerribleStanding%, data.ini, Hostiles, TerribleStanding
	IniWrite, %War%, data.ini, Hostiles, War

	IniWrite, %Drone%, data.ini, NPC, Drone
	IniWrite, %Sentry_drone%, data.ini, NPC, Sentry_drone
	IniWrite, %Fighter%, data.ini, NPC, Fighter
	IniWrite, %Capsule%, data.ini, NPC, Capsule
	IniWrite, %Shuttle%, data.ini, NPC, Shuttle
	IniWrite, %Rookie%, data.ini, NPC, Rookie
	IniWrite, %Mining_frigate%, data.ini, NPC, Mining_frigate
	IniWrite, %Mining_barge%, data.ini, NPC, Mining_barge
	IniWrite, %Industrial%, data.ini, NPC, Industrial
	IniWrite, %Industrial_command%, data.ini, NPC, Industrial_command
	IniWrite, %Industrial_capital%, data.ini, NPC, Industrial_capital
	IniWrite, %Sentry%, data.ini, NPC, Sentry

	IniWrite, %Frigate%, data.ini, NPC, Frigate
	IniWrite, %Destroyer%, data.ini, NPC, Destroyer
	IniWrite, %Cruiser%, data.ini, NPC, Cruiser
	IniWrite, %Battlecruiser%, data.ini, NPC, Battlecruiser
	IniWrite, %Battleship%, data.ini, NPC, Battleship
	IniWrite, %Dreadnought%, data.ini, NPC, Dreadnought
	IniWrite, %Carrier%, data.ini, NPC, Carrier
	IniWrite, %Supercarrier%, data.ini, NPC, Supercarrier
	IniWrite, %Titan%, data.ini, NPC, Titan

	ExitApp
}
return

; GUI에서 앱 종료를 눌렀을 경우
GuiClose:
{
	IniWrite, %name%, data.ini, Name, Name

	IniWrite, %FX%, data.ini, Coordinate, FX
	IniWrite, %FY%, data.ini, Coordinate, FY
	IniWrite, %SX%, data.ini, Coordinate, SX
	IniWrite, %SY%, data.ini, Coordinate, SY

	IniWrite, %Delay%, data.ini, SetValue, delay
	IniWrite, %WA%, data.ini, SetValue, WA

	IniWrite, %Alliance%, data.ini, Friendly, Alliance
	IniWrite, %Corporation%, data.ini, Friendly, Corporation
	IniWrite, %ExcellentStanding%, data.ini, Friendly, ExcellentStanding
	IniWrite, %Fleet%, data.ini, Friendly, Fleet
	IniWrite, %GoodStanding%, data.ini, Friendly, GoodStanding
	IniWrite, %MilitiaAlly%, data.ini, Friendly, MilitiaAlly

	IniWrite, %AvailableKillRight%, data.ini, Hostiles, AvailableKillRight
	IniWrite, %BadStanding%, data.ini, Hostiles, BadStanding
	IniWrite, %Bounty%, data.ini, Hostiles, Bounty
	IniWrite, %Criminal%, data.ini, Hostiles, Criminal
	IniWrite, %LimitedEngagement%, data.ini, Hostiles, LimitedEngagement
	IniWrite, %MilitiaWar%, data.ini, Hostiles, MilitiaWar
	IniWrite, %Neutral%, data.ini, Hostiles, Neutral
	IniWrite, %Outlaw%, data.ini, Hostiles, Outlaw
	IniWrite, %SecurityStatusBelowZero%, data.ini, Hostiles, SecurityStatusBelowZero
	IniWrite, %Suspect%, data.ini, Hostiles, Suspect
	IniWrite, %TerribleStanding%, data.ini, Hostiles, TerribleStanding
	IniWrite, %War%, data.ini, Hostiles, War

	IniWrite, %Drone%, data.ini, NPC, Drone
	IniWrite, %Sentry_drone%, data.ini, NPC, Sentry_drone
	IniWrite, %Fighter%, data.ini, NPC, Fighter
	IniWrite, %Capsule%, data.ini, NPC, Capsule
	IniWrite, %Shuttle%, data.ini, NPC, Shuttle
	IniWrite, %Rookie%, data.ini, NPC, Rookie
	IniWrite, %Mining_frigate%, data.ini, NPC, Mining_frigate
	IniWrite, %Mining_barge%, data.ini, NPC, Mining_barge
	IniWrite, %Industrial%, data.ini, NPC, Industrial
	IniWrite, %Industrial_command%, data.ini, NPC, Industrial_command
	IniWrite, %Industrial_capital%, data.ini, NPC, Industrial_capital
	IniWrite, %Sentry%, data.ini, NPC, Sentry

	IniWrite, %Frigate%, data.ini, NPC, Frigate
	IniWrite, %Destroyer%, data.ini, NPC, Destroyer
	IniWrite, %Cruiser%, data.ini, NPC, Cruiser
	IniWrite, %Battlecruiser%, data.ini, NPC, Battlecruiser
	IniWrite, %Battleship%, data.ini, NPC, Battleship
	IniWrite, %Dreadnought%, data.ini, NPC, Dreadnought
	IniWrite, %Carrier%, data.ini, NPC, Carrier
	IniWrite, %Supercarrier%, data.ini, NPC, Supercarrier
	IniWrite, %Titan%, data.ini, NPC, Titan
	ExitApp
}
return