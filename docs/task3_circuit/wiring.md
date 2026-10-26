# 3a - wiring

The diagram is `wiring.svg`.

Rails:
- Battery: 3S LiPo, around 9.9 to 12.6 V.
- 6 V buck: all five servos.
- 5 V buck: ESP32 VIN.
- ESP32 regulator makes 3.3 V for its logic.

## basic wiring
1. Battery positive goes to a DC kill switch, then a 15 A fuse close to the battery, then the distribution point.
2. From there, power goes to the motor drivers and both buck converters.
3. Use one suitable H-bridge for each drive motor. ESP32 control pins follow Appendix A.
4. The 6 V supply powers the four MG996R-type servos and the gripper servo. Do not power these from the ESP32 pin because the current can be way too high.
5. The separate 5 V buck powers ESP32 VIN. Don't connect 5 V to the ESP32 3V3 pin.
6. Battery negative, buck negatives, driver ground and ESP32 ground all connect together. Keep motor current from running through the ESP32 ground wire if possible.

## why these parts
An H-bridge lets the motor go forward or reverse, and PWM changes speed. The task sheet says 4 A stall current per motor, but an L298N-type driver is only rated 2 A per channel. I wouldn't use it here. A higher-current driver is needed, and its actual continuous rating and cooling need checking before buying.

Put a 470-1000 uF capacitor near each motor driver supply and a 100 nF ceramic capacitor near its power pins. Put a bigger capacitor (about 1000-2200 uF) on the 6 V servo rail. These help with short voltage dips and noise, but they don't fix an undersized supply.

For short high-current wires i'd use 16 AWG from battery to fuse/switch and driver. 18 AWG is a starting point for the buck inputs and servo supply trunk. Longer wires may need thicker wire.

The kill switch should be DC rated for at least 20 A. Battery needs a proper strap and holder so it can't fall out if the bot tips. Fully charged 3S is 12.6 V, under the 24 V limit.
