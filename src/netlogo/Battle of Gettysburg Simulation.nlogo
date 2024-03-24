extensions [time]

globals [
  number-of-confederate-soldiers
  number-of-union-soldiers
  confederate-starting-points
  confederate-infantry-starting-points
  confederate-cavalry-starting-points
  confederate-artillery-starting-points
  confederate-objective-points

  union-infantry-starting-points
  union-cavalry-starting-points
  union-artillery-starting-points
  union-ending-points
  current-date-time
  time-of-reinforcement
  turtle-troop-size
  initial-fight-point
  minutes-per-tick
  union-infantry-reinforcement_points
  union-artillery-reinforcement_points
  confederate-infantry-reinforcement_points
  confederate-artillery-reinforcement_points
]

breed [union-army union-soldiers]
breed [confederate-army confederate-soldiers]
turtles-own [union-target confederate-target]

breed [confederate-infantry Cinfantry]
;breed [confederate-cavalry Ccavalry]
breed [confederate-artillery Cartillery]
breed [union-infantry Uinfantry]
;breed [union-cavalry Ucavalry]
breed [union-artillery Uartillery]

confederate-army-own [
  health
  troop-type  ;
]

union-army-own [
  health
   troop-type  ;
]

to-report confederate-troop-count
  report count confederate-army * (turtle-troop-size)
end

to-report union-troop-count
  report count union-army * (turtle-troop-size)
end

to-report confederate-troop-killed
  report (number-of-confederate-soldiers - count confederate-army) * (turtle-troop-size)
end

to-report union-troop-killed
  report (number-of-union-soldiers - count union-army) * (turtle-troop-size)
end

to-report fight-started
  report union-troop-killed > 0 or confederate-troop-killed > 0
end

to LittleRoundTop_Historical
  clear-all
  historical-control-scenario
end

to LittleRoundTop_EarlyConfAttack_BothReinforcements
  clear-all
  battle_scenario1
end

to LittleRoundTop_HistoricalConfAttack_ConfReinforcementsOnly
  clear-all
  battle_scenario2
end

to LittleRoundTop_EarlyConfAttack_UnionReinforcementsOnly
  clear-all
  battle_scenario3
end
;=======================================================================================================================
to historical-control-scenario
  set minutes-per-tick 60
  ; day 2
  set turtle-troop-size 100
  set confederate-infantry-starting-points patches at-points [
    [-6 29][-6 28][-6 28][-6 27][-5 29][-4 29][-5 28];[16 36][16 37][16 38][16 39]
    ]

  set confederate-cavalry-starting-points patches at-points [
    [-10 6]
  ]

  set confederate-artillery-starting-points patches at-points [
    [-6 29][-5 30][-4 30][-7 28]
  ]

;    set confederate-objective-points patches at-points [
;    [-1 24]
;    ]

    set union-infantry-starting-points patches at-points [
    ;[4 31] [4 32][4 33][3 34][1 34]; Slocum
    [0 34][-1 33][-1 32][-1 31][-1 30][-1 29][-1 28][1 32][1 30]; Main Hook
    [-5 27][-6 27][-5 26][-4 26][-3 26][-5 25][-4 27][-3 27][-3 25][-2 27][-2 28][-3 28][-4 28]; Peach Orchard
    ]

;  set union-cavalry-starting-points patches at-points [
;    [10 6]
;  ]

    set union-artillery-starting-points patches at-points [
    [-4 26][-4 27][-3 27][-5 27][-1 32][-1 31][-1 30][1 32][0 33] 
  ]
  
    set union-infantry-reinforcement_points patches at-points [
    [-1 -9]
    ]
  
   set union-artillery-reinforcement_points patches at-points [
    [-1 -10]
    ]
  
    set confederate-objective-points patches at-points [
    ;  [32 26][32 25][32 24]
    ;  [33 27][33 26][33 25][33 24]
    ;  [34 27][34 26][34 25][34 24]
    ;  [35 26][35 25]
  ]

    set union-ending-points patches at-points [
      [38 4][38 3]
     ; [37 4][37 3]
    ;  [36 4][36 3]
    ]
  
    ;set confederate-attack-strength 60
    ;set union-attack-strength 40
    ;set run-away-protection-bonus 32

    import-drawing "Gettysburg.png"
    set current-date-time time:create "1863/07/02 16:00"
    set time-of-day "4:00 PM"
    set number-of-confederate-soldiers 15000 / (turtle-troop-size)
    set number-of-union-soldiers 10000 / (turtle-troop-size)

  ask union-infantry-starting-points [
    set pcolor blue
  ]

