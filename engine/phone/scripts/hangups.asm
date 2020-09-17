JackPhoneTips:
	farwritetext UnknownText_0x1745c2
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0900:
	farwritetext UnknownText_0x17485b
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa0908:
	farwritetext UnknownText_0x17496b
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0910:
	farwritetext UnknownText_0x174c29
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0918:
	farwritetext UnknownText_0x174ec5
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa0920:
	farwritetext UnknownText_0x17519b
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0928:
	farwritetext UnknownText_0x17549b
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa0930:
	farwritetext UnknownText_0x17571d
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0938:
	farwritetext UnknownText_0x175abe
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0940:
	farwritetext UnknownText_0x175eaf
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0948:
	farwritetext UnknownText_0x1768b0
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa0950:
	farwritetext UnknownText_0x176d32
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0958:
	farwritetext UnknownText_0x1770fb
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0960:
	farwritetext UnknownText_0x177465
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa0968:
	farwritetext UnknownText_0x64bc6
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0970:
	farwritetext UnknownText_0x64e90
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0978:
	farwritetext UnknownText_0x65161
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa0980:
	farwritetext UnknownText_0x65a23
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0988:
	farwritetext UnknownText_0x65d5c
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0990:
	farwritetext UnknownText_0x65ff2
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa0998:
	farwritetext UnknownText_0x6651e
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa09a0:
	farwritetext UnknownText_0x66882
	buttonsound
	jump PhoneScript_HangupText_Female

VanceLookingForward:
	farwritetext VanceLookingForwardText
	buttonsound
	jump PhoneScript_HangupText_Male

WiltonHaventFoundAnything:
	farwritetext WiltonHaventFoundAnythingText
	buttonsound
	jump PhoneScript_HangupText_Male

ParryBattleWithMe:
	farwritetext ParryBattleWithMeText
	buttonsound
	jump PhoneScript_HangupText_Male

ErinWorkingHardScript:
	farwritetext ErinWorkingHardText
	buttonsound
	jump PhoneScript_HangupText_Female

UnknownScript_0xa09c8:
	random 3
	ifequal 0, UnknownScript_0xa09d6
	ifequal 1, UnknownScript_0xa09de
	ifequal 2, UnknownScript_0xa09e6

UnknownScript_0xa09d6:
	farwritetext UnknownText_0x64846
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa09de:
	farwritetext UnknownText_0x64881
	buttonsound
	jump PhoneScript_HangupText_Male

UnknownScript_0xa09e6:
	end
