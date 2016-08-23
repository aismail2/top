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

evgConfigure "EVG0" "10.2.1.60" "2000" "125"
evrConfigure "EVR0" "10.2.1.61" "2000" "125"
evrConfigure "EVR1" "10.2.1.62" "2000" "125"

asSetFilename("/home/control/epics/support/access/common.acf")

iocInit