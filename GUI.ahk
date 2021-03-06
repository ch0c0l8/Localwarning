#NoEnv
#SingleInstance OFF
; GUI 
Gui, Show, x720 y400 w270 h230, Local Warning
Gui, Add, Tab, x0 y0 w270 h230 , Main|Options|Friendly|Hostile|NPC
Gui, Tab, 1
Gui, Add, Edit, xp+20 yp+30 w110 h20 vName Limit40 +Center, %name%
Gui, Add, Text, xp yp+25 w70 h20 +Center, Delay(ms)
Gui, Add, Edit, xp+80 yp w30 h20 vDelay Number Limit4 +Center, %Delay%
Gui, Add, Text, xp-80 yp+25 w70 h20 +Center, Variation
Gui, Add, Edit, xp+80 yp w30 h20 gVariationCheck vVariation Number Limit3 +Center, %Variation%
Gui, Add, Text, xp-80 yp+25 w70 h25 +Center, Log Check Timer(ms)
Gui, Add, Edit, xp+70 yp +25 w40 h20 vLogCheckTimer Number Limit5 +Center, %LogCheckTimer%
Gui, Add, Text, x130 y30 w70 h20 +Center, First X
Gui, Add, Edit, xp+80 yp w30 h20 vFX Number Limit4 +Center, %FX%
Gui, Add, Text, xp-80 yp+25 w70 h20 +Center, First Y
Gui, Add, Edit, xp+80 yp w30 h20 vFY Number Limit4 +Center, %FY%
Gui, Add, Text, xp-80 yp+25 w70 h20 +Center, Second X
Gui, Add, Edit, xp+80 yp w30 h20 vSX Number Limit4 +Center, %SX%
Gui, Add, Text, xp-80 yp+25 w70 h20 +Center, Second Y
Gui, Add, Edit, xp+80 yp w30 h20 vSY Number Limit4 +Center, %SY%
Gui, Add, Edit, x20 y140 w170 h20 vFolderPath, %FolderPath%
Gui, Add, Button, xp+170 yp w60 h20 vSelectFolderPath gSelectFolderPath, ...
Gui, Tab, 2
Gui, Add, Checkbox, x20 y30 vUI90 checked%UI90%, UI Scaling 90`%
Gui, Add, Checkbox, xp yp+20 vWA checked%WA%, WinActivate
Gui, Add, Checkbox, xp yp+20 vDroneHalfHP checked%DroneHalfHP%, Drone Half HP
Gui, Add, Checkbox, xp yp+20 vFactionNPCNotification checked%FactionNPCNotification%, Faction NPC notification
Gui, Add, Checkbox, xp yp+20 vAFKNotification checked%AFKNotification%, AFK Notification
Gui, Add, Checkbox, xp yp+20 vAmmoReload checked%AmmoReload%, Check Ammo Reload
Gui, Tab, 3
Gui, Add, Picture, x20 y30 w12 h12, image/Friendly/Fleet.gif
Gui, Add, Checkbox, xp+15 yp vFleet checked%Fleet%, Fleet
Gui, Add, Picture, xp-15 yp+20 w12 h12, image/Friendly/ExcellentStanding.gif
Gui, Add, Checkbox, xp+15 yp vExcellentStanding checked%ExcellentStanding%, Deep blue
Gui, Add, Picture, xp-15 yp+20 w12 h12, image/Friendly/GoodStanding.gif
Gui, Add, Checkbox, xp+15 yp vGoodStanding checked%GoodStanding%, Blue
Gui, Add, Picture, x150 y30 w12 h12, image/Friendly/Corporation.gif
Gui, Add, Checkbox, xp+15 yp vCorporation checked%Corporation%, Corporation
Gui, Add, Picture, xp-15 yp+20 w12 h12, image/Friendly/Alliance.gif
Gui, Add, Checkbox, xp+15 yp vAlliance checked%Alliance%, Alliance
Gui, Add, Picture, xp-15 yp+20 w12 h12, image/Friendly/MilitiaAlly.gif
Gui, Add, Checkbox, xp+15 yp vMilitiaAlly checked%MilitiaAlly%, Militia ally
Gui, Tab, 4
Gui, Add, Picture, x20 y30 w12 h12, image/Hostiles/TerribleStanding.gif
Gui, Add, Checkbox, xp+15 yp vTerribleStanding checked%TerribleStanding%, Deep red
Gui, Add, Picture, xp-15 yp+20 w12 h12, image/Hostiles/BadStanding.gif
Gui, Add, Checkbox, xp+15 yp vBadStanding checked%BadStanding%, Red
Gui, Add, Picture, xp-15 yp+20 w12 h12, image/Hostiles/Neutral.gif
Gui, Add, Checkbox, xp+15 yp vNeutral checked%Neutral%, Neutral
Gui, Add, Picture, xp-15 yp+20 w12 h12, image/Hostiles/War.gif
Gui, Add, Checkbox, xp+15 yp vWar checked%War%, War
Gui, Add, Picture, xp-15 yp+20 w12 h12, image/Hostiles/MilitiaWar.gif
Gui, Add, Checkbox, xp+15 yp vMilitiaWar checked%MilitiaWar%, Militia war
Gui, Add, Picture, xp-15 yp+20 w12 h12, image/Hostiles/AvailableKillRight.gif
Gui, Add, Checkbox, xp+15 yp vAvailableKillRight checked%AvailableKillRight%, Kill right
Gui, Add, Picture, x150 y30 w12 h12, image/Hostiles/LimitedEngagement.gif
Gui, Add, Checkbox, xp+15 yp vLimitedEngagement checked%LimitedEngagement%, Engagement
Gui, Add, Picture,xp-15 yp+20 w12 h12, image/Hostiles/Criminal.gif
Gui, Add, Checkbox,xp+15 yp vCriminal checked%Criminal%, Criminal
Gui, Add, Picture, xp-15 yp+20 w12 h12, image/Hostiles/Suspect.gif
Gui, Add, Checkbox, xp+15 yp vSuspect checked%Suspect%, Suspect
Gui, Add, Picture, xp-15 yp+20 w12 h12, image/Hostiles/Outlaw.png
Gui, Add, Checkbox, xp+15 yp vOutlaw checked%Outlaw%, Below -5 sec
Gui, Add, Picture, xp-15 yp+20 w12 h12, image/Hostiles/SecurityStatusBelowZero.gif
Gui, Add, Checkbox, xp+15 yp vSecurityStatusBelowZero checked%SecurityStatusBelowZero%, Below -0 sec
Gui, Add, Picture, xp-15 yp+20 w12 h12, image/Hostiles/Bounty.gif
Gui, Add, Checkbox, xp+15 yp vBounty checked%Bounty%, Bounty
Gui, Tab, 5
Gui, Add, Picture, x20 y30 w12 h12, image/NPC/Icon_red_frigate.png
Gui, Add, Checkbox, xp+15 yp vFrigate checked%Frigate%, Frigate
Gui, Add, Picture, xp-15 yp+20 w12 h12, image/NPC/Icon_red_destroyer.png
Gui, Add, Checkbox, xp+15 yp vDestroyer checked%Destroyer%, Destroyer
Gui, Add, Picture, xp-15 yp+20 w12 h12, image/NPC/Icon_red_cruiser.png
Gui, Add, Checkbox, xp+15 yp vCruiser checked%Cruiser%, Cruiser
Gui, Add, Picture, xp-15 yp+20 w12 h12, image/NPC/Icon_red_battlecruiser.png
Gui, Add, Checkbox, xp+15 yp vBattlecruiser checked%Battlecruiser%, Battlecruiser
Gui, Add, Picture, x150 y30 w12 h12, image/NPC/Icon_red_battleship.png
Gui, Add, Checkbox, xp+15 yp vBattleship checked%Battleship%, Battleship
Gui, Add, Picture, xp-15 yp+20 w12 h12, image/NPC/Icon_red_dreadnought.png
Gui, Add, Checkbox, xp+15 yp vDreadnought checked%Dreadnought%, Dreadnought
Gui, Add, Picture, xp-15 yp+20 w12 h12, image/NPC/Icon_red_carrier.png
Gui, Add, Checkbox, xp+15 yp vCarrier checked%Carrier%, Carrier
Gui, Tab
Gui, Add, Button, x20 y160 w230 h20 vSMP gSMP +Center, Set Mouse Position
Gui, Add, Button, xp yp+20 w230 h20 gStart vstart +Center, Start
Gui, Add, Button, xp yp w230 h20 gStop vstop +Center, Stop
Gui, Add, Button, xp yp+20 w230 h20 gExitApp +Center, Exit App

GuiControl, hide, stop
; 트레이 메뉴
Menu, Tray, NoStandard
Menu, Tray, Add, %name%, Return
Menu, Tray, Add
Menu, Tray, Add, Show GUI, ShowGUI
Menu, Tray, Add, Start, Start
Menu, Tray, Add, Stop, Stop
Menu, Tray, Add
Menu, Tray, Add, Exit App, ExitApp

Menu, Tray, Disable, Stop

OnMessage(0x404,"AHK_NotifyTrayIcon")
return

AHK_NotifyTrayIcon(wParam, lParam)
{
	If (lparam = 517)
	{
		Gosub, ChangeMenu
	}

}
Return

ChangeMenu:
{
	Menu, Tray, NoStandard
	Menu, Tray, DeleteAll
	Menu, Tray, Add, %name%, Return
	Menu, Tray, Add
	Menu, Tray, Add, Show GUI, ShowGUI
	Menu, Tray, Add, Start, Start
	Menu, Tray, Add, Stop, Stop
	if running
	{
		Menu, Tray, Disable, Start
		Menu, Tray, Enable, Stop
	}
	if not running
	{
		Menu, Tray, Enable, Start
		Menu, Tray, Disable, Stop
	}
	Menu, Tray, Add
	Menu, Tray, Add, Exit App, ExitApp
}
return

Return:
{
	return
}

ShowGUI:
{
	Gui, Show
}
return