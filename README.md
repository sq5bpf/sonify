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
interfaces. This is not pare of this repository, please see:
https://github.com/sq5bpf/etherify


Sonify:
Send data by morse code at ultrasound. Sample implementation is in sonify1.sh


