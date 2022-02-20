BattleCommand_StartSun:
; startsun

	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jp z, FailedWeather

	ld a, WEATHER_SUN
	call StartWeather
	ld hl, SunGotBrightText
	jp StdBattleTextBox

BattleCommand_StartRain:
; startrain
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	jp z, FailedWeather

	ld a, WEATHER_RAIN
	call StartWeather
	ld hl, DownpourText
	jp StdBattleTextBox
	
BattleCommand_StartSandstorm:
; startsandstorm

	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	jp z, FailedWeather

	ld a, WEATHER_SANDSTORM
	call StartWeather
	ld hl, SandstormBrewedText
	jp StdBattleTextBox

StartWeather:
	ld [wBattleWeather], a
	ld a, 5
	ld [wWeatherCount], a
	jp AnimateCurrentMove

FailedWeather:
	call AnimateFailedMove
	jp PrintButItFailed

BattleCommand_ItemSun:
	ld a, WEATHER_SUN
	jp StartWeatherItem

BattleCommand_ItemRain:
	ld a, WEATHER_RAIN
	jp StartWeatherItem

BattleCommand_ItemSandstorm:
	ld a, WEATHER_SANDSTORM
StartWeatherItem:
	ld [wBattleWeather], a
	ld a, 3
	ld [wWeatherCount], a
	ret