/*  Operation Sequencer
 *  Description: powerups/powerdowns the machine
 *
 *  Controlled devices:
 *    Microtron power
 *    Main magnet
 *    Filament
 *    High voltage
 *    Trim coils
 *    TL1 correctors
 *    TL1 triplets
 *    Booster DC power supplies
 *    Booster pulsed power supplies
 *    Booster correctors
 */

program power_seq

string getPowerSequenceState; assign getPowerSequenceState to "GBL-OP:getState";
string getSequenceStage; assign getSequenceStage to "GBL-OP:getStage";
string setPowerSequenceState; assign setPowerSequenceState to "GBL-OP:setState"; monitor setPowerSequenceState;
char setPowerSequenceReset; assign setPowerSequenceReset to "GBL-OP:reset"; monitor setPowerSequenceReset;

char getMicrotronPower; assign getMicrotronPower to "MI-PS:isRackPowerEnabled"; monitor getMicrotronPower;
char enableMicrotronPower; assign enableMicrotronPower to "MI-PS:enableRackPower";
char disableMicrotronPower; assign disableMicrotronPower to "MI-PS:disableRackPower";

char getMagnetEnabled; assign getMagnetEnabled to "MI-PS-MM:isEnabled"; monitor getMagnetEnabled;
char getMagnetOutputStatus; assign getMagnetOutputStatus to "MI-PS-MM:getShutdownCondition.B3"; monitor getMagnetOutputStatus;
char enableMagnet; assign enableMagnet to "MI-PS-MM:enable";

char getMagnetRampStatus; assign getMagnetRampStatus  to "MI-PS-MM:getRampStatus"; monitor getMagnetRampStatus;
string setMagnetSequence; assign setMagnetSequence  to "MI-PS-MM:setSequence";
string setMagnetSequenceState; assign setMagnetSequenceState to "MI-PS-MM:setSequenceState";
char setMagnetTriggerSequence; assign setMagnetTriggerSequence to "MI-PS-MM:enableTrigger";

char getFilamentStatus; assign getFilamentStatus to "MI-RF-MAG:isFilamentEnabled"; monitor getFilamentStatus;
char getFilamentReady; assign getFilamentReady to "MI-RF-MAG:isFilamentReady"; monitor getFilamentReady;
char enableFilament; assign enableFilament to "MI-RF-MAG:enableFilament";
char disableFilament; assign disableFilament to "MI-RF-MAG:disableFilament";

char getMicrotronTC1Enabled; assign getMicrotronTC1Enabled to "MI-PS-TC1:isEnabled"; monitor getMicrotronTC1Enabled;
char getMicrotronTC2Enabled; assign getMicrotronTC2Enabled to "MI-PS-TC2:isEnabled"; monitor getMicrotronTC2Enabled;
char getMicrotronTC3Enabled; assign getMicrotronTC3Enabled to "MI-PS-TC3:isEnabled"; monitor getMicrotronTC3Enabled;
char getMicrotronTC4Enabled; assign getMicrotronTC4Enabled to "MI-PS-TC4:isEnabled"; monitor getMicrotronTC4Enabled;
char setMicrotronTC1Enabled; assign setMicrotronTC1Enabled to "MI-PS-TC1:enable";
char setMicrotronTC2Enabled; assign setMicrotronTC2Enabled to "MI-PS-TC2:enable";
char setMicrotronTC3Enabled; assign setMicrotronTC3Enabled to "MI-PS-TC3:enable";
char setMicrotronTC4Enabled; assign setMicrotronTC4Enabled to "MI-PS-TC4:enable";

