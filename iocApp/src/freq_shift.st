program freq_shift

double setFreq;
double setTarget;
char   getStatus;
char   smallChange;

assign setFreq   to "BO-RF-SGN1:setFrequency";
assign setTarget to "BO-RF-SGN1:setFreqShiftTarget";
assign getStatus to "BO-RF-SGN1:getFreqShiftStatus";

monitor setFreq;
monitor setTarget;

%{
  // feq returns 0 in case a != b and nonzero in case a = b
  int feq(double a, double b)
  {
    const double epsilon = 0.0000005;
    return a > b - epsilon && a < b + epsilon;
  }
}%

ss FrequencyShifter
{
  state init
  {
    when() {} state checkTarget
  }

  state checkTarget
  {
    entry
    {
      if (feq(setTarget, setFreq))
      {
        getStatus = 0;
        pvPut(getStatus);
      }
    }

    when () {} state loop
  }

  state loop
  {
    when (!feq(setFreq, setTarget))
    {
      smallChange = 0;

      // move setFreq closer to setTarget
      if (setTarget >= setFreq + 0.01)
      {
        setFreq = setFreq + 0.01;
      }
      else if (setTarget <= setFreq - 0.01)
      {
        setFreq = setFreq - 0.01;
      }
      else
      {
        setFreq = setTarget;
        if (!getStatus)
        {
          smallChange = 1;
        }
      }

      getStatus = 1;
      pvPut(getStatus);
      pvPut(setFreq);
    } state waitStablization
  }

  state waitStablization
  {
    when (delay(8.0))
    {

    } state checkTarget

    when (smallChange)
    {

    } state checkTarget
  }
}
