program microtron_polarity_switcher

char getPolarity;
char setPolarity;
char setPolarityImpl;
char isEnabled;
char enable;

assign getPolarity to "{DEVICE}-CH{CHANNEL}-INV:getPolarity";
assign setPolarity to "{DEVICE}-CH{CHANNEL}-INV:setPolarity";
assign setPolarityImpl to "{DEVICE}-CH{CHANNEL}-INV:setPolarityReal";
assign isEnabled to "{DEVICE}-CH{CHANNEL}:isEnabled";
assign enable to "{DEVICE}-CH{CHANNEL}:enable";

monitor getPolarity;
monitor setPolarity;
monitor isEnabled;

// getPolarity values:
//   0: invalid
//   1: forward
//   2: reverse
//   3: invalid

ss PolaritySwitcher
{
  state init
  {
    // simply switch polarity if off
    when (needPolarityChange(getPolarity, setPolarity) && !isEnabled)
    {
      setPolarityImpl = setPolarity;
      pvPut(setPolarityImpl);
    } state waitSwitchDone

    // turn off the power, switch polarity, and turn it on again
    when (needPolarityChange(getPolarity, setPolarity) && isEnabled)
    {
      enable = 0;
      pvPut(enable);
    } state switchAndRestartPower
  }

  state switchAndRestartPower
  {
    when (!isEnabled)
    {
      // switch power supply polarity
      setPolarityImpl = setPolarity;
      pvPut(setPolarityImpl);
      // and wait
    } state waitSwitchAndRestart
  }

  state waitSwitchAndRestart
  {
    when (polaritySwitched(getPolarity, setPolarityImpl))
    {
      // restart power supply
      enable = 1;
      pvPut(enable);
    } state init
  }

  state waitSwitchDone
  {
    when (polaritySwitched(getPolarity, setPolarityImpl)) {} state init
  }
}