char getTL1Corrector1X; assign getTL1Corrector1X to "TL1-PS-CR1-X:isEnabled"; monitor getTL1Corrector1X;
char getTL1Corrector1Y; assign getTL1Corrector1Y to "TL1-PS-CR1-Y:isEnabled"; monitor getTL1Corrector1Y;
char getTL1Corrector2X; assign getTL1Corrector2X to "TL1-PS-CR2-X:isEnabled"; monitor getTL1Corrector2X;
char getTL1Corrector2Y; assign getTL1Corrector2Y to "TL1-PS-CR2-Y:isEnabled"; monitor getTL1Corrector2Y;
char getTL1Corrector3X; assign getTL1Corrector3X to "TL1-PS-CR3-X:isEnabled"; monitor getTL1Corrector3X;
char getTL1Corrector3Y; assign getTL1Corrector3Y to "TL1-PS-CR3-Y:isEnabled"; monitor getTL1Corrector3Y;
char getTL1Corrector4X; assign getTL1Corrector4X to "TL1-PS-CR4-X:isEnabled"; monitor getTL1Corrector4X;
char getTL1Corrector4Y; assign getTL1Corrector4Y to "TL1-PS-CR4-Y:isEnabled"; monitor getTL1Corrector4Y;
char setTL1Corrector1X; assign setTL1Corrector1X to "TL1-PS-CR1-X:enable";
char setTL1Corrector1Y; assign setTL1Corrector1Y to "TL1-PS-CR1-Y:enable";
char setTL1Corrector2X; assign setTL1Corrector2X to "TL1-PS-CR2-X:enable";
char setTL1Corrector2Y; assign setTL1Corrector2Y to "TL1-PS-CR2-Y:enable";
char setTL1Corrector3X; assign setTL1Corrector3X to "TL1-PS-CR3-X:enable";
char setTL1Corrector3Y; assign setTL1Corrector3Y to "TL1-PS-CR3-Y:enable";
char setTL1Corrector4X; assign setTL1Corrector4X to "TL1-PS-CR4-X:enable";
char setTL1Corrector4Y; assign setTL1Corrector4Y to "TL1-PS-CR4-Y:enable";
char setTL1Triplet1Voltage; assign setTL1Triplet1Voltage to "TL1-PS-TRP1:setVoltage";
char setTL1Triplet2Voltage; assign setTL1Triplet2Voltage to "TL1-PS-TRP2:setVoltage";
char setTL1Triplet3Voltage; assign setTL1Triplet3Voltage to "TL1-PS-TRP3:setVoltage";
char setTL1Triplet4Voltage; assign setTL1Triplet4Voltage to "TL1-PS-TRP4:setVoltage";

char getBoosterCorrectorStatus1; assign getBoosterCorrectorStatus1 to "BOC01-PS-CR1:isEnabled"; monitor getBoosterCorrectorStatus1;
char getBoosterCorrectorStatus2; assign getBoosterCorrectorStatus2 to "BOC02-PS-CR1:isEnabled"; monitor getBoosterCorrectorStatus2;
char getBoosterCorrectorStatus3; assign getBoosterCorrectorStatus3 to "BOC03-PS-CR1:isEnabled"; monitor getBoosterCorrectorStatus3;
char getBoosterCorrectorStatus4; assign getBoosterCorrectorStatus4 to "BOC04-PS-CR1:isEnabled"; monitor getBoosterCorrectorStatus4;
char getBoosterCorrectorStatus5; assign getBoosterCorrectorStatus5 to "BOC05-PS-CR1:isEnabled"; monitor getBoosterCorrectorStatus5;
char getBoosterCorrectorStatus6; assign getBoosterCorrectorStatus6 to "BOC06-PS-CR1:isEnabled"; monitor getBoosterCorrectorStatus6;
char enableBoosterCorrectorStatus1; assign enableBoosterCorrectorStatus1 to "BOC01-PS-CR1:enable";
char enableBoosterCorrectorStatus2; assign enableBoosterCorrectorStatus2 to "BOC02-PS-CR1:enable";
char enableBoosterCorrectorStatus3; assign enableBoosterCorrectorStatus3 to "BOC03-PS-CR1:enable";
char enableBoosterCorrectorStatus4; assign enableBoosterCorrectorStatus4 to "BOC04-PS-CR1:enable";
char enableBoosterCorrectorStatus5; assign enableBoosterCorrectorStatus5 to "BOC05-PS-CR1:enable";
char enableBoosterCorrectorStatus6; assign enableBoosterCorrectorStatus6 to "BOC06-PS-CR1:enable";
char disableBoosterCorrectorStatus1; assign disableBoosterCorrectorStatus1 to "BOC01-PS-CR1:disable";
char disableBoosterCorrectorStatus2; assign disableBoosterCorrectorStatus2 to "BOC02-PS-CR1:disable";
char disableBoosterCorrectorStatus3; assign disableBoosterCorrectorStatus3 to "BOC03-PS-CR1:disable";
char disableBoosterCorrectorStatus4; assign disableBoosterCorrectorStatus4 to "BOC04-PS-CR1:disable";
char disableBoosterCorrectorStatus5; assign disableBoosterCorrectorStatus5 to "BOC05-PS-CR1:disable";
char disableBoosterCorrectorStatus6; assign disableBoosterCorrectorStatus6 to "BOC06-PS-CR1:disable";
char setBoosterCorrectorPSReset1; assign setBoosterCorrectorPSReset1 to "BOC01-PS-CR1:reset";
char setBoosterCorrectorPSReset2; assign setBoosterCorrectorPSReset2 to "BOC02-PS-CR1:reset";
char setBoosterCorrectorPSReset3; assign setBoosterCorrectorPSReset3 to "BOC03-PS-CR1:reset";
char setBoosterCorrectorPSReset4; assign setBoosterCorrectorPSReset4 to "BOC04-PS-CR1:reset";
char setBoosterCorrectorPSReset5; assign setBoosterCorrectorPSReset5 to "BOC05-PS-CR1:reset";
char setBoosterCorrectorPSReset6; assign setBoosterCorrectorPSReset6 to "BOC06-PS-CR1:reset";
char setBoosterCorrectorInvReset1; assign setBoosterCorrectorInvReset1 to "BOC01-PS-CR1-INV:reset";
char setBoosterCorrectorInvReset2; assign setBoosterCorrectorInvReset2 to "BOC02-PS-CR1-INV:reset";
char setBoosterCorrectorInvReset3; assign setBoosterCorrectorInvReset3 to "BOC03-PS-CR1-INV:reset";
char setBoosterCorrectorInvReset4; assign setBoosterCorrectorInvReset4 to "BOC04-PS-CR1-INV:reset";
char setBoosterCorrectorInvReset5; assign setBoosterCorrectorInvReset5 to "BOC05-PS-CR1-INV:reset";
char setBoosterCorrectorInvReset6; assign setBoosterCorrectorInvReset6 to "BOC06-PS-CR1-INV:reset";

