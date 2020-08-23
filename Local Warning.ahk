#Include Gdip_All.ahk
#Include Gdip_ImageSearch.ahk
#Include IniRead.ahk
#Include GUI.ahk

; 편차값 255를 초과했을경우 기본값으로 되돌림
VariationCheck:
{
	Gui, Submit, NoHide
	if Variation>255
	{
		GuiControl,,Variation, 30
		TrayTip, Local Warning, You have exceeded the allowed Value(0~255), 1, 3
	}

}
return

; 파일 경로 설정
SelectFolderPath:
{
	FileSelectFolder, Path
	Path .= "`\*.txt"
    GuiControl, , FolderPath, %Path%
	IniWrite, %FolderPath%, data.ini, Setvalue, FolderPath
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
	if Name = ""
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
		if (-1 > posx1) or (-1 > posy1)
		{
			msgbox, 16, Local Warning, Wrong range
			GuiControl,,FX, 0
			GuiControl,,FY, 0
			GuiControl,,SX, 0
			GuiControl,,SY, 0
			goto stop
		}
		GuiControl,,FX, %posx1%
		GuiControl,,FY, %posy1%
		sleep, 100
		; 두번째 좌표 클릭 설정
		KeyWait, Lbutton, D
		MouseGetPos, posx2, posy2
		if (posx1 > posx2) or (posy1 > posy2) or (posx2 >= ScreenWidth) or (posy2 >= ScreenHeight)
		{
			msgbox, 16, Local Warning, Wrong range
			GuiControl,,FX, 0
			GuiControl,,FY, 0
			GuiControl,,SX, 0
			GuiControl,,SY, 0
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

; 스타트 버튼
start:
{
	running := true
	Gui, submit, nohide
	; 서치 시작 시 모든 입력창 비활성화
	#IncludeAgain GUIDisabled.ahk

	; 데이터 저장
	#IncludeAgain IniWrite.ahk
	
	; 로딩 변경
	GuiControl, Disabled, Start
	GuiControl, , Start, Loading

	; 스타트 트레이 비활성화, 스탑 트레이 활성화
	Menu, Tray, Disable, Start
	Menu, Tray, Enable, Stop

	; 기본 값 넣기
	#IncludeAgain IniRead.ahk
	Title := "EVE - " . name
	WinGetPos, , , ScreenWidthBefore, ScreenHeightBefore, %Title% ahk_exe exefile.exe ahk_class triuiScreen

	; 가장 최신 로그 파일 찾기
	if FactionNPCNotification or AFKNotification
	{
		FileEncoding, UTF-8
		Loop, %FolderPath%, 0
		{
			FileRead, OutputTextFile, %A_LoopFileLongPath%
			RegExMatch(OutputTextFile,"Listener:\s(.*)", english)
			RegExMatch(OutputTextFile,"청취자:\s(.*)", korean)
			if (english1 = name) || (korean1 = name)
			{
				FindFile := A_LoopFileLongPath
			}
		}

		; 로그파일 닉네임과 설정 닉네임이 일치하지않을때 실행 불가능
		FileRead, OutputTextFile, %FindFile%
		RegExMatch(OutputTextFile,"Listener:\s(.*)", english)
		RegExMatch(OutputTextFile,"청취자:\s(.*)", korean)
		Gamelogs := Gamelogs
		IfnotInString, FindFile, %Gamelogs%
		{
			TrayTip, Local Warning, Please change to the correct path, 1, 3
			goto stop
		}
		if (FolderPath = "") or (LogCheckTimer = "")
		{
			TrayTip, Local Warning, Please enter log check time and path , 1, 3
			goto stop
		}
		if !((english1 = name) || (korean1 = name))
		{
			TrayTip, Local Warning, Please enter a correct character name, 1, 3
			goto stop
		}
	}

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

	; Variation 값을 안넣었을 경우 실행 불가능
	if (Variation = "")
	{
		GuiControl,,Variation, 30
		TrayTip, Local Warning, Please enter a Variation value, 1, 3
		goto stop
	}

	; Delay 값을 안넣었을 경우 실행 불가능
	if (Delay = "")
	{
		GuiControl,,Delay, 1000
		TrayTip, Local Warning, Please enter a Delay value, 1, 3
		goto stop
	}

	; 체크박스에 아무것도 체크하지 않았을 경우 이미지 서치 시작 불가능
	if !(Alliance || Corporation || ExcellentStanding || Fleet || GoodStanding || MilitiaAlly || AvailableKillRight || BadStanding || Bounty || Criminal || LimitedEngagement || MilitiaWar || Neutral || Outlaw || SecurityStatusBelowZero || Suspect || TerribleStanding || War || Frigate || Destroyer || Cruiser || Battlecruiser || Battleship || Dreadnought || Carrier)
	{
		TrayTip, Local Warning, Please check at least one check box, 1, 3
		goto stop
	}

	; 잘못된 좌표 입력 시 시작 불가능
	if (-1 > ScreenWidthBefore) or (-1 > ScreenHeightBefore) or (FX > SX) or (FY > SY) or (SX >= ScreenWidthBefore) or (SY >= ScreenHeightBefore) or (FX = "") or (FY = "") or (SX = "") or (SY = "")
	{
		TrayTip, Local Warning, Wrong range, 1, 3
		GuiControl,,FX, 0
		GuiControl,,FY, 0
		GuiControl,,SX, 0
		GuiControl,,SY, 0
		goto stop
	}

	if AFKNotification
	{
		SetTimer, AFKNotificationTimer, %LogCheckTimer%
	}
	If FactionNPCNotification
	{
		FactionNPCArray := ["Domination", "Dark Blood", "Dread Guristas", "True Sansha", "Shadow Serpentis", "Sentient"]
	}
	; 로딩 변경 종료
	GuiControl, hide, Start
	GuiControl, show, Stop
	GuiControl, , Start, Start
	GuiControl, Enabled, Start

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

		pFrigate := Gdip_CreateBitmapFromFile("image/NPC90/Icon_red_frigate.png")
		pDestroyer := Gdip_CreateBitmapFromFile("image/NPC90/Icon_red_destroyer.png")
		pCruiser := Gdip_CreateBitmapFromFile("image/NPC90/Icon_red_cruiser.png")
		pBattlecruiser := Gdip_CreateBitmapFromFile("image/NPC90/Icon_red_battlecruiser.png")
		pBattleship := Gdip_CreateBitmapFromFile("image/NPC90/Icon_red_battleship.png")
		pDreadnought := Gdip_CreateBitmapFromFile("image/NPC90/Icon_red_dreadnought.png")
		pCarrier := Gdip_CreateBitmapFromFile("image/NPC90/Icon_red_carrier.png")

		pDroneHalfHP := Gdip_CreateBitmapFromFile("image/DroneHalfHP.png")
		p5_25 := Gdip_CreateBitmapFromFile("image/Ammo90/5_25.png")
		p5_25eng := Gdip_CreateBitmapFromFile("image/Ammo90/5_25eng.png")
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

		pDroneHalfHP := Gdip_CreateBitmapFromFile("image/DroneHalfHP.png")
		p5_25 := Gdip_CreateBitmapFromFile("image/Ammo/5_25.png")
		p5_25eng := Gdip_CreateBitmapFromFile("image/Ammo/5_25eng.png")
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
		; Friendly 탭
		if Alliance
			vAlliance := Gdip_ImageSearch(pScreen, pAlliance, , FX, FY, SX, SY, Variation)
		if Corporation
			vCorporation := Gdip_ImageSearch(pScreen, pCorporation, , FX, FY, SX, SY, Variation)
		if ExcellentStanding
			vExcellentStanding := Gdip_ImageSearch(pScreen, pExcellentStanding, , FX, FY, SX, SY, Variation)
		if Fleet
			vFleet := Gdip_ImageSearch(pScreen, pFleet, , FX, FY, SX, SY, Variation)
		if GoodStanding
			vGoodStanding := Gdip_ImageSearch(pScreen, pGoodStanding, , FX, FY, SX, SY, Variation)
		if MilitiaAlly
			vMilitiaAlly := Gdip_ImageSearch(pScreen, pMilitiaAlly, , FX, FY, SX, SY, Variation)
		; Hostlie 탭 
		if AvailableKillRight
			vAvailableKillRight := Gdip_ImageSearch(pScreen, pAvailableKillRight, , FX, FY, SX, SY, Variation)
		if BadStanding
			vBadStanding := Gdip_ImageSearch(pScreen, pBadStanding, , FX, FY, SX, SY, Variation)
		if Bounty
			vBounty := Gdip_ImageSearch(pScreen, pBounty, , FX, FY, SX, SY, Variation)
		if Criminal
			vCriminal := Gdip_ImageSearch(pScreen, pCriminal, , FX, FY, SX, SY, Variation)
		if LimitedEngagement
			vLimitedEngagement := Gdip_ImageSearch(pScreen, pLimitedEngagement, , FX, FY, SX, SY, Variation)
		if MilitiaWar
			vMilitiaWar := Gdip_ImageSearch(pScreen, pMilitiaWar, , FX, FY, SX, SY, Variation)
		if Neutral
			vNeutral := Gdip_ImageSearch(pScreen, pNeutral, , FX, FY, SX, SY, Variation)
		if Outlaw
			vOutlaw := Gdip_ImageSearch(pScreen, pOutlaw, , FX, FY, SX, SY, Variation)
		if SecurityStatusBelowZero
			vSecurityStatusBelowZero := Gdip_ImageSearch(pScreen, pSecurityStatusBelowZero, , FX, FY, SX, SY, Variation)
		if Suspect
			vSuspect := Gdip_ImageSearch(pScreen, pSuspect, , FX, FY, SX, SY, Variation)
		if TerribleStanding
			vTerribleStanding := Gdip_ImageSearch(pScreen, pTerribleStanding, , FX, FY, SX, SY, Variation)
		if War
			vWar := Gdip_ImageSearch(pScreen, pWar, , FX, FY, SX, SY, Variation)
		; NPC
		if Frigate
			vFrigate := Gdip_ImageSearch(pScreen, pFrigate, , FX, FY, SX, SY, Variation)
		if Destroyer
			vDestroyer := Gdip_ImageSearch(pScreen, pDestroyer, , FX, FY, SX, SY, Variation)
		if Cruiser
			vCruiser := Gdip_ImageSearch(pScreen, pCruiser, , FX, FY, SX, SY, Variation)
		if Battlecruiser
			vBattlecruiser := Gdip_ImageSearch(pScreen, pBattlecruiser, , FX, FY, SX, SY, Variation)
		if Battleship
			vBattleship := Gdip_ImageSearch(pScreen, pBattleship, , FX, FY, SX, SY, Variation)
		if Dreadnought
			vDreadnought := Gdip_ImageSearch(pScreen, pDreadnought, , FX, FY, SX, SY, Variation)
		if Carrier
			vCarrier := Gdip_ImageSearch(pScreen, pCarrier, , FX, FY, SX, SY, Variation)

		; FindImage 이전 값 대입
		FindImageBefore := FindImage
		; 서치된 이미지가 하나라도 있으면 FindImage 변수에 대입
		FindImage := vAlliance || vCorporation || vExcellentStanding || vFleet || vGoodStanding || vMilitiaAlly || vAvailableKillRight || vBadStanding || vBounty || vCriminal || vLimitedEngagement || vMilitiaWar || vNeutral || vOutlaw || vSecurityStatusBelowZero || vSuspect || vTerribleStanding || vWar || vFrigate || vDestroyer || vCruiser || vBattlecruiser || vBattleship || vDreadnought || vCarrier
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

		; 로컬경보기가 작동하지 않으면 옵션 사운드 플레이
		if !FindImage
		{
			; 드론 HP 절반 알림
			if DroneHalfHP
			{
				vDroneHalfHPBefore := vDroneHalfHP
				vDroneHalfHP := Gdip_ImageSearch(pScreen, pDroneHalfHP, , FX, FY, SX, SY, Variation)
				if vDroneHalfHP
				{
					SoundPlay, sound/Drone_HP_is_half.mp3, 1
					; 이전값과 같지 않고 WinActive 체크가 되있으면 화면을 불러온다
					if !(vDroneHalfHPBefore = vDroneHalfHP) && WA
					{
						WinActivate, %Title% ahk_exe exefile.exe ahk_class triuiScreen
					}
				}
			}

			; 탄 장전 알림
			if AmmoReload
			{
				v5_25Before := v5_25
				v5_25 := Gdip_ImageSearch(pScreen, p5_25, , FX, FY, SX, SY, Variation)
				v5_25eng := Gdip_ImageSearch(pScreen, p5_25eng, , FX, FY, SX, SY, Variation)
				v5_25 := v5_25 || v5_25eng
				if v5_25 && !TimerChecker
				{
					TimerChecker := 1
					SetTimer, LoadingTimer5_25, 35000
				}
			}

			; AFK 알림
			Critical, 50
			if AFKNotification
			{
				FileEncoding, UTF-8
				old_linesAFK := total_linesAFK
				; 총 라인 수 읽기 & 마지막 줄 변수에 넣기
				Loop, Read, %FindFile%
				{
					total_linesAFK := A_Index
					LastLineAFK:= A_LoopReadLine
				}
				
				readlineAFK := total_linesAFK - (old_linesAFK - 1) ; 읽어야하는 라인 수 

				; 라인 수 만큼 읽기
				Loop, %readlineAFK%
				{
					FileReadLine, TextAFK, %FindFile%, %old_linesAFK%
					if ErrorLevel
						break
					old_linesAFK++
					StackLinesAFK .= TextAFK . "`n"
				}
			}

			; 팩션 NPC 공격 알림
			if FactionNPCNotification
			{
				FileEncoding, UTF-8
				old_linesFaction := total_linesFaction
				; 총 라인 수 읽기 & 마지막 줄 변수에 넣기
				Loop, Read, %FindFile%
				{
					total_linesFaction := A_Index
					LastLineFaction := A_LoopReadLine
				}
				
				readlineFaction := total_linesFaction - (old_linesFaction - 1) ; 읽어야하는 라인 수 

				; 라인 수 만큼 읽기
				Loop, %readlineFaction%
				{
					FileReadLine, TextFaction, %FindFile%, %old_linesFaction%
					if ErrorLevel
						break
					old_linesFaction++
					StackLinesFaction .= TextFaction . "`n"
				}

				; 팩션 NPC 이름 찾기
				For index, value in FactionNPCArray
				{
					FactionNPCNotificationBefore := FactionNPCNotificationFind
					IfInString, StackLinesFaction, %value%
					{
						FactionNPCNotificationFind := 1
						SoundPlay, sound/FactionNPCNotification.mp3
						StackLinesFaction := ""
						if !(FactionNPCNotificationBefore = FactionNPCNotificationFind) && WA
						{
							WinActivate, %Title% ahk_exe exefile.exe ahk_class triuiScreen
						}
					}
					else
					{
						FactionNPCNotificationFind := 0
					}
				}
			}
			Critical, Off
		}
		; 이미지 데이터 삭제 및 서치 값 리셋
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
	}
}
return

; 스탑 버튼
stop:
{
	running := false

	; 이미지 데이터 삭제 및 서치 값 리셋
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
	SetTimer, LoadingTimer5_25, OFF
	TimerChecker := 0
	v5_25 := 0
	v5_25eng := 0
	SetTimer, AFKNotificationTimer, OFF
	StackLinesFaction := ""
	StackLinesAFK := ""


	; 로딩 변경 종료
	GuiControl, hide, Start
	GuiControl, show, Stop
	GuiControl, , Start, Start
	GuiControl, Enabled, Start

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

LoadingTimer5_25:
{
	if !FindImage
	{
		if v5_25
		{
			SoundPlay, sound/Reload_complete.mp3
			if !(v5_25Before = v5_25) && WA
			{
				WinActivate, %Title% ahk_exe exefile.exe ahk_class triuiScreen
			}
		}
	}
	TimerChecker := 0
	SetTimer, LoadingTimer5_25, OFF
}
return

AFKNotificationTimer:
{
	if !FindImage
	{
		BattleCombat := "combat"
		BattleBounty := "bounty"
		IfInString, LastLineAFK, %BattleCombat%
		{
			vBattleCombat := 1
		}
		IfInString, LastLineAFK, %BattleBounty%
		{
			vBattleBounty := 1
		}
		If vBattleCombat or vBattleBounty
		{
			; 교전 로그이나 다음 로그가 갱신되지 않음 (사이트클리어)
			SiteClearBefore := SiteClear
			SiteClear := (tmp = LastLineAFK)
			if SiteClear
			{
				SoundPlay, sound/site_clear.mp3
				if !(SiteClearBefore = SiteClear) && WA
				{
					WinActivate, %Title% ahk_exe exefile.exe ahk_class triuiScreen
				}
			}
			else
			{
				SiteClear := 0
			}

			; 로그는 갱신중이나 드론이 때리지 않는 상황 (드론 잠수)
			if !(tmp = LastLineAFK)
			{
				tmp := LastLineAFK
				EnglishHit := ">to<"
				EnglishMiss := "completely - "
				KoreanHit := "입힘"
				KoreanMiss := "을(를) 완전히 빗나감"
				IfInString, StackLinesAFK, %EnglishHit%
				{
					vEnglishHit := 1
					StackLinesAFK := ""
				}
				IfInString, StackLinesAFK, %EnglishMiss%
				{
					vEnglishMiss := 1
					StackLinesAFK := ""
				}
				IfInString, StackLinesAFK, %KoreanHit%
				{
					vKoreanHit := 1
					StackLinesAFK := ""
				}
				IfInString, StackLinesAFK, %KoreanMiss%
				{
					vKoreanMiss := 1
					StackLinesAFK := ""
				}
				DroneFightingBefore := DroneFighting
				DroneFighting := (vEnglishHit || vEnglishMiss || vKoreanHit || vKoreanMiss)
				if !DroneFighting
				{
					SoundPlay, sound/drone_is_not_fighting.mp3
					if !(DroneFightingBefore = DroneFighting) && WA
					{
						WinActivate, %Title% ahk_exe exefile.exe ahk_class triuiScreen
					}
				}
			}
		}
	}
	vEnglishHit := 0
	vEnglishMiss := 0
	vKoreanHit := 0
	vKoreanMiss := 0
	vBattleBounty := 0
	vBattleCombat := 0
}
return