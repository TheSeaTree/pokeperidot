phone: MACRO
; trainer class, trainer id, map, time 1, script 1, time 2, script 2
	db \1, \2
	map_id \3
	db \4
	dba \5
	db \6
	dba \7
ENDM

PhoneContacts:
; entries correspond to PHONE_* constants
	phone TRAINER_NONE, PHONECONTACT_BUENA, GOLDENROD_DEPT_STORE_ROOF, ANYTIME, BuenaPhoneScript1, ANYTIME, BuenaPhoneScript2
