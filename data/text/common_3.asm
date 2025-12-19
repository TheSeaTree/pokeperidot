_OakText6::
	text "…And your name?"
	prompt

_OakText7::
	text "<PLAYER>, is it?"
	
	para "………"
	
	para "Oh, right!"
	
	para "You're meant to be"
	line "starting your jou-"
	cont "rney with #MON"
	cont "today. You must be"
	cont "excited!"

	para "I'll be expecting"
	line "you to stop by my"
	cont "LAB to select your"
	cont "#MON partner!"
	
	para "See you soon,"
	line "<PLAYER>!"
	done

UnknownText_0x1c40e6::
	text "Please reset the"
	line "clock."
	prompt

UnknownText_0x1c411c::
	text "Confirm: A Button"
	line "Cancel:  B Button"
	done

UnknownText_0x1c415b::
	text "Is this OK?"
	done

UnknownText_0x1c4168::
	text "The clock has been"
	line "reset."
	done

UnknownText_0x1c4183::
	text "Too much time has"
	line "elapsed. Please"
	cont "try again."
	prompt

UnknownText_0x1c41b1::
	text "If you trade that"
	line "#MON, you won't"
	cont "be able to battle."
	prompt

UnknownText_0x1c41e6::
	text "Your friend's"
	line "@"
	text_ram wStringBuffer1
	text " appears"
	cont "to be abnormal!"
	prompt

UnknownText_0x1c4212::
	text "Trade @"
	text_ram wd004
	text_start
	line "for @"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c422a::
	text "To enter a mobile"
	line "battle, you must"

	para "pick a team of"
	line "three #MON."

	para "Is that OK?"
	done

UnknownText_0x1c4275::
	text "Need more info on"
	line "mobile battles?"
	done

UnknownText_0x1c4298::
	text "For a mobile"
	line "battle, choose"
	cont "three #MON."

	para "The maximum daily"
	line "play time is ten"

	para "minutes for each"
	line "linked player."

	para "If a battle isn't"
	line "finished within"

	para "the time limit,"
	line "the player with"

	para "the fewest fainted"
	line "#MON wins."

	para "If tied, the team"
	line "that lost the"

	para "least amount of HP"
	line "wins."
	done

UnknownText_0x1c439c::
	text "Today's remaining"
	line "time is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."

	para "Would you like to"
	line "battle?"
	done

UnknownText_0x1c43dc::
	text "There are only @"
	text_decimal wStringBuffer2, 1, 2
	text_start
	line "min. left today."

	para "Want a quick"
	line "battle?"
	done

UnknownText_0x1c4419::
	text "There is only"
	line "1 min. left today!"

	para "Want to rush"
	line "through a battle?"
	done

UnknownText_0x1c445a::
	text "There is less than"
	line "1 min. left today!"

	para "Please try again"
	line "tomorrow."
	done

UnknownText_0x1c449c::
	text "Try again using"
	line "the same settings?"
	done

UnknownText_0x1c44c0::
	text "There is less than"
	line "1 min. left today!"
	done

UnknownText_0x1c44e7::
	text "No time left for"
	line "linking today."
	done

UnknownText_0x1c4508::
	text "Pick three #MON"
	line "for battle."
	done

UnknownText_0x1c4525::
	text "Today's remaining"
	line "time is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."
	done

UnknownText_0x1c454b::
	text "Would you like to"
	line "save the game?"
	done

UnknownText_0x1c456d::
	text "SAVING… DON'T TURN"
	line "OFF THE POWER."
	done

UnknownText_0x1c4590::
	text "<PLAYER> saved"
	line "the game."
	done

UnknownText_0x1c45a3::
	text "There is already a"
	line "save file. Is it"
	cont "OK to overwrite?"
	done

UnknownText_0x1c45d9::
	text "There is another"
	line "save file. Is it"
	cont "OK to overwrite?"
	done

UnknownText_0x1c460d::
	text "The save file is"
	line "corrupted!"
	prompt

UnknownText_0x1c462a::
	text "When you change a"
	line "#MON BOX, data"
	cont "will be saved. OK?"
	done

UnknownText_0x1c465f::
	text "Each time you move"
	line "a #MON, data"
	cont "will be saved. OK?"
	done

CannotAccessPCFeatureText::
	text "This menu cannot"
	line "be accessed now."
	done

