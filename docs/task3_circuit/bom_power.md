# 3b - parts and power notes

The prices below are estimates, not a live checkout. Check the exact model, stock and shipping before buying. The task asks for electronics under ₹12,000 including shipping and around 10% extra, so leave some room instead of spending the whole budget on paper.

## power rails and rough current
| part / rail | normal current | worst case used |
|---|---:|---:|
| 2 drive motors, battery rail | about 2 A total while moving | 8 A total at stall |
| 4 MG996R servos, 6 V | about 2 A total while moving | 10 A total at stall |
| MG90S gripper, 6 V | varies | 0.7 A |
| ESP32, 5 V | about 0.08 A | 0.35 A radio peak |

The 6 V servo rail could reach about 10.7 A in the simple all-stalled case. With 1.5x margin that is about 16 A, so a 20 A class buck is the safer target. For the ESP32, 0.35 A x 1.5 = 0.525 A, so a 2 A or 3 A converter gives room for startup and accessories.

The motor driver and wiring must be chosen for stall current too, not only the normal running current. Use current limiting where possible and don't keep a motor stalled.

## battery runtime
Example battery: 3S, 2200 mAh, 11.1 V nominal. Energy is roughly `11.1 x 2.2 = 24.4 Wh`. If we assume about 70% is usable, that leaves around 17.1 Wh.

For a rough run estimate, assume average system power around 25-35 W while driving and moving the arm. That gives about 29-41 minutes ideally from 17.1 Wh, before accounting for losses, bursts and battery ageing. The actual run could be lower, so test it. A 7 minute run plus setup/testing should still have some margin if the load is close to this assumption.

## chemistry
| type | good points | downsides |
|---|---|---|
| 3S LiPo | high current / C rating, light for its output | needs careful charging and storage |
| 18650 Li-ion pack | common cells, often good energy per weight | current depends on cells and pack design; needs proper protection |

I'd choose the 3S LiPo because the robot needs short bursts of current. It is 12.6 V fully charged, so under the 24 V rule. Secure it with a strap and latch, not just tape.

## BOM notes
Use an ESP32-WROOM-32 dev board, two drive motors matching the task sheet, two suitable high-current motor drivers (or a dual driver that truly meets the current), one 6 V high-current buck, one 5 V buck, five servos, battery, fuse, DC kill switch, capacitors, wiring and connectors. The motor-driver and servo-buck prices need especially careful checking because the current rating matters more than a cheap listing.