;    ask union-cavalry-starting-points [
;    set pcolor blue
;  ]


    ask union-artillery-starting-points [
    set pcolor blue
  ]

    ask confederate-infantry-starting-points [
    set pcolor red
  ]

;    ask union-cavalry-starting-points [
;    set pcolor blue
;  ]
  
    ask confederate-artillery-starting-points [
    set pcolor red
  ]

  create-confederate-army (number-of-confederate-soldiers * 0.9) [
    set shape "person"  ; Example shape for infantry
    set color red
    set troop-type "infantry"
    set health 100
    set size .5
    move-to one-of confederate-infantry-starting-points
  ]
  create-confederate-army (number-of-confederate-soldiers * 0.1) [
    set shape "cannon"  ; Example shape for artillery
    set color red
    set troop-type "artillery"
    set health 300
    set size 1
    move-to one-of confederate-artillery-starting-points
  ]
  create-union-army (number-of-union-soldiers * 0.8) [
    set shape "person"  ; Example shape for infantry
    set color blue
    set troop-type "infantry"
    set health 100
    set size .5
    move-to one-of union-infantry-starting-points
  ]
  create-union-army (number-of-union-soldiers * 0.2) [
    set shape "cannon"  ; Example shape for artillery
    set color blue
    set troop-type "artillery"
    set health 300
    set size 1
    move-to one-of union-artillery-starting-points
  ]
  reset-ticks
end
;=======================================================================================================================
to battle_scenario1

  set minutes-per-tick 60
  ; day 2
  set turtle-troop-size 100
  set confederate-infantry-starting-points patches at-points [
    [-6 29][-6 28][-6 28][-6 27][-5 29][-4 29][-5 28];[16 36][16 37][16 38][16 39]
    ]

  set confederate-cavalry-starting-points patches at-points [
    [-10 6]
  ]

  set confederate-artillery-starting-points patches at-points [
    [-6 29][-5 30][-4 30][-7 28]
  ]
;    set confederate-objective-points patches at-points [
;    [-1 24]
;    ]
 set confederate-infantry-reinforcement_points patches at-points [
    [-5 -5]
    ]
  
   set confederate-artillery-reinforcement_points patches at-points [
    [-7 -5]
    ]
  
    set union-infantry-starting-points patches at-points [
    ;[4 31] [4 32][4 33][3 34][1 34]; Slocum
    [0 34][-1 33][-1 32][-1 31][-1 30][-1 29][-1 28][1 32][1 30]; Main Hook
    [-5 27][-6 27][-5 26][-4 26][-3 26][-5 25][-4 27][-3 27][-3 25][-2 27][-2 28][-3 28][-4 28]; Peach Orchard
    ]