UnknownText_0x1c4693::
	text "The window save"
	line "area was exceeded."
	done

UnknownText_0x1c46b7::
	text "No windows avail-"
	line "able for popping."
	done

UnknownText_0x1c46dc::
	text "Corrupted event!"
	prompt

_ObjectEventText::
	text "Object event"
	done

UnknownText_0x1c46fc::
	text "BG event"
	done

UnknownText_0x1c4706::
	text "Coordinates event"
	done

GiveItemText::
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

UnknownText_0x1c472c::
	text "<PLAYER> put the"
	line "@"
	text_ram wStringBuffer1
	text " in"
	cont "the @"
	text_ram wStringBuffer3
	text "."
	prompt

UnknownText_0x1c474b::
	text "The @"
	text_ram wStringBuffer3
	text_start
	line "is full…"
	prompt

UnknownText_0x1c475f::
	text "I see all."
	line "I know all…"

	para "Certainly, I know"
	line "of your #MON!"
	done

UnknownText_0x1c4797::
	text "Whaaaat? I can't"
	line "tell a thing!"

	para "How could I not"
	line "know of this?"
	done

UnknownText_0x1c47d4::
	text "Hm… I see you met"
	line "@"
	text_ram wSeerNickname
	text " here:"
	cont "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

PokeSeer_PalerockLocationText::
	text "Hm… I see you met"
	line "@"
	text_ram wSeerNickname
	text " here:"
	cont "PALEROCK MOUNTAIN!"
	prompt

PokeSeer_PastLocationText::
	text "Hm…"

	para "Oh my…"

	para "@"
	text_ram wSeerNickname
	text " must"
	line "have come from"
	cont "the distant past!"
	prompt

UnknownText_0x1c47fa::
	text "The time was"
	line "@"
	text_ram wSeerTimeOfDay
	text "!"

	para "Its level was @"
	text_ram wSeerCaughtLevelString
	text "!"

	para "Am I good or what?"
	prompt

UnknownText_0x1c4837::
	text "Hm… @"
	text_ram wSeerNickname
	text_start
	line "came from @"
	text_ram wSeerOTName
	text_start
	cont "in a trade?"

	para "@"
	text_ram wSeerCaughtLocation
	text_start
	line "was where @"
	text_ram wSeerOTName
	text_start
	cont "met @"
	text_ram wSeerNickname
	text "!"
	prompt

UnknownText_0x1c487f::
	text "What!? Incredible!"

	para "I don't understand"
	line "how, but it is"

	para "incredible!"
	line "You are special."

	para "I can't tell where"
	line "you met it, but it"
	cont "was at level @"
	text_ram wSeerCaughtLevelString
	text "."

	para "Am I good or what?"
	prompt

PokeSeer_TimeOnlyText::
	text "The time was"
	line "@"
	text_ram wSeerTimeOfDay
	text "."
	
	para "This #MON had"
	line "incredible power"
	cont "when you met it!"

	para "You are truly a"
	line "special trainer to"
	cont "have tamed it!"
	prompt
	
UnknownText_0x1c491d::
	text "Hey!"

	para "That's an EGG!"

	para "You can't say that"
	line "you've met it yet…"
	done

UnknownText_0x1c4955::
	text "Fufufu! I saw that"
	line "you'd do nothing!"
	done

UnknownText_0x1c497a::
	text "Incidentally…"

	para "It would be wise"
	line "to raise your"

	para "#MON with a"
	line "little more care."
	done

UnknownText_0x1c49c6::
	text "Incidentally…"

	para "It seems to have"
	line "grown a little."

	para "@"
	text_ram wSeerNickname
	text " seems"
	line "to be becoming"
	cont "more confident."
	done

UnknownText_0x1c4a21::
	text "Incidentally…"

	para "@"
	text_ram wSeerNickname
	text " has"
	line "grown. It's gained"
	cont "much strength."
	done

UnknownText_0x1c4a5b::
	text "Incidentally…"

	para "It certainly has"
	line "grown mighty!"

	para "This @"
	text_ram wSeerNickname
	text_start
	line "must have come"

	para "through numerous"
	line "#MON battles."

	para "It looks brimming"
	line "with confidence."
	done

