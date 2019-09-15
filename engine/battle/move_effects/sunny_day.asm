BattleCommand_StartSun:
; startsun
	ld a, WEATHER_SUN
	ld [wBattleWeather], a
	ld a, 5
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, SunGotBrightText
	jp StdBattleTextBox

BattleCommand_ItemSun:
	ld a, WEATHER_SUN
	ld [wBattleWeather], a
	ld a, 3
	ld [wWeatherCount], a
	ret
