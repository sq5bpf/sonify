Sonify - transmit data via ultrasonic morse code

(c) 2020 Jacek Lipkowski SQ5BPF <sq5bpf@lipkowski.org>

Main page here: https://lipkowski.com/sonify

Demo: https://www.youtube.com/watch?v=MfOy_7g7fdI


Sample implementation is in sonify1.sh

Usage:

./sonify1.sh 

If  is  given, then the contents are sent, else "sonify 1 demo" is sent.

This works by generating morse code at 21.5kHz, and playing it through the computer's speakers.
Usually they have very good efficiency in the area between the top of the human hearing range - 
20kHz and 24kHz - the top frequency that a sound card running at 48kHz sample rate can produce. 

The frequency can be varied by changing the FREQUENCY variable in the script.

Note: most animals have a greater hearing range than humans, and also greater sensitivity. 
Please don't use this in presence of animals.

I use DL4YHF Spectrum Lab for reception, the software can be downloaded here: 
https://www.qsl.net/dl4yhf/spectra1.html
This is a windows application, but it will run fine under linux/wine. 
The audio output can be redirected to other programs (for example a morse code
decoder), under linux use pulseaudio (set via pavucontrol), under
windows use VAC (virtual audio cable).

The sq5bpf_sonify1.usr file contains sample Spectrum Lab configuration for
a receiver which will downconvert the 21.5kHz signal to an audiable 650Hz tone.
This is a modification of the SAQrcvr1.usr configuration.

Demo of the software in use:

[![Watch the sonify 1 demo](https://img.youtube.com/vi/MfOy_7g7fdI/hqdefault.jpg)](https://youtu.be/MfOy_7g7fdI )

For other software options search software VLF radio receivers.


