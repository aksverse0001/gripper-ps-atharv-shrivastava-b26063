# stability maths

## sizes and assumed masses
- Chassis: 240 x 180 x 6 mm
- Wheels: 70 mm diameter
- Wheelbase: 170 mm
- Track width: 150 mm
- Chassis + drive: 1.20 kg at x=0 mm
- Arm and gripper: 0.35 kg at x=65 mm
- Cube: 0.10 kg at x=190 mm

I measured x from the middle of the chassis, with the front being positive.

## combined CG
Using `xCG = sum(m*x) / sum(m)`:

`xCG = (1.20*0 + 0.35*65 + 0.10*190) / (1.20 + 0.35 + 0.10)`

`= 41.75 / 1.65 = 25.3 mm` forward of the middle.

These masses are assumptions, so the answer will change with the real motors, battery and arm.

## ramp
At 15 degrees, gravity pulling down the ramp is `mg sin(15)`, about `0.259mg`. The normal force is about `0.966mg`. So the bot needs enough tyre grip and should move slowly.

Half the wheelbase is 85 mm. The CG estimate is 25.3 mm forward, leaving around `85 - 25.3 = 59.7 mm` to the front axle line on flat ground. That is a decent rough margin, but the arm can shift the load forward when extended.

## speed breakers
The 70 mm wheel radius is 35 mm, so it is smaller than the 40 mm breaker height. Rounded breakers may be okay at low speed, but a sharp step is not guaranteed. A 90 mm wheel has a 45 mm radius, but it also makes the bot taller, so check the start box again.

Keep the battery low, avoid sudden braking and test it on the ramp with the cube held out front. This is a calculation, not a real stability test.
