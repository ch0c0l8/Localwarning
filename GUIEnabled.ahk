GuiControl, Enabled, FX
GuiControl, Enabled, FY
GuiControl, Enabled, SX
GuiControl, Enabled, SY
GuiControl, Enabled, Name
GuiControl, Enabled, Delay
GuiControl, Enabled, WA
GuiControl, Enabled, UI90
GuiControl, Enabled, SMP
GuiControl, Enabled, Start
GuiControl, Enabled, ExitApp

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

; UI 스케일링 90% 사용시 무시
if !UI90
{
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
}