;Volunteer Planner

(define (domain volunteerPlanner)

;remove requirements that are not needed
; TODO remove unutilised types
(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    locatable - object
    volunteer atRiskPerson depot - locatable
    walk bicycle - modeOfTravel
    resource 
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (at ?obj - locatable ?l - locatable)
    (linked ?l1 ?l2 - locatable)
    (usingTransport ?v - volunteer ?m - modeOfTravel)
    (walk ?v - volunteer)
    (satisfied ?p - atRiskPerson)
    (available ?v - volunteer)
    (full ?v - volunteer)
    (emptyVolunteer ?v - volunteer)
    (emptyDepot ?d - depot)
    (onBike ?v - volunteer ?m - modeOfTravel) 
)
;(hasResource ?v - volunteer ?r - resource)

(:functions ;todo: define numeric functions here
    (time-to-arrive ?from ?to - locatable ?mode - modeOfTravel)
    (requires ?p - atRiskPerson ?r - resource)
    (resources-stored ?r - resource ?obj - locatable)
    (capacity ?v -volunteer ?mode - modeOfTravel)
    (resource-size ?r - resource)
)

;define actions here
(:durative-action PICK-UP-RESOURCE
    :parameters (?v - volunteer ?m - modeOfTravel ?r - resource ?d - depot)
    :duration (= ?duration 0.3)
    :condition (and 
        (at start (at ?v ?d))
        (at start (usingTransport ?v ?m))
        (at start (>= (capacity ?v ?m) (resource-size ?r)))
        (at start (>= (resources-stored ?r ?d) 1))
        ;(at start (available ?v))
    )
    :effect (and
        ;(at start (not (available ?v)))
        (at end (decrease (resources-stored ?r ?d) 1))
        (at end (increase (resources-stored ?r ?v) 1))
        (at end (decrease (capacity ?v ?m) (resource-size ?r)))
        ;(at end (available ?v))
    )
)

(:durative-action DELIVER-RESOURCE
    :parameters (?v - volunteer ?m - modeOfTravel ?r - resource ?p - atRiskPerson)
    :duration (= ?duration 0.3)
    :condition (and
        (at start (at ?v ?p))
        (at start (usingTransport ?v ?m))
        (at start (>= (resources-stored ?r ?v) 1))
    )
    :effect (and
        (at end (decrease (resources-stored ?r ?v) 1))
        (at end (decrease (requires ?p ?r) 1))
        (at end (increase (capacity ?v ?m) (resource-size ?r)))
    )
)

(:durative-action TRAVEL
    :parameters (?v - volunteer ?to ?from - locatable, ?mode - modeOfTravel)
    :duration (= ?duration (time-to-arrive ?from ?to ?mode))
    :condition (and
        (at start (at ?v ?from))
        (at start (usingTransport ?v ?mode))
    )
    :effect (and
        (at end (not (at ?v ?from)))
        (at end (at ?v ?to))
    )
)

)
