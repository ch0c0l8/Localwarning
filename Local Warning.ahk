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

	; 기본 값 넣기
	#IncludeAgain IniRead.ahk
	Title := "EVE - " . name
	FindImage := 0

	; 캐릭터명 입력창에 아무것도 없으면 이미지 서치 시작 불가능
	if (Name = "")
	{
		msgbox, 0, Local Warning, Please enter a character name
		goto stop
	}

	; 이브온라인 핸들을 찾지 못하면 이미지 서치 시작 불가능
	IfWinNotExist, %Title%
	{
		msgbox, 0, Local Warning, EVE Online not detected
		goto stop
	}

	; 체크박스에 아무것도 체크되지 않았을 경우 이미지 서치 시작 불가능
	if !(Alliance || Corporation || ExcellentStanding || Fleet || GoodStanding || MilitiaAlly || AvailableKillRight || BadStanding || Bounty || Criminal || LimitedEngagement || MilitiaWar || Neutral || Outlaw || SecurityStatusBelowZero || Suspect || TerribleStanding || War || Drone || Sentry_drone || Fighter || Capsule || Shuttle || Rookie || Mining_frigate || Mining_barge || Industrial || Industrial_command || Industrial_capital || Sentry || Frigate || Destroyer || Cruiser || Battlecruiser || Battleship || Dreadnought || Carrier || Supercarrier || Titan)
	{
		msgbox, 0, Local Warning, Please check at least one check box
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

		pDrone := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_drone.png")
		pSentry_drone := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_sentry_drone.png")
		pFighter := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_fighter.png")
		pCapsule := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_capsule.png")
		pShuttle := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_shuttle.png")
		pRookie := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_rookie.png")
		pMining_frigate := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_mining_frigate.png")
		pMining_barge := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_mining_barge.png")
		pIndustrial := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_industrial.png")
		pIndustrial_command := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_industrial_command_ship.png")
		pIndustrial_capital := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_industrial_capital.png")
		pSentry := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_tower.png")

		pFrigate := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_frigate.png")
		pDestroyer := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_destroyer.png")
		pCruiser := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_cruiser.png")
		pBattlecruiser := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_battlecruiser.png")
		pBattleship := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_battleship.png")
		pDreadnought := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_dreadnought.png")
		pCarrier := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_carrier.png")
		pSupercarrier := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_supercarrier.png")
		pTitan := Gdip_CreateBitmapFromFile("image/NPC/Icon_red_titan.png")
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

			Gdip_DisposeImage(pDrone)
			Gdip_DisposeImage(pSentry_drone)
			Gdip_DisposeImage(pFighter)
			Gdip_DisposeImage(pCapsule)
			Gdip_DisposeImage(pShuttle)
			Gdip_DisposeImage(pRookie)
			Gdip_DisposeImage(pMining_frigate)
			Gdip_DisposeImage(pMining_barge)
			Gdip_DisposeImage(pIndustrial)
			Gdip_DisposeImage(pIndustrial_command)
			Gdip_DisposeImage(pIndustrial_capital)
			Gdip_DisposeImage(pSentry)

			Gdip_DisposeImage(pFrigate)
			Gdip_DisposeImage(pDestroyer)
			Gdip_DisposeImage(pCruiser)
			Gdip_DisposeImage(pBattlecruiser)
			Gdip_DisposeImage(pBattleship)
			Gdip_DisposeImage(pDreadnought)
			Gdip_DisposeImage(pCarrier)
			Gdip_DisposeImage(pSupercarrier)
			Gdip_DisposeImage(pTitan)
			
			; Gdip 종료
			Gdip_Shutdown(pToken)
			break
		}
		; 이브온라인 스크린 이미지 데이터 입력
		pScreen := Gdip_BitmapFromHwnd(WinExist(Title))

		; 체크된 이미지만 서치
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

		; UI 스케일링 90%를 사용하면 무시
		if !UI90
		{
			; NPC 탭 1
			if Drone
				vDrone := Gdip_ImageSearch(pScreen, pDrone, , FX, FY, SX, SY, 25)
			if Sentry_drone
				vSentry_drone := Gdip_ImageSearch(pScreen, pSentry_drone, , FX, FY, SX, SY, 25)
			if Fighter
				vFighter := Gdip_ImageSearch(pScreen, pFighter, , FX, FY, SX, SY, 25)
			if Capsule
				vCapsule := Gdip_ImageSearch(pScreen, pCapsule, , FX, FY, SX, SY, 25)
			if Shuttle
				vShuttle := Gdip_ImageSearch(pScreen, pShuttle, , FX, FY, SX, SY, 25)
			if Rookie
				vRookie := Gdip_ImageSearch(pScreen, pRookie, , FX, FY, SX, SY, 25)
			if Mining_frigate
				vMining_frigate := Gdip_ImageSearch(pScreen, pMining_frigate, , FX, FY, SX, SY, 25)
			if Mining_barge
				vMining_barge := Gdip_ImageSearch(pScreen, pMining_barge, , FX, FY, SX, SY, 25)
			if Industrial
				vIndustrial := Gdip_ImageSearch(pScreen, pIndustrial, , FX, FY, SX, SY, 25)
			if Industrial_command
				vIndustrial_command := Gdip_ImageSearch(pScreen, pIndustrial_command, , FX, FY, SX, SY, 25)
			if Industrial_capital
				vIndustrial_capital := Gdip_ImageSearch(pScreen, pIndustrial_capital, , FX, FY, SX, SY, 25)
			if Sentry
				vSentry := Gdip_ImageSearch(pScreen, pSentry, , FX, FY, SX, SY, 25)
			; NPC 탭 2
			if Frigate
				vFrigate := Gdip_ImageSearch(pScreen, pFrigate, , FX, FY, SX, SY, 25)
			if Destroyer
				vDestroyer := Gdip_ImageSearch(pScreen, pDestroyer, , FX, FY, SX, SY, 25)
			if Cruiser
				vCruiser := Gdip_ImageSearch(pScreen, pCruiser, , FX, FY, SX, SY, 25)
			if Battlecruiser
				vBattlecruiser := Gdip_ImageSearch(pScreen, pBattlecruiser, , FX, FY, SX, SY, 25)
			if Battleship
				vBattleship := Gdip_ImageSearch(pScreen, pBattleship, , FX, FY, SX, SY, 25)
			if Dreadnought
				vDreadnought := Gdip_ImageSearch(pScreen, pDreadnought, , FX, FY, SX, SY, 25)
			if Carrier
				vCarrier := Gdip_ImageSearch(pScreen, pCarrier, , FX, FY, SX, SY, 25)
			if Supercarrier
				vSupercarrier := Gdip_ImageSearch(pScreen, pSupercarrier, , FX, FY, SX, SY, 25)
			if Titan
				vTitan := Gdip_ImageSearch(pScreen, pTitan, , FX, FY, SX, SY, 25)
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
			FindImage := vAlliance || vCorporation || vExcellentStanding || vFleet || vGoodStanding || vMilitiaAlly || vAvailableKillRight || vBadStanding || vBounty || vCriminal || vLimitedEngagement || vMilitiaWar || vNeutral || vOutlaw || vSecurityStatusBelowZero || vSuspect || vTerribleStanding || vWar || vDrone || vSentry_drone || vFighter || vCapsule || vShuttle || vRookie || vMining_frigate || vIndustrial || vIndustrial_command || vIndustrial_capital || vSentry || vFrigate || vDestroyer || vCruiser || vBattlecruiser || vBattleship || vDreadnought || vCarrier || vSupercarrier || vTitan
		}

		if FindImage
		{
			SoundPlay, warning.wav
			; 이전값과 같지 않고 WinActive 체크가 되있으면 화면을 불러온다
			if !(FindImageBefore = FindImage) && WA
			{
				WinActivate, %Title%
			}
			sleep, %delay%
		}
		else
		{
			sleep, %Delay% ; 딜레이
		}
		; 이브온라인 스크린 이미지 데이터 삭제 및 서치 값 리셋
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
		vDrone := 0
		vSentry_drone := 0
		vFighter := 0
		vCapsule := 0
		vShuttle := 0
		vRookie := 0
		vMining_frigate := 0
		vIndustrial := 0
		vIndustrial_command := 0
		vIndustrial_capital := 0
		vSentry := 0
		vFrigate := 0
		vDestroyer := 0
		vCruiser := 0
		vBattlecruiser := 0
		vBattleship := 0
		vDreadnought := 0
		vCarrier := 0
		vSupercarrier := 0
		vTitan := 0
		Gdip_DisposeImage(pScreen)
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
}
return
