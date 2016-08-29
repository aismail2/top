program safe_polarity_switcher

char getPolarity;
char setPolarity;
char setPolarityImpl;
char isEnabled;
char enable;
char disable;

assign getPolarity to "BO{CELL}-PS-{DEVICE}-INV:getPolarity";
assign setPolarity to "BO{CELL}-PS-{DEVICE}-INV:setPolarity";
assign setPolarityImpl to "BO{CELL}-PS-{DEVICE}-INV:setPolarityReal";
assign isEnabled to "BO{CELL}-PS-{DEVICE}:isEnabled";
assign enable to "BO{CELL}-PS-{DEVICE}:enable";
assign disable to "BO{CELL}-PS-{DEVICE}:disable";

monitor getPolarity;
monitor setPolarity;
monitor isEnabled;

// getPolarity values:
//   0: invalid
//   1: forward
//   2: reverse
//   3: invalid

// setPolarity values:
//   0: forward
//   1: reverse

%{
  char needPolarityChange(char getPolarity, char setPolarity)
  {
    return (
      getPolarity == 1 /*forward*/ && setPolarity == 1 /*reverse*/ ||
      getPolarity == 2 /*reverse*/ && setPolarity == 0 /*forward*/
    );
  }

  char polaritySwitched(char getPolarity, char setPolarityImpl)
  {
    return (
      getPolarity == 1 /*forward*/ && setPolarityImpl == 0 /*forward*/ ||
      getPolarity == 2 /*reverse*/ && setPolarityImpl == 1 /*reverse*/
    );
  }
}%

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
      disable = 1;
      pvPut(disable);
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
