#Include Gdip_All.ahk
#Include Gdip_ImageSearch.ahk
; 정의
eve := "EVE - "

; ini 불러오기
IniRead, name, data.ini, Name, name

IniRead, FX, data.ini, First, X
IniRead, FY, data.ini, First, Y

IniRead, SX, data.ini, Second, X
IniRead, SY, data.ini, Second, Y

IniRead, Delay, data.ini, Delay, delay

IniRead, Alliance, data.ini, Friendly, Alliance
IniRead, Corporation, data.ini, Friendly, Corporation
IniRead, ExcellentStanding, data.ini, Friendly, ExcellentStanding
IniRead, Fleet, data.ini, Friendly, Fleet
IniRead, GoodStanding, data.ini, Friendly, GoodStanding
IniRead, MilitiaAlly, data.ini, Friendly, MilitiaAlly

IniRead, AvailableKillRight, data.ini, Hostiles, AvailableKillRight
IniRead, BadStanding, data.ini, Hostiles, BadStanding
IniRead, Bounty, data.ini, Hostiles, Bounty
IniRead, Criminal, data.ini, Hostiles, Criminal
IniRead, LimitedEngagement, data.ini, Hostiles, LimitedEngagement
IniRead, MilitiaWar, data.ini, Hostiles, MilitiaWar
IniRead, Neutral, data.ini, Hostiles, Neutral
IniRead, Outlaw, data.ini, Hostiles, Outlaw
IniRead, SecurityStatusBelowZero, data.ini, Hostiles, SecurityStatusBelowZero
IniRead, Suspect, data.ini, Hostiles, Suspect
IniRead, TerribleStanding, data.ini, Hostiles, TerribleStanding
IniRead, War, data.ini, Hostiles, War

; GUI
Gui, Show, x718 y400 w260 h230, Local Warning
Gui, Add, Tab, x0 y-1 w260 h230 , Main Menu|Friendly|Hostile
Gui, Tab, 1
Gui, Add, Edit, x10 y40 w110 h20 vName Limit40 +Center, %name%
Gui, Add, Text, x130 y40 w70 h20 +Center, Delay(ms)
Gui, Add, Edit, x210 y40 w30 h20 vDelay Number Limit4 +Center, %Delay%
Gui, Add, Text, x10 y70 w70 h20 +Center, First X
Gui, Add, Text, x10 y100 w70 h20 +Center, First Y
Gui, Add, Edit, x90 y70 w30 h20 vFX Number Limit4 +Center, %FX%
Gui, Add, Edit, x90 y100 w30 h20 vFY Number Limit4 +Center, %FY%
Gui, Add, Text, x130 y70 w70 h20 +Center, Second X
Gui, Add, Text, x130 y100 w70 h20 +Center, Second Y
Gui, Add, Edit, x210 y70 w30 h20 vSX Number Limit4 +Center, %SX%
Gui, Add, Edit, x210 y100 w30 h20 vSY Number Limit4 +Center, %SY%
Gui, Add, Text, x12 y140 w230 h20 +Center, Made by Odunen Yatolila
Gui, Tab, 2
Gui,Add,Picture,x10 y30 w12 h12, image/Friendly/Fleet.gif
Gui, Add, Checkbox, x25 y30 vFleet checked%Fleet%, Fleet
Gui,Add,Picture,x10 y50 w12 h12, image/Friendly/ExcellentStanding.gif
Gui, Add, Checkbox, x25 y50 vExcellentStanding checked%ExcellentStanding%, Deep blue
Gui,Add,Picture,x10 y70 w12 h12, image/Friendly/GoodStanding.gif
Gui, Add, Checkbox, x25 y70 vGoodStanding checked%GoodStanding%, Blue
Gui,Add,Picture,x130 y30 w12 h12, image/Friendly/Corporation.gif
Gui, Add, Checkbox, x145 y30 vCorporation checked%Corporation%, Corporation
Gui,Add,Picture,x130 y50 w12 h12, image/Friendly/Alliance.gif
Gui, Add, Checkbox, x145 y50 vAlliance checked%Alliance%, Alliance
Gui,Add,Picture,x130 y70 w12 h12, image/Friendly/MilitiaAlly.gif
Gui, Add, Checkbox, x145 y70 vMilitiaAlly checked%MilitiaAlly%, Militia ally
Gui, Tab, 3
Gui,Add,Picture,x10 y30 w12 h12, image/Hostiles/TerribleStanding.gif
Gui, Add, Checkbox, x25 y30 vTerribleStanding checked%TerribleStanding%, Deep red
Gui,Add,Picture,x10 y50 w12 h12, image/Hostiles/BadStanding.gif
Gui, Add, Checkbox, x25 y50 vBadStanding checked%BadStanding%, Red
Gui,Add,Picture,x10 y70 w12 h12, image/Hostiles/Neutral.gif
Gui, Add, Checkbox, x25 y70 vNeutral checked%Neutral%, Neutral
Gui,Add,Picture,x10 y90 w12 h12, image/Hostiles/War.gif
Gui, Add, Checkbox, x25 y90 vWar checked%War%, War
Gui,Add,Picture,x10 y110 w12 h12, image/Hostiles/MilitiaWar.gif
Gui, Add, Checkbox, x25 y110 vMilitiaWar checked%MilitiaWar%, Militia war
Gui,Add,Picture,x10 y130 w12 h12, image/Hostiles/AvailableKillRight.gif
Gui, Add, Checkbox, x25 y130 vAvailableKillRight checked%AvailableKillRight%, Kill right
Gui,Add,Picture,x130 y30 w12 h12, image/Hostiles/LimitedEngagement.gif
Gui, Add, Checkbox, x145 y30 vLimitedEngagement checked%LimitedEngagement%, Engagement
Gui,Add,Picture,x130 y50 w12 h12, image/Hostiles/Criminal.gif
Gui, Add, Checkbox, x145 y50 vCriminal checked%Criminal%, Criminal
Gui,Add,Picture,x130 y70 w12 h12, image/Hostiles/Suspect.gif
Gui, Add, Checkbox, x145 y70 vSuspect checked%Suspect%, Suspect
Gui,Add,Picture,x130 y90 w12 h12, image/Hostiles/Outlaw.png
Gui, Add, Checkbox, x145 y90 vOutlaw checked%Outlaw%, Below -5 sec
Gui,Add,Picture,x130 y110 w12 h12, image/Hostiles/SecurityStatusBelowZero.gif
Gui, Add, Checkbox, x145 y110 vSecurityStatusBelowZero checked%SecurityStatusBelowZero%, Below -0 sec
Gui,Add,Picture,x130 y130 w12 h12, image/Hostiles/Bounty.gif
Gui, Add, Checkbox, x145 y130 vBounty checked%Bounty%, Bounty
Gui, Tab
Gui, Add, Button, x12 y160 w230 h20 vSMP gSMP +Center, Set Mouse Position
Gui, Add, Button, x12 y180 w230 h20 gStart vstart +Center, Start and Save
Gui, Add, Button, x12 y180 w230 h20 gStop vstop +Center, Stop
Gui, Add, Button, x12 y200 w230 h20 gExitApp +Center, Exit App

