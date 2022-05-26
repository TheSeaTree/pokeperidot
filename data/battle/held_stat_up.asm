HeldStatUpItems:
	dbw HELD_ATTACK_UP,     BattleCommand_AttackUp
	dbw HELD_DEFENSE_UP,    BattleCommand_DefenseUp
	dbw HELD_SPEED_UP,      BattleCommand_SpeedUp
	dbw HELD_SP_ATTACK_UP,  BattleCommand_SpecialAttackUp
	dbw HELD_SP_DEFENSE_UP, BattleCommand_SpecialDefenseUp
	dbw HELD_ACCURACY_UP,   BattleCommand_AccuracyUp
	dbw HELD_BERSERK_GENE,  BattleCommand_AttackUp2
	db -1 ; end

HeldWeatherItems:
	dbw HELD_SET_RAIN,		BattleCommand_ItemRain
	dbw HELD_SET_SUN,       BattleCommand_ItemSun
	dbw HELD_SET_SAND, 		BattleCommand_ItemSandstorm
	db -1