UnknownText_0x1c4ae5::
	text "Incidentally…"

	para "I'm impressed by"
	line "your dedication."

	para "It's been a long"
	line "time since I've"

	para "seen a #MON as"
	line "mighty as this"
	cont "@"
	text_ram wSeerNickname
	text "."

	para "I'm sure that"
	line "seeing @"
	text_ram wSeerNickname
	text_start

	para "in battle would"
	line "excite anyone."
	done

UnknownText_0x1c4b92::
	text "Congratulations!"
	line "Your @"
	text_ram wStringBuffer2
	text_end

	text_end ; unused

UnknownText_0x1c4baf::
	text_start

	para "evolved into"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

UnknownText_0x1c4bc5::
	text "Huh? @"
	text_ram wStringBuffer2
	text_start
	line "stopped evolving!"
	prompt

UnknownText_0x1c4be3::
	text "What? @"
	text_ram wStringBuffer2
	text_start
	line "is evolving!"
	done

UnknownText_0x1c4bfd::
	text "How many?"
	done

AlreadyHaveTMText::
	text "You already have"
	line "that TM."
	done

UnknownText_0x1c4c08::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(S)"
	line "will be ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

UnknownText_0x1c4c28::
	text "Hiya!"

	para "I sell inexpensive"
	line "herbal medicine."

	para "They're good, but"
	line "Your #MON may"
	cont "not like their"
	cont "bitterness."
	done

UnknownText_0x1c4ca3::
	text "How many?"
	done

UnknownText_0x1c4cae::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(S)"
	line "will be ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

UnknownText_0x1c4cce::
	text "Thanks a lot!"
	done

UnknownText_0x1c4cea::
	text "Oh? Your PACK is"
	line "full."
	done

UnknownText_0x1c4d08::
	text "You can't afford"
	line "that right now."
	done

UnknownText_0x1c4d2a::
	text "Take care and come"
	line "again!"
	done
	
Subway_TradeBPText::
	text "You may exchange"
	line "your BP for prizes"
	cont "here."
	done

Subway_CostsThisMuch_Text::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(S)"
	line "will be @"
	text_decimal hMoneyTemp, 3, 6
	text " BP."
	done

Subway_InsufficientFunds_Text::
	text "You do not have"
	line "enough BP."
	done

UnknownText_0x1c4d47::
	text "Welcome, CHAMPION!"
	line "We have a special"
	cont "discount for you!"

	para "Do your #MON"
	line "need VITAMINs?"
	done

UnknownText_0x1c4db0::
	text_ram wStringBuffer2
	text " costs"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text ". Want it?"
	done

UnknownText_0x1c4dcd::
	text "Thanks."
	done

UnknownText_0x1c4dd6::
	text "Uh-oh, your PACK"
	line "is chock-full."
	done

UnknownText_0x1c4df7::
	text "You bought that"
	line "already. I'm all"
	cont "sold out of it."
	done

UnknownText_0x1c4e28::
	text "Uh-oh, you're"
	line "short on funds."
	done

UnknownText_0x1c4e46::
	text "Come by again"
	line "sometime."
	done

UnknownText_0x1c4e5f::
	text "I don't have much"
	line "to offer."
	done

UnknownText_0x1c4e7e::
	text "How many?"
	done

UnknownText_0x1c4e89::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(S)"
	line "will cost ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

UnknownText_0x1c4eab::
	text "Thanks much!"
	done

UnknownText_0x1c4eb9::
	text "You don't have any"
	line "more space."
	done

UnknownText_0x1c4ed8::
	text "Huh? That's not"
	line "enough money."
	done

UnknownText_0x1c4ef6::
	text "All right."
	line "See you around."
	done

UnknownText_0x1c4f12::
	text "You don't have"
	line "anything to sell."
	prompt

UnknownText_0x1c4f33::
	text "How many?"
	done

UnknownText_0x1c4f3e::
	text "I can pay you"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."

	para "Is that OK?"
	done

UnknownText_0x1c4f62::
	text "Welcome! How may I"
	line "help you?"
	done

Rooftop_HowMayIHelpYouText::
	text "Have you come to"
	line "browse my select-"
	cont "ion of items?"
	done
	
Drinks_HowMayIHelpYouText::
	text "Welcome! Take a"
	line "seat and let me"
	cont "know what you'd"
	cont "like to drink."
	done
	
