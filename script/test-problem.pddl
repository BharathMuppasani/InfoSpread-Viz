(define (problem information-spread-problem)
  (:domain information-spread)
  (:objects
    agent0 agent1 agent3 agent4 agent5 agent7 agent8 agent9 agent10 agent11 agent12 agent13 agent14 agent15 agent16 agent17 agent18 agent19 agent20 agent21 agent22 agent23 agent24 agent25 agent26 agent27 agent28 agent29 agent30 agent31 agent32 agent33 agent34 agent35 agent36 agent37 agent38 agent39 agent40 agent41 agent42 agent43 agent44 agent45 agent46 agent47 agent48  - agent
    source2 source6 source49  - source
    topic1  - topic
  )

  (:init

    (connected-agent agent0 agent41)
    (connected-agent agent41 agent0)
    (= (have-trust agent0 agent41) 100)
    (= (have-trust agent41 agent0) 100)

    (connected-agent agent1 agent19)
    (connected-agent agent19 agent1)
    (= (have-trust agent1 agent19) 100)
    (= (have-trust agent19 agent1) 100)

    (connected-agent source2 agent45)
    (connected-agent agent45 source2)
    (= (have-trust source2 agent45) 100)
    (= (have-trust agent45 source2) 100)

    (connected-agent agent3 agent5)
    (connected-agent agent5 agent3)
    (= (have-trust agent3 agent5) 100)
    (= (have-trust agent5 agent3) 100)

    (connected-agent agent4 agent28)
    (connected-agent agent28 agent4)
    (= (have-trust agent4 agent28) 100)
    (= (have-trust agent28 agent4) 100)

    (connected-agent agent5 agent26)
    (connected-agent agent26 agent5)
    (= (have-trust agent5 agent26) 100)
    (= (have-trust agent26 agent5) 100)

    (connected-agent source6 agent21)
    (connected-agent agent21 source6)
    (= (have-trust source6 agent21) 100)
    (= (have-trust agent21 source6) 100)

    (connected-agent agent7 agent11)
    (connected-agent agent11 agent7)
    (= (have-trust agent7 agent11) 100)
    (= (have-trust agent11 agent7) 100)

    (connected-agent agent8 source49)
    (connected-agent source49 agent8)
    (= (have-trust agent8 source49) 100)
    (= (have-trust source49 agent8) 100)

    (connected-agent agent9 agent42)
    (connected-agent agent42 agent9)
    (= (have-trust agent9 agent42) 100)
    (= (have-trust agent42 agent9) 100)

    (connected-agent agent10 agent41)
    (connected-agent agent41 agent10)
    (= (have-trust agent10 agent41) 100)
    (= (have-trust agent41 agent10) 100)

    (connected-agent agent11 agent30)
    (connected-agent agent30 agent11)
    (= (have-trust agent11 agent30) 100)
    (= (have-trust agent30 agent11) 100)

    (connected-agent agent12 agent41)
    (connected-agent agent41 agent12)
    (= (have-trust agent12 agent41) 100)
    (= (have-trust agent41 agent12) 100)

    (connected-agent agent13 agent7)
    (connected-agent agent7 agent13)
    (= (have-trust agent13 agent7) 100)
    (= (have-trust agent7 agent13) 100)

    (connected-agent agent14 agent3)
    (connected-agent agent3 agent14)
    (= (have-trust agent14 agent3) 100)
    (= (have-trust agent3 agent14) 100)

    (connected-agent agent15 agent8)
    (connected-agent agent8 agent15)
    (= (have-trust agent15 agent8) 100)
    (= (have-trust agent8 agent15) 100)

    (connected-agent agent16 agent0)
    (connected-agent agent0 agent16)
    (= (have-trust agent16 agent0) 100)
    (= (have-trust agent0 agent16) 100)

    (connected-agent agent17 agent31)
    (connected-agent agent31 agent17)
    (= (have-trust agent17 agent31) 100)
    (= (have-trust agent31 agent17) 100)

    (connected-agent agent18 agent8)
    (connected-agent agent8 agent18)
    (= (have-trust agent18 agent8) 100)
    (= (have-trust agent8 agent18) 100)

    (connected-agent agent19 agent47)
    (connected-agent agent47 agent19)
    (= (have-trust agent19 agent47) 100)
    (= (have-trust agent47 agent19) 100)

    (connected-agent agent21 agent35)
    (connected-agent agent35 agent21)
    (= (have-trust agent21 agent35) 100)
    (= (have-trust agent35 agent21) 100)

    (connected-agent agent22 agent11)
    (connected-agent agent11 agent22)
    (= (have-trust agent22 agent11) 100)
    (= (have-trust agent11 agent22) 100)

    (connected-agent agent23 agent13)
    (connected-agent agent13 agent23)
    (= (have-trust agent23 agent13) 100)
    (= (have-trust agent13 agent23) 100)

    (connected-agent agent24 agent32)
    (connected-agent agent32 agent24)
    (= (have-trust agent24 agent32) 100)
    (= (have-trust agent32 agent24) 100)

    (connected-agent agent25 agent8)
    (connected-agent agent8 agent25)
    (= (have-trust agent25 agent8) 100)
    (= (have-trust agent8 agent25) 100)

    (connected-agent agent26 agent32)
    (connected-agent agent32 agent26)
    (= (have-trust agent26 agent32) 100)
    (= (have-trust agent32 agent26) 100)

    (connected-agent agent27 agent11)
    (connected-agent agent11 agent27)
    (= (have-trust agent27 agent11) 100)
    (= (have-trust agent11 agent27) 100)

    (connected-agent agent28 agent34)
    (connected-agent agent34 agent28)
    (= (have-trust agent28 agent34) 100)
    (= (have-trust agent34 agent28) 100)

    (connected-agent agent29 agent23)
    (connected-agent agent23 agent29)
    (= (have-trust agent29 agent23) 100)
    (= (have-trust agent23 agent29) 100)

    (connected-agent agent30 source49)
    (connected-agent source49 agent30)
    (= (have-trust agent30 source49) 100)
    (= (have-trust source49 agent30) 100)

    (connected-agent agent31 agent30)
    (connected-agent agent30 agent31)
    (= (have-trust agent31 agent30) 100)
    (= (have-trust agent30 agent31) 100)

    (connected-agent agent32 agent28)
    (connected-agent agent28 agent32)
    (= (have-trust agent32 agent28) 100)
    (= (have-trust agent28 agent32) 100)

    (connected-agent agent33 agent0)
    (connected-agent agent0 agent33)
    (= (have-trust agent33 agent0) 100)
    (= (have-trust agent0 agent33) 100)

    (connected-agent agent34 agent1)
    (connected-agent agent1 agent34)
    (= (have-trust agent34 agent1) 100)
    (= (have-trust agent1 agent34) 100)

    (connected-agent agent35 agent32)
    (connected-agent agent32 agent35)
    (= (have-trust agent35 agent32) 100)
    (= (have-trust agent32 agent35) 100)

    (connected-agent agent36 source49)
    (connected-agent source49 agent36)
    (= (have-trust agent36 source49) 100)
    (= (have-trust source49 agent36) 100)

    (connected-agent agent37 agent27)
    (connected-agent agent27 agent37)
    (= (have-trust agent37 agent27) 100)
    (= (have-trust agent27 agent37) 100)

    (connected-agent agent38 agent19)
    (connected-agent agent19 agent38)
    (= (have-trust agent38 agent19) 100)
    (= (have-trust agent19 agent38) 100)

    (connected-agent agent39 agent21)
    (connected-agent agent21 agent39)
    (= (have-trust agent39 agent21) 100)
    (= (have-trust agent21 agent39) 100)

    (connected-agent agent40 agent30)
    (connected-agent agent30 agent40)
    (= (have-trust agent40 agent30) 100)
    (= (have-trust agent30 agent40) 100)

    (connected-agent agent41 agent24)
    (connected-agent agent24 agent41)
    (= (have-trust agent41 agent24) 100)
    (= (have-trust agent24 agent41) 100)

    (connected-agent agent42 agent10)
    (connected-agent agent10 agent42)
    (= (have-trust agent42 agent10) 100)
    (= (have-trust agent10 agent42) 100)

    (connected-agent agent43 source2)
    (connected-agent source2 agent43)
    (= (have-trust agent43 source2) 100)
    (= (have-trust source2 agent43) 100)

    (connected-agent agent44 agent17)
    (connected-agent agent17 agent44)
    (= (have-trust agent44 agent17) 100)
    (= (have-trust agent17 agent44) 100)

    (connected-agent agent45 agent27)
    (connected-agent agent27 agent45)
    (= (have-trust agent45 agent27) 100)
    (= (have-trust agent27 agent45) 100)

    (connected-agent agent46 agent17)
    (connected-agent agent17 agent46)
    (= (have-trust agent46 agent17) 100)
    (= (have-trust agent17 agent46) 100)

    (connected-agent agent47 agent30)
    (connected-agent agent30 agent47)
    (= (have-trust agent47 agent30) 100)
    (= (have-trust agent30 agent47) 100)

    (connected-agent agent48 agent32)
    (connected-agent agent32 agent48)
    (= (have-trust agent48 agent32) 100)
    (= (have-trust agent32 agent48) 100)

    (connected-agent source49 agent14)
    (connected-agent agent14 source49)
    (= (have-trust source49 agent14) 100)
    (= (have-trust agent14 source49) 100)


    (= (have-stance agent0 topic1) 81)

    (= (have-stance agent1 topic1) 50)

    (= (have-stance source2 topic1) 100)

    (= (have-stance agent3 topic1) 77)

    (= (have-stance agent4 topic1) 5)

    (= (have-stance agent5 topic1) -76)

    (= (have-stance source6 topic1) 100)

    (= (have-stance agent7 topic1) 73)

    (= (have-stance agent8 topic1) -22)

    (= (have-stance agent9 topic1) 59)

    (= (have-stance agent10 topic1) 34)

    (= (have-stance agent11 topic1) 25)

    (= (have-stance agent12 topic1) -15)

    (= (have-stance agent13 topic1) 27)

    (= (have-stance agent14 topic1) 59)

    (= (have-stance agent15 topic1) 51)

    (= (have-stance agent16 topic1) -30)

    (= (have-stance agent17 topic1) 69)

    (= (have-stance agent18 topic1) -77)

    (= (have-stance agent19 topic1) -91)

    (= (have-stance agent20 topic1) -94)

    (= (have-stance agent21 topic1) -80)

    (= (have-stance agent22 topic1) 36)

    (= (have-stance agent23 topic1) -91)

    (= (have-stance agent24 topic1) 88)

    (= (have-stance agent25 topic1) 81)

    (= (have-stance agent26 topic1) -44)

    (= (have-stance agent27 topic1) -96)

    (= (have-stance agent28 topic1) 20)

    (= (have-stance agent29 topic1) 4)

    (= (have-stance agent30 topic1) -69)

    (= (have-stance agent31 topic1) 43)

    (= (have-stance agent32 topic1) 21)

    (= (have-stance agent33 topic1) -89)

    (= (have-stance agent34 topic1) -34)

    (= (have-stance agent35 topic1) -41)

    (= (have-stance agent36 topic1) 64)

    (= (have-stance agent37 topic1) -32)

    (= (have-stance agent38 topic1) -1)

    (= (have-stance agent39 topic1) -32)

    (= (have-stance agent40 topic1) 50)

    (= (have-stance agent41 topic1) -33)

    (= (have-stance agent42 topic1) 91)

    (= (have-stance agent43 topic1) 71)

    (= (have-stance agent44 topic1) -50)

    (= (have-stance agent45 topic1) -61)

    (= (have-stance agent46 topic1) 79)

    (= (have-stance agent47 topic1) 59)

    (= (have-stance agent48 topic1) -54)

    (= (have-stance source49 topic1) 100)


  )

  (:goal
    (and
      (>= (have-stance agent13 topic1) 90)
      (<= (have-stance agent13 topic1) 110)
    )
  )
)
