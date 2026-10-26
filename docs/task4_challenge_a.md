# task 4 - challenge A

I picked the chassis challenge. It is a four wheel skid steer bot with the battery kept low and towards the back. The arm is kept simple because the task says basic shapes and joints are fine.

## parts in the model
- 240 x 180 x 6 mm chassis plate
- four 70 mm wheels
- 170 mm wheelbase and 150 mm track width
- battery and controller blocks
- front arm and two finger gripper
- 50 mm cube, with its centre 70 mm ahead of the chassis front

The CAD files are in `design/cad/`. The OpenSCAD file is editable. STEP and STL files are also there, but these are concept geometry, not ready-to-manufacture parts.

## why these sizes
The chassis is smaller than the 300 x 200 mm starting footprint. Four wheels should be less likely to get caught than a caster, and the battery being low helps lower the CG.

One issue is the wheel size. A 70 mm wheel has a 35 mm radius, which is smaller than the 40 mm breaker height. It might work on a rounded breaker but not guaranteed for a sharp step. A 90 mm wheel is worth trying, but then the size needs checking again.

## CG calculation
I assumed 1.20 kg for chassis and drive at x=0 mm, 0.35 kg for arm at x=65 mm and 0.10 kg for the cube at x=190 mm.

`xCG = (1.20x0 + 0.35x65 + 0.10x190) / 1.65`
`xCG = 25.3 mm` forward of the chassis centre.

Half the wheelbase is 85 mm, so on flat ground there is about `85 - 25.3 = 59.7 mm` between the estimated CG and the front axle line. This looks okay as a first estimate, but arm movement can shift the CG, so it needs a real test on the 15 degree ramp.

## views
- `dimensions.svg` has the main sizes.
- `exploded_view.svg` is a simple exploded view.
- `media/motion_preview.gif` shows the idea of the movement.

This is only a first design. It still needs real part masses and a proper test before saying it is stable.
