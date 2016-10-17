#!./bin/linux-x86/ioc

dbLoadDatabase "dbd/ioc.dbd"
ioc_registerRecordDeviceDriver pdbbase

dbLoadRecords "db/mrf-vmeevg230.db"
dbLoadRecords "db/mrf-vmeevg230-sequencer.db"
dbLoadRecords "db/mrf-vmeevg230-event.db"
dbLoadRecords "db/mrf-vmeevg230-counter.db"
dbLoadRecords "db/mrf-vmeevr230.db"
dbLoadRecords "db/mrf-vmeevr230-event.db"
dbLoadRecords "db/mrf-vmeevr230-pulser.db"
dbLoadRecords "db/mrf-vmeevr230-pdp.db"
dbLoadRecords "db/mrf-vmeevr230-prescaler.db"
dbLoadRecords "db/mrf-vmeevr230-ttl.db"
dbLoadRecords "db/mrf-vmeevr230-univ.db"
dbLoadRecords "db/mrf-vmeevr230-cml.db"

# 
# Configuration parameters:
# 	1. Card name, must be identical to that used in the substitution files.
# 	2. IP address of the card (or the URL is DNS is used).
# 	3. UDP port used on the card, default is 2000.
# 	4. Event frequency in MHz (500MHz/4=125MHz at SESAME).
#
evgConfigure "EVG0" "gbl-ti-evg" "2000" "125"
evrConfigure "EVR0" "gbl-ti-evr1" "2000" "125"
evrConfigure "EVR1" "gbl-ti-evr2" "2000" "125"

iocInit