;  set union-cavalry-starting-points patches at-points [
;    [10 6]
;  ]

  set union-artillery-starting-points patches at-points [
    [-4 26][-4 27][-3 27][-5 27][-1 32][-1 31][-1 30][1 32][0 33]
  ]
  
  set union-infantry-reinforcement_points patches at-points [
    [-1 -9]
    ]
  
   set union-artillery-reinforcement_points patches at-points [
    [-1 -10]
    ]

    ;set confederate-objective-points patches at-points [
    ;  [32 26][32 25][32 24]
    ;  [33 27][33 26][33 25][33 24]
    ;  [34 27][34 26][34 25][34 24]
    ;  [35 26][35 25]
  ;]

    set union-ending-points patches at-points [
      [38 4][38 3]
     ; [37 4][37 3]
    ;  [36 4][36 3]
    ]

    ;set confederate-attack-strength 60
    ;set union-attack-strength 40
    ;set run-away-protection-bonus 32

    import-drawing "Gettysburg.png"
    set current-date-time time:create "1863/07/02 10:00"
    set time-of-day "10:00 AM"
    set number-of-confederate-soldiers 16000 / (turtle-troop-size)
    set number-of-union-soldiers 10000 / (turtle-troop-size)

  ask union-infantry-starting-points [
    set pcolor blue
  ]

;    ask union-cavalry-starting-points [
;    set pcolor blue
;  ]

    ask union-artillery-starting-points [
    set pcolor blue
  ]

    ask confederate-infantry-starting-points [
    set pcolor red
  ]

;    ask union-cavalry-starting-points [
;    set pcolor blue
;  ]

    ask confederate-artillery-starting-points [
    set pcolor red
  ]

  create-confederate-army (number-of-confederate-soldiers * 0.9) [
    set shape "person"  ; Example shape for infantry
    set color red
    set troop-type "infantry"
    set health 100
    set size .5
    move-to one-of confederate-infantry-starting-points
  ]
  create-confederate-army (number-of-confederate-soldiers * 0.1) [
    set shape "cannon"  ; Example shape for artillery
    set color red
    set troop-type "artillery"
    set health 300
    set size 1
    move-to one-of confederate-artillery-starting-points
  ]
  create-union-army (number-of-union-soldiers * 0.8) [
    set shape "person"  ; Example shape for infantry
    set color blue
    set troop-type "infantry"
    set health 100
    set size .5
    move-to one-of union-infantry-starting-points
  ]
  create-union-army (number-of-union-soldiers * 0.2) [
    set shape "cannon"  ; Example shape for artillery
    set color blue
    set troop-type "artillery"
    set health 300
    set size 1
    move-to one-of union-artillery-starting-points
  ]

  reset-ticks
end
;=======================================================================================================================
to battle_scenario2
  set minutes-per-tick 60
  ; day 2

  set turtle-troop-size 100
  set confederate-infantry-starting-points patches at-points [
    [-6 29][-6 28][-6 28][-6 27][-5 29][-4 29][-5 28];[16 36][16 37][16 38][16 39]
    ]

  set confederate-cavalry-starting-points patches at-points [
    [-10 6]
  ]

  set confederate-artillery-starting-points patches at-points [
    [-6 29][-5 30][-4 30][-7 28]
  ]

;    set confederate-objective-points patches at-points [
;    [-1 24]
;    ]
  
   set confederate-infantry-reinforcement_points patches at-points [
    [-5 -5]
    ]
  
   set confederate-artillery-reinforcement_points patches at-points [
    [-7 -5]
    ]
    set union-infantry-starting-points patches at-points [
    ;[4 31] [4 32][4 33][3 34][1 34]; Slocum
    [0 34][-1 33][-1 32][-1 31][-1 30][-1 29][-1 28][1 32][1 30]; Main Hook
    [-5 27][-6 27][-5 26][-4 26][-3 26][-5 25][-4 27][-3 27][-3 25][-2 27][-2 28][-3 28][-4 28]; Peach Orchard
    ]
  
