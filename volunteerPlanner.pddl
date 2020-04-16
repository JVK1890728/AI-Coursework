;Volunteer Planner

(define (domain volunteerPlanner)

;remove requirements that are not needed
; TODO remove unutilised types
(:requirements :fluents :durative-actions :typing :duration-inequalities :equality)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    locatable - object
    volunteer atRiskPerson depot - locatable
    modeOfTravel
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
 (activePeriod ?v - volunteer)
)

;define actions here
(:durative-action PICK-UP-RESOURCE
    :parameters (?v - volunteer ?m - modeOfTravel ?r - resource ?d - depot)
    :duration (= ?duration 0.3)
    :condition (and 
        (at start (at ?v ?d))
        (at start (> (activePeriod ?v) 0.3))
        (at start (usingTransport ?v ?m))
        (at start (>= (capacity ?v ?m) (resource-size ?r)))
        (at start (>= (resources-stored ?r ?d) 1))
        (at start (available ?v))
    )
    :effect (and
        (at start (not (available ?v)))
        (at end (decrease (activePeriod ?v) 0.3))
        (at end (decrease (resources-stored ?r ?d) 1))
        (at end (increase (resources-stored ?r ?v) 1))
        (at end (decrease (capacity ?v ?m) (resource-size ?r)))
        (at end (available ?v))
    )
)

(:durative-action DELIVER-RESOURCE
    :parameters (?v - volunteer ?m - modeOfTravel ?r - resource ?p - atRiskPerson)
    :duration (= ?duration 0.3)
    :condition (and
        (at start (at ?v ?p))
        (at start (> (activePeriod ?v) 0.3))
        (at start (usingTransport ?v ?m))
        (at start (>= (resources-stored ?r ?v) 1))
        (at start (available ?v))
    )
    :effect (and
        (at start (not (available ?v)))
        (at end (decrease (activePeriod ?v) 0.3))
        (at end (decrease (resources-stored ?r ?v) 1))
        (at end (decrease (requires ?p ?r) 1))
        (at end (increase (capacity ?v ?m) (resource-size ?r)))
        (at end (available ?v))
    )
)

(:durative-action TRAVEL
    :parameters (?v - volunteer ?to ?from - locatable, ?mode - modeOfTravel)
    :duration (= ?duration (time-to-arrive ?from ?to ?mode))
    :condition (and
        (at start (> (activePeriod ?v) (time-to-arrive ?from ?to ?mode)))
        (at start (at ?v ?from))
        (at start (usingTransport ?v ?mode))
        (at start (linked ?from ?to))
        (at start (available ?v))
    )
    :effect (and
        (at start (not (available ?v)))
        (at start (decrease (activePeriod ?v) (time-to-arrive ?from ?to ?mode)))
        (at end (not (at ?v ?from)))
        (at end (at ?v ?to))
        (at end (available ?v))
    )
)

(:durative-action TRANSFER-RESOURCE
    :parameters (?v1 ?v2 - volunteer ?m1 ?m2 - modeOfTravel ?r - resource ?l - locatable)
    ; might be a good idea to make this take
    ; longer than getting it from a depot, iunno
    :duration (= ?duration 0.6)
    :condition (and
        (at start (available ?v1))
        (at start (> (activePeriod ?v1) 0.6))
        (at start (available ?v2))
        (at start (> (activePeriod ?v2) 0.6))
        (at start (at ?v1 ?l))
        (at start (at ?v2 ?l))
        (at start (usingTransport ?v1 ?m1))
        (at start (usingTransport ?v2 ?m2))
        (at start (>= (resources-stored ?r ?v1) 1))
        (at start (>= (capacity ?v2 ?m2) (resource-size ?r)))
    )
    :effect (and
        (at start (not (available ?v1)))
        (at end (decrease (activePeriod ?v1) 0.6))
        (at start (not (available ?v2)))
        (at end (decrease (activePeriod ?v2) 0.6))
        (at end (decrease (resources-stored ?r ?v1) 1))
        (at end (increase (capacity ?v1 ?m1) (resource-size ?r)))
        (at end (increase (resources-stored ?r ?v2) 1))
        (at end (decrease (capacity ?v2 ?m2) (resource-size ?r)))
        (at end (available ?v1))
        (at end (available ?v2))
    )
)

(:durative-action REST
    :parameters (?v - volunteer)
    :duration (= ?duration 10)
    :condition (and 
        (at start (= (activePeriod ?v) 0)) 
        (at start (available ?v))
    )
    :effect (and 
        (at start (not (available ?v)))
        (at end (increase (activePeriod ?v) 80))
        (at end (available ?v))
        )
)