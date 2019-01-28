BattleCommand_Growth:
; growth

	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jp z, .Sunlight
	ld b, SP_ATTACK
	jp BattleCommand_StatUp
	ld b, ATTACK
	jp BattleCommand_StatUp
	ret

.Sunlight
	ld b, $10 | SP_ATTACK
	jp BattleCommand_StatUp
	ld b, ATTACK
	jp BattleCommand_StatUp
	ret
	