;  set union-cavalry-starting-points patches at-points [
;    [10 6]
;  ]

  set union-artillery-starting-points patches at-points [
    [-4 26][-4 27][-3 27][-5 27][-1 32][-1 31][-1 30][1 32][0 33]
  ]

    set confederate-objective-points patches at-points [
    ;  [32 26][32 25][32 24]
    ;  [33 27][33 26][33 25][33 24]
    ;  [34 27][34 26][34 25][34 24]
    ;  [35 26][35 25]
  ]

    set union-ending-points patches at-points [
      [38 4][38 3]
     ; [37 4][37 3]
    ;  [36 4][36 3]
    ]

    ;set confederate-attack-strength 60
    ;set union-attack-strength 40
    ;set run-away-protection-bonus 32

    import-drawing "Gettysburg.png"
    set current-date-time time:create "1863/07/02 16:00"
    set time-of-day "4:00 PM"
    set number-of-confederate-soldiers 15000 / (turtle-troop-size)
    set number-of-union-soldiers 10000 / (turtle-troop-size)

  ask union-infantry-starting-points [
    set pcolor blue
  ]

;    ask union-cavalry-starting-points [
;    set pcolor blue
;  ]

    ask union-artillery-starting-points [
    set pcolor blue
  ]

    ask confederate-infantry-starting-points [
    set pcolor red
  ]

;    ask union-cavalry-starting-points [
;    set pcolor blue
;  ]

    ask confederate-artillery-starting-points [
    set pcolor red
  ]

  create-confederate-army (number-of-confederate-soldiers * 0.9) [
    set shape "person"  ; Example shape for infantry
    set color red
    set troop-type "infantry"
    set health 100
    set size .5
    move-to one-of confederate-infantry-starting-points
  ]
  create-confederate-army (number-of-confederate-soldiers * 0.1) [
    set shape "cannon"  ; Example shape for artillery
    set color red
    set troop-type "artillery"
    set health 300
    set size 1
    move-to one-of confederate-artillery-starting-points
  ]
  create-union-army (number-of-union-soldiers * 0.8) [
    set shape "person"  ; Example shape for infantry
    set color blue
    set troop-type "infantry"
    set health 100
    set size .5
    move-to one-of union-infantry-starting-points
  ]
  create-union-army (number-of-union-soldiers * 0.2) [
    set shape "cannon"  ; Example shape for artillery
    set color blue
    set troop-type "artillery"
    set health 300
    set size 1
    move-to one-of union-artillery-starting-points
  ]

  reset-ticks
end
;=======================================================================================================================
to battle_scenario3
  set minutes-per-tick 60
  ; day 2

  set turtle-troop-size 100
  set confederate-infantry-starting-points patches at-points [
    [-6 29][-6 28][-6 28][-6 27][-5 29][-4 29][-5 28];[16 36][16 37][16 38][16 39]
    ]

  set confederate-cavalry-starting-points patches at-points [
    [-10 6]
  ]

  set confederate-artillery-starting-points patches at-points [
    [-6 29][-5 30][-4 30][-7 28]
  ]

;    set confederate-objective-points patches at-points [
;    [-1 24]
;    ]

    set union-infantry-starting-points patches at-points [
    ;[4 31] [4 32][4 33][3 34][1 34]; Slocum
    [0 34][-1 33][-1 32][-1 31][-1 30][-1 29][-1 28][1 32][1 30]; Main Hook
    [-5 27][-6 27][-5 26][-4 26][-3 26][-5 25][-4 27][-3 27][-3 25][-2 27][-2 28][-3 28][-4 28]; Peach Orchard
    ]

    set union-infantry-reinforcement_points patches at-points [
    [-1 -9]
    ]
  
   set union-artillery-reinforcement_points patches at-points [
    [-1 -10]
    ]
  
;  set union-cavalry-starting-points patches at-points [
;    [10 6]
;  ]

  set union-artillery-starting-points patches at-points [
    [-4 26][-4 27][-3 27][-5 27][-1 32][-1 31][-1 30][1 32][0 33]
  ]

    set confederate-objective-points patches at-points [
    ;  [32 26][32 25][32 24]
    ;  [33 27][33 26][33 25][33 24]
    ;  [34 27][34 26][34 25][34 24]
    ;  [35 26][35 25]
  ]

    set union-ending-points patches at-points [
      [38 4][38 3]
     ; [37 4][37 3]
    ;  [36 4][36 3]
    ]

    ;set confederate-attack-strength 60
    ;set union-attack-strength 40
    ;set run-away-protection-bonus 32

    import-drawing "Gettysburg.png"
    set current-date-time time:create "1863/07/02 10:00"
    set time-of-day "10:00 AM"
    set number-of-confederate-soldiers 15000 / (turtle-troop-size)
    set number-of-union-soldiers 10000 / (turtle-troop-size)

  ask union-infantry-starting-points [
    set pcolor blue
  ]

