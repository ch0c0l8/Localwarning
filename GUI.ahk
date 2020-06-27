#NoEnv
#SingleInstance force
; GUI 
Gui, Show, x720 y400 w270 h230, Local Warning
Gui, Add, Tab, x0 y0 w270 h230 , Main|Options|Friendly|Hostile|NPC
Gui, Tab, 1
Gui, Add, Edit, xp+20 yp+30 w110 h20 vName Limit40 +Center, %name%
Gui, Add, Text, xp yp+25 w70 h20 +Center, Delay(ms)
Gui, Add, Edit, xp+80 yp w30 h20 vDelay Number Limit4 +Center, %Delay%
Gui, Add, Text, x130 y30 w70 h20 +Center, First X
Gui, Add, Edit, xp+80 yp w30 h20 vFX Number Limit4 +Center, %FX%
Gui, Add, Text, xp-80 yp+25 w70 h20 +Center, First Y
Gui, Add, Edit, xp+80 yp w30 h20 vFY Number Limit4 +Center, %FY%
Gui, Add, Text, xp-80 yp+25 w70 h20 +Center, Second X
Gui, Add, Edit, xp+80 yp w30 h20 vSX Number Limit4 +Center, %SX%
Gui, Add, Text, xp-80 yp+25 w70 h20 +Center, Second Y
Gui, Add, Edit, xp+80 yp w30 h20 vSY Number Limit4 +Center, %SY%
Gui, Add, Text, x12 y140 w230 h20 +Center, Made by Odunen Yatolila
Gui, Tab, 2
Gui, Add, Checkbox, x20 y30 gUI90 vUI90 checked%UI90%, UI Scaling 90`%
Gui, Add, Checkbox, xp yp+20 vWA checked%WA%, WinActivate
Gui, Add, Checkbox, xp yp+20 vDroneHalfHP checked%DroneHalfHP%, Drone Half HP
Gui, Add, Checkbox, xp yp+20 vNPCisDead checked%NPCisDead%, Check NPC Dead
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
Gui, Add, Picture, xp-15 yp+20 w12 h12, image/NPC/Icon_red_battleship.png
Gui, Add, Checkbox, xp+15 yp vBattleship checked%Battleship%, Battleship
Gui, Add, Picture, x150 y30 w12 h12, image/NPC/Icon_red_dreadnought.png
Gui, Add, Checkbox, xp+15 yp vDreadnought checked%Dreadnought%, Dreadnought
Gui, Add, Picture, xp-15 yp+20 w12 h12, image/NPC/Icon_red_carrier.png
Gui, Add, Checkbox, xp+15 yp vCarrier checked%Carrier%, Carrier
Gui, Add, Picture, xp-15 yp+20 w12 h12, image/NPC/Icon_red_supercarrier.png
Gui, Add, Checkbox, xp+15 yp vSupercarrier checked%Supercarrier%, Supercarrier
Gui, Add, Picture, xp-15 yp+20 w12 h12, image/NPC/Icon_red_titan.png
Gui, Add, Checkbox, xp+15 yp vTitan checked%Titan%, Titan
Gui, Add, Picture, xp-15 yp+20 w12 h12, image/NPC/Icon_red_tower.png
Gui, Add, Checkbox, xp+15 yp vSentry checked%Sentry%, Sentry
Gui, Tab
Gui, Add, Button, x20 y160 w230 h20 vSMP gSMP +Center, Set Mouse Position
Gui, Add, Button, xp yp+20 w230 h20 gStart vstart +Center, Start
Gui, Add, Button, xp yp w230 h20 gStop vstop +Center, Stop
Gui, Add, Button, xp yp+20 w230 h20 gExitApp +Center, Exit App

GuiControl, hide, stop

;UI 스케일링 90% 사용시 NPC 탭 비활성화
if UI90
{
	GuiControl, Disabled, Frigate
	GuiControl, Disabled, Destroyer
	GuiControl, Disabled, Cruiser
	GuiControl, Disabled, Battlecruiser
	GuiControl, Disabled, Battleship
	GuiControl, Disabled, Dreadnought
	GuiControl, Disabled, Carrier
	GuiControl, Disabled, Supercarrier
	GuiControl, Disabled, Titan
	GuiControl, Disabled, Sentry
}

; UI 스케일링 100% 사용시 NPC 탭 활성화
if !UI90
{
	GuiControl, Enabled, Frigate
	GuiControl, Enabled, Frigate
	GuiControl, Enabled, Destroyer
	GuiControl, Enabled, Cruiser
	GuiControl, Enabled, Battlecruiser
	GuiControl, Enabled, Battleship
	GuiControl, Enabled, Dreadnought
	GuiControl, Enabled, Carrier
	GuiControl, Enabled, Supercarrier
	GuiControl, Enabled, Titan
	GuiControl, Enabled, Sentry
}

; 트레이 메뉴
Menu, Tray, NoStandard
Menu, Tray, Add, Show GUI, ShowGUI
Menu, Tray, Default, Show GUI
Menu, Tray, Add, Start, Start
Menu, Tray, Add, Stop, Stop
Menu, Tray, Add, Exit App, ExitApp

Menu, Tray, Disable, Stop
return

ShowGUI:
{
	Gui, Show
}
return

; UI 스케일링 90% 체크했을 때 NPC 탭 비활성화
UI90:
{
	UI90 := !UI90
	IniWrite, %UI90%, data.ini, SetValue, UI90
	IniRead, UI90, data.ini, SetValue, UI90

	If UI90
	{
		#IncludeAgain GUIDisabled.ahk
		MsgBox, 4, Local Warning, If enable this, NPC tab is disabled`nDo you still want to use it?
		#IncludeAgain GUIEnabled.ahk
		IfMsgBox, No
		{
			UI90 := !UI90
			GuiControl, , UI90, 0
			GuiControl, Enabled, Frigate
			GuiControl, Enabled, Frigate
			GuiControl, Enabled, Destroyer
			GuiControl, Enabled, Cruiser
			GuiControl, Enabled, Battlecruiser
			GuiControl, Enabled, Battleship
			GuiControl, Enabled, Dreadnought
			GuiControl, Enabled, Carrier
			GuiControl, Enabled, Supercarrier
			GuiControl, Enabled, Titan
			GuiControl, Enabled, Sentry
		}
		IfMsgBox, Yes
		{
			if UI90
			{
				GuiControl, Disabled, Frigate
				GuiControl, Disabled, Destroyer
				GuiControl, Disabled, Cruiser
				GuiControl, Disabled, Battlecruiser
				GuiControl, Disabled, Battleship
				GuiControl, Disabled, Dreadnought
				GuiControl, Disabled, Carrier
				GuiControl, Disabled, Supercarrier
				GuiControl, Disabled, Titan
				GuiControl, Disabled, Sentry
			}
		}
	}
	If !UI90
	{
		GuiControl, Enabled, Frigate
		GuiControl, Enabled, Frigate
		GuiControl, Enabled, Destroyer
		GuiControl, Enabled, Cruiser
		GuiControl, Enabled, Battlecruiser
		GuiControl, Enabled, Battleship
		GuiControl, Enabled, Dreadnought
		GuiControl, Enabled, Carrier
		GuiControl, Enabled, Supercarrier
		GuiControl, Enabled, Titan
		GuiControl, Enabled, Sentry
	}
	IniWrite, %UI90%, data.ini, SetValue, UI90
}
return

