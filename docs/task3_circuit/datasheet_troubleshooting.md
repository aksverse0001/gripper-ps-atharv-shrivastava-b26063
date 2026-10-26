# 3c and 3d - datasheet check / fault

## servo check
The MG996R type servo is listed as working from 4.8 to 7.2 V, so i used a 6 V rail. The reference stall current is about 2.5 A each. Four of them could pull about 10 A together, and the gripper servo adds around 0.7 A. This is why a small 5 A buck is not enough for worst case, so the design asks for a much bigger 6 V supply.

Too much voltage or holding a servo stalled for too long can damage it. Keep the rail regulated at 6 V and don't force the arm against a hard stop.

Also, the motor driver needs attention: the reference motor stall current is 4 A but an L298N type driver is listed at 2 A per channel. So use a higher current driver and check the real datasheet first.

## fault: ESP32 resets when shoulder servo moves

Possible causes:
- The servo pulls the voltage down when it starts.
- Servos are being powered from the ESP32 supply.
- Ground wires are too thin or too long.
- The buck converter cannot provide enough current.

First check: measure the 6 V servo rail and 5 V ESP32 input while moving the shoulder. If there is no meter, disconnect the servos and run the ESP32 from USB, then reconnect one servo at a time to narrow it down.

To confirm the fix, power the servos and ESP32 from their separate converters, connect grounds together, shorten the power wires and add the capacitors shown in the diagram. Try the shoulder again with some load and check that the ESP32 stays on.