;    ask union-cavalry-starting-points [
;    set pcolor blue
;  ]

    ask union-artillery-starting-points [
    set pcolor blue
  ]

    ask confederate-infantry-starting-points [
    set pcolor red
  ]

;    ask union-cavalry-starting-points [
;    set pcolor blue
;  ]

    ask confederate-artillery-starting-points [
    set pcolor red
  ]

  create-confederate-army (number-of-confederate-soldiers * 0.9) [
    set shape "person"  ; Example shape for infantry
    set color red
    set troop-type "infantry"
    set health 100
    set size .5
    move-to one-of confederate-infantry-starting-points
  ]
  create-confederate-army (number-of-confederate-soldiers * 0.1) [
    set shape "cannon"  ; Example shape for artillery
    set color red
    set troop-type "artillery"
    set health 300
    set size 1
    move-to one-of confederate-artillery-starting-points
  ]
  create-union-army (number-of-union-soldiers * 0.8) [
    set shape "person"  ; Example shape for infantry
    set color blue
    set troop-type "infantry"
    set health 100
    set size .5
    move-to one-of union-infantry-starting-points
  ]
  create-union-army (number-of-union-soldiers * 0.2) [
    set shape "cannon"  ; Example shape for artillery
    set color blue
    set troop-type "artillery"
    set health 300
    set size 1
    move-to one-of union-artillery-starting-points
  ]

  reset-ticks
end
;=======================================================================================================================
to HistoricalBattle
    ; if one army is wiped out, end the battle
  if not any? confederate-army or not any? union-army [
    stopSimulation
    stop
  ]
    ask turtles [
    ifelse breed = confederate-army
    [confederateTroopAction]
    [unionTroopAction]
   ]
    ; Code to create new Union soldiers and add them to the simulation
   if time-of-day = "4:00 PM"
  [
    add-union-reinforcements
  ]
  
  set current-date-time time:plus current-date-time minutes-per-tick "minutes"
  set time-of-day time:show current-date-time "hh:mm a"
  tick
end
;=======================================================================================================================
to Battle1
    ; if one army is wiped out, end the battle
  if not any? confederate-army or not any? union-army [
    stopSimulation
    stop
  ]
    ask turtles [
    ifelse breed = confederate-army
    [confederateTroopAction]
    [unionTroopAction]
   ]
  
   if ticks = 6
  [
    add-union-reinforcements
  ]
  
  set current-date-time time:plus current-date-time minutes-per-tick "minutes"
  set time-of-day time:show current-date-time "hh:mm a"
  tick
end
;=======================================================================================================================
to Battle2
    ; if one army is wiped out, end the battle
  if not any? confederate-army or not any? union-army [
    stopSimulation
    stop
  ]
    ask turtles [
    ifelse breed = confederate-army
    [confederateTroopAction]
    [unionTroopAction]
   ]
  
  if time-of-day = "4:00 PM"
  [
    add-confederate-reinforcements
  ]

  set current-date-time time:plus current-date-time minutes-per-tick "minutes"
  set time-of-day time:show current-date-time "hh:mm a"
  tick
end
;=======================================================================================================================
to Battle3
    ; if one army is wiped out, end the battle
  if not any? confederate-army or not any? union-army [
    stopSimulation
    stop
  ]
    ask turtles [
    ifelse breed = confederate-army
    [confederateTroopAction]
    [unionTroopAction]
   ]
  
    if ticks = 4
  [
    add-union-reinforcements
  ]
  
  set current-date-time time:plus current-date-time minutes-per-tick "minutes"
  set time-of-day time:show current-date-time "hh:mm a"
  tick
