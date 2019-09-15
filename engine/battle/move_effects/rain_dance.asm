BattleCommand_StartRain:
; startrain
	ld a, WEATHER_RAIN
	ld [wBattleWeather], a
	ld a, 5
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, DownpourText
	jp StdBattleTextBox

BattleCommand_ItemRain:
	ld a, WEATHER_RAIN
	ld [wBattleWeather], a
	ld a, 3
	ld [wWeatherCount], a
	ret
