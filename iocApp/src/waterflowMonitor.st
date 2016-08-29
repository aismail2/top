program waterflowMonitor

int		STATUS_OFF		=	0;
int		STATUS_RAMPUP	=	1;
int		STATUS_READY	=	2;
int		STATUS_RAMPDOWN	=	4;

int 	getInterlock;
assign 	getInterlock 		to 	"MI-CO:isWaterFlowInterlocked";
monitor getInterlock;

int	getRampStatus;
assign	getRampStatus 		to 	"MI-PS-MM:getRampStatus";
monitor	getRampStatus;

int	setOnOff;
assign	setOnOff		to	"MI-PS-MM:enable";

int	setTimeoutStatus;
assign	setTimeoutStatus	to	"MI-PS-MM:setTimeoutStatus";

int	disableSequencer;
assign	disableSequencer 	to	"MI-PS-MM:setSequenceState.DISA";

int	triggerSequencer;
assign	triggerSequencer 	to	"MI-PS-MM:triggerSequence";


ss waterflowMonitor
{
	state STATE_INIT
	{
		when ()
		{

		} state STATE_IDLE
	}

	state STATE_IDLE
	{
		when (getInterlock == 0 && getRampStatus == STATUS_OFF)
		{
			disableSequencer = 1;
			pvPut(disableSequencer);
		} state STATE_OFF

		when (getInterlock == 0 && getRampStatus == STATUS_RAMPDOWN)
		{
			disableSequencer = 1;
			pvPut(disableSequencer);
		} state STATE_RAMPDOWN

		when (getInterlock == 0 && getRampStatus == STATUS_READY)
		{
			disableSequencer 	= 	1;
			pvPut(disableSequencer);
			triggerSequencer	=	1;
			pvPut(triggerSequencer);
		} state STATE_READY

		when (getInterlock == 0 && getRampStatus == STATUS_RAMPUP)
		{
			disableSequencer = 1;
			pvPut(disableSequencer);
		} state STATE_RAMPUP
	}

	state STATE_OFF
	{
		when (getInterlock == 1)
		{
			disableSequencer = 0;
			pvPut(disableSequencer);
		} state STATE_IDLE
	}
	state STATE_RAMPDOWN
	{
		when (getRampStatus == STATUS_OFF)
		{
		} state STATE_OFF

		when (delay(360.0))
		{
			disableSequencer = 0;
			pvPut(disableSequencer);
			setOnOff	=  0;
			pvPut(setOnOff);
			setTimeoutStatus=  1;
			pvPut(setTimeoutStatus);
		} state STATE_IDLE
	}
	state STATE_READY
	{
		when (getRampStatus == STATUS_RAMPDOWN)
		{
		} state STATE_RAMPDOWN

		when (delay(30.0))
		{
			disableSequencer= 0;
			pvPut(disableSequencer);
			setOnOff	=  0;
			pvPut(setOnOff);
			setTimeoutStatus=  1;
			pvPut(setTimeoutStatus);
		} state STATE_IDLE
	}
	state STATE_RAMPUP
	{ 
		when (getRampStatus == STATUS_READY) {
			triggerSequencer	=	1;
			pvPut(triggerSequencer);
		} state STATE_READY
	}
}
