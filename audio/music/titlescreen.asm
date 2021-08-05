Music_TitleScreen: ; eb7b1
	dbw $c0, Music_TitleScreen_Ch1
	dbw $01, Music_TitleScreen_Ch2
	dbw $02, Music_TitleScreen_Ch3
	dbw $03, Music_TitleScreen_Ch4
; eb7bd

Music_TitleScreen_Ch1: ; eb7bd
	tempo 256
	volume $77
	dutycycle $3
	tone $0002
	vibrato $10, $12
	stereopanning $f0
	notetype $c, $a7
	octave 3
	note D_, 6
	octave 2
	note B_, 2
	note B_, 4
	octave 3
	note D_, 4
	intensity $a0
	note C_, 6
	intensity $a7
	note C_, 6
	note D#, 4
	note D_, 6
	octave 2
	note G_, 2
	note G_, 4
	octave 3
	note D_, 4
	note D#, 8
	tempo 184
	note G#, 8
	tempo 134
	octave 2
	note G_, 1
	note __, 2
	note A_, 1
	note B_, 8
	note G_, 4
	octave 3
	note C_, 1
	note __, 2
	note D_, 1
	note E_, 8
	note C_, 4
	octave 2
	note B_, 1
	note __, 2
	octave 3
	note C_, 1
	octave 2
	note B_, 8
	note A_, 4
	note A_, 1
	note __, 2
	note B_, 1
	octave 3
	note C_, 6
	note E_, 4
	note F#, 2
	stereopanning $ff
	octave 4
	note G_, 1
	stereopanning $f0
	octave 3
	note D_, 5
	octave 2
	note B_, 2
	octave 3
	note D_, 4
	octave 2
	note B_, 4
	octave 3
	note C_, 6
	note F_, 6
	note C_, 4
	note D_, 6
	intensity $b7
	note D#, 1
	note E_, 1
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 8
	notetype $8, $a7
	note C_, 4
	octave 2
	note B_, 4
	octave 3
	note C_, 4
	note D_, 9
	octave 2
	note B_, 3
	octave 3
	note D_, 6
	octave 2
	note B_, 6
	octave 3
	note C_, 3
	note D_, 6
	note E_, 3
	note E_, 4
	note E_, 4
	note C_, 4
	notetype $8, $a0
	octave 2
	note B_, 6
	notetype $8, $a7
	note B_, 6
	notetype $8, $a7
	octave 3
	note F_, 4
	note E_, 4
	note C_, 4
	notetype $8, $a0
	note D_, 6
	notetype $8, $a7
	note D_, 6
	notetype $8, $a7
	note __, 3
	octave 2
	note B_, 3
	octave 3
	note C_, 3
	note D_, 3
	note D_, 9
	octave 2
	note B_, 3
	octave 3
	note D_, 6
	octave 2
	note B_, 6
	octave 3
	note C_, 9
	note F_, 9
	note C_, 6
	note D_, 9
	notetype $c, $b7
	note D#, 1
	note E_, 1
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 8
	notetype $8, $a7
	note C_, 4
	octave 2
	note B_, 4
	octave 3
	note C_, 4
	note D_, 9
	octave 2
	note B_, 3
	octave 3
	note D_, 9
	notetype $8, $b7
	note G_, 3
	note A_, 4
	note G_, 4
	note F_, 4
	note F_, 6
	note E_, 6
	note D_, 9
	note F_, 3
	note G_, 3
	note D_, 6
	note G_, 3
	notetype $8, $54
	octave 2
	note G_, 3
	note B_, 3
	notetype $8, $94
	octave 3
	note D_, 3
	note G_, 3
	tempo 136
	notetype $8, $b4
	note F_, 3
	note A_, 3
	notetype $8, $d4
	octave 4
	note C_, 3
	note F_, 3
	tempo 138
	notetype $8, $b4
	note D_, 9
	note C_, 9
	octave 3
	note A#, 6
	notetype $c, $b7
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note F_, 4
	octave 4
	note D_, 4
	note F_, 4
	note E_, 6
	octave 3
	note G_, 2
	notetype $8, $b7
	note A_, 4
	note G_, 4
	note F_, 4
	note G_, 12
	octave 4
	note C_, 6
	tempo 136
	note C#, 6
	tempo 134
	callchannel Music_TitleScreen_branch_eb92c
	octave 4
	note C_, 4
	note C_, 4
	note C#, 4
	callchannel Music_TitleScreen_branch_eb92c
	octave 4
	note C_, 4
	note C_, 4
	note C#, 4
	callchannel Music_TitleScreen_branch_eb92c
	octave 3
	note E_, 4
	note E_, 4
	note C_, 4
	notetype $c, $a0
	note D_, 6
	notetype $c, $a7
	note D_, 10
	intensity $a0
	note C_, 8
	intensity $a7
	note C_, 8
	intensity $a0
	octave 2
	note B_, 8
	intensity $a7
	note B_, 8
	octave 3
	note C_, 8
	octave 2
	note B_, 8
	octave 3
	note D_, 8
	octave 2
	note B_, 8
	octave 3
	note C_, 8
	note F_, 8
	note A_, 8
	note G_, 6
	note G_, 1
	note F#, 1
	note F_, 8
	note E_, 8
	intensity $a0
	note D_, 16
	intensity $a7
	note D_, 16
	intensity $a3
	octave 2
	note G_, 1
	note __, 3
	note G_, 1
	note __, 5
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	notetype $8, $b2
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note F#, 2
	notetype $c, $b7
	note G_, 1
	note __, 3
	octave 1
	note G_, 1
	note __, 11
	endchannel
