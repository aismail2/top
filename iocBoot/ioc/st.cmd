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

seq safe_polarity_switcher, "CELL=C01,DEVICE=CR1"
seq safe_polarity_switcher, "CELL=C02,DEVICE=CR1"
seq safe_polarity_switcher, "CELL=C03,DEVICE=CR1"
seq safe_polarity_switcher, "CELL=C04,DEVICE=CR1"
seq safe_polarity_switcher, "CELL=C05,DEVICE=CR1"
seq safe_polarity_switcher, "CELL=C06,DEVICE=CR1"
seq extkic
seq microtron_polarity_switcher, "DEVICE=MI-PS-DC1,CHANNEL=1"
seq microtron_polarity_switcher, "DEVICE=MI-PS-DC1,CHANNEL=2"
seq microtron_polarity_switcher, "DEVICE=MI-PS-DC2,CHANNEL=1"
seq microtron_polarity_switcher, "DEVICE=MI-PS-DC2,CHANNEL=2"
seq waterflowMonitor
seq power_seq
seq freq_shift