UnknownText_0x1c4f80::
	text "Here you are."
	line "Thank you!"
	done

UnknownText_0x1c4f9a::
	text "You don't have"
	line "enough money."
	done

UnknownText_0x1c4fb7::
	text "You can't carry"
	line "any more items."
	done

UnknownText_0x1c4fd7::
	text "Sorry, I can't buy"
	line "that from you."
	prompt

UnknownText_0x1c4ff9::
	text "Please come again!"
	done

UnknownText_0x1c500d::
	text "Can I do anything"
	line "else for you?"
	done

UnknownText_0x1c502e::
	text "Got ¥@"
	text_decimal hMoneyTemp, 3, 6
	text " for"
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	done

UnknownText_0x1c5049::
	text "Bet how many"
	line "coins?"
	done

UnknownText_0x1c505e::
	text "Start!"
	done

UnknownText_0x1c5066::
	text "Not enough"
	line "coins."
	prompt

UnknownText_0x1c5079::
	text "Darn… Ran out of"
	line "coins…"
	done

UnknownText_0x1c5092::
	text "Play again?"
	done

UnknownText_0x1c509f::
	text "lined up!"
	line "Won @"
	text_ram wStringBuffer2
	text " coins!"
	done

UnknownText_0x1c50bb::
	text "Darn!"
	done

_MobileStadiumEntryText::
	text "Data for use in"
	line "the MOBILE STADIUM"

	para "of the N64 #MON"
	line "STADIUM 2 can be"
	cont "read here."

	para "Read the data?"
	done

_MobileStadiumSuccessText::
	text "Data transfer is"
	line "complete."

	para "We hope you enjoy"
	line "MOBILE STADIUM"

	para "battles in the N64"
	line "#MON STADIUM 2."

	para ""
	done

UnknownText_0x1c5182::
	text "Clock time unknown"
	done

UnknownText_0x1c5196::
	text "Delete the saved"
	line "LOG-IN PASSWORD?"
	done

UnknownText_0x1c51b9::
	text "Deleted the LOG-IN"
	line "PASSWORD."
	done

UnknownText_0x1c51d7::
	text "Pick three #MON"
	line "for battle."
	prompt

UnknownText_0x1c51f4::
	text_ram wMobileParticipant1Nickname
	text ","
	line "@"
	text_ram wMobileParticipant2Nickname
	text " and"
	cont "@"
	text_ram wMobileParticipant3Nickname
	text "."

	para "Use these three?"
	done

UnknownText_0x1c521c::
	text "Only three #MON"
	line "may enter."
	prompt

UnknownText_0x1c5238::
	text "The CARD FOLDER"
	line "stores your and"

	para "your friends'"
	line "CARDS."

	para "A CARD contains"
	line "information like"

	para "the person's name,"
	line "phone number and"
	cont "profile."

	para ""
	done

UnknownText_0x1c52bc::
	text "This is your CARD."

	para "Once you've"
	line "entered your phone"

	para "number, you can"
	line "trade CARDS with"
	cont "your friends."

	para ""
	done

UnknownText_0x1c531e::
	text "If you have your"
	line "friend's CARD, you"

	para "can use it to make"
	line "a call from a"

	para "mobile phone on"
	line "the 2nd floor of a"
	cont "#MON CENTER."

	para ""
	done

UnknownText_0x1c5394::
	text "To safely store"
	line "your collection of"

	para "CARDS, you must"
	line "set a PASSCODE for"
	cont "your CARD FOLDER."

	para ""
	done

UnknownText_0x1c53ee::
	text "If the CARD FOLDER"
	line "is deleted, all"

	para "its CARDS and the"
	line "PASSCODE will also"
	cont "be deleted."

	para "Beware--a deleted"
	line "CARD FOLDER can't"
	cont "be restored."

	para "Want to delete"
	line "your CARD FOLDER?"
	done

UnknownText_0x1c5494::
	text "Are you sure you"
	line "want to delete it?"
	done

UnknownText_0x1c54b9::
	text "The CARD FOLDER"
	line "has been deleted."

	para ""
	done

UnknownText_0x1c54dd::
	text "There is an older"
	line "CARD FOLDER from a"
	cont "previous journey."

	para "Do you want to"
	line "open it?"
	done

