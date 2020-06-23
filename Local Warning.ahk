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
	GuiControl, Disabled, FX
	GuiControl, Disabled, FY
	GuiControl, Disabled, SX
	GuiControl, Disabled, SY
	GuiControl, Disabled, Name
	GuiControl, Disabled, Delay
	GuiControl, Disabled, WA
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

	GuiControl, Disabled, Drone
	GuiControl, Disabled, Sentry_drone
	GuiControl, Disabled, Fighter
	GuiControl, Disabled, Capsule
	GuiControl, Disabled, Shuttle
	GuiControl, Disabled, Rookie
	GuiControl, Disabled, Mining_frigate
	GuiControl, Disabled, Mining_barge
	GuiControl, Disabled, Industrial
	GuiControl, Disabled, Industrial_command
	GuiControl, Disabled, Industrial_capital
	GuiControl, Disabled, Sentry

	GuiControl, Disabled, Frigate
	GuiControl, Disabled, Destroyer
	GuiControl, Disabled, Cruiser
	GuiControl, Disabled, Battlecruiser
	GuiControl, Disabled, Battleship
	GuiControl, Disabled, Dreadnought
	GuiControl, Disabled, Carrier
	GuiControl, Disabled, Supercarrier
	GuiControl, Disabled, Titan

	; 데이터 저장
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
	
	; 스탑 버튼으로 변경
	GuiControl, hide, start
	GuiControl, show, stop

	; 기본 값 넣기
	Title := "EVE - " . name
	FindChcekedImage := 0

	;
	if (Name = "")
	{
		msgbox, 0, Local Warning, Please enter a character name
		goto stop
	}

	; Gdip 시작
	pToken := Gdip_Startup()

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

	pFortizar := Gdip_CreateBitmapFromFile("fort_new.png")
	

	; 이미지 서치 루프 시작
	Loop
	{
		; 스탑 버튼을 눌렀을 경우
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
		; 화면 캡쳐
		pScreen := Gdip_BitmapFromHwnd(WinExist(Title))

		; 이미지 서치 시작
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
		
		; 체크박스에 아무것도 체크되지 않았을 경우 이미지 서치 종료
		if !(Alliance || Corporation ExcellentStanding || Fleet || GoodStanding || MilitiaAlly || AvailableKillRight || BadStanding || Bounty || Criminal || LimitedEngagement || MilitiaWar || Neutral || Outlaw || SecurityStatusBelowZero || Suspect || TerribleStanding || War || Drone || Sentry_drone || Fighter || Capsule || Shuttle || Rookie || Mining_frigate || Mining_barge || Industrial || Industrial_command || Industrial_capital || Sentry || Frigate || Destroyer || Cruiser || Battlecruiser || Battleship || Dreadnought || Carrier || Supercarrier || Titan)
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

			msgbox, 0, Local Warning, Please check at least one check box
			goto stop
		}

		; 이브 핸들을 찾지 못했을 경우 이미지 서치 종료
		if (vAlliance = -1001) || (vCorporation = -1001) || (vExcellentStanding = -1001) || (vFleet = -1001) || (vGoodStanding = -1001) || (vMilitiaAlly = -1001) || (vAvailableKillRight = -1001) || (vBadStanding = -1001) || (vBounty = -1001) || (vCriminal = -1001) || (vLimitedEngagement = -1001) || (vMilitiaWar = -1001) || (vNeutral = -1001) || (vOutlaw = -1001) || (vSecurityStatusBelowZero = -1001) || (vSuspect = -1001) || (vTerribleStanding = -1001) || (vWar = -1001) || (vDrone = -1001) || (vSentry_drone = -1001) || (vFighter = -1001) || (vCapsule = -1001) || (vShuttle = -1001) || (vRookie = -1001) || (vMining_frigate = -1001) || (vMining_barge = -1001) || (vIndustrial = -1001) || (vIndustrial_command = -1001) || (vIndustrial_capital = -1001) || (vSentry = -1001) || (vFrigate = -1001) || (vDestroyer = -1001) || (vCruiser = -1001) || (vBattlecruiser = -1001) || (vBattleship = -1001) || (vDreadnought = -1001) || (vCarrier = -1001) || (vSupercarrier = -1001) || (vTitan = -1001)
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

			msgbox, 0, Local Warning, EVE Online not detected
			goto stop
		}
		; 체크된 이미지만 찾기
		CheckPointBefore := %FindChcekedImage%
		FindChcekedImage := ((vAlliance && Alliance) || (vCorporation && Corporation) || (vExcellentStanding && ExcellentStanding) || (vFleet && Fleet) || (vGoodStanding && GoodStanding) || (vMilitiaAlly && MilitiaAlly)||(vAvailableKillRight && AvailableKillRight) ||(vBadStanding && BadStanding) ||(vBounty && Bounty) ||(vCriminal && Criminal) || (vLimitedEngagement && LimitedEngagement)|| (vMilitiaWar && MilitiaWar)||(vNeutral && Neutral) ||(vOutlaw && Outlaw) ||(vSecurityStatusBelowZero && SecurityStatusBelowZero) || (vSuspect && Suspect)||(vTerribleStanding && TerribleStanding) || (vWar && War) || (vDrone && Drone) || (vSentry_drone && Sentry_drone) || (vFighter && Fighter) || (vCapsule && Capsule) || (vShuttle && Shuttle) || (vRookie && Rookie) || (vMining_frigate && Mining_frigate) || (vIndustrial && Industrial) || (vIndustrial_command && Industrial_command) || (vIndustrial_capital && Industrial_capital) || (vSentry && Sentry) || (vFrigate && Frigate) || (vDestroyer && Destroyer) || (vCruiser && Cruiser) || (vBattlecruiser && Battlecruiser) || (vBattleship && Battleship) || (vDreadnought && Dreadnought) || (vCarrier && Carrier) || (vSupercarrier && Supercarrier) || (vTitan && Titan))
		CheckPointAfter := %FindChcekedImage%

		if FindChcekedImage
		{
			SoundPlay, warning.wav
			if !(CheckPointBefore = CheckPointAfter) && WA
			{
				WinActivate, %Title%
			}
			sleep, %delay%
		}
		else
		{
			sleep, %Delay% ; 딜레이
		}
		; 스크린 이미지 삭제
		Gdip_DisposeImage(pScreen)
	}
}
return

; 스탑 버튼
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
	GuiControl, Enabled, WA
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

	GuiControl, Enabled, Drone
	GuiControl, Enabled, Sentry_drone
	GuiControl, Enabled, Fighter
	GuiControl, Enabled, Capsule
	GuiControl, Enabled, Shuttle
	GuiControl, Enabled, Rookie
	GuiControl, Enabled, Mining_frigate
	GuiControl, Enabled, Mining_barge
	GuiControl, Enabled, Industrial
	GuiControl, Enabled, Industrial_command
	GuiControl, Enabled, Industrial_capital
	GuiControl, Enabled, Sentry

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
	
	; 스타트 버튼으로 변경
	GuiControl, hide, stop
	GuiControl, show, start
}
return
