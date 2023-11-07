;Coordinates Explorer
;Adrián García Riber
;2023
<Cabbage>
form caption("STELIB Explorer") size(880, 567), colour(255, 255, 255), pluginID("STELIB Explorer")



image bounds(56, 12, 799, 303), channel("bkgrnd"), corners(10) alpha(0.05)


image bounds(-2, -8, 902, 326) identchannel("Image") corners(10) file("VAE_result.png") 
image bounds(426, 336, 434, 204) identchannel("Star") corners(10) file("Star.png")
image bounds(-2, 300, 466, 267) identchannel("Sky") corners(10) file("Sky.png") 

vslider bounds(12, 12, 30, 113), channel("level"), text("Level"), range(0, 1, 0.5, 1, 0.001) trackercolour(0, 124, 207, 255) colour(204, 204, 204, 255)
hslider bounds(738, 532, 122, 29) channel("Send"), text("REV"), range(0, 2, 0.2, 1, 0.001) trackercolour(0, 124, 207, 255) colour(204, 204, 204, 255)
hslider bounds(482, 534, 122, 29) channel("Send2"), text("DLY"), range(0, 2, 0.5, 1, 0.001) trackercolour(0, 124, 204, 255) colour(204, 204, 204, 255)


vslider bounds(12, 130, 30, 113) channel("LpFrec"), text("LPF"), range(20, 20000, 20000, 0.5, 1) trackercolour(0, 124, 207, 255) textboxoutlinecolour(0, 0, 0, 0) colour(204, 204, 204, 255)
vslider bounds(12, 254, 30, 113) channel("HpFrec"), text("HPF")range(20, 20000, 20, 0.5, 1) trackercolour(0, 124, 207, 255) colour(204, 204, 204, 255) 




</Cabbage>
<CsoundSynthesizer>
<CsOptions>
;-n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5
-odac
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
sr = 48000
ksmps =32
nchnls = 2
0dbfs = 1


gks init 0
gkplay init 0
gifrec init 0

gkf0 init 0
gkf1 init 0
gkf2 init 0
gkf3 init 0
gkf4 init 0
gkf5 init 0
gkra init 0
gkdec init 0


instr 1 ; 3D Binaural Sonification: Additive Synthesizer

gkFader chnget "level"
kSend chnget "Send"
kSend2 chnget "Send2"
gkFeedback chnget "Feed"

giosc9 OSCinit 9999 
giosc8 OSCinit 9998 
giosc7 OSCinit 9997 
giosc6 OSCinit 9996 
giosc5 OSCinit 9995 
giosc4 OSCinit 9994 
giosc3 OSCinit 9993
giosc2 OSCinit 9992
giosc1 OSCinit 9991 
giosc0 OSCinit 9990 
giosc_s OSCinit 9989

;Loading HRTF
gS_HRTF_left   =           "hrtf-48000-left.dat"
gS_HRTF_right  =           "hrtf-48000-right.dat"

;Listening OSC
kans0 OSClisten giosc0, "/lat0", "f", gkf0
printk2 gkf0
kans1 OSClisten giosc1, "/lat1", "f", gkf1
printk2 gkf1
kans2 OSClisten giosc2, "/lat2", "f", gkf2
printk2 gkf2
kans3 OSClisten giosc3, "/lat3", "f", gkf3
printk2 gkf3
kans4 OSClisten giosc4, "/lat4", "f", gkf4
printk2 gkf4
kans5 OSClisten giosc5, "/lat5", "f", gkf5
printk2 gkf5
kans6 OSClisten giosc6, "/ra", "f", gkra
printk2 gkra
kans7 OSClisten giosc7, "/dec", "f", gkdec
printk2 gkdec

;Additive Synthesis (Six oscillators)
kAmp = 0.5

a0  oscil kAmp/4, gkf0, -1, 0
if gkf0<0 then
    a0 = -a0
endif
a1  oscil kAmp/4, gkf1, -1, 0
if gkf1<0 then
    a1 = -a1
endif
a2  oscil kAmp/4, gkf2, -1, 0
if gkf2<0 then
    a2 = -a2
endif
a3	oscil kAmp/4, gkf3, -1, 0
if gkf3<0 then
    a3 = -a3
endif
a4	oscil kAmp/4, gkf4, -1, 0
if gkf4<0 then
    a4 = -a4
endif
a5	oscil kAmp/4, gkf5, -1, 0
if gkf5<0 then
    a5 = -a5
endif


gkLpFrec chnget "LpFrec"
gkHpFrec chnget "HpFrec"

;Mono output
aOut = a0+a1+a2+a3+a4+a5

;Amplitude envelope (softening transitions), delay (aesthetics), filtering, phaser (aesthetics), and flanger (aesthetics)
adel linseg 0, .5, 0.2, .5, 0	;max delay time =20ms	

aDly comb aOut, 30, .5
aDlyFilt moogladder aDly, 700, .1
aDlyFX phaser1 aDly, 10, 1, .5
aflg flanger aDlyFX, adel, .5, 10

aHp butterhp aOut-aflg/8*kSend2, gkHpFrec
aFilt moogladder aHp, gkLpFrec, 0.1

;Reverb sends
gasendL= aFilt*kSend	
gasendR= aFilt*kSend
gasend2L= aFilt*kSend2	
gasend2R= aFilt*kSend2	

;Binaural parameters: [aleft, aright] hrtfmove2 [asrc, kAz, kElev, ifilel, ifiler]

aLeft, aRight  hrtfmove2   (aFilt)*gkFader, gkra, gkdec, gS_HRTF_left, gS_HRTF_right
               outs        aRight, aLeft                 ; ---------------------------binaural outputs


;outs aFilt*gkFader, aFilt*gkFader;aFilt*kEnv*gkFader, aFilt*kEnv*gkFader ;-----------stereo outputs
;fout "2Layers_Autoencoder2Chords.wav", 12, (aOut) ;write to soundfile

endin


instr 2 ; Graphical representation

kans_graph OSClisten giosc_s, "/s", "f", gks ;Control signal


if gks!=0 then
	
	Scurve sprintfk "file(%s)", "VAE_result.png"
    chnset Scurve, "Image"
    giImage imageload "VAE_result.png"
    
    Splot sprintfk "file(%s)", "Star.png"
    chnset Splot, "Star"
    giPlot imageload "Star.png"
    
    Splot2 sprintfk "file(%s)", "Sky.png"
    chnset Splot2, "Sky"
    giPlot2 imageload "Sky.png"



elseif gks==0 then
    Scurve sprintfk "file(%s)", "Init2.png"
	chnset Scurve, "Image"	
	imagefree giImage
	
	Splot sprintfk "file(%s)", "Init.png"
	chnset Splot, "Star"	
	imagefree giPlot
	
	Splot2 sprintfk "file(%s)", "Init3.png"
	chnset Splot2, "Sky"	
	imagefree giPlot2
				
endif

endin


instr 6; Reverb

gaRevLf, gaRevRf		reverbsc	gasendL,gasendR,0.85,10000
gaRevLr, gaRevRr		reverbsc	gasendL,gasendR,0.85,10000
		
		out	gaRevLf*gkFader,gaRevRf*gkFader
		clear		gasendL, gasendR

endin





</CsInstruments>
<CsScore>
f 1 0 1024 10 1

i 1 0 3600*24*7
i 2 0 3600*24*7
i 6 0 3600*24*7

e

</CsScore>
</CsoundSynthesizer>