UnknownText_0x1c552d::
	text "Delete the old"
	line "CARD FOLDER?"
	done

UnknownText_0x1c554a::
	text "Finish registering"
	line "CARDS?"
	done

UnknownText_0x1c5565::
	text "Huh? Sorry, wrong"
	line "number!"
	done

UnknownText_0x1c5580::
	text "Click!"
	done

UnknownText_0x1c5588::
	text "<……>"
	done

UnknownText_0x1c558b::
	text "That number is out"
	line "of the area."
	done

UnknownText_0x1c55ac::
	text "Just go talk to"
	line "that person!"
	done

UnknownText_0x1c55ca::
	text "Thank you!"
	done

UnknownText_0x1c55d6::
	text "  :"
	done

UnknownText_0x1c55db::
	text "The time has been"
	line "reset."
	prompt

UnknownText_0x1c564a::
	text "Clear all save"
	line "data?"
	done

Text_DifficultySelect::
	text "Select a mode."
	line "Explain: B Button"
	done

Text_DifficultSelectConfirmation::
	text "This can not be"
	line "changed later."
	
	para "Are you sure?"
	done

Text_AskChangeDifficulty::
	text "Would you like to"
	line "change the current"
	cont "difficulty mode?"
	done

Text_CannotChangeDifficulty::
	text "The difficulty"
	line "mode can not be"
	cont "changed now."
	prompt

Text_DifficultyExplain::
	text "RELAXED mode will"
	line "only make traded"
	cont "#MON disobey."

	para "EXPERT mode will"
	line "disable the SHIFT"
	cont "battle style,"
	cont "only allow saving"
	cont "from the PC, and"
	cont "the game will"
	cont "return to the"
	cont "title screen if a"
	cont "battle is lost."
	cont "Additionally,"
	cont "items may not be"
	cont "used when in a"
	cont "TRAINER battle."

	para "The mode can not"
	line "be changed once"
	cont "it is selected."
	prompt

UnknownText_0x1c5660::
	text_ram wMonOrItemNameBuffer
	text " learned"
	line "@"
	text_ram wStringBuffer2
	text "!@"
	sound_dex_fanfare_50_79
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c5678::
	text "Which move should"
	next "be forgotten?"
	done

UnknownText_0x1c5699::
	text "Stop learning"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1c56af::
	text_ram wMonOrItemNameBuffer
	text_start
	line "did not learn"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c56c9::
	text_ram wMonOrItemNameBuffer
	text " is"
	line "trying to learn"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "But @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "can't learn more"
	cont "than four moves."

	para "Delete an older"
	line "move to make room"
	cont "for @"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1c5740::
	text "1, 2 and…@"
	text_pause
	text_end

	text_end ; unused

UnknownText_0x1c574e::
	text " Poof!@"
	text_pause
	text_start

	para "@"
	text_ram wMonOrItemNameBuffer
	text " forgot"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "And…"
	prompt

UnknownText_0x1c5772::
	text "SURF can't be"
	line "forgotten now."
	prompt

UnknownText_0x1c5793::
	text "Play with three"
	line "coins?"
	done

UnknownText_0x1c57ab::
	text "Not enough coins…"
	prompt

UnknownText_0x1c57be::
	text "Choose a card."
	done

UnknownText_0x1c57ce::
	text "Place your bet."
	done

UnknownText_0x1c57df::
	text "Want to play"
	line "again?"
	done

UnknownText_0x1c57f4::
	text "The cards have"
	line "been shuffled."
	prompt

UnknownText_0x1c5813::
	text "Yeah!"
	done

UnknownText_0x1c581a::
	text "Darn…"
	done

UnknownText_0x1c5821::
	text_today
	text_end

	text_end ; unused

UnknownText_0x1c5824::
	text "<……>"
	done

UnknownText_0x1c5827::
	text "You're out of the"
	line "service area."
	prompt

UnknownText_0x1c5847::
	text "Whom do you want"
	line "to call?"
	done

UnknownText_0x1c5862::
	text "Press any button"
	line "to exit."
	done

UnknownText_0x1c587d::
	text "Delete this stored"
	line "phone number?"
	done

UnknownText_0x1c589f::
	text "Which prize would"
	line "you like?"
	done

UnknownText_0x1c58bc::
	text_ram wStringBuffer1
	text "?"
	line "Is that right?"
	done