; eb92c

Music_TitleScreen_branch_eb92c: ; eb92c
	notetype $c, $c3
	note D_, 1
Music_TitleScreen_branch_eb930: ; eb930
	note __, 1
	octave 2
	note D_, 1
	octave 1
	note A_, 1
	octave 2
	note D_, 1
	loopchannel 5, Music_TitleScreen_branch_eb930
	note __, 1
	note D_, 1
	octave 1
	note A_, 1
	notetype $8, $b7
	endchannel
; eb943

Music_TitleScreen_Ch2: ; eb943
	dutycycle $3
	vibrato $14, $12
	notetype $c, $c7
	octave 3
	note G_, 6
	note D_, 2
	note D_, 4
	note G_, 4
	intensity $b0
	note F_, 8
	intensity $b7
	note F_, 8
	intensity $c7
	note G_, 6
	note D_, 2
	note D_, 4
	note G_, 4
	intensity $b0
	note G#, 4
	intensity $b7
	note G#, 4
	intensity $b0
	octave 4
	note C_, 4
	intensity $b7
	note C_, 4
	intensity $c2
	octave 3
	note B_, 1
	note __, 2
	note A_, 1
	intensity $b0
	note G_, 6
	intensity $b7
	note G_, 6
	note __, 16
	note __, 16
	intensity $c7
	octave 4
	note C_, 1
	note __, 2
	note D_, 1
	note E_, 8
	note F#, 2
	note E_, 1
	note F#, 1
	octave 3
	note G_, 6
	note B_, 2
	octave 4
	note D_, 8
	stereopanning $f0
	intensity $97
	octave 2
	note A_, 4
	note F_, 4
	stereopanning $ff
	intensity $c7
	octave 4
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 8
	stereopanning $f0
	intensity $97
	octave 2
	note A_, 6
	octave 3
	note C_, 2
	stereopanning $f
	intensity $a3
	octave 4
	note D_, 4
	note D_, 2
	note C_, 4
	note C_, 2
	octave 3
	note B_, 4
	stereopanning $ff
	intensity $c7
	octave 3
	note G_, 6
	note B_, 2
	octave 4
	note D_, 8
	stereopanning $f0
	intensity $97
	octave 2
	note A_, 2
	note F_, 4
	note A_, 2
	stereopanning $ff
	notetype $8, $c7
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note C_, 4
	note D_, 12
	stereopanning $f0
	notetype $8, $b7
	octave 2
	note A_, 9
	stereopanning $f
	notetype $c, $c7
	note G_, 1
	note A_, 1
	note B_, 6
	note E_, 1
	note F#, 1
	note G_, 4
	notetype $c, $4b
	note A_, 4
	stereopanning $ff
	notetype $c, $c7
	octave 3
	note G_, 6
	note B_, 2
	octave 4
	note D_, 8
	stereopanning $f0
	intensity $97
	octave 2
	note A_, 2
	note F_, 6
	stereopanning $ff
	intensity $c7
	octave 4
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 8
	stereopanning $f0
	intensity $97
	octave 3
	note C_, 2
	octave 2
	note A_, 6
	note B_, 6
	note G_, 2
	notetype $8, $c7
	note F_, 4
	note G_, 4
	note F_, 4
	stereopanning $ff
	octave 3
	note G_, 9
	note B_, 3
	octave 4
	note D_, 12
	stereopanning $f0
	notetype $8, $a7
	octave 3
	note D_, 4
	note C_, 4
	note D_, 4
	stereopanning $ff
	notetype $8, $c7
	octave 4
	note F_, 4
	note E_, 4
	note F_, 4
	note G_, 9
	note A#, 3
	notetype $c, $b0
	note G_, 8
	notetype $c, $b7
	note G_, 8
	intensity $c6
	note A_, 4
	intensity $5d
	note A_, 4
	intensity $c7
	note A#, 6
	intensity $c3
	note F_, 2
	intensity $c7
	note F_, 8
	intensity $a7
	octave 3
	note A#, 8
	intensity $c7
	octave 4
	note A#, 4
	note B_, 4
	octave 5
	note C_, 6
	intensity $c3
	octave 4
	note G_, 2
	intensity $c7
	note G_, 8
	intensity $a7
	octave 3
	note E_, 8
	intensity $c7
	octave 5
	note C_, 4
	note C#, 4
	tone $0001
	stereopanning $f
	callchannel Music_TitleScreen_branch_ebabb
	note C#, 4
	callchannel Music_TitleScreen_branch_ebabb
	note C#, 4
	callchannel Music_TitleScreen_branch_ebabb
	octave 4
	note A_, 4
	stereopanning $ff
	tone $0000
	notetype $c, $b0
	octave 3
	note B_, 6
	notetype $c, $b7
	note B_, 10
	intensity $c7
	note A_, 8
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 8
	note G_, 8
	note F_, 8
	note A_, 8
	intensity $b0
	note G_, 8
	intensity $b7
	note G_, 8
	intensity $c7
	note F_, 8
	octave 4
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 8
	octave 2
	note B_, 8
	octave 3
	note C_, 8
	note A_, 6
	note F_, 1
	note A_, 1
	intensity $b0
	note G_, 16
	intensity $b7
	note G_, 16
	intensity $c2
	octave 4
	note G_, 1
	note __, 3
	note G_, 1
	note __, 5
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	intensity $90
	note G_, 4
	notetype $8, $c2
	octave 3
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F#, 2
	notetype $c, $c7
	note G_, 1
	note __, 3
	octave 2
	note G_, 1
	note __, 11
	endchannel
