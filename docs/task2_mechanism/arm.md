# 2b - arm choice

I'd go with a **2 link arm with a wrist**. It can reach forward and up, and the wrist helps keep the gripper in a useful position. It does need more than one servo and the base joint will have to handle the arm's weight.

| option | reach / fold | actuators | base torque | stiffness | accuracy | easy to build | total |
|---|---:|---:|---:|---:|---:|---:|---:|
| 2 link arm | 4 | 3 | 3 | 3 | 4 | 4 | 3.55 |
| 3 link + wrist | 5 | 4 | 2 | 3 | 5 | 2 | 3.55 |
| lift + short arm | 3 | 2 | 4 | 4 | 3 | 3 | 3.30 |
| telescopic arm | 5 | 2 | 3 | 2 | 3 | 2 | 3.15 |

Weights: reach/fold 20%, actuators 10%, base torque 20%, stiffness 15%, accuracy 20%, build complexity 15%. Scores are estimates, higher is better. For actuator count, higher score means fewer actuators.

The 3-link option is close, but I picked the 2-link because it seems easier to make and explain for a first version.

## reach check
Assume base height `hs = 100 mm`, and two links of 220 mm each. At a simple pose with both links at 45 degrees:

`z = 100 + 220 sin45° + 220 sin90°`
`z = 100 + 155.6 + 220 = 475.6 mm`

So it can pass 450 mm in this rough geometry. The arm still needs to fold into the 300 x 200 x 300 mm start box, so the real joint angles and servo placement have to be checked in CAD. Ground clearance should stay at least 50 mm.
