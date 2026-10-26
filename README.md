# robo reach ps3

this is my submission for the RoboReach fresher tasks. I went with challenge A for task 4, the chassis one. seemed easier to connect with the drive and stability parts.

## where stuff is
- `docs/task1_rulebook.md` - rule questions + score.
- `docs/task2_mechanism/` - drive, arm and gripper choices.
- `docs/task3_circuit/` - wiring, parts list, power and troubleshooting.
- `design/cad/robo_reach_chassis.scad` - editable model. Open it in OpenSCAD, F5 for preview and F6 to render.
- `design/cad/` - other CAD exports and drawings.
- `design/calcs/stability.md` - CG and ramp calculation.
- `media/` - motion preview.

## assumptions / stuff to know
This is a basic concept, not a robot i've built and tested yet. I used the ratings in the task PDF for the calculations. Prices are rough estimates so check them before ordering anything.

One important thing: the sheet says the motors can pull 4 A each at stall, while an L298N type driver is rated for 2 A per channel. thats not a good match, so i have suggested a higher-current driver instead. The exact model still needs to be checked properly before buying.

## limitations
- CAD parts are simplified, not every screw or motor part is modelled.
- CG is estimated using assumed masses. Real parts could change it.
- The servo current calculation is worst case. They probably wont all stall together, but the supply still needs enough margin.
- A fully charged 3S battery is 12.6 V, under the 24 V rule.
- It is meant to be manually controlled, not autonomous.

## tools and references
I used OpenSCAD, SVG diagrams and Markdown notes. Main source is the RoboReach task PDF, especially Appendix A and B.

Other pages checked for rough part options:
- ESP32 info: https://www.espressif.com/en/products/socs/esp32
- RobuKits: https://www.robukits.online/
- Motor example: https://www.electroboat.in/products/details/n20-micro-gear-12v-100rpm-dc-motor-high-torque-metal-gearbox
- Another motor listing: https://dsmonline.in/product/dc-gear-motor-12v-100-rpm-by-generic-fykpi
- Cytron driver options: https://www.cytron.io/

Prices and exact specs can change, and some listings are only examples, not the exact reference motor. i'll double check the exact part before ordering.