; ebabb

Music_TitleScreen_branch_ebabb: ; ebabb
	notetype $c, $b2
	note D_, 1
Music_TitleScreen_branch_ebabf: ; ebabf
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	note A_, 1
	note D_, 1
	loopchannel 5, Music_TitleScreen_branch_ebabf
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	note A_, 1
	notetype $8, $b7
	octave 5
	note C_, 4
	note C_, 4
	endchannel
; ebad5

Music_TitleScreen_Ch3: ; ebad5
	stereopanning $f
	vibrato $10, $14
	tone $0001
	notetype $c, $16
	octave 3
	note B_, 6
	note D_, 2
	note G_, 4
	note D_, 4
	note F_, 2
	note C_, 2
	note F_, 2
	note A_, 4
	note G_, 4
	note F_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note B_, 4
	note A_, 4
	note G_, 2
	note G#, 2
	note D#, 2
	note G#, 2
	octave 4
	note C_, 2
	note C_, 2
	octave 3
	note A#, 4
	note G#, 2
	octave 2
	note G_, 2
	note D_, 1
	note C#, 1
	note D_, 1
	note __, 1
	note G_, 2
	note D_, 1
	note __, 1
	note D_, 2
	note G_, 2
	note D_, 2
	note F_, 2
	note C_, 1
	octave 1
	note B_, 1
	octave 2
	note C_, 1
	note __, 1
	note F_, 2
	note C_, 1
	note __, 1
	note C_, 2
	note F_, 2
	note C_, 2
	note G_, 2
	note D_, 1
	note C#, 1
	note D_, 1
	note __, 1
	note G_, 2
	note D_, 1
	note __, 1
	note D_, 2
	note G_, 2
	note D_, 2
	note A_, 2
	note F_, 1
	note E_, 1
	note F_, 1
	note __, 1
	note A_, 2
	note F_, 2
	note A_, 4
	octave 3
	note C_, 2
	octave 2
	note G_, 4
	note D_, 2
	note G_, 4
	note D_, 2
	note G_, 2
	note D_, 2
	note A_, 4
	note F_, 2
	note A_, 4
	note F_, 2
	note A_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 4
	note G_, 2
	note B_, 4
	note G_, 2
	note B_, 2
	note G_, 2
	note G_, 4
	note B_, 2
	note A_, 4
	note B_, 2
	octave 3
	note C_, 4
	octave 2
	note G_, 4
	note D_, 2
	note G_, 4
	note D_, 2
	note G_, 2
	note D_, 2
	note A_, 4
	note F_, 2
	note A_, 4
	note F_, 2
	note A_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 4
	note G_, 2
	note B_, 4
	note G_, 2
	note B_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 4
	note G_, 2
	note B_, 4
	note G_, 2
	octave 3
	note D_, 4
	octave 2
	note G_, 4
	note D_, 2
	note G_, 4
	note D_, 2
	note G_, 2
	note D_, 2
	note A_, 4
	note F_, 2
	note A_, 4
	note F_, 2
	note A_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 4
	note G_, 2
	note B_, 4
	note G_, 2
	note B_, 2
	note G_, 2
	octave 3
	note D_, 4
	octave 2
	note G_, 2
	octave 3
	note D_, 4
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note A_, 2
	note G_, 4
	note D_, 2
	note G_, 4
	note D_, 2
	note G_, 2
	note D_, 2
	note A_, 4
	note F_, 2
	note A_, 4
	note F_, 2
	note A_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 4
	note G_, 2
	note B_, 4
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note A_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	octave 3
	note C_, 2
	note D_, 6
	octave 2
	note A#, 6
	octave 3
	note F_, 4
	note A#, 6
	note F_, 6
	note D_, 4
	note E_, 6
	note C_, 6
	note E_, 4
	octave 4
	note C_, 6
	octave 3
	note G_, 6
	note E_, 4
	note D_, 1
	note __, 1
	stereopanning $ff
	notetype $c, $16
	tone $0000
	octave 4
	note A_, 2
	octave 5
	note D_, 2
	note A_, 6
	note G_, 2
	note F#, 2
	note D_, 1
	note __, 2
	note E_, 1
	note F#, 4
	notetype $8, $16
	octave 3
	note C_, 4
	note C_, 4
	note C#, 4
	notetype $c, $16
	note D_, 1
	note __, 1
	octave 4
	note A_, 2
	octave 5
	note D_, 2
	note A_, 6
	note G_, 2
	note F#, 2
	note B_, 1
	note __, 2
	note A_, 1
	note A_, 4
	notetype $8, $16
	octave 3
	note C_, 4
	note C_, 4
	note C#, 4
	notetype $c, $16
	note D_, 1
	note __, 1
	notetype $c, $16
	octave 4
	note A_, 2
	octave 5
	note D_, 2
	note G_, 6
	note E_, 2
	note G_, 2
	note F#, 1
	note E_, 1
	note D_, 6
	tone $0001
	notetype $8, $16
	octave 3
	note C_, 4
	note C_, 4
	note E_, 2
	note F#, 2
	stereopanning $f
	notetype $c, $16
	note G_, 16
	note F_, 16
	note G_, 8
	note D_, 6
	note D_, 1
	note E_, 1
	note F_, 2
	note F_, 12
	note E_, 1
	note D#, 1
	note D_, 8
	note G_, 8
	note F_, 8
	note A_, 8
	note G_, 8
	note D_, 6
	note D_, 1
	note E_, 1
	note F_, 16
	note G_, 1
	note __, 3
	note G_, 1
	note __, 5
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	note G_, 1
	note __, 5
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 3
	octave 2
	note G_, 1
	note __, 3
	note G_, 1
	note __, 5
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	notetype $8, $16
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note A_, 2
	notetype $c, $16
	note G_, 1
	note __, 3
	octave 1
	note G_, 1
	note __, 11
	endchannel
