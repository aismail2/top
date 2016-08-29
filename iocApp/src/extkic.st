program extkic

//	Constants
int	DISABLE		=	0;
int	ENABLE		=	1;
int	COUNTDOWN	=	1200;	//Countdown in seconds

// Getters
int		enableSequence;
assign	enableSequence			to	"BO-PS-EXK:enableSequence";
monitor enableSequence;

int		isInterlock;
assign	isInterlock				to	"BO-PS-EXK:isInterlock";
monitor isInterlock;

int		getSequenceCountdown;
assign	getSequenceCountdown	to	"BO-PS-EXK:getSequenceCountdown";
monitor	getSequenceCountdown;

// Setters
int		isSequenceReady;
assign	isSequenceReady			to	"BO-PS-EXK:isSequenceReady";

int		enablePowerSupply;
assign	enablePowerSupply		to	"BO-PS-EXK:enable";	

int		enableHeater;
assign	enableHeater			to	"BO-PS-EXK:enableHeater";

int		disableHeater;
assign	disableHeater			to	"BO-PS-EXK:disableHeater";

ss extkic
{
	state STATE_INIT
	{
		when ()
		{
			disableHeater		=	ENABLE;
			pvPut(disableHeater, SYNC);
			enablePowerSupply	=	DISABLE;
			pvPut(enablePowerSupply, SYNC);
			isSequenceReady		=	FALSE;
			pvPut(isSequenceReady, SYNC);
		} state STATE_OFF
	}

	state STATE_OFF
	{
		when (enableSequence == ENABLE)
		{
			enableHeater			=	ENABLE;
			pvPut(enableHeater, SYNC);
			getSequenceCountdown	=	COUNTDOWN;
			pvPut(getSequenceCountdown, SYNC);
		} state STATE_HEAT

		when (isInterlock == TRUE)
		{
			disableHeater	=	ENABLE;
			pvPut(disableHeater, SYNC);
		} state STATE_INTERLOCK
	}

	state STATE_HEAT
	{
		when (enableSequence == DISABLE)
		{
			disableHeater	=	ENABLE;
			pvPut(disableHeater, SYNC);
		} state STATE_OFF

		when (isInterlock == TRUE)
		{
			disableHeater	=	ENABLE;
			pvPut(disableHeater, SYNC);
		} state STATE_INTERLOCK

		when (delay(1.0))
		{
			getSequenceCountdown--;
			pvPut(getSequenceCountdown, SYNC);
		} state STATE_HEAT

		when (getSequenceCountdown == 0)
		{
			enablePowerSupply	=	ENABLE;
			pvPut(enablePowerSupply, SYNC);
			isSequenceReady		=	TRUE;
			pvPut(isSequenceReady, SYNC);
		} state STATE_ON
	}

	state STATE_ON
	{
		when (enableSequence == DISABLE)
		{
			disableHeater		=	ENABLE;
			pvPut(disableHeater, SYNC);
			enablePowerSupply	=	DISABLE;
			pvPut(enablePowerSupply, SYNC);
			isSequenceReady		=	FALSE;
			pvPut(isSequenceReady, SYNC);
		} state STATE_OFF

		when (isInterlock == TRUE)
		{
			disableHeater	=	ENABLE;
			pvPut(disableHeater, SYNC);
			isSequenceReady	=	FALSE;
			pvPut(isSequenceReady, SYNC);
		} state STATE_INTERLOCK
	}

	state STATE_INTERLOCK
	{
		when (isInterlock == FALSE)
		{
		} state STATE_OFF
	}
}