end
;=======================================================================================================================
to add-union-reinforcements
  ; Code to create new Union soldiers and add them to the simulation
  create-union-army (number-of-union-soldiers * 0.2) [
    set shape "person"  ; Example shape for infantry
    set color blue
    set troop-type "infantry"
    set health 100
    set size .5
    move-to one-of union-infantry-reinforcement_points
    unionTroopAction
    ]
  create-union-army (number-of-union-soldiers * 0.1) [
    set shape "cannon"  ; Example shape for artillery
    set color blue
    set troop-type "artillery"
    set health 300
    set size 1
    move-to one-of union-artillery-reinforcement_points
    unionTroopAction
    ]
end

to add-confederate-reinforcements
  ; Code to create new Union soldiers and add them to the simulation
  create-confederate-army (number-of-confederate-soldiers * 0.1) [
    set shape "person"  ; Example shape for infantry
    set color red
    set troop-type "infantry"
    set health 100
    set size .5
    move-to one-of confederate-infantry-reinforcement_points
    confederateTroopAction
    ]
  create-confederate-army (number-of-confederate-soldiers * 0.1) [
    set shape "cannon"  ; Example shape for artillery
    set color red
    set troop-type "artillery"
    set health 300
    set size 1
    move-to one-of confederate-artillery-reinforcement_points
    confederateTroopAction
    ]
end
;=======================================================================================================================
to confederateTroopAction
  ifelse troop-type = "infantry" [
    ifelse any? union-army [
      let target one-of union-army with [health > 0]
      if target != nobody [
        face target
        ifelse distance target <= 3 [
          fight-turtle self target
        ]
        [
          ifelse xcor = -1 and ycor = 24 [
            ; If the troop has reached its destination, it continues to fight
            fight-turtle self target
          ]
          [
            ; If the troop hasn't reached its destination, it moves forward
            face patch -1 24
            forward 1
          ]
        ]
      ]
    ][
      face patch -1 24
      forward 1
    ]
  ]
  [
    if any? union-army [
      let target one-of union-army with [health > 0]
      if target != nobody [
        face target
        ifelse distance target <= 6 [
          fight-turtle-artillery self target
        ] [
          ifelse xcor = -1 and ycor = 24 [
            ; If the troop has reached its destination, it continues to fight
            fight-turtle-artillery self target
          ]
          [
            ; If the troop hasn't reached its destination, it moves forward
            face patch -1 24
            forward 1
          ]
        ]
      ]
    ]
  ]
end

to unionTroopAction
  ifelse troop-type = "infantry" [
    ifelse any? confederate-army [
      let target one-of confederate-army with [health > 0]
      if target != nobody [
        face target
        ifelse distance target <= 3 [
          fight-turtle self target
        ]
        [
        ]
      ]
    ][
    ]

  ]
    [
   if any? confederate-army [
      let target one-of confederate-army with [health > 0]
      if target != nobody [
        face target
        ifelse distance target <= 6 [
          fight-turtle-artillery self target
        ] [
        ]
      ]
    ]
  ]
end
;=======================================================================================================================
to fight-turtle [attacker target]
  let hit? (random-float 100 < 30)
  if hit? [
    let damage 40
    ask target [
      set health health - damage
      if health <= 0 [
        die
      ]
    ]
  ]

end;

to fight-turtle-artillery [attacker target]
  let hit? (random-float 100 < 60)
  if hit? [
    let damage 100
    ask target [
      set health health - damage
      if health <= 0 [
        die
      ]
    ]
  ]

end;
;=======================================================================================================================
to stopSimulation
  ask confederate-army [
    let target one-of union-army
    if target != nobody [
      face target
    ]
  ]
  ask union-army [
    let target one-of confederate-army
    if target != nobody [
      face target
    ]
  ]
end