; ebc47

Music_TitleScreen_Ch4: ; ebc47
	togglenoise $5
	stereopanning $f0
	notetype $c
	note __, 16
	note __, 16
	note __, 16
	note __, 8
	note C_, 2
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 6
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 3
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 4
	note D#, 2
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 2
	notetype $6
	note D_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C_, 1
	note C_, 1
	notetype $c
	callchannel Music_TitleScreen_branch_ebd6b
	callchannel Music_TitleScreen_branch_ebd75
	callchannel Music_TitleScreen_branch_ebd75
	note C_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note D#, 2
	note C_, 1
	note C_, 1
	note C_, 2
	notetype $6
	note C#, 1
	note C#, 1
	note C_, 1
	note C_, 1
	notetype $c
	callchannel Music_TitleScreen_branch_ebd6b
	note C_, 2
	note D#, 2
	note C_, 2
	note F_, 2
	note D#, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 2
	callchannel Music_TitleScreen_branch_ebd75
	note C_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note D#, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	callchannel Music_TitleScreen_branch_ebd6b
	callchannel Music_TitleScreen_branch_ebd75
	callchannel Music_TitleScreen_branch_ebd75
	note C_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note D#, 2
	note C_, 1
	note C_, 1
	note C_, 2
	notetype $6
	note C#, 1
	note D_, 1
	note D_, 1
	note C#, 1
	notetype $c
	callchannel Music_TitleScreen_branch_ebd6b
	callchannel Music_TitleScreen_branch_ebd75
	note C_, 2
	note D#, 2
	note C_, 2
	note F_, 2
	note D#, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note D#, 2
	note C_, 1
	note C_, 1
	note C_, 2
	notetype $6
	note D_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	notetype $c
	note A_, 2
	note D#, 4
	note A_, 4
	note D#, 2
	note A_, 4
	note A_, 2
	note D#, 4
	note A_, 4
	note D#, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note D#, 4
	note A_, 4
	note D#, 2
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 2
	note D_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	note C_, 1
	note C_, 1
	callchannel Music_TitleScreen_branch_ebd7f
	callchannel Music_TitleScreen_branch_ebd87
	note C#, 1
	note D_, 1
	note D_, 1
	note C#, 1
	notetype $c
	callchannel Music_TitleScreen_branch_ebd7f
	callchannel Music_TitleScreen_branch_ebd87
	note D_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	notetype $c
	callchannel Music_TitleScreen_branch_ebd7f
	callchannel Music_TitleScreen_branch_ebd87
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	notetype $c
	note G#, 16
