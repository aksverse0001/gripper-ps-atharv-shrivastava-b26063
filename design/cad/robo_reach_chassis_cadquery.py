# Editable CadQuery source for the RoboReach Challenge A concept.
# Install CadQuery, then run: python robo_reach_chassis_cadquery.py
import cadquery as cq
from cadquery import Color, Assembly

plate = cq.Workplane("XY").box(240, 180, 6).translate((0, 0, 48))
rails = [cq.Workplane("XY").box(225, 8, 18).translate((0, y, 39)) for y in (-82, 82)]
battery = cq.Workplane("XY").box(85, 55, 28).translate((-25, 0, 65))
controller = cq.Workplane("XY").box(40, 35, 8).translate((-75, 0, 61))
tower = cq.Workplane("XY").box(24, 30, 52).translate((78, 0, 76))
arm = cq.Workplane("XY").box(75, 14, 10).rotate((0,0,0), (0,1,0), -12).translate((112,0,84))
fingers = [cq.Workplane("XY").box(36,7,12).translate((151,y,75)) for y in (-14,14)]
cube = cq.Workplane("XY").box(50,50,50).translate((190,0,75))
wheels = []
for x in (-85,85):
    for y in (-75,75):
        outer = cq.Solid.makeCylinder(35,22,cq.Vector(x,y-11,35),cq.Vector(0,1,0))
        bore = cq.Solid.makeCylinder(5,24,cq.Vector(x,y-12,35),cq.Vector(0,1,0))
        wheels.append(cq.Workplane("XY").newObject([outer.cut(bore)]))

assembly = Assembly(name="RoboReach_Chassis")
assembly.add(plate, name="chassis_plate", color=Color(0.22,0.28,0.33))
for i, rail in enumerate(rails):
    assembly.add(rail, name=f"side_rail_{i+1}", color=Color(0.45,0.48,0.50))
assembly.add(battery, name="battery_block", color=Color(0.15,0.15,0.17))
assembly.add(controller, name="controller_block", color=Color(0.05,0.38,0.22))
assembly.add(tower, name="arm_tower", color=Color(0.70,0.70,0.72))
assembly.add(arm, name="arm_link", color=Color(0.78,0.58,0.25))
for i, finger in enumerate(fingers):
    assembly.add(finger, name=f"finger_{i+1}", color=Color(0.85,0.70,0.42))
assembly.add(cube, name="50mm_cube", color=Color(0.88,0.25,0.18))
for i, wheel in enumerate(wheels):
    assembly.add(wheel, name=f"wheel_{i+1}", color=Color(0.18,0.20,0.22))
assembly.save("robo_reach_chassis.step")
