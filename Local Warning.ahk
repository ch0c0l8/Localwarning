#Include Gdip_All.ahk
#Include Gdip_ImageSearch.ahk
#Include IniRead.ahk
#Include GUI.ahk

; 스타트 버튼
start:
{
	running := true
	Gui, submit, nohide
	; 서치 시작 시 모든 입력창 비활성화
	#IncludeAgain GUIDisabled.ahk

	; 데이터 저장
	#IncludeAgain IniWrite.ahk
	
	; 스탑 버튼으로 변경
	GuiControl, hide, start
	GuiControl, show, stop

	; 스타트 트레이 비활성화, 스탑 트레이 활성화
	Menu, Tray, Disable, Start
	Menu, Tray, Enable, Stop

	; 기본 값 넣기
	#IncludeAgain IniRead.ahk
	Title := "EVE - " . name
	FindImage := 0
	WinGetPos, , , ScreenWidthBefore, ScreenHeightBefore, %Title% ahk_exe exefile.exe ahk_class triuiScreen

	; 이브온라인 핸들을 찾지 못하면 이미지 서치 시작 불가능
	IfWinNotExist, %Title% ahk_exe exefile.exe ahk_class triuiScreen
	{
		TrayTip, Local Warning, EVE Online not detected, 1, 3
		goto stop
	}

	; 캐릭터명 입력창에 아무것도 없으면 이미지 서치 시작 불가능
	if (Name = "")
	{
		TrayTip, Local Warning, Please enter a character name, 1, 3
		goto stop
	}

	; 체크박스에 아무것도 체크하지 않았을 경우 이미지 서치 시작 불가능
	if !(Alliance && Corporation || ExcellentStanding || Fleet || GoodStanding || MilitiaAlly || AvailableKillRight || BadStanding || Bounty || Criminal || LimitedEngagement || MilitiaWar || Neutral || Outlaw || SecurityStatusBelowZero || Suspect || TerribleStanding || War || Sentry || Frigate || Destroyer || Cruiser || Battlecruiser || Battleship || Dreadnought || Carrier || Supercarrier || Titan)
	{
		TrayTip, Local Warning, Please check at least one check box, 1, 3
		goto stop
	}

	; Gdip 시작
	pToken := Gdip_Startup()

	; UI 스케일링 90% 사용
	if UI90
	{
		; 화면과 매치 시킬 이미지 데이터 입력 
		pAlliance := Gdip_CreateBitmapFromFile("image/Friendly90/Alliance.png")
		pCorporation := Gdip_CreateBitmapFromFile("image/Friendly90/Corporation.png")
		pExcellentStanding := Gdip_CreateBitmapFromFile("image/Friendly90/ExcellentStanding.png")
		pFleet := Gdip_CreateBitmapFromFile("image/Friendly90/Fleet.png")
		pGoodStanding := Gdip_CreateBitmapFromFile("image/Friendly90/GoodStanding.png")
		pMilitiaAlly := Gdip_CreateBitmapFromFile("image/Friendly90/MilitiaAlly.png")
		
		pAvailableKillRight := Gdip_CreateBitmapFromFile("image/Hostiles90/AvailableKillRight.png")
		pBadStanding := Gdip_CreateBitmapFromFile("image/Hostiles90/BadStanding.png")
		pBounty := Gdip_CreateBitmapFromFile("image/Hostiles90/Bounty.png")
		pCriminal := Gdip_CreateBitmapFromFile("image/Hostiles90/Criminal.png")
		pLimitedEngagement := Gdip_CreateBitmapFromFile("image/Hostiles90/LimitedEngagement.png")
		pMilitiaWar := Gdip_CreateBitmapFromFile("image/Hostiles90/MilitiaWar.png")
		pNeutral := Gdip_CreateBitmapFromFile("image/Hostiles90/Neutral.png")
		pOutlaw := Gdip_CreateBitmapFromFile("image/Hostiles90/Outlaw.png")
		pSecurityStatusBelowZero := Gdip_CreateBitmapFromFile("image/Hostiles90/SecurityStatusBelowZero.png")
		pSuspect := Gdip_CreateBitmapFromFile("image/Hostiles90/Suspect.png")
		pTerribleStanding := Gdip_CreateBitmapFromFile("image/Hostiles90/TerribleStanding.png")
		pWar := Gdip_CreateBitmapFromFile("image/Hostiles90/War.png")

		pDroneHalfHP := Gdip_CreateBitmapFromFile("image/DroneHalfHP.png")
	}
	
	; UI 스케일링 100% 사용
	if !UI90
	{
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

		pFrigate := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_frigate.png")
		pDestroyer := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_destroyer.png")
		pCruiser := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_cruiser.png")
		pBattlecruiser := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_battlecruiser.png")
		pBattleship := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_battleship.png")
		pDreadnought := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_dreadnought.png")
		pCarrier := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_carrier.png")
		pSupercarrier := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_supercarrier.png")
		pTitan := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_titan.png")
		pSentry := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_tower.png")

		pDroneHalfHP := Gdip_CreateBitmapFromFile("image/DroneHalfHP.png")
	}

	; 이미지 서치 루프 시작
	Loop
	{
		; running 함수가 False가 되면 (stop 버튼을 누를 경우)
		if not running
		{
			; 데이터 이미지 삭제
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
			Gdip_DisposeImage(pNeutral)
			Gdip_DisposeImage(pOutlaw)
			Gdip_DisposeImage(pSecurityStatusBelowZero)
			Gdip_DisposeImage(pSuspect)
			Gdip_DisposeImage(pTerribleStanding)
			Gdip_DisposeImage(pWar)

			Gdip_DisposeImage(pFrigate)
			Gdip_DisposeImage(pDestroyer)
			Gdip_DisposeImage(pCruiser)
			Gdip_DisposeImage(pBattlecruiser)
			Gdip_DisposeImage(pBattleship)
			Gdip_DisposeImage(pDreadnought)
			Gdip_DisposeImage(pCarrier)
			Gdip_DisposeImage(pSupercarrier)
			Gdip_DisposeImage(pTitan)
			Gdip_DisposeImage(pSentry)

			Gdip_DisposeImage(pDroneHalfHP)
			
			; Gdip 종료
			Gdip_Shutdown(pToken)
			break
		}

		; 이브온라인 핸들을 찾지 못하면 이미지 서치 시작 불가능
		IfWinNotExist, %Title% ahk_exe exefile.exe ahk_class triuiScreen
		{
			msgbox, 16, Local Warning, EVE Online not detected
			goto stop
		}
		WinGetPos, , , ScreenWidthAfter, ScreenHeightAfter, %Title% ahk_exe exefile.exe ahk_class triuiScreen
		if (ScreenWidthBefore != ScreenWidthAfter) or (ScreenHeightBefore != ScreenHeightAfter)
		{
			msgbox, 16, Local Warning, Resolution has changed`nPlease reset the coordinates
			goto stop
		}
		; 이브온라인 스크린 이미지 데이터 입력
		pScreen := Gdip_BitmapFromHwnd(WinExist(Title "ahk_exe exefile.exe ahk_class triuiScreen"))

		; 체크된 이미지만 서치
		if DroneHalfHP
			vDroneHalfHPBefore := vDroneHalfHP
			vDroneHalfHP := Gdip_ImageSearch(pScreen, pDroneHalfHP, , FX, FY, SX, SY, 25)
		; Friendly 탭
		if Alliance
			vAlliance := Gdip_ImageSearch(pScreen, pAlliance, , FX, FY, SX, SY, 25)
		if Corporation
			vCorporation := Gdip_ImageSearch(pScreen, pCorporation, , FX, FY, SX, SY, 25)
		if ExcellentStanding
			vExcellentStanding := Gdip_ImageSearch(pScreen, pExcellentStanding, , FX, FY, SX, SY, 25)
		if Fleet
			vFleet := Gdip_ImageSearch(pScreen, pFleet, , FX, FY, SX, SY, 25)
		if GoodStanding
			vGoodStanding := Gdip_ImageSearch(pScreen, pGoodStanding, , FX, FY, SX, SY, 25)
		if MilitiaAlly
			vMilitiaAlly := Gdip_ImageSearch(pScreen, pMilitiaAlly, , FX, FY, SX, SY, 25)
		; Hostlie 탭 
		if AvailableKillRight
			vAvailableKillRight := Gdip_ImageSearch(pScreen, pAvailableKillRight, , FX, FY, SX, SY, 25)
		if BadStanding
			vBadStanding := Gdip_ImageSearch(pScreen, pBadStanding, , FX, FY, SX, SY, 25)
		if Bounty
			vBounty := Gdip_ImageSearch(pScreen, pBounty, , FX, FY, SX, SY, 25)
		if Criminal
			vCriminal := Gdip_ImageSearch(pScreen, pCriminal, , FX, FY, SX, SY, 25)
		if LimitedEngagement
			vLimitedEngagement := Gdip_ImageSearch(pScreen, pLimitedEngagement, , FX, FY, SX, SY, 25)
		if MilitiaWar
			vMilitiaWar := Gdip_ImageSearch(pScreen, pMilitiaWar, , FX, FY, SX, SY, 25)
		if Neutral
			vNeutral := Gdip_ImageSearch(pScreen, pNeutral, , FX, FY, SX, SY, 25)
		if Outlaw
			vOutlaw := Gdip_ImageSearch(pScreen, pOutlaw, , FX, FY, SX, SY, 25)
		if SecurityStatusBelowZero
			vSecurityStatusBelowZero := Gdip_ImageSearch(pScreen, pSecurityStatusBelowZero, , FX, FY, SX, SY, 25)
		if Suspect
			vSuspect := Gdip_ImageSearch(pScreen, pSuspect, , FX, FY, SX, SY, 25)
		if TerribleStanding
			vTerribleStanding := Gdip_ImageSearch(pScreen, pTerribleStanding, , FX, FY, SX, SY, 25)
		if War
			vWar := Gdip_ImageSearch(pScreen, pWar, , FX, FY, SX, SY, 25)
		; UI 스케일링 90% 사용하면 무시
		if !UI90
		{
			; NPC
			if Frigate
			{
				if NPCisDead
				{
					dFrigate := Gdip_ImageSearch(pScreen, pFrigate, , FX, FY, SX, SY, 25)
				}
				else
				{
					vFrigate := Gdip_ImageSearch(pScreen, pFrigate, , FX, FY, SX, SY, 25)
				}
			}
			if Destroyer
			{
				if NPCisDead
				{
					dDestroyer := Gdip_ImageSearch(pScreen, pDestroyer, , FX, FY, SX, SY, 25)
				}
				else
				{
					vDestroyer := Gdip_ImageSearch(pScreen, pFrigate, , FX, FY, SX, SY, 25)
				}
			}
			if Cruiser
			{
				if NPCisDead
				{
					dCruiser := Gdip_ImageSearch(pScreen, pCruiser, , FX, FY, SX, SY, 25)
				}
				else
				{
					vCruiser := Gdip_ImageSearch(pScreen, pCruiser, , FX, FY, SX, SY, 25)
				}
			}
			if Battlecruiser
			{
				if NPCisDead
				{
					dBattlecruiser := Gdip_ImageSearch(pScreen, pBattlecruiser, , FX, FY, SX, SY, 25)
				}
				else
				{
					vBattlecruiser := Gdip_ImageSearch(pScreen, pBattlecruiser, , FX, FY, SX, SY, 25)
				}
			}
			if Battleship
			{
				if NPCisDead
				{
					dBattleship := Gdip_ImageSearch(pScreen, pBattleship, , FX, FY, SX, SY, 25)
				}
				else
				{
					vBattleship := Gdip_ImageSearch(pScreen, pBattleship, , FX, FY, SX, SY, 25)
				}
			}
			if Dreadnought
			{
				if NPCisDead
				{
					dDreadnought := Gdip_ImageSearch(pScreen, pDreadnought, , FX, FY, SX, SY, 25)
				}
				else
				{
					vDreadnought := Gdip_ImageSearch(pScreen, pDreadnought, , FX, FY, SX, SY, 25)
				}
			}
			if Carrier
			{
				if NPCisDead
				{
					dCarrier := Gdip_ImageSearch(pScreen, pCarrier, , FX, FY, SX, SY, 25)
				}
				else
				{
					vCarrier := Gdip_ImageSearch(pScreen, pCarrier, , FX, FY, SX, SY, 25)
				}
			}
			if Supercarrier
			{
				if NPCisDead
				{
					dSupercarrier := Gdip_ImageSearch(pScreen, pSupercarrier, , FX, FY, SX, SY, 25)
				}
				else
				{
					vSupercarrier := Gdip_ImageSearch(pScreen, pSupercarrier, , FX, FY, SX, SY, 25)
				}
			}
			if Titan
			{
				if NPCisDead
				{
					dTitan := Gdip_ImageSearch(pScreen, pTitan, , FX, FY, SX, SY, 25)
				}
				else
				{
					vTitan := Gdip_ImageSearch(pScreen, pTitan, , FX, FY, SX, SY, 25)
				}
			}
			if Sentry
			{
				if NPCisDead
				{
					dSentry := Gdip_ImageSearch(pScreen, pSentry, , FX, FY, SX, SY, 25)
				}
				else
				{
					vSentry := Gdip_ImageSearch(pScreen, pSentry, , FX, FY, SX, SY, 25)
				}
			}
		}

		; FindImage 이전 값 대입
		FindImageBefore := FindImage

		; 서치된 이미지가 하나라도 있으면 FindImage 변수에 대입
		if UI90
		{
			FindImage := vAlliance || vCorporation || vExcellentStanding || vFleet || vGoodStanding || vMilitiaAlly || vAvailableKillRight || vBadStanding || vBounty || vCriminal || vLimitedEngagement || vMilitiaWar || vNeutral || vOutlaw || vSecurityStatusBelowZero || vSuspect || vTerribleStanding || vWar
		}

		if !UI90
		{
			FindImage := vAlliance || vCorporation || vExcellentStanding || vFleet || vGoodStanding || vMilitiaAlly || vAvailableKillRight || vBadStanding || vBounty || vCriminal || vLimitedEngagement || vMilitiaWar || vNeutral || vOutlaw || vSecurityStatusBelowZero || vSuspect || vTerribleStanding || vWar || vSentry || vFrigate || vDestroyer || vCruiser || vBattlecruiser || vBattleship || vDreadnought || vCarrier || vSupercarrier || vTitan
		}
		; 로컬경보기가 작동하면 사운드 플레이
		if FindImage
		{
			SoundPlay, sound/warning.wav
			; 이전값과 같지 않고 WinActive 체크가 되있으면 화면을 불러온다
			if !(FindImageBefore = FindImage) && WA
			{
				WinActivate, %Title% ahk_exe exefile.exe ahk_class triuiScreen
			}
			sleep, %delay%
		}
		; 로컬경보기가 작동하지 않으면 사운드 플레이 (드론체력절반)
		if !FindImage
		{
			CheckNPCDeadBefore := CheckNPCDead
			CheckNPCDead := dFrigate || dDestroyer || dCruiser || dBattlecruiser || dBattleship || dDreadnought || dCarrier || dSupercarrier || dTitan || dSentry
			if NPCisDead && !CheckNPCDead
			{
				SoundPlay, sound/NPC's_dead.mp3, 1
				if !(CheckNPCDeadBefore = CheckNPCDead) && WA
				{
					WinActivate, %Title% ahk_exe exefile.exe ahk_class triuiScreen
				}
			}
			if vDroneHalfHP && DroneHalfHP
			{
				SoundPlay, sound/Drone_HP_is_half.mp3, 1
				; 이전값과 같지 않고 WinActive 체크가 되있으면 화면을 불러온다
				if !(vDroneHalfHPBefore = vDroneHalfHP) && WA
				{
					WinActivate, %Title% ahk_exe exefile.exe ahk_class triuiScreen
				}
			}
		}

		; 이브온라인 스크린 이미지 데이터 삭제 및 서치 값 리셋
		Gdip_DisposeImage(pScreen)
		vAlliance := 0
		vCorporation := 0
		vExcellentStanding := 0
		vFleet := 0
		vGoodStanding := 0
		vMilitiaAlly := 0
		vAvailableKillRight := 0
		vBadStanding := 0
		vBounty := 0
		vCriminal := 0
		vLimitedEngagement := 0
		vMilitiaWar := 0
		vNeutral := 0
		vOutlaw := 0
		vSecurityStatusBelowZero := 0
		vSuspect := 0
		vTerribleStanding := 0
		vWar := 0
		vFrigate := 0
		vDestroyer := 0
		vCruiser := 0
		vBattlecruiser := 0
		vBattleship := 0
		vDreadnought := 0
		vCarrier := 0
		vSupercarrier := 0
		vTitan := 0
		vSentry := 0
	}
}
return

; 스탑 버튼
stop:
{
	running := false
	; 서치 종료 시 모든 입력창 활성화
	#IncludeAgain GUIEnabled.ahk
	
	; 스타트 버튼으로 변경
	GuiControl, hide, stop
	GuiControl, show, start

	; 스타트 트레이 활성화, 스탑 트레이 비활성화
	Menu, Tray, Enable, Start
	Menu, Tray, Disable, Stop
}
return