string getBMState; assign getBMState to "BO-PS-BM:getState"; monitor getBMState;
string getQFState; assign getQFState to "BO-PS-QF:getState"; monitor getQFState;
string getQDState; assign getQDState to "BO-PS-QD:getState"; monitor getQDState;
char setBMPower; assign setBMPower to "BO-PS-BM:enablePower";
char setBMPulse; assign setBMPulse to "BO-PS-BM:enablePulse";
char setQFPower; assign setQFPower to "BO-PS-QF:enablePower";
char setQFPulse; assign setQFPulse to "BO-PS-QF:enablePulse";
char setQDPower; assign setQDPower to "BO-PS-QD:enablePower";
char setQDPulse; assign setQDPulse to "BO-PS-QD:enablePulse";

char getKickerState; assign getKickerState to "BO-PS-INK:isEnabled"; monitor getKickerState;
char getSeptumState; assign getSeptumState to "BO-PS-INS:isEnabled"; monitor getSeptumState;
char setKickerState; assign setKickerState to "BO-PS-INK:enable";
char setSeptumState; assign setSeptumState to "BO-PS-INS:enable";
// char setKickerTrigger; assign setKickerTrigger to "BO-PS-INK:enableTrigger";
// char setSeptumTrigger; assign setSeptumTrigger to "BO-PS-INS:enableTrigger";

char getHighVoltageState; assign getHighVoltageState to "MI-PS-MOD:isHighVoltageEnabled"; monitor getHighVoltageState;
char enableHighVoltage; assign enableHighVoltage to "MI-PS-MOD:enableHighVoltage";
char disableHighVoltage; assign disableHighVoltage to "MI-PS-MOD:disableHighVoltage";

char RAMP_OFF = 0;
char RAMP_UP = 1;
char RAMP_READY = 2;
char RAMP_DOWN = 3;