Guicontrol, hide, stop
return

GuiClose:
IniWrite, %name%, data.ini, Name, Name

IniWrite, %FX%, data.ini, First, X
IniWrite, %FY%, data.ini, First, Y

IniWrite, %SX%, data.ini, Second, X
IniWrite, %SY%, data.ini, Second, Y

IniWrite, %Delay%, data.ini, Delay, delay

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

ExitApp
return

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
	msgbox, 0, Local Waring, Set next mouse position
	
	;두번째 좌표 클릭 설정
	KeyWait, Lbutton, D
	MouseGetPos, posx2, posy2
	guicontrol,,SX, %posx2%
	guicontrol,,SY, %posy2%
	msgbox, 0, Local Waring, Setup completed
	
	GuiControl, Enabled, SMP
}
return

start:
{
	running := true
	Gui, submit, nohide
	; 서치 시작 시 모든 입력창 비활성화
	GuiControl, Disabled, FX
	GuiControl, Disabled, FY
	GuiControl, Disabled, SX
	GuiControl, Disabled, SY
	GuiControl, Disabled, Name
	GuiControl, Disabled, Delay
	GuiControl, Disabled, SMP
	
	GuiControl, Disabled, Alliance
	GuiControl, Disabled, Corporation
	GuiControl, Disabled, ExcellentStanding
	GuiControl, Disabled, GoodStanding
	GuiControl, Disabled, MilitiaAlly
	GuiControl, Disabled, Fleet
	
	GuiControl, Disabled, AvailableKillRight
	GuiControl, Disabled, BadStanding
	GuiControl, Disabled, Bounty
	GuiControl, Disabled, Criminal
	GuiControl, Disabled, LimitedEngagement
	GuiControl, Disabled, MilitiaWar
	GuiControl, Disabled, Neutral
	GuiControl, Disabled, Outlaw
	GuiControl, Disabled, SecurityStatusBelowZero
	GuiControl, Disabled, Suspect
	GuiControl, Disabled, TerribleStanding
	GuiControl, Disabled, War
	
	; 스탑 버튼으로 변경
	guicontrol, hide, start
	guicontrol, show, stop
	
	; 이미지 서치 루프 시작
	Loop
	{
		if not running
		{
			break
		}
		;
		
		pToken := Gdip_Startup() ;Gdip 시작
		pScreen := Gdip_BitmapFromHwnd(WinExist(eve,name)) ; 화면 캡쳐

		; 화면과 매치 시킬 이미지 데이터 입력 
		pAlliance := Gdip_CreateBitmapFromFile("image/Friendly/Alliance.gif")
		pCorporation := Gdip_CreateBitmapFromFile("image/Friendly/Corporation.gif")
		pExcellentStanding := Gdip_CreateBitmapFromFile("image/Friendly/ExcellentStanding.gif")
		pFleet := Gdip_CreateBitmapFromFile("image/Friendly/Fleet.gif")
		pGoodStanding := Gdip_CreateBitmapFromFile("image/Friendly/GoodStanding.gif")
		pMilitiaAlly := Gdip_CreateBitmapFromFile("image/Friendly/MilitiaAlly.gif")
		
		pAvailableKillRight := Gdip_CreateBitmapFromFile("image/Hostiles/AvailableKillRight.gif")
		pBadStanding := Gdip_CreateBitmapFromFile("image/Hostiles/BadStanding.gif")
		pBounty := Gdip_CreateBitmapFromFile("image/Hostiles/Bounty.gif")
		pCriminal := Gdip_CreateBitmapFromFile("image/Hostiles/Criminal.gif")
		pLimitedEngagement := Gdip_CreateBitmapFromFile("image/Hostiles/LimitedEngagement.gif")
		pMilitiaWar := Gdip_CreateBitmapFromFile("image/Hostiles/MilitiaWar.gif")
		pNeutral := Gdip_CreateBitmapFromFile("image/Hostiles/Neutral.gif")
		pOutlaw := Gdip_CreateBitmapFromFile("image/Hostiles/Outlaw.png")
		pSecurityStatusBelowZero := Gdip_CreateBitmapFromFile("image/Hostiles/SecurityStatusBelowZero.gif")
		pSuspect := Gdip_CreateBitmapFromFile("image/Hostiles/Suspect.gif")
		pTerribleStanding := Gdip_CreateBitmapFromFile("image/Hostiles/TerribleStanding.gif")
		pWar := Gdip_CreateBitmapFromFile("image/Hostiles/War.gif")
		; 이미지 서치 시작
		vAlliance := Gdip_ImageSearch(pScreen, pAlliance, , FX, FY, SX, SY, 50)
		vCorporation := Gdip_ImageSearch(pScreen, pCorporation, , FX, FY, SX, SY, 50)
		vExcellentStanding := Gdip_ImageSearch(pScreen, pExcellentStanding, , FX, FY, SX, SY, 50)
		vFleet := Gdip_ImageSearch(pScreen, pFleet, , FX, FY, SX, SY, 50)
		vGoodStanding := Gdip_ImageSearch(pScreen, pGoodStanding, , FX, FY, SX, SY, 50)
		vMilitiaAlly := Gdip_ImageSearch(pScreen, pMilitiaAlly, , FX, FY, SX, SY, 50)
		
		vAvailableKillRight := Gdip_ImageSearch(pScreen, pAvailableKillRight, , FX, FY, SX, SY, 50)
		vBadStanding := Gdip_ImageSearch(pScreen, pBadStanding, , FX, FY, SX, SY, 50)
		vBounty := Gdip_ImageSearch(pScreen, pBounty, , FX, FY, SX, SY, 50)
		vCriminal := Gdip_ImageSearch(pScreen, pCriminal, , FX, FY, SX, SY, 50)
		vLimitedEngagement := Gdip_ImageSearch(pScreen, pLimitedEngagement, , FX, FY, SX, SY, 50)
		vMilitiaWar := Gdip_ImageSearch(pScreen, pMilitiaWar, , FX, FY, SX, SY, 50)
		vNeutral := Gdip_ImageSearch(pScreen, pNeutral, , FX, FY, SX, SY, 50)
		vOutlaw := Gdip_ImageSearch(pScreen, pOutlaw, , FX, FY, SX, SY, 50)
		vSecurityStatusBelowZero := Gdip_ImageSearch(pScreen, pSecurityStatusBelowZero, , FX, FY, SX, SY, 50)
		vSuspect := Gdip_ImageSearch(pScreen, pSuspect, , FX, FY, SX, SY, 50)
		vTerribleStanding := Gdip_ImageSearch(pScreen, pTerribleStanding, , FX, FY, SX, SY, 50)
		vWar := Gdip_ImageSearch(pScreen, pWar, , FX, FY, SX, SY, 50)
		; 이미지 서치 종료
		; 이미지 메모리 삭제 시작
		Gdip_DisposeImage(pScreen)
		Gdip_DisposeImage(pAlliance)
		Gdip_DisposeImage(pCorporation)
		Gdip_DisposeImage(pExcellentStanding)
		Gdip_DisposeImage(pFleet)
		Gdip_DisposeImage(pGoodStanding)
		Gdip_DisposeImage(pMilitiaAlly)
		Gdip_DisposeImage(pWarAlly)
		
		Gdip_DisposeImage(pAvailableKillRight)
		Gdip_DisposeImage(pBadStanding)
		Gdip_DisposeImage(pBounty)
		Gdip_DisposeImage(pCriminal)
		Gdip_DisposeImage(pLimitedEngagement)
		Gdip_DisposeImage(pMilitiaWar)
		Gdip_DisposeImage(vNeutral)
		Gdip_DisposeImage(pOutlaw)
		Gdip_DisposeImage(pSecurityStatusBelowZero)
		Gdip_DisposeImage(pSuspect)
		Gdip_DisposeImage(pTerribleStanding)
		Gdip_DisposeImage(pWar)
		; 이미지 메모리 삭제 완료
		Gdip_Shutdown(pToken) ; Gdip 종료

		if ((vAlliance && Alliance) || ( vCorporation && Corporation) || (vExcellentStanding && ExcellentStanding) || (vFleet && Fleet) || (vGoodStanding && GoodStanding) || (vMilitiaAlly && MilitiaAlly)||(vAvailableKillRight && AvailableKillRight) ||(vBadStanding && BadStanding) ||(vBounty && Bounty) ||(vCriminal && Criminal) || (vLimitedEngagement && LimitedEngagement)|| (vMilitiaWar && MilitiaWar)||(vNeutral && Neutral) ||(vOutlaw && Outlaw) ||(vSecurityStatusBelowZero && SecurityStatusBelowZero) || (vSuspect && Suspect)||(vTerribleStanding && TerribleStanding) || (vWar && War))
		{
			SoundPlay warning.wav ; 사운드 실행
			sleep, %Delay%
		}
		else ; 찾지 못했을경우 딜레이
		{
			sleep, %Delay%
		}
	}
}
return