UnknownText_0x1c58d1::
	text "Here you go!"

	para ""
	done

UnknownText_0x1c58e0::
	text "You don't have"
	line "enough points."

	para ""
	done

UnknownText_0x1c58ff::
	text "You have no room"
	line "for it."

	para ""
	done

UnknownText_0x1c591a::
	text "Oh. Please come"
	line "back again!"
	done

UnknownText_0x1c5937::
	text "Excuse me!"

	para ""
	done

Text_ExcuseMeYoureNotReady::
	text "Excuse me."
	line "You're not ready."

	para ""
	done

UnknownText_0x1c5962::
	text "Please return when"
	line "you're ready."
	done

UnknownText_0x1c5983::
	text "You need at least"
	line "three #MON."

	para ""
	done

UnknownText_0x1c59a3::
	text "Sorry, an EGG"
	line "doesn't qualify."

	para ""
	done

Text_OnlyThreeMonMayBeEntered::
	text "Only three #MON"
	line "may be entered."

	para ""
	done

Text_TheMonMustAllBeDifferentKinds::
	text "The @"
	text_ram wStringBuffer2
	text " #MON"
	line "must all be"
	cont "different kinds."

	para ""
	done

Text_TheMonMustNotHoldTheSameItems::
	text "The @"
	text_ram wStringBuffer2
	text " #MON"
	line "must not hold the"
	cont "same items."

	para ""
	done

Text_YouCantTakeAnEgg::
	text "You can't take an"
	line "EGG!"

	para ""
	done

UnknownText_0x1c5a5a::
	text "It dodged the"
	line "thrown BALL!"

	para "This #MON"
	line "can't be caught!"
	prompt

UnknownText_0x1c5a90::
	text "You missed the"
	line "#MON!"
	prompt

UnknownText_0x1c5aa6::
	text "Oh no! The #MON"
	line "broke free!"
	prompt

UnknownText_0x1c5ac3::
	text "Aww! It appeared"
	line "to be caught!"
	prompt

UnknownText_0x1c5ae3::
	text "Aargh!"
	line "Almost had it!"
	prompt

UnknownText_0x1c5afa::
	text "Shoot! It was so"
	line "close too!"
	prompt

UnknownText_0x1c5b17::
	text "Gotcha! @"
	text_ram wEnemyMonNick
	text_start
	line "was caught!@"
	sound_caught_mon
	text_end

	text_end ; unused

Text_Waitbutton_2::
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c5b38::
	text_ram wMonOrItemNameBuffer
	text " was"
	line "sent to the PC."
	prompt

UnknownText_0x1c5b53::
	text_ram wEnemyMonNick
	text "'s data"
	line "was newly added to"
	cont "the #DEX.@"
	sound_slot_machine_start
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c5b7f::
	text "Give a nickname to"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c5b9a::
	text_ram wStringBuffer1
	text "'s"
	line "@"
	text_ram wStringBuffer2
	text " rose."
	prompt

UnknownText_0x1c5bac::
	text "That can't be used"
	line "on this #MON."
	prompt

Text_RepelUsedEarlierIsStillInEffect::	
	text "There is a REPEL"
	line "still in effect."

	para "Steps remaining:"
	line "@"
	text_decimal wRepelEffect, 1, 3
	text "."
	prompt

UnknownText_0x1c5bf9::
	text "Now, that's a"
	line "catchy tune!"
	done

UnknownText_0x1c5c28::
	text "All sleeping"
	line "#MON woke up."
	prompt

UnknownText_0x1c5c44::
	text "<PLAYER> played the"
	line "# FLUTE.@"
;	text_waitbutton
	text_end

PlayerPlayedTimeBell_Text::
	text "<PLAYER> rang the"
	line "TIME BELL.@"
	text_end

UnknownText_0x1c5c5e::
	text "You now have"
	line "@"
	text_decimal wBlueCardBalance, 1, 2
	text " points."
	done

AncientTomeRead_Text::
	text "<PLAYER> read"
	line "aloud from the"
	cont "ANCIENT TOME…"
	done

AncientTomeNothingHappened_Text::
	text "…But nothing"
	line "happened."
	done

AncientTomeGlowing_Text::
	text "The ANCIENT TOME"
	line "is glowing!"
	done

