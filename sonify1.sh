#!/bin/bash

# Sonify 1 - silly hack to implement sending of morse code in shell
#            this is intended to send morse code on ultrasound frequencies
#              
#
# (c) 2020 Jacek Lipkowski SQ5BPF <sq5bpf@lipkowski.org>
# https://lipkowski.com/sonify
#
# 
#
# This enables one to leak data out via morse code.
# Please tune the audio receiver to 21.5kHz (or whatever you have 
# configured in this script) in CW mode
#
# During tests the signal could be received at a distance of 10m,
# more would probably work, especially with dedicated directional 
# ultrasound microphones.
#
#
# Notice:
# - software decoders are very bad at decoding morse code in the presence
#   of interference, and with imperfect timing. If you want to asess if the
#   signal is decodable, then get someone who can receive by ear
#   (such as an experienced amateur radio operator).
#   Humans are way better at this.
# - run this as a user with privileges to the audio system
# - don't move. moving objects cause a lot of doppler shift at ultrasound 
#   frequencies. while this might not be a problem for a human, it will 
#   fool most (all?) software decoders
# - echo is a problem, both for software decoders (which will fail miserably),
#   and for humans (which will struggle to receive). 

#
# This script is licensed under GPL v3
#
# I disclaim any liability for things that this software does or doesn't do.
# Everything is the responsibility of the user.
#


#sonify1 settings:

#this gives around 18-20wpm
#modify these if you need faster/slower cw
SLEEPDOT=0.05
SLEEPDASH=0.15
SLEEPSPACE=0.12 #a bit longer, because this helps software decoders. should be 0.1

FREQUENCY=21500 #frequency in Hz, change this to 650 to have a nice audiable tone 

declare -A cw=( [0]='-----' [1]='.----' [2]='..---' [3]='...--' [4]='....-' [5]='.....' [6]='-....' [7]='--...' [8]='---..' [9]='----.' [a]='.-' [b]='-...' [c]='-.-.' [d]='-..' [e]='.' [f]='..-.' [g]='--.' [h]='....' [i]='..' [j]='.---' [k]='-.-' [l]='.-..' [m]='--' [n]='-.' [o]='---' [p]='.--.' [q]='--.-' [r]='.-.' [s]='...' [t]='-' [u]='..-' [v]='...-' [w]='.--' [x]='-..-' [y]='-.--' [z]='--..' ['/']='-..-.' ['.']='.-.-.-' ['!']='--..--' ['?']='..--..' ['=']='-...-' [kn]='-.--.' [sk]='...-.-' [ar]='.-.-.' [bk]='-...-.-' )

text2morse() {
	IN="${1,,}"
	OUT=""
	for (( pos=0 ; pos < ${#IN} ; pos++ ))
	do
		ch="${IN:$pos:1}"
		[ "$ch" = " " ] && OUT+="  " && continue
		[ "${cw[$ch]}" ] && OUT+="${cw[$ch]} " || OUT+="${cw['?']} " 
	done
	echo "$OUT"
}


sonify1_gencw() {
	B="$1"
	OUT2=""
	while [ "$B" ]; do
		C="${B:0:1}"
		B="${B:1}"

		case "$C" in
			"-") OUT2+="/tmp/dah.wav " ;;
			".") OUT2+="/tmp/dit.wav " ;;
			" ") OUT2+="/tmp/space.wav " ;;
		esac
		OUT2+="/tmp/sdit.wav "
	done
sox $OUT2 $2
}



TEXT=" sonify 1 demo="
[ "$1" -a -f "$1" ] &&  TEXT=`tr '\n' ' ' < $1 | sed -re 's/  */ /g'`
CWTEXT=`text2morse "$TEXT"`

cat <<EOF
Sonify 1 , sending data via ultrasound morsecode
Please receive at $FREQUENCY Hz
(c) 2020 Jacek Lipkowski SQ5BPF 

Sending: "${TEXT}"
$CWTEXT

EOF

if which play >/dev/null; then

# unmute the speaker, set full volume. watch your ears!
# you might want to comment this out and use alsamixer instead
amixer -q set Master unmute
amixer -q set Master 100%

	sox -r 48000 -b 16 -n /tmp/dit.wav synth $SLEEPDOT sin $FREQUENCY 2>/dev/null
	sox -r 48000 -b 16 -n /tmp/dah.wav synth $SLEEPDASH sin $FREQUENCY 2>/dev/null
	sox -r 48000 -b 16 -n /tmp/sdit.wav trim 0.0 $SLEEPDOT 2>/dev/null
	sox -r 48000 -b 16 -n /tmp/space.wav trim 0.0 $SLEEPSPACE 2>/dev/null
	sonify1_gencw "$CWTEXT" /tmp/sonify1.wav 
	while : ; do
		echo "Sending..."
		play -q /tmp/sonify1.wav 
#		sleep $SLEEPSPACE 
	done

else
	echo "Aborting, there is no sxo installed"

fi