ss OperationSequencer
{
  state init
  {
    entry
    {
      strcpy(getPowerSequenceState, "Idle");
      pvPut(getPowerSequenceState);
    }

    when(strcmp(setPowerSequenceState, "Powerup") == 0)
    {
      strcpy(getPowerSequenceState, "Powerup");
      pvPut(getPowerSequenceState);

      strcpy(getSequenceStage, "powering up microtron");
      pvPut(getSequenceStage);

      enableMicrotronPower = 1;
      pvPut(enableMicrotronPower);
    } state powerup_microtron

    when(strcmp(setPowerSequenceState, "Powerdown") == 0)
    {
      strcpy(getPowerSequenceState, "Powerdown");
      pvPut(getPowerSequenceState);

      strcpy(getSequenceStage, "powering down power supplies");
      pvPut(getSequenceStage);

      if (strcmp(getBMState, "Pulse on") == 0)
      {
        setBMPulse = 0;
        setBMPower = 1;
        pvPut(setBMPulse);
        pvPut(setBMPower);
      }

      if (strcmp(getQFState, "Pulse on") == 0)
      {
        setQFPulse = 0;
        setQFPower = 1;
        pvPut(setQFPulse);
        pvPut(setQFPower);
      }

      if (strcmp(getQDState, "Pulse on") == 0)
      {
        setQDPulse = 0;
        setQDPower = 1;
        pvPut(setQDPulse);
        pvPut(setBMPower);
      }

      setKickerState = 0;
      setSeptumState = 0;
      pvPut(setKickerState);
      pvPut(setSeptumState);

      setMicrotronTC1Enabled = 0;
      setMicrotronTC2Enabled = 0;
      setMicrotronTC3Enabled = 0;
      setMicrotronTC4Enabled = 0;
      pvPut(setMicrotronTC1Enabled);
      pvPut(setMicrotronTC2Enabled);
      pvPut(setMicrotronTC3Enabled);
      pvPut(setMicrotronTC4Enabled);

      setTL1Corrector1X = 0;
      setTL1Corrector1Y = 0;
      setTL1Corrector2X = 0;
      setTL1Corrector2Y = 0;
      setTL1Corrector3X = 0;
      setTL1Corrector3Y = 0;
      setTL1Corrector4X = 0;
      setTL1Corrector4Y = 0;
      pvPut(setTL1Corrector1X);
      pvPut(setTL1Corrector1Y);
      pvPut(setTL1Corrector2X);
      pvPut(setTL1Corrector2Y);
      pvPut(setTL1Corrector3X);
      pvPut(setTL1Corrector3Y);
      pvPut(setTL1Corrector4X);
      pvPut(setTL1Corrector4Y);

      setTL1Triplet1Voltage = 0;
      setTL1Triplet2Voltage = 0;
      setTL1Triplet3Voltage = 0;
      setTL1Triplet4Voltage = 0;
      pvPut(setTL1Triplet1Voltage);
      pvPut(setTL1Triplet2Voltage);
      pvPut(setTL1Triplet3Voltage);
      pvPut(setTL1Triplet4Voltage);

      disableBoosterCorrectorStatus1 = 1;
      disableBoosterCorrectorStatus2 = 1;
      disableBoosterCorrectorStatus3 = 1;
      disableBoosterCorrectorStatus4 = 1;
      disableBoosterCorrectorStatus5 = 1;
      disableBoosterCorrectorStatus6 = 1;
      pvPut(disableBoosterCorrectorStatus1);
      pvPut(disableBoosterCorrectorStatus2);
      pvPut(disableBoosterCorrectorStatus3);
      pvPut(disableBoosterCorrectorStatus4);
      pvPut(disableBoosterCorrectorStatus5);
      pvPut(disableBoosterCorrectorStatus6);
    } state powerdown_ps
  }

  state operation_failure
  {
    entry
    {
      strcpy(getSequenceStage, "failure");
      strcpy(getPowerSequenceState, "Failure");
      pvPut(getSequenceStage);
      pvPut(getPowerSequenceState);
    }

    when (setPowerSequenceReset == 1)
    {
      setPowerSequenceReset = 0;
      strcpy(getPowerSequenceState, "Idle");
      strcpy(setPowerSequenceState, "Idle");
      strcpy(getSequenceStage, "idle");

      pvPut(setPowerSequenceReset);
      pvPut(getPowerSequenceState);
      pvPut(setPowerSequenceState);
      pvPut(getSequenceStage);
    } state init
  }

  state powerdown_ps
  {
    when (!
         (getMicrotronTC1Enabled ||
          getMicrotronTC2Enabled ||
          getMicrotronTC3Enabled ||
          getMicrotronTC4Enabled ||

          getTL1Corrector1X ||
          getTL1Corrector1Y ||
          getTL1Corrector2X ||
          getTL1Corrector2Y ||
          getTL1Corrector3X ||
          getTL1Corrector3Y ||
          getTL1Corrector4X ||
          getTL1Corrector4Y ||

          getBoosterCorrectorStatus1 ||
          getBoosterCorrectorStatus2 ||
          getBoosterCorrectorStatus3 ||
          getBoosterCorrectorStatus4 ||
          getBoosterCorrectorStatus5 ||
          getBoosterCorrectorStatus6 ||

          getKickerState ||
          getSeptumState) &&

          (strcmp(getBMState, "Power on") == 0 || strcmp(getBMState, "Standby") == 0) &&
          (strcmp(getQFState, "Power on") == 0 || strcmp(getQFState, "Standby") == 0) &&
          (strcmp(getQDState, "Power on") == 0 || strcmp(getQFState, "Standby") == 0))
    {
      strcpy(getSequenceStage, "powering off DC PS & ramping magnet down");
      pvPut(getSequenceStage);

      if (strcmp(getBMState, "Power on") == 0)
      {
        setBMPower = 0;
        pvPut(setBMPower);
      }

      if (strcmp(getQFState, "Power on") == 0)
      {
        setQFPower = 0;
        pvPut(setQFPower);
      }

      if (strcmp(getQDState, "Power on") == 0)
      {
        setQDPower = 0;
        pvPut(setQDPower);
      }

      disableHighVoltage = 1;
      pvPut(disableHighVoltage);

      disableFilament = 1;
      pvPut(disableFilament);

      if (getMagnetOutputStatus && getMagnetRampStatus == RAMP_READY)
      {
        setMagnetTriggerSequence = 1;
        pvPut(setMagnetTriggerSequence);
      }
    } state powerdown_magnet

    when (strcmp(setPowerSequenceState, "Powerdown") != 0) {} state operation_incomplete
    when (delay(3.0 * 60.0)) {} state operation_failure
  }

  state powerdown_magnet
  {
    when (getMagnetRampStatus == RAMP_OFF &&
    	strcmp(getBMState, "Standby") == 0 &&
    	strcmp(getQFState, "Standby") == 0 &&
    	strcmp(getQFState, "Standby") == 0)
    {
      strcpy(getSequenceStage, "powering off magnet and microtron");
      pvPut(getSequenceStage);

      enableMagnet = 0;
      pvPut(enableMagnet);

      disableMicrotronPower = 1;
      pvPut(disableMicrotronPower);
    } state powerdown_done

    when (strcmp(setPowerSequenceState, "Powerdown") != 0) {} state operation_incomplete
    when (delay(6.0 * 60.0)) {} state operation_failure
  }

  state powerdown_done
  {
    when (getMicrotronPower == 0 && !getMagnetOutputStatus)
    {
      strcpy(getSequenceStage, "done - powered down");
      strcpy(getPowerSequenceState, "Idle");
      strcpy(setPowerSequenceState, "Idle");
      pvPut(getSequenceStage);
      pvPut(getPowerSequenceState);
      pvPut(setPowerSequenceState);
    } state init

    when (strcmp(setPowerSequenceState, "Powerdown") != 0) {} state operation_incomplete
    when (delay(10.0)) {} state operation_failure
  }

  state powerup_microtron
  {
    when (getMicrotronPower)
    {
      strcpy(getSequenceStage, "powering up magnets");
      pvPut(getSequenceStage);

      if (!getMagnetOutputStatus)
      {
        enableMagnet = 1;
        pvPut(enableMagnet);
      }
    } state powerup_magnet

    when (strcmp(setPowerSequenceState, "Powerup") != 0) {} state operation_incomplete
    when (delay(5.0)) {} state operation_failure
  }

  state powerup_magnet
  {
    when (getMagnetOutputStatus)
    {
      strcpy(getSequenceStage, "powering up PS, filament and magnet");
      pvPut(getSequenceStage);

      if (getMagnetRampStatus == RAMP_OFF && getMagnetOutputStatus)
      {
        strcpy(setMagnetSequence, "TEST5");
        pvPut(setMagnetSequence);
        strcpy(setMagnetSequenceState, "RUN");
        pvPut(setMagnetSequenceState);
      }

      enableFilament = 1;
      pvPut(enableFilament);

      setMicrotronTC1Enabled = 1;
      setMicrotronTC2Enabled = 1;
      setMicrotronTC3Enabled = 1;
      setMicrotronTC4Enabled = 1;

      pvPut(setMicrotronTC1Enabled);
      pvPut(setMicrotronTC2Enabled);
      pvPut(setMicrotronTC3Enabled);
      pvPut(setMicrotronTC4Enabled);

      setTL1Corrector1X = 1;
      setTL1Corrector1Y = 1;
      setTL1Corrector2X = 1;
      setTL1Corrector2Y = 1;
      setTL1Corrector3X = 1;
      setTL1Corrector3Y = 1;
      setTL1Corrector4X = 1;
      setTL1Corrector4Y = 1;

      setTL1Triplet1Voltage = 35;
      setTL1Triplet2Voltage = 35;
      setTL1Triplet3Voltage = 35;
      setTL1Triplet4Voltage = 35;

      pvPut(setTL1Corrector1X);
      pvPut(setTL1Corrector1Y);
      pvPut(setTL1Corrector2X);
      pvPut(setTL1Corrector2Y);
      pvPut(setTL1Corrector3X);
      pvPut(setTL1Corrector3Y);
      pvPut(setTL1Corrector4X);
      pvPut(setTL1Corrector4Y);

      pvPut(setTL1Triplet1Voltage);
      pvPut(setTL1Triplet2Voltage);
      pvPut(setTL1Triplet3Voltage);
      pvPut(setTL1Triplet4Voltage);

      setBoosterCorrectorPSReset1 = 1;
      setBoosterCorrectorPSReset2 = 1;
      setBoosterCorrectorPSReset3 = 1;
      setBoosterCorrectorPSReset4 = 1;
      setBoosterCorrectorPSReset5 = 1;
      setBoosterCorrectorPSReset6 = 1;
      setBoosterCorrectorInvReset1 = 1;
      setBoosterCorrectorInvReset2 = 1;
      setBoosterCorrectorInvReset3 = 1;
      setBoosterCorrectorInvReset4 = 1;
      setBoosterCorrectorInvReset5 = 1;
      setBoosterCorrectorInvReset6 = 1;

      pvPut(setBoosterCorrectorPSReset1);
      pvPut(setBoosterCorrectorPSReset2);
      pvPut(setBoosterCorrectorPSReset3);
      pvPut(setBoosterCorrectorPSReset4);
      pvPut(setBoosterCorrectorPSReset5);
      pvPut(setBoosterCorrectorPSReset6);
      pvPut(setBoosterCorrectorInvReset1);
      pvPut(setBoosterCorrectorInvReset2);
      pvPut(setBoosterCorrectorInvReset3);
      pvPut(setBoosterCorrectorInvReset4);
      pvPut(setBoosterCorrectorInvReset5);
      pvPut(setBoosterCorrectorInvReset6);

      if (strcmp(getBMState, "Standby") == 0)
      {
        setBMPower = 1;
        setBMPulse = 0;
        pvPut(setBMPower);
        pvPut(setBMPulse);
      }

      if (strcmp(getQFState, "Standby") == 0)
      {
        setQFPower = 1;
        setQFPulse = 0;
        pvPut(setQFPower);
        pvPut(setQFPulse);
      }

      if (strcmp(getQDState, "Standby") == 0)
      {
        setQDPower = 1;
        setQDPulse = 0;
        pvPut(setQDPower);
        pvPut(setQDPulse);
      }

      setKickerState = 1;
      setSeptumState = 1;

      pvPut(setKickerState);
      pvPut(setSeptumState);
    } state powerup_ps_reset

    when (strcmp(setPowerSequenceState, "Powerup") != 0) {} state operation_incomplete
    when (delay(5.0)) {} state operation_failure
  }

  state powerup_ps_reset
  {
    when (delay(1.0))
    {
      setBoosterCorrectorPSReset1 = 0;
      setBoosterCorrectorPSReset2 = 0;
      setBoosterCorrectorPSReset3 = 0;
      setBoosterCorrectorPSReset4 = 0;
      setBoosterCorrectorPSReset5 = 0;
      setBoosterCorrectorPSReset6 = 0;
      setBoosterCorrectorInvReset1 = 0;
      setBoosterCorrectorInvReset2 = 0;
      setBoosterCorrectorInvReset3 = 0;
      setBoosterCorrectorInvReset4 = 0;
      setBoosterCorrectorInvReset5 = 0;
      setBoosterCorrectorInvReset6 = 0;

      pvPut(setBoosterCorrectorPSReset1);
      pvPut(setBoosterCorrectorPSReset2);
      pvPut(setBoosterCorrectorPSReset3);
      pvPut(setBoosterCorrectorPSReset4);
      pvPut(setBoosterCorrectorPSReset5);
      pvPut(setBoosterCorrectorPSReset6);
      pvPut(setBoosterCorrectorInvReset1);
      pvPut(setBoosterCorrectorInvReset2);
      pvPut(setBoosterCorrectorInvReset3);
      pvPut(setBoosterCorrectorInvReset4);
      pvPut(setBoosterCorrectorInvReset5);
      pvPut(setBoosterCorrectorInvReset6);

      enableBoosterCorrectorStatus1 = 1;
      enableBoosterCorrectorStatus2 = 1;
      enableBoosterCorrectorStatus3 = 1;
      enableBoosterCorrectorStatus4 = 1;
      enableBoosterCorrectorStatus5 = 1;
      enableBoosterCorrectorStatus6 = 1;

      pvPut(enableBoosterCorrectorStatus1);
      pvPut(enableBoosterCorrectorStatus2);
      pvPut(enableBoosterCorrectorStatus3);
      pvPut(enableBoosterCorrectorStatus4);
      pvPut(enableBoosterCorrectorStatus5);
      pvPut(enableBoosterCorrectorStatus6);
    } state powerup_ps_on
  }

  state powerup_ps_on
  {
    when (getMicrotronTC1Enabled &&
          getMicrotronTC2Enabled &&
          getMicrotronTC3Enabled &&
          getMicrotronTC4Enabled &&

          getTL1Corrector1X &&
          getTL1Corrector1Y &&
          getTL1Corrector2X &&
          getTL1Corrector2Y &&
          getTL1Corrector3X &&
          getTL1Corrector3Y &&
          getTL1Corrector4X &&
          getTL1Corrector4Y &&

          getBoosterCorrectorStatus1 &&
          getBoosterCorrectorStatus2 &&
          getBoosterCorrectorStatus3 &&
          getBoosterCorrectorStatus4 &&
          getBoosterCorrectorStatus5 &&
          getBoosterCorrectorStatus6 &&

          getKickerState &&
          getSeptumState &&

          strcmp(getBMState, "Power on") == 0 &&
          strcmp(getQFState, "Power on") == 0 &&
          strcmp(getQDState, "Power on") == 0)
    {
      strcpy(getSequenceStage, "waiting for booster dc power supplies");
      pvPut(getSequenceStage);

      if (strcmp(getBMState, "Power on") == 0)
      {
        setBMPulse = 1;
        pvPut(setBMPulse);
      }

      if (strcmp(getQFState, "Power on") == 0)
      {
        setQFPulse = 1;
        pvPut(setQFPulse);
      }

      if (strcmp(getQDState, "Power on") == 0)
      {
        setQDPulse = 1;
        pvPut(setQDPulse);
      }
    } state powerup_ps_pulse_on

    when (strcmp(setPowerSequenceState, "Powerup") != 0) {} state operation_incomplete
    when (delay(60.0)) {} state operation_failure
  }

  state powerup_ps_pulse_on
  {
    when (strcmp(getBMState, "Pulse on") == 0 &&
          strcmp(getQFState, "Pulse on") == 0 &&
          strcmp(getQDState, "Pulse on") == 0)
    {
      strcpy(getSequenceStage, "waiting for filament and magnet ramp");
      pvPut(getSequenceStage);
    } state powerup_long_wait

    when (strcmp(setPowerSequenceState, "Powerup") != 0) {} state operation_incomplete
    when (delay(60.0)) {} state operation_failure
  }

  state powerup_long_wait
  {
    when (getMagnetRampStatus == RAMP_READY && getFilamentStatus && getFilamentReady)
    {
      strcpy(getSequenceStage, "powering up high voltage");
      pvPut(getSequenceStage);

      enableHighVoltage = 1;
      pvPut(enableHighVoltage);
    } state powerup_high_voltage

    when (strcmp(setPowerSequenceState, "Powerup") != 0) {} state operation_incomplete
    when (delay(22.5 * 60)) {} state operation_failure
  }

  state powerup_high_voltage
  {
    when (getHighVoltageState)
    {
      strcpy(getSequenceStage, "done - powered up");
      strcpy(getPowerSequenceState, "Idle");
      strcpy(setPowerSequenceState, "Idle");
      pvPut(getSequenceStage);
      pvPut(getPowerSequenceState);
      pvPut(setPowerSequenceState);
    } state init

    when (strcmp(setPowerSequenceState, "Powerup") != 0) {} state operation_incomplete
    when (delay(5.0)) {} state operation_failure
  }

  state operation_incomplete
  {
    when () {} state init
  }
}
