(define (problem information-spread-problem)
  (:domain information-spread)
  (:objects
    agent0 agent1 agent2 agent3 agent4 agent5 agent6 agent7 agent8 agent9 agent10 agent11 agent12 agent13 agent14 agent15 agent16 agent17 agent18 agent19 agent20 agent21 agent22 agent23 agent24 agent25 agent26 agent27 agent28 agent29 agent30 agent31 agent32 agent33 agent34 agent35 agent36 agent37 agent38 agent39 agent40 agent41 agent42 agent43 agent44 agent45 agent47 agent48 agent49 agent50 agent51 agent52 agent53 agent54 agent55 agent56 agent57 agent58 agent59 agent60 agent61 agent62 agent63 agent64 agent65 agent66 agent67 agent68 agent69 agent70 agent71 agent72 agent73 agent74 agent75 agent76 agent77 agent78 agent79 agent80 agent81 agent83 agent84 agent85 agent86 agent87 agent88 agent89 agent90 agent91 agent92 agent93 agent94 agent95 agent96 agent97 agent98 agent99  - agent
    source46 source82  - source
    topic1  - topic
  )

  (:init

    (connected-agent agent0 agent1)
    (connected-agent agent1 agent0)
    (= (have-trust agent0 agent1) 100)
    (= (have-trust agent1 agent0) 100)

    (connected-agent agent0 agent99)
    (connected-agent agent99 agent0)
    (= (have-trust agent0 agent99) 100)
    (= (have-trust agent99 agent0) 100)

    (connected-agent agent0 agent2)
    (connected-agent agent2 agent0)
    (= (have-trust agent0 agent2) 100)
    (= (have-trust agent2 agent0) 100)

    (connected-agent agent0 agent98)
    (connected-agent agent98 agent0)
    (= (have-trust agent0 agent98) 100)
    (= (have-trust agent98 agent0) 100)

    (connected-agent agent1 agent2)
    (connected-agent agent2 agent1)
    (= (have-trust agent1 agent2) 100)
    (= (have-trust agent2 agent1) 100)

    (connected-agent agent1 agent3)
    (connected-agent agent3 agent1)
    (= (have-trust agent1 agent3) 100)
    (= (have-trust agent3 agent1) 100)

    (connected-agent agent1 agent99)
    (connected-agent agent99 agent1)
    (= (have-trust agent1 agent99) 100)
    (= (have-trust agent99 agent1) 100)

    (connected-agent agent2 agent3)
    (connected-agent agent3 agent2)
    (= (have-trust agent2 agent3) 100)
    (= (have-trust agent3 agent2) 100)

    (connected-agent agent2 agent4)
    (connected-agent agent4 agent2)
    (= (have-trust agent2 agent4) 100)
    (= (have-trust agent4 agent2) 100)

    (connected-agent agent3 agent5)
    (connected-agent agent5 agent3)
    (= (have-trust agent3 agent5) 100)
    (= (have-trust agent5 agent3) 100)

    (connected-agent agent3 agent72)
    (connected-agent agent72 agent3)
    (= (have-trust agent3 agent72) 100)
    (= (have-trust agent72 agent3) 100)

    (connected-agent agent4 agent5)
    (connected-agent agent5 agent4)
    (= (have-trust agent4 agent5) 100)
    (= (have-trust agent5 agent4) 100)

    (connected-agent agent4 agent6)
    (connected-agent agent6 agent4)
    (= (have-trust agent4 agent6) 100)
    (= (have-trust agent6 agent4) 100)

    (connected-agent agent4 agent96)
    (connected-agent agent96 agent4)
    (= (have-trust agent4 agent96) 100)
    (= (have-trust agent96 agent4) 100)

    (connected-agent agent5 agent6)
    (connected-agent agent6 agent5)
    (= (have-trust agent5 agent6) 100)
    (= (have-trust agent6 agent5) 100)

    (connected-agent agent5 agent7)
    (connected-agent agent7 agent5)
    (= (have-trust agent5 agent7) 100)
    (= (have-trust agent7 agent5) 100)

    (connected-agent agent6 agent7)
    (connected-agent agent7 agent6)
    (= (have-trust agent6 agent7) 100)
    (= (have-trust agent7 agent6) 100)

    (connected-agent agent6 agent75)
    (connected-agent agent75 agent6)
    (= (have-trust agent6 agent75) 100)
    (= (have-trust agent75 agent6) 100)

    (connected-agent agent7 agent8)
    (connected-agent agent8 agent7)
    (= (have-trust agent7 agent8) 100)
    (= (have-trust agent8 agent7) 100)

    (connected-agent agent7 agent9)
    (connected-agent agent9 agent7)
    (= (have-trust agent7 agent9) 100)
    (= (have-trust agent9 agent7) 100)

    (connected-agent agent8 agent9)
    (connected-agent agent9 agent8)
    (= (have-trust agent8 agent9) 100)
    (= (have-trust agent9 agent8) 100)

    (connected-agent agent8 agent10)
    (connected-agent agent10 agent8)
    (= (have-trust agent8 agent10) 100)
    (= (have-trust agent10 agent8) 100)

    (connected-agent agent9 agent10)
    (connected-agent agent10 agent9)
    (= (have-trust agent9 agent10) 100)
    (= (have-trust agent10 agent9) 100)

    (connected-agent agent9 agent11)
    (connected-agent agent11 agent9)
    (= (have-trust agent9 agent11) 100)
    (= (have-trust agent11 agent9) 100)

    (connected-agent agent10 agent11)
    (connected-agent agent11 agent10)
    (= (have-trust agent10 agent11) 100)
    (= (have-trust agent11 agent10) 100)

    (connected-agent agent10 agent12)
    (connected-agent agent12 agent10)
    (= (have-trust agent10 agent12) 100)
    (= (have-trust agent12 agent10) 100)

    (connected-agent agent11 agent12)
    (connected-agent agent12 agent11)
    (= (have-trust agent11 agent12) 100)
    (= (have-trust agent12 agent11) 100)

    (connected-agent agent11 agent13)
    (connected-agent agent13 agent11)
    (= (have-trust agent11 agent13) 100)
    (= (have-trust agent13 agent11) 100)

    (connected-agent agent12 agent14)
    (connected-agent agent14 agent12)
    (= (have-trust agent12 agent14) 100)
    (= (have-trust agent14 agent12) 100)

    (connected-agent agent12 agent88)
    (connected-agent agent88 agent12)
    (= (have-trust agent12 agent88) 100)
    (= (have-trust agent88 agent12) 100)

    (connected-agent agent12 agent45)
    (connected-agent agent45 agent12)
    (= (have-trust agent12 agent45) 100)
    (= (have-trust agent45 agent12) 100)

    (connected-agent agent13 agent14)
    (connected-agent agent14 agent13)
    (= (have-trust agent13 agent14) 100)
    (= (have-trust agent14 agent13) 100)

    (connected-agent agent13 agent15)
    (connected-agent agent15 agent13)
    (= (have-trust agent13 agent15) 100)
    (= (have-trust agent15 agent13) 100)

    (connected-agent agent13 agent76)
    (connected-agent agent76 agent13)
    (= (have-trust agent13 agent76) 100)
    (= (have-trust agent76 agent13) 100)

    (connected-agent agent14 agent15)
    (connected-agent agent15 agent14)
    (= (have-trust agent14 agent15) 100)
    (= (have-trust agent15 agent14) 100)

    (connected-agent agent14 agent16)
    (connected-agent agent16 agent14)
    (= (have-trust agent14 agent16) 100)
    (= (have-trust agent16 agent14) 100)

    (connected-agent agent14 agent35)
    (connected-agent agent35 agent14)
    (= (have-trust agent14 agent35) 100)
    (= (have-trust agent35 agent14) 100)

    (connected-agent agent15 agent16)
    (connected-agent agent16 agent15)
    (= (have-trust agent15 agent16) 100)
    (= (have-trust agent16 agent15) 100)

    (connected-agent agent15 agent17)
    (connected-agent agent17 agent15)
    (= (have-trust agent15 agent17) 100)
    (= (have-trust agent17 agent15) 100)

    (connected-agent agent16 agent17)
    (connected-agent agent17 agent16)
    (= (have-trust agent16 agent17) 100)
    (= (have-trust agent17 agent16) 100)

    (connected-agent agent16 agent18)
    (connected-agent agent18 agent16)
    (= (have-trust agent16 agent18) 100)
    (= (have-trust agent18 agent16) 100)

    (connected-agent agent17 agent19)
    (connected-agent agent19 agent17)
    (= (have-trust agent17 agent19) 100)
    (= (have-trust agent19 agent17) 100)

    (connected-agent agent17 agent76)
    (connected-agent agent76 agent17)
    (= (have-trust agent17 agent76) 100)
    (= (have-trust agent76 agent17) 100)

    (connected-agent agent18 agent19)
    (connected-agent agent19 agent18)
    (= (have-trust agent18 agent19) 100)
    (= (have-trust agent19 agent18) 100)

    (connected-agent agent18 agent20)
    (connected-agent agent20 agent18)
    (= (have-trust agent18 agent20) 100)
    (= (have-trust agent20 agent18) 100)

    (connected-agent agent19 agent20)
    (connected-agent agent20 agent19)
    (= (have-trust agent19 agent20) 100)
    (= (have-trust agent20 agent19) 100)

    (connected-agent agent19 agent21)
    (connected-agent agent21 agent19)
    (= (have-trust agent19 agent21) 100)
    (= (have-trust agent21 agent19) 100)

    (connected-agent agent20 agent21)
    (connected-agent agent21 agent20)
    (= (have-trust agent20 agent21) 100)
    (= (have-trust agent21 agent20) 100)

    (connected-agent agent20 agent22)
    (connected-agent agent22 agent20)
    (= (have-trust agent20 agent22) 100)
    (= (have-trust agent22 agent20) 100)

    (connected-agent agent21 agent22)
    (connected-agent agent22 agent21)
    (= (have-trust agent21 agent22) 100)
    (= (have-trust agent22 agent21) 100)

    (connected-agent agent21 agent89)
    (connected-agent agent89 agent21)
    (= (have-trust agent21 agent89) 100)
    (= (have-trust agent89 agent21) 100)

    (connected-agent agent22 agent23)
    (connected-agent agent23 agent22)
    (= (have-trust agent22 agent23) 100)
    (= (have-trust agent23 agent22) 100)

    (connected-agent agent22 agent24)
    (connected-agent agent24 agent22)
    (= (have-trust agent22 agent24) 100)
    (= (have-trust agent24 agent22) 100)

    (connected-agent agent23 agent24)
    (connected-agent agent24 agent23)
    (= (have-trust agent23 agent24) 100)
    (= (have-trust agent24 agent23) 100)

    (connected-agent agent23 agent25)
    (connected-agent agent25 agent23)
    (= (have-trust agent23 agent25) 100)
    (= (have-trust agent25 agent23) 100)

    (connected-agent agent24 agent26)
    (connected-agent agent26 agent24)
    (= (have-trust agent24 agent26) 100)
    (= (have-trust agent26 agent24) 100)

    (connected-agent agent24 agent41)
    (connected-agent agent41 agent24)
    (= (have-trust agent24 agent41) 100)
    (= (have-trust agent41 agent24) 100)

    (connected-agent agent25 agent26)
    (connected-agent agent26 agent25)
    (= (have-trust agent25 agent26) 100)
    (= (have-trust agent26 agent25) 100)

    (connected-agent agent25 agent27)
    (connected-agent agent27 agent25)
    (= (have-trust agent25 agent27) 100)
    (= (have-trust agent27 agent25) 100)

    (connected-agent agent26 agent27)
    (connected-agent agent27 agent26)
    (= (have-trust agent26 agent27) 100)
    (= (have-trust agent27 agent26) 100)

    (connected-agent agent26 agent28)
    (connected-agent agent28 agent26)
    (= (have-trust agent26 agent28) 100)
    (= (have-trust agent28 agent26) 100)

    (connected-agent agent27 agent28)
    (connected-agent agent28 agent27)
    (= (have-trust agent27 agent28) 100)
    (= (have-trust agent28 agent27) 100)

    (connected-agent agent27 agent29)
    (connected-agent agent29 agent27)
    (= (have-trust agent27 agent29) 100)
    (= (have-trust agent29 agent27) 100)

    (connected-agent agent28 agent29)
    (connected-agent agent29 agent28)
    (= (have-trust agent28 agent29) 100)
    (= (have-trust agent29 agent28) 100)

    (connected-agent agent28 agent30)
    (connected-agent agent30 agent28)
    (= (have-trust agent28 agent30) 100)
    (= (have-trust agent30 agent28) 100)

    (connected-agent agent29 agent30)
    (connected-agent agent30 agent29)
    (= (have-trust agent29 agent30) 100)
    (= (have-trust agent30 agent29) 100)

    (connected-agent agent29 agent31)
    (connected-agent agent31 agent29)
    (= (have-trust agent29 agent31) 100)
    (= (have-trust agent31 agent29) 100)

    (connected-agent agent30 agent31)
    (connected-agent agent31 agent30)
    (= (have-trust agent30 agent31) 100)
    (= (have-trust agent31 agent30) 100)

    (connected-agent agent30 agent32)
    (connected-agent agent32 agent30)
    (= (have-trust agent30 agent32) 100)
    (= (have-trust agent32 agent30) 100)

    (connected-agent agent31 agent32)
    (connected-agent agent32 agent31)
    (= (have-trust agent31 agent32) 100)
    (= (have-trust agent32 agent31) 100)

    (connected-agent agent31 agent33)
    (connected-agent agent33 agent31)
    (= (have-trust agent31 agent33) 100)
    (= (have-trust agent33 agent31) 100)

    (connected-agent agent32 agent33)
    (connected-agent agent33 agent32)
    (= (have-trust agent32 agent33) 100)
    (= (have-trust agent33 agent32) 100)

    (connected-agent agent32 agent34)
    (connected-agent agent34 agent32)
    (= (have-trust agent32 agent34) 100)
    (= (have-trust agent34 agent32) 100)

    (connected-agent agent33 agent34)
    (connected-agent agent34 agent33)
    (= (have-trust agent33 agent34) 100)
    (= (have-trust agent34 agent33) 100)

    (connected-agent agent33 agent35)
    (connected-agent agent35 agent33)
    (= (have-trust agent33 agent35) 100)
    (= (have-trust agent35 agent33) 100)

    (connected-agent agent34 agent35)
    (connected-agent agent35 agent34)
    (= (have-trust agent34 agent35) 100)
    (= (have-trust agent35 agent34) 100)

    (connected-agent agent34 agent36)
    (connected-agent agent36 agent34)
    (= (have-trust agent34 agent36) 100)
    (= (have-trust agent36 agent34) 100)

    (connected-agent agent35 agent36)
    (connected-agent agent36 agent35)
    (= (have-trust agent35 agent36) 100)
    (= (have-trust agent36 agent35) 100)

    (connected-agent agent36 agent37)
    (connected-agent agent37 agent36)
    (= (have-trust agent36 agent37) 100)
    (= (have-trust agent37 agent36) 100)

    (connected-agent agent36 agent38)
    (connected-agent agent38 agent36)
    (= (have-trust agent36 agent38) 100)
    (= (have-trust agent38 agent36) 100)

    (connected-agent agent37 agent39)
    (connected-agent agent39 agent37)
    (= (have-trust agent37 agent39) 100)
    (= (have-trust agent39 agent37) 100)

    (connected-agent agent37 agent71)
    (connected-agent agent71 agent37)
    (= (have-trust agent37 agent71) 100)
    (= (have-trust agent71 agent37) 100)

    (connected-agent agent38 agent39)
    (connected-agent agent39 agent38)
    (= (have-trust agent38 agent39) 100)
    (= (have-trust agent39 agent38) 100)

    (connected-agent agent38 agent40)
    (connected-agent agent40 agent38)
    (= (have-trust agent38 agent40) 100)
    (= (have-trust agent40 agent38) 100)

    (connected-agent agent39 agent40)
    (connected-agent agent40 agent39)
    (= (have-trust agent39 agent40) 100)
    (= (have-trust agent40 agent39) 100)

    (connected-agent agent39 agent41)
    (connected-agent agent41 agent39)
    (= (have-trust agent39 agent41) 100)
    (= (have-trust agent41 agent39) 100)

    (connected-agent agent40 agent41)
    (connected-agent agent41 agent40)
    (= (have-trust agent40 agent41) 100)
    (= (have-trust agent41 agent40) 100)

    (connected-agent agent40 agent42)
    (connected-agent agent42 agent40)
    (= (have-trust agent40 agent42) 100)
    (= (have-trust agent42 agent40) 100)

    (connected-agent agent41 agent42)
    (connected-agent agent42 agent41)
    (= (have-trust agent41 agent42) 100)
    (= (have-trust agent42 agent41) 100)

    (connected-agent agent41 agent43)
    (connected-agent agent43 agent41)
    (= (have-trust agent41 agent43) 100)
    (= (have-trust agent43 agent41) 100)

    (connected-agent agent42 agent43)
    (connected-agent agent43 agent42)
    (= (have-trust agent42 agent43) 100)
    (= (have-trust agent43 agent42) 100)

    (connected-agent agent42 agent44)
    (connected-agent agent44 agent42)
    (= (have-trust agent42 agent44) 100)
    (= (have-trust agent44 agent42) 100)

    (connected-agent agent43 agent44)
    (connected-agent agent44 agent43)
    (= (have-trust agent43 agent44) 100)
    (= (have-trust agent44 agent43) 100)

    (connected-agent agent43 agent45)
    (connected-agent agent45 agent43)
    (= (have-trust agent43 agent45) 100)
    (= (have-trust agent45 agent43) 100)

    (connected-agent agent44 agent45)
    (connected-agent agent45 agent44)
    (= (have-trust agent44 agent45) 100)
    (= (have-trust agent45 agent44) 100)

    (connected-agent agent44 source46)
    (connected-agent source46 agent44)
    (= (have-trust agent44 source46) 100)
    (= (have-trust source46 agent44) 100)

    (connected-agent agent45 agent47)
    (connected-agent agent47 agent45)
    (= (have-trust agent45 agent47) 100)
    (= (have-trust agent47 agent45) 100)

    (connected-agent source46 agent47)
    (connected-agent agent47 source46)
    (= (have-trust source46 agent47) 100)
    (= (have-trust agent47 source46) 100)

    (connected-agent source46 agent48)
    (connected-agent agent48 source46)
    (= (have-trust source46 agent48) 100)
    (= (have-trust agent48 source46) 100)

    (connected-agent agent47 agent48)
    (connected-agent agent48 agent47)
    (= (have-trust agent47 agent48) 100)
    (= (have-trust agent48 agent47) 100)

    (connected-agent agent47 agent49)
    (connected-agent agent49 agent47)
    (= (have-trust agent47 agent49) 100)
    (= (have-trust agent49 agent47) 100)

    (connected-agent agent48 agent49)
    (connected-agent agent49 agent48)
    (= (have-trust agent48 agent49) 100)
    (= (have-trust agent49 agent48) 100)

    (connected-agent agent48 agent50)
    (connected-agent agent50 agent48)
    (= (have-trust agent48 agent50) 100)
    (= (have-trust agent50 agent48) 100)

    (connected-agent agent49 agent50)
    (connected-agent agent50 agent49)
    (= (have-trust agent49 agent50) 100)
    (= (have-trust agent50 agent49) 100)

    (connected-agent agent49 agent51)
    (connected-agent agent51 agent49)
    (= (have-trust agent49 agent51) 100)
    (= (have-trust agent51 agent49) 100)

    (connected-agent agent49 agent78)
    (connected-agent agent78 agent49)
    (= (have-trust agent49 agent78) 100)
    (= (have-trust agent78 agent49) 100)

    (connected-agent agent50 agent51)
    (connected-agent agent51 agent50)
    (= (have-trust agent50 agent51) 100)
    (= (have-trust agent51 agent50) 100)

    (connected-agent agent50 agent52)
    (connected-agent agent52 agent50)
    (= (have-trust agent50 agent52) 100)
    (= (have-trust agent52 agent50) 100)

    (connected-agent agent51 agent52)
    (connected-agent agent52 agent51)
    (= (have-trust agent51 agent52) 100)
    (= (have-trust agent52 agent51) 100)

    (connected-agent agent51 agent53)
    (connected-agent agent53 agent51)
    (= (have-trust agent51 agent53) 100)
    (= (have-trust agent53 agent51) 100)

    (connected-agent agent52 agent53)
    (connected-agent agent53 agent52)
    (= (have-trust agent52 agent53) 100)
    (= (have-trust agent53 agent52) 100)

    (connected-agent agent52 agent54)
    (connected-agent agent54 agent52)
    (= (have-trust agent52 agent54) 100)
    (= (have-trust agent54 agent52) 100)

    (connected-agent agent53 agent54)
    (connected-agent agent54 agent53)
    (= (have-trust agent53 agent54) 100)
    (= (have-trust agent54 agent53) 100)

    (connected-agent agent53 agent55)
    (connected-agent agent55 agent53)
    (= (have-trust agent53 agent55) 100)
    (= (have-trust agent55 agent53) 100)

    (connected-agent agent54 agent55)
    (connected-agent agent55 agent54)
    (= (have-trust agent54 agent55) 100)
    (= (have-trust agent55 agent54) 100)

    (connected-agent agent54 agent56)
    (connected-agent agent56 agent54)
    (= (have-trust agent54 agent56) 100)
    (= (have-trust agent56 agent54) 100)

    (connected-agent agent55 agent56)
    (connected-agent agent56 agent55)
    (= (have-trust agent55 agent56) 100)
    (= (have-trust agent56 agent55) 100)

    (connected-agent agent55 agent57)
    (connected-agent agent57 agent55)
    (= (have-trust agent55 agent57) 100)
    (= (have-trust agent57 agent55) 100)

    (connected-agent agent56 agent57)
    (connected-agent agent57 agent56)
    (= (have-trust agent56 agent57) 100)
    (= (have-trust agent57 agent56) 100)

    (connected-agent agent56 agent58)
    (connected-agent agent58 agent56)
    (= (have-trust agent56 agent58) 100)
    (= (have-trust agent58 agent56) 100)

    (connected-agent agent57 agent58)
    (connected-agent agent58 agent57)
    (= (have-trust agent57 agent58) 100)
    (= (have-trust agent58 agent57) 100)

    (connected-agent agent57 agent59)
    (connected-agent agent59 agent57)
    (= (have-trust agent57 agent59) 100)
    (= (have-trust agent59 agent57) 100)

    (connected-agent agent58 agent59)
    (connected-agent agent59 agent58)
    (= (have-trust agent58 agent59) 100)
    (= (have-trust agent59 agent58) 100)

    (connected-agent agent58 agent60)
    (connected-agent agent60 agent58)
    (= (have-trust agent58 agent60) 100)
    (= (have-trust agent60 agent58) 100)

    (connected-agent agent58 agent65)
    (connected-agent agent65 agent58)
    (= (have-trust agent58 agent65) 100)
    (= (have-trust agent65 agent58) 100)

    (connected-agent agent59 agent60)
    (connected-agent agent60 agent59)
    (= (have-trust agent59 agent60) 100)
    (= (have-trust agent60 agent59) 100)

    (connected-agent agent59 agent61)
    (connected-agent agent61 agent59)
    (= (have-trust agent59 agent61) 100)
    (= (have-trust agent61 agent59) 100)

    (connected-agent agent60 agent61)
    (connected-agent agent61 agent60)
    (= (have-trust agent60 agent61) 100)
    (= (have-trust agent61 agent60) 100)

    (connected-agent agent60 agent62)
    (connected-agent agent62 agent60)
    (= (have-trust agent60 agent62) 100)
    (= (have-trust agent62 agent60) 100)

    (connected-agent agent61 agent62)
    (connected-agent agent62 agent61)
    (= (have-trust agent61 agent62) 100)
    (= (have-trust agent62 agent61) 100)

    (connected-agent agent61 agent63)
    (connected-agent agent63 agent61)
    (= (have-trust agent61 agent63) 100)
    (= (have-trust agent63 agent61) 100)

    (connected-agent agent62 agent63)
    (connected-agent agent63 agent62)
    (= (have-trust agent62 agent63) 100)
    (= (have-trust agent63 agent62) 100)

    (connected-agent agent62 agent64)
    (connected-agent agent64 agent62)
    (= (have-trust agent62 agent64) 100)
    (= (have-trust agent64 agent62) 100)

    (connected-agent agent63 agent64)
    (connected-agent agent64 agent63)
    (= (have-trust agent63 agent64) 100)
    (= (have-trust agent64 agent63) 100)

    (connected-agent agent63 agent65)
    (connected-agent agent65 agent63)
    (= (have-trust agent63 agent65) 100)
    (= (have-trust agent65 agent63) 100)

    (connected-agent agent64 agent65)
    (connected-agent agent65 agent64)
    (= (have-trust agent64 agent65) 100)
    (= (have-trust agent65 agent64) 100)

    (connected-agent agent64 agent94)
    (connected-agent agent94 agent64)
    (= (have-trust agent64 agent94) 100)
    (= (have-trust agent94 agent64) 100)

    (connected-agent agent65 agent66)
    (connected-agent agent66 agent65)
    (= (have-trust agent65 agent66) 100)
    (= (have-trust agent66 agent65) 100)

    (connected-agent agent66 agent67)
    (connected-agent agent67 agent66)
    (= (have-trust agent66 agent67) 100)
    (= (have-trust agent67 agent66) 100)

    (connected-agent agent66 agent68)
    (connected-agent agent68 agent66)
    (= (have-trust agent66 agent68) 100)
    (= (have-trust agent68 agent66) 100)

    (connected-agent agent67 agent68)
    (connected-agent agent68 agent67)
    (= (have-trust agent67 agent68) 100)
    (= (have-trust agent68 agent67) 100)

    (connected-agent agent67 agent69)
    (connected-agent agent69 agent67)
    (= (have-trust agent67 agent69) 100)
    (= (have-trust agent69 agent67) 100)

    (connected-agent agent67 agent77)
    (connected-agent agent77 agent67)
    (= (have-trust agent67 agent77) 100)
    (= (have-trust agent77 agent67) 100)

    (connected-agent agent68 agent69)
    (connected-agent agent69 agent68)
    (= (have-trust agent68 agent69) 100)
    (= (have-trust agent69 agent68) 100)

    (connected-agent agent68 agent70)
    (connected-agent agent70 agent68)
    (= (have-trust agent68 agent70) 100)
    (= (have-trust agent70 agent68) 100)

    (connected-agent agent69 agent70)
    (connected-agent agent70 agent69)
    (= (have-trust agent69 agent70) 100)
    (= (have-trust agent70 agent69) 100)

    (connected-agent agent69 agent71)
    (connected-agent agent71 agent69)
    (= (have-trust agent69 agent71) 100)
    (= (have-trust agent71 agent69) 100)

    (connected-agent agent70 agent71)
    (connected-agent agent71 agent70)
    (= (have-trust agent70 agent71) 100)
    (= (have-trust agent71 agent70) 100)

    (connected-agent agent70 agent72)
    (connected-agent agent72 agent70)
    (= (have-trust agent70 agent72) 100)
    (= (have-trust agent72 agent70) 100)

    (connected-agent agent71 agent72)
    (connected-agent agent72 agent71)
    (= (have-trust agent71 agent72) 100)
    (= (have-trust agent72 agent71) 100)

    (connected-agent agent71 agent73)
    (connected-agent agent73 agent71)
    (= (have-trust agent71 agent73) 100)
    (= (have-trust agent73 agent71) 100)

    (connected-agent agent72 agent73)
    (connected-agent agent73 agent72)
    (= (have-trust agent72 agent73) 100)
    (= (have-trust agent73 agent72) 100)

    (connected-agent agent72 agent74)
    (connected-agent agent74 agent72)
    (= (have-trust agent72 agent74) 100)
    (= (have-trust agent74 agent72) 100)

    (connected-agent agent73 agent74)
    (connected-agent agent74 agent73)
    (= (have-trust agent73 agent74) 100)
    (= (have-trust agent74 agent73) 100)

    (connected-agent agent73 agent75)
    (connected-agent agent75 agent73)
    (= (have-trust agent73 agent75) 100)
    (= (have-trust agent75 agent73) 100)

    (connected-agent agent74 agent75)
    (connected-agent agent75 agent74)
    (= (have-trust agent74 agent75) 100)
    (= (have-trust agent75 agent74) 100)

    (connected-agent agent74 agent76)
    (connected-agent agent76 agent74)
    (= (have-trust agent74 agent76) 100)
    (= (have-trust agent76 agent74) 100)

    (connected-agent agent75 agent76)
    (connected-agent agent76 agent75)
    (= (have-trust agent75 agent76) 100)
    (= (have-trust agent76 agent75) 100)

    (connected-agent agent75 agent77)
    (connected-agent agent77 agent75)
    (= (have-trust agent75 agent77) 100)
    (= (have-trust agent77 agent75) 100)

    (connected-agent agent76 agent77)
    (connected-agent agent77 agent76)
    (= (have-trust agent76 agent77) 100)
    (= (have-trust agent77 agent76) 100)

    (connected-agent agent77 agent78)
    (connected-agent agent78 agent77)
    (= (have-trust agent77 agent78) 100)
    (= (have-trust agent78 agent77) 100)

    (connected-agent agent78 agent79)
    (connected-agent agent79 agent78)
    (= (have-trust agent78 agent79) 100)
    (= (have-trust agent79 agent78) 100)

    (connected-agent agent79 agent80)
    (connected-agent agent80 agent79)
    (= (have-trust agent79 agent80) 100)
    (= (have-trust agent80 agent79) 100)

    (connected-agent agent79 agent81)
    (connected-agent agent81 agent79)
    (= (have-trust agent79 agent81) 100)
    (= (have-trust agent81 agent79) 100)

    (connected-agent agent79 agent97)
    (connected-agent agent97 agent79)
    (= (have-trust agent79 agent97) 100)
    (= (have-trust agent97 agent79) 100)

    (connected-agent agent80 agent81)
    (connected-agent agent81 agent80)
    (= (have-trust agent80 agent81) 100)
    (= (have-trust agent81 agent80) 100)

    (connected-agent agent80 source82)
    (connected-agent source82 agent80)
    (= (have-trust agent80 source82) 100)
    (= (have-trust source82 agent80) 100)

    (connected-agent agent81 source82)
    (connected-agent source82 agent81)
    (= (have-trust agent81 source82) 100)
    (= (have-trust source82 agent81) 100)

    (connected-agent agent81 agent83)
    (connected-agent agent83 agent81)
    (= (have-trust agent81 agent83) 100)
    (= (have-trust agent83 agent81) 100)

    (connected-agent source82 agent83)
    (connected-agent agent83 source82)
    (= (have-trust source82 agent83) 100)
    (= (have-trust agent83 source82) 100)

    (connected-agent source82 agent84)
    (connected-agent agent84 source82)
    (= (have-trust source82 agent84) 100)
    (= (have-trust agent84 source82) 100)

    (connected-agent agent83 agent84)
    (connected-agent agent84 agent83)
    (= (have-trust agent83 agent84) 100)
    (= (have-trust agent84 agent83) 100)

    (connected-agent agent83 agent85)
    (connected-agent agent85 agent83)
    (= (have-trust agent83 agent85) 100)
    (= (have-trust agent85 agent83) 100)

    (connected-agent agent84 agent85)
    (connected-agent agent85 agent84)
    (= (have-trust agent84 agent85) 100)
    (= (have-trust agent85 agent84) 100)

    (connected-agent agent84 agent86)
    (connected-agent agent86 agent84)
    (= (have-trust agent84 agent86) 100)
    (= (have-trust agent86 agent84) 100)

    (connected-agent agent85 agent86)
    (connected-agent agent86 agent85)
    (= (have-trust agent85 agent86) 100)
    (= (have-trust agent86 agent85) 100)

    (connected-agent agent85 agent87)
    (connected-agent agent87 agent85)
    (= (have-trust agent85 agent87) 100)
    (= (have-trust agent87 agent85) 100)

    (connected-agent agent86 agent87)
    (connected-agent agent87 agent86)
    (= (have-trust agent86 agent87) 100)
    (= (have-trust agent87 agent86) 100)

    (connected-agent agent86 agent88)
    (connected-agent agent88 agent86)
    (= (have-trust agent86 agent88) 100)
    (= (have-trust agent88 agent86) 100)

    (connected-agent agent87 agent88)
    (connected-agent agent88 agent87)
    (= (have-trust agent87 agent88) 100)
    (= (have-trust agent88 agent87) 100)

    (connected-agent agent87 agent89)
    (connected-agent agent89 agent87)
    (= (have-trust agent87 agent89) 100)
    (= (have-trust agent89 agent87) 100)

    (connected-agent agent88 agent89)
    (connected-agent agent89 agent88)
    (= (have-trust agent88 agent89) 100)
    (= (have-trust agent89 agent88) 100)

    (connected-agent agent88 agent90)
    (connected-agent agent90 agent88)
    (= (have-trust agent88 agent90) 100)
    (= (have-trust agent90 agent88) 100)

    (connected-agent agent89 agent90)
    (connected-agent agent90 agent89)
    (= (have-trust agent89 agent90) 100)
    (= (have-trust agent90 agent89) 100)

    (connected-agent agent89 agent91)
    (connected-agent agent91 agent89)
    (= (have-trust agent89 agent91) 100)
    (= (have-trust agent91 agent89) 100)

    (connected-agent agent90 agent91)
    (connected-agent agent91 agent90)
    (= (have-trust agent90 agent91) 100)
    (= (have-trust agent91 agent90) 100)

    (connected-agent agent90 agent92)
    (connected-agent agent92 agent90)
    (= (have-trust agent90 agent92) 100)
    (= (have-trust agent92 agent90) 100)

    (connected-agent agent91 agent92)
    (connected-agent agent92 agent91)
    (= (have-trust agent91 agent92) 100)
    (= (have-trust agent92 agent91) 100)

    (connected-agent agent91 agent93)
    (connected-agent agent93 agent91)
    (= (have-trust agent91 agent93) 100)
    (= (have-trust agent93 agent91) 100)

    (connected-agent agent92 agent93)
    (connected-agent agent93 agent92)
    (= (have-trust agent92 agent93) 100)
    (= (have-trust agent93 agent92) 100)

    (connected-agent agent92 agent94)
    (connected-agent agent94 agent92)
    (= (have-trust agent92 agent94) 100)
    (= (have-trust agent94 agent92) 100)

    (connected-agent agent93 agent94)
    (connected-agent agent94 agent93)
    (= (have-trust agent93 agent94) 100)
    (= (have-trust agent94 agent93) 100)

    (connected-agent agent93 agent95)
    (connected-agent agent95 agent93)
    (= (have-trust agent93 agent95) 100)
    (= (have-trust agent95 agent93) 100)

    (connected-agent agent94 agent95)
    (connected-agent agent95 agent94)
    (= (have-trust agent94 agent95) 100)
    (= (have-trust agent95 agent94) 100)

    (connected-agent agent94 agent96)
    (connected-agent agent96 agent94)
    (= (have-trust agent94 agent96) 100)
    (= (have-trust agent96 agent94) 100)

    (connected-agent agent95 agent96)
    (connected-agent agent96 agent95)
    (= (have-trust agent95 agent96) 100)
    (= (have-trust agent96 agent95) 100)

    (connected-agent agent95 agent97)
    (connected-agent agent97 agent95)
    (= (have-trust agent95 agent97) 100)
    (= (have-trust agent97 agent95) 100)

    (connected-agent agent96 agent97)
    (connected-agent agent97 agent96)
    (= (have-trust agent96 agent97) 100)
    (= (have-trust agent97 agent96) 100)

    (connected-agent agent97 agent98)
    (connected-agent agent98 agent97)
    (= (have-trust agent97 agent98) 100)
    (= (have-trust agent98 agent97) 100)

    (connected-agent agent98 agent99)
    (connected-agent agent99 agent98)
    (= (have-trust agent98 agent99) 100)
    (= (have-trust agent99 agent98) 100)


    (= (have-stance agent0 topic1) -6)

    (= (have-stance agent1 topic1) -4)

    (= (have-stance agent2 topic1) 8)

    (= (have-stance agent3 topic1) 28)

    (= (have-stance agent4 topic1) 77)

    (= (have-stance agent5 topic1) 93)

    (= (have-stance agent6 topic1) -49)

    (= (have-stance agent7 topic1) 56)

    (= (have-stance agent8 topic1) -55)

    (= (have-stance agent9 topic1) 28)

    (= (have-stance agent10 topic1) 28)

    (= (have-stance agent11 topic1) 67)

    (= (have-stance agent12 topic1) 20)

    (= (have-stance agent13 topic1) 74)

    (= (have-stance agent14 topic1) 94)

    (= (have-stance agent15 topic1) 60)

    (= (have-stance agent16 topic1) -85)

    (= (have-stance agent17 topic1) 77)

    (= (have-stance agent18 topic1) 34)

    (= (have-stance agent19 topic1) 25)

    (= (have-stance agent20 topic1) -24)

    (= (have-stance agent21 topic1) -32)

    (= (have-stance agent22 topic1) 37)

    (= (have-stance agent23 topic1) 32)

    (= (have-stance agent24 topic1) 89)

    (= (have-stance agent25 topic1) 8)

    (= (have-stance agent26 topic1) 82)

    (= (have-stance agent27 topic1) -50)

    (= (have-stance agent28 topic1) 60)

    (= (have-stance agent29 topic1) 34)

    (= (have-stance agent30 topic1) -19)

    (= (have-stance agent31 topic1) 62)

    (= (have-stance agent32 topic1) 28)

    (= (have-stance agent33 topic1) 52)

    (= (have-stance agent34 topic1) -93)

    (= (have-stance agent35 topic1) 59)

    (= (have-stance agent36 topic1) 96)

    (= (have-stance agent37 topic1) -91)

    (= (have-stance agent38 topic1) -76)

    (= (have-stance agent39 topic1) 91)

    (= (have-stance agent40 topic1) -56)

    (= (have-stance agent41 topic1) 20)

    (= (have-stance agent42 topic1) 13)

    (= (have-stance agent43 topic1) 26)

    (= (have-stance agent44 topic1) -54)

    (= (have-stance agent45 topic1) 66)

    (= (have-stance source46 topic1) 100)

    (= (have-stance agent47 topic1) -90)

    (= (have-stance agent48 topic1) 16)

    (= (have-stance agent49 topic1) 83)

    (= (have-stance agent50 topic1) 100)

    (= (have-stance agent51 topic1) -88)

    (= (have-stance agent52 topic1) 86)

    (= (have-stance agent53 topic1) 90)

    (= (have-stance agent54 topic1) 11)

    (= (have-stance agent55 topic1) -91)

    (= (have-stance agent56 topic1) -23)

    (= (have-stance agent57 topic1) 2)

    (= (have-stance agent58 topic1) -84)

    (= (have-stance agent59 topic1) 66)

    (= (have-stance agent60 topic1) 54)

    (= (have-stance agent61 topic1) 12)

    (= (have-stance agent62 topic1) -98)

    (= (have-stance agent63 topic1) 36)

    (= (have-stance agent64 topic1) -10)

    (= (have-stance agent65 topic1) -35)

    (= (have-stance agent66 topic1) -62)

    (= (have-stance agent67 topic1) -78)

    (= (have-stance agent68 topic1) -93)

    (= (have-stance agent69 topic1) 43)

    (= (have-stance agent70 topic1) 65)

    (= (have-stance agent71 topic1) 14)

    (= (have-stance agent72 topic1) -73)

    (= (have-stance agent73 topic1) 60)

    (= (have-stance agent74 topic1) 48)

    (= (have-stance agent75 topic1) -85)

    (= (have-stance agent76 topic1) 89)

    (= (have-stance agent77 topic1) 64)

    (= (have-stance agent78 topic1) -98)

    (= (have-stance agent79 topic1) -24)

    (= (have-stance agent80 topic1) 55)

    (= (have-stance agent81 topic1) -12)

    (= (have-stance source82 topic1) 100)

    (= (have-stance agent83 topic1) 62)

    (= (have-stance agent84 topic1) -83)

    (= (have-stance agent85 topic1) -76)

    (= (have-stance agent86 topic1) -65)

    (= (have-stance agent87 topic1) 26)

    (= (have-stance agent88 topic1) -96)

    (= (have-stance agent89 topic1) 56)

    (= (have-stance agent90 topic1) -96)

    (= (have-stance agent91 topic1) 31)

    (= (have-stance agent92 topic1) -76)

    (= (have-stance agent93 topic1) -36)

    (= (have-stance agent94 topic1) 76)

    (= (have-stance agent95 topic1) 23)

    (= (have-stance agent96 topic1) -8)

    (= (have-stance agent97 topic1) 7)

    (= (have-stance agent98 topic1) -55)

    (= (have-stance agent99 topic1) -33)


  )

  (:goal
    (and
      (>= (have-stance agent78 topic1) 90)
      (<= (have-stance agent78 topic1) 110)
    )
  )
)