stop:
{
	running := false
	; 서치 종료 시 모든 입력창 활성화
	GuiControl, Enabled, FX
	GuiControl, Enabled, FY
	GuiControl, Enabled, SX
	GuiControl, Enabled, SY
	GuiControl, Enabled, Name
	GuiControl, Enabled, Delay
	GuiControl, Enabled, SMP
	
	GuiControl, Enabled, Alliance
	GuiControl, Enabled, Corporation
	GuiControl, Enabled, ExcellentStanding
	GuiControl, Enabled, Fleet
	GuiControl, Enabled, GoodStanding
	GuiControl, Enabled, MilitiaAlly
	
	GuiControl, Enabled, AvailableKillRight
	GuiControl, Enabled, BadStanding
	GuiControl, Enabled, Bounty
	GuiControl, Enabled, Criminal
	GuiControl, Enabled, LimitedEngagement
	GuiControl, Enabled, MilitiaWar
	GuiControl, Enabled, Neutral
	GuiControl, Enabled, Outlaw
	GuiControl, Enabled, SecurityStatusBelowZero
	GuiControl, Enabled, Suspect
	GuiControl, Enabled, TerribleStanding
	GuiControl, Enabled, War
	
	; 스타트 버튼으로 변경
	guicontrol, hide, stop
	guicontrol, show, start
}
return

ExitApp:
{
	IniWrite, %name%, data.ini, Name, Name

	IniWrite, %FX%, data.ini, First, X
	IniWrite, %FY%, data.ini, First, Y
	
	IniWrite, %SX%, data.ini, Second, X
	IniWrite, %SY%, data.ini, Second, Y
	
	IniWrite, %Delay%, data.ini, Delay, delay
	
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
	ExitApp
}
return