AncientTomeUnownReact_Text::
	text "Your UNOWN seems"
	line "quite pleased!"
	done

UnknownText_0x1c5c7b::
	text "Coins:"
	line "@"
	text_decimal wCoins, 2, 4
	text_end

	text_end ; unused

Text_RaiseThePPOfWhichMove::
	text "Raise the PP of"
	line "which move?"
	done

Text_RestoreThePPOfWhichMove::
	text "Restore the PP of"
	line "which move?"
	done

Text_PPIsMaxedOut::
	text_ram wStringBuffer2
	text "'s PP"
	line "is maxed out."
	prompt

Text_PPsIncreased::
	text_ram wStringBuffer2
	text "'s PP"
	line "increased."
	prompt

UnknownText_0x1c5cf1::
	text "PP was restored."
	prompt

UnknownText_0x1c5d03::
	text "There was a trophy"
	line "inside!@"
	sound_dex_fanfare_50_79
	text_start

	para "@"
	text_ram wPlayerName
	text " sent the"
	line "trophy home."
	prompt

UnknownText_0x1c5d3e::
	text "It looks bitter…"
	prompt

UnknownText_0x1c5d50::
	text "That can't be used"
	line "on an EGG."
	prompt

UnknownText_0x1c5d6e::
	text "This isn't the"
	line "time to use that!"
	prompt

UnknownText_0x1c5d97::
	text "That belongs to"
	line "someone else!"
	prompt

UnknownText_0x1c5db6::
	text "It won't have any"
	line "effect."
	prompt

UnknownText_0x1c5dd0::
	text "The trainer"
	line "blocked the BALL!"
	prompt

Text_SmackedTheBall::
	text_ram wEnemyMonNick
	text " smacked" 
	line "the BALL away!"

	para "This #MON"
	line "can't be caught!"
	prompt

UnknownText_0x1c5def::
	text "Don't be a thief!"
	prompt

UnknownText_0x1c5e01::
	text "Cycling isn't"
	line "allowed here."
	prompt

UnknownText_0x1c5e1d::
	text "Can't get on your"
	line "@"
	text_ram wStringBuffer1
	text " now."
	prompt

UnknownText_0x1c5e3a::
	text "The #MON BOX"
	line "is full. That"
	cont "can't be used now."
	prompt

UnknownText_0x1c5e68::
	text "<PLAYER> used the@"
	text_low
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1c5e7b::
	text "<PLAYER> got on the@"
	text_low
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c5e90::
	text "<PLAYER> got off@"
	text_low
	text "the @"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c5ea8::
	text_ram wStringBuffer1
	text " knows"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c5eba::
	text "That #MON knows"
	line "only one move."
	done

UnknownText_0x1c5eda::
	text "Oh, make it forget"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c5ef5::
	text "Done! Your #MON"
	line "forgot the move."
	done

UnknownText_0x1c5f17::
	text "An EGG doesn't"
	line "know any moves!"
	done

UnknownText_0x1c5f36::
	text "No? Come visit me"
	line "again."
	done

UnknownText_0x1c5f50::
	text "Which move should"
	line "it forget, then?"
	prompt

UnknownText_0x1c5f74::
	text "Um… Oh, yes, I'm"
	line "the MOVE DELETER."

	para "I can make #MON"
	line "forget moves."

	para "Shall I make a"
	line "#MON forget?"
	done

UnknownText_0x1c5fd1::
	text "Which #MON?"
	prompt

Text_DSTIsThatOK::
	text " DST,"
	line "is that OK?"
	done

UnknownText_0x1c5ff1::
	text ","
	line "is that OK?"
	done

UnknownText_0x1c6000::
	text "Set the clock for-"
	line "ward one hour?"
	done

UnknownText_0x1c6030::
	text "The clock has been"
	line "set forward by one"
	cont "hour."
	prompt

UnknownText_0x1c6056::
	text "Do you want to"
	line "adjust the clock?"
	done

UnknownText_0x1c6075::
	text "The clock has been"
	line "set back by one"
	cont "hour."
	prompt

UnknownText_0x1c6095::
	text "The time can't be"
	line "changed that way"
	cont "right now."
	prompt

UnknownText_0x1c60d1::
	text "The time has al-"
	line "ready been changed"
	cont "today."
	prompt

