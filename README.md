# soft-tempest-demos

This is supposed to be a collection of simple demos implementing soft tempest.

TEMPEST is a codeword for unintentionally sending data from a system via
some side-channel, such as electromagnetic emissions etc. Please see:

https://en.wikipedia.org/wiki/Tempest_(codename)


Soft TEMPEST is the same, but intentional. This could be realised for exmaple
by putting some malware on the compromised system that exfiltrates data
via some sidechannel usually attributed to TEMPEST. 

Please see this presentation for a very good description of various 
soft tempest topics:
https://i.blackhat.com/us-18/Wed-August-8/us-18-Guri-AirGap.pdf


Unfortunately academic research often uses esoteric equipment, doesn't
document source code etc (this is still better than candlestine security
agency research, which keeps all research secret). So i will try to
publish some very primitive proof of concept code, so that everyone can
experiment with this concept.



Etherify:
Send data by changing the electromagnetic spectrum emanated from ethernet
interfaces. This is not part of this repository, please see:
https://github.com/sq5bpf/etherify


Sonify:
Send data by morse code at ultrasound. Please see:
https://lipkowski.com/sonify

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


[![Watch the sonify 1 demo](https://img.youtube.com/vi/MfOy_7g7fdI /hqdefault.jpg)](https://youtu.be/MfOy_7g7fdI )

