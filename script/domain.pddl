(define (domain information-spread)
  (:requirements :strips :typing :fluents :conditional-effects)
  (:types agent source topic ) ;location )
  
  ; Predicates
  (:predicates
    ; Information source predicates
    (connected-agent ?a1 - (either agent source) ?a2 - (either agent source) )
  )

  ; Numeric fluents
  (:functions
    (have-stance ?a ?t)
    (have-trust ?truster ?trustee)
  )

  (:action spread-info-from
    :parameters (?a - (either agent source) ?t - topic)
    :precondition (and ) ;(>= (have-stance ?a ?t) -1) (<= (have-stance ?a ?t) 1))
    :effect (and
              (forall (?a2 - agent) 
                (when (connected-agent ?a ?a2) (and (increase (have-stance ?a2 ?t) (/ (* (have-trust ?a2 ?a) (- (have-stance ?a ?t) (have-stance ?a2 ?t)) ) 100)  ) ))
              )

              (forall (?a2 - agent)
                (when (and (connected-agent ?a ?a2) 
                          (< (+ (have-stance ?a2 ?t) (/ (* (have-trust ?a2 ?a) (- (have-stance ?a ?t) (have-stance ?a2 ?t))) 100) ) -100))
                  ; Clip the stance value to -1 if it goes below
                  (assign (have-stance ?a2 ?t) -100)
                )
              )
                
              (forall (?a2 - agent)
                (when (and (connected-agent ?a ?a2)
                          (> (+ (have-stance ?a2 ?t) (/ (* (have-trust ?a2 ?a) (- (have-stance ?a ?t) (have-stance ?a2 ?t))) 100) ) 100))
                  ; Clip the stance value to 1 if it goes above
                  (assign (have-stance ?a2 ?t) 100)
                )
              )
            )
  )

  ; Other actions and predicates can be defined here as per your requirements

)