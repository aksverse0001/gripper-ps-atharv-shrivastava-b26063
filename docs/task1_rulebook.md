# task 1 - rulebook

## 1. size and reach
At the start the bot has to fit in 300 x 200 x 300 mm. The arm needs to grab an object with its centre 450 mm above the ground, and clearance from the ground should be at least 50 mm.

## 2. disconnect
If the controller disconnects, the drive motors and arm stop. Gripper stays where it was, and the bot stays disabled until it gets a valid command again.

## 3. power
- 3S LiPo: 3 x 4.2 = **12.6 V**, so it is under 24 V and allowed.
- 6S LiPo: 6 x 4.2 = **25.2 V**, so it goes over the limit and is not allowed.

## 4. score
Completed: Pickup, Ascent, Bridge, Descent, Touchdown and The End.

Obstacle points: 10 + 30 + 10 + 60 + 10 + 10 = **130**, so A = 130.

Time is 250 s. Since this is under 300 s, T = 300 - 250 = **50**. This is below the 100 point cap.

Penalties: cube dropped once = 15 points. One wheel goes off track once = 10 points. So P = 15 + 10 = **25**.

Final score = A + T - P = 130 + 50 - 25 = **155 points**.