Music_TitleScreen_branch_ebd34: ; ebd34
	note __, 16
	loopchannel 6, Music_TitleScreen_branch_ebd34
	note __, 12
	notetype $6
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	note C_, 1
	notetype $c
	note C_, 4
	note C_, 6
	note C_, 1
	note C_, 1
	note C_, 4
	note C_, 4
	note C_, 6
	note C_, 1
	note C_, 1
	note C_, 4
	note C_, 4
	note C_, 6
	note C_, 1
	note C_, 1
	note C_, 4
	note C_, 4
	note C_, 4
	notetype $8
	note C_, 2
	note C_, 2
	note C_, 2
	notetype $6
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	note C_, 1
	note C_, 1
	notetype $c
	note C_, 4
	note B_, 4
	endchannel
; ebd6b

Music_TitleScreen_branch_ebd6b: ; ebd6b
	note C_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note F_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note D#, 2
	endchannel
; ebd75

Music_TitleScreen_branch_ebd75: ; ebd75
	note C_, 2
	note D#, 2
	note C_, 2
	note F_, 2
	note D#, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note D#, 2
	endchannel
; ebd7f

Music_TitleScreen_branch_ebd7f: ; ebd7f
	note C_, 2
	note C_, 1
	note C_, 1
	loopchannel 4, Music_TitleScreen_branch_ebd7f
	endchannel
; ebd87

Music_TitleScreen_branch_ebd87: ; ebd87
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	notetype $8
	note C_, 4
	note C_, 4
	endchannel
; ebd92