MoveReminderIntroText::
	text "People call me the"
	line "MOVE MANIAC."

	para "I know every move"
	line "a #MON learns!"

	para "I can remind your"
	line "#MON how to use"
	cont "a forgotten move"
	cont "if you trade me a"
	cont "BRICK PIECE."
	done

MoveReminderPromptText::
	text "Do you want me to"
	line "teach one of your"
	cont "#MON a move?"
	done

MoveReminderWhichMonText::
	text "Alright! Which one"
	line "am I tutoring?"
	done

MoveReminderWhichMoveText::
	text "Which move should"
	line "it remember?"
	done

MoveReminderNoGoldLeafText::
	text "You don't have a"
	line "BRICK PIECE to"
	cont "give to me? That's"
	cont "a shame…"

	para "I hear you can get"
	line "them from breaking"
	cont "ROCKs sometimes."
	done

MoveReminderEggText::
	text "Huh? EGGs can't"
	line "use moves…"
	done

MoveReminderNoMonText::
	text "That's not a"
	line "#MON."
	done

MoveReminderNoMovesText::
	text "That #MON does"
	line "not learn any more"
	cont "moves."
	
	para "Sorry…"
	done

MoveReminderCancelText::
	text "If you want to"
	line "teach your #MON"
	cont "more moves, come"
	cont "back with a BRICK"
	cont "PIECE."
	done

SimulationMoveReminderIntrroText::
	text "I am the MOVE"
	line "MANIAC."

	para "I can teach your"
	line "#MON moves it"
	cont "may have known at"
	cont "a lower level."

	para "Would you like to"
	line "tutor a #MON?"
	done

EggMoveTutorIntroText::
	text "Hello! I am the"
	line "MOVE FANATIC."

	para "I study the most"
	line "rare moves that"
	cont "#MON can learn."

	para "I can teach your"
	line "#MON how to use"
	cont "these rare moves"
	cont "if you trade me"
	cont "a STAR PIECE."
	done

EggMoveTutorWhichMonText::
	text "Which #MON will"
	line "you have me tutor?"
	done

EggMoveTutorWhichMoveText::
	text "Which move will I"
	line "be teaching it?"
	done

EggMoveTutorNoItemText::
	text "You don't have a"
	line "STAR PIECE for me?"

	para "I understand they"
	line "are hard to find,"
	cont "but it's difficult"
	cont "work documenting"
	cont "what moves a"
	cont "#MON can learn."
	done

EggMoveTutorNoMovesText::
	text "I'm sorry, that"
	line "#MON does not"
	cont "have any rare"
	cont "moves to learn."

	para "Try another,"
	line "please."
	done

EggMoveTutorNotHappyText::
	text "I can only tutor a"
	line "#MON that has a"
	cont "strong bond with"
	cont "its trainer."

	para "I do apologize for"
	line "any inconvenience."
	done

EggMoveTutorCancelText::
	text "Take care now!"

	para "Come see me if you"
	line "want your #MON"
	cont "to learn some new"
	cont "rare moves."
	done

SimulationMoveReminderCancelText::
	text "All set?"

	para "Good luck with the"
	line "rest of your"
	cont "SIMULATION run!"
	done

ExpAll_TurnOnText::
	text "The EXP. ALL has"
	line "been disabled."
	done

ExpAll_TurnOffText::
	text "The EXP. ALL has"
	line "been enabled."
	done

UsedLastItemText::
	text "You used your last"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_HiddenPowerGirlIntroText::
	text "A #MON's genes"
	line "will determine"
	cont "many things."

	para "One of which"
	line "determines the"
	cont "type it has a"
	cont "strong bond with."

	para "Please, allow me"
	line "to demonstrate."
	done

_HiddenPowerGirlDeclineText::
	text "Do you not trust"
	line "my judgment?"

	para "I have no reason"
	line "to deceive you."
	prompt

_HiddenPowerGirlEggText::
	text "Sorry, I cannot"
	line "predict what an"
	cont "EGG's capabilities"
	cont "will be."
	prompt

_HiddenPowerGirlAnswerText::
	text "Ah, I see…"

	para "Yes!"

	para "This #MON has"
	line "an affinity for"
	cont "the @"
	text_ram wStringBuffer1
	text "-type!"
	prompt
