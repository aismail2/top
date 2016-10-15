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
dbLoadRecords "db/power_seq.db"
dbLoadRecords("db/power-seq-extkic.db")

evgConfigure "EVG0" "gbl-ti-evg" "2000" "125"
evrConfigure "EVR0" "gbl-ti-evr1" "2000" "125"
evrConfigure "EVR1" "gbl-ti-evr2" "2000" "125"

asSetFilename("/home/control/epics/support/access/common.acf")

iocInit

seq TL1_safe_polarity_switcher, "SYSTEM=MI-PS-TC4-INV"
seq TL1_safe_polarity_switcher, "SYSTEM=TL1-PS-CR1-X-INV"
seq extkic
seq waterflowMonitor
seq power_seq
seq freq_shift