; 마우스 간편 좌표 설정
SMP:
{
	gui, submit, nohide
	CoordMode, Mouse, Client
	#IncludeAgain GUIDisabled.ahk

	; 최신 값 불러오기
	IniWrite, %name%, data.ini, Name, name
	IniRead, name, data.ini, Name, name
	Title := "EVE - " . name

	; 캐릭터명에 입력을 안했을 경우 뜨는 트레이팁
	if (Name = "")
	{
		TrayTip, Local Warning, Please enter a character name, 1, 3
		goto stop
	}

	; 이브온라인 핸들을 찾지 못했다는 트레이팁
	IfWinNotExist, %Title% ahk_exe exefile.exe ahk_class triuiScreen
	{
		TrayTip, Local Warning, EVE Online not detected, 1, 3
		goto stop
	}

	; 이브온라인 핸들 찾았으면 좌표설정 시작
	IfWinExist, %Title% ahk_exe exefile.exe ahk_class triuiScreen
	{
		WinGetPos, , , ScreenWidth, ScreenHeight, %Title% ahk_exe exefile.exe ahk_class triuiScreen
		WinActivate, %Title% ahk_exe exefile.exe ahk_class triuiScreen
		; 첫번째 좌표 클릭 설정
		KeyWait, Lbutton, D
		MouseGetPos, posx1, posy1
		if (-1 > posx1) and (-1 > posy1)
		{
			msgbox, 16, Local Warning, Wrong range Set again
			GuiControl,,FX, 0
			GuiControl,,FY, 0
			GuiControl,,SX, %ScreenWidth%
			GuiControl,,SY, %ScreenHeight%
			goto stop
		}
		GuiControl,,FX, %posx1%
		GuiControl,,FY, %posy1%
		sleep, 100
		; 두번째 좌표 클릭 설정
		KeyWait, Lbutton, D
		MouseGetPos, posx2, posy2
		if (posx1 > posx2) or (posy1 > posy2) or (posx2 > ScreenWidth) or (posy2 > ScreenHeight)
		{
			msgbox, 16, Local Warning, Wrong range Set again
			GuiControl,,FX, 0
			GuiControl,,FY, 0
			GuiControl,,SX, %ScreenWidth%
			GuiControl,,SY, %ScreenHeight%
			goto stop
		}
		GuiControl,,SX, %posx2%
		GuiControl,,SY, %posy2%
		#IncludeAgain IniWrite.ahk
		msgbox, 64, Local Warning, Setting Complete
		
	}
	#IncludeAgain GUIEnabled.ahk
}
return

; 앱 종료
ExitApp:
{
	ExitApp
}
return

; GUI에서 X 버튼을 눌렀을 경우
GuiClose:
{
	Gui, hide
	TrayTip, Local Warning, Working in the background, 3, 1
}
return