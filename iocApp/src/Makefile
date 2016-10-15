TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = ioc
# ioc.dbd will be created and installed
DBD += ioc.dbd

# ioc.dbd will be made up from these files:
ioc_DBD += base.dbd
ioc_DBD += evg.dbd
ioc_DBD += evr.dbd
ioc_DBD += power_seq.dbd
# ioc_DBD += safe_polarity_switcher.dbd
ioc_DBD += extkic.dbd
ioc_DBD += waterflowMonitor.dbd
ioc_DBD += freq_shift.dbd

# ioc_DBD += BO_safe_polarity_switcher.dbd
ioc_DBD += TL1_safe_polarity_switcher.dbd

# Add all the support libraries needed by this IOC
ioc_LIBS += evg
ioc_LIBS += evr
ioc_LIBS += seq pv

# ioc_registerRecordDeviceDriver.cpp derives from ioc.dbd
ioc_SRCS += ioc_registerRecordDeviceDriver.cpp
ioc_SRCS += power_seq.st
# ioc_SRCS += safe_polarity_switcher.st
ioc_SRCS += extkic.st
ioc_SRCS += waterflowMonitor.st
ioc_SRCS += freq_shift.st

# ioc_SRCS += BO_safe_polarity_switcher.st
ioc_SRCS += TL1_safe_polarity_switcher.st

# Build the main IOC entry point on workstation OSs.
ioc_SRCS_DEFAULT += iocMain.cpp
ioc_SRCS_vxWorks += -nil-

ioc_seq_SNCFLAGS 			+= +r
TL1_safe_polarity_switcher_SNCFLAGS         += +r
extkic_SNCFLAGS                         += +r
waterflowMonitor_SNCFLAGS               += +r
freq_shift_SNCFLAGS 			+= +r

# Add support from base/src/vxWorks if needed
#ioc_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
ioc_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

