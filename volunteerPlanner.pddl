;Volunteer Planner
; TODO: update all fluents and durations to make sense

(define (domain volunteerPlanner)

(:requirements :fluents :durative-actions :typing :duration-inequalities :equality)

(:types 
    locatable - object
    volunteer atRiskPerson depot - locatable
    modeOfTravel
    resource
)


(:predicates 
    (at ?obj - locatable ?l - locatable)
    (linked ?l1 ?l2 - locatable)
    (usingTransport ?v - volunteer ?m - modeOfTravel)
    (available ?v - volunteer)
)


(:functions
    (time-to-arrive ?from ?to - locatable ?mode - modeOfTravel)
    (requires ?p - atRiskPerson ?r - resource)
    (resources-stored ?r - resource ?obj - locatable)
    (capacity ?v -volunteer ?mode - modeOfTravel)
    (resource-size ?r - resource)
    (activePeriod ?v - volunteer)
    (remainingActivePeriod ?v - volunteer)
)

(:durative-action PICK-UP-RESOURCE
    :parameters (?v - volunteer ?m - modeOfTravel ?r - resource ?d - depot)
    :duration (= ?duration 0.2)
    :condition (and 
        (at start (at ?v ?d))
        (at start (> (remainingActivePeriod ?v) 0.2))
        (at start (usingTransport ?v ?m))
        (at start (>= (capacity ?v ?m) (resource-size ?r)))
        (at start (>= (resources-stored ?r ?d) 1))
        (at start (available ?v))
    )
    :effect (and
        (at start (not (available ?v)))
        (at end (decrease (remainingActivePeriod ?v) 0.2))
        (at end (decrease (resources-stored ?r ?d) 1))
        (at end (increase (resources-stored ?r ?v) 1))
        (at end (decrease (capacity ?v ?m) (resource-size ?r)))
        (at end (available ?v))
    )
)

(:durative-action DELIVER-RESOURCE
    :parameters (?v - volunteer ?m - modeOfTravel ?r - resource ?p - atRiskPerson)
    :duration (= ?duration 0.2)
    :condition (and
        (at start (at ?v ?p))
        (at start (> (remainingActivePeriod ?v) 0.2))
        (at start (usingTransport ?v ?m))
        (at start (>= (resources-stored ?r ?v) 1))
        (at start (available ?v))
    )
    :effect (and
        (at start (not (available ?v)))
        (at end (decrease (remainingActivePeriod ?v) 0.2))
        (at end (decrease (resources-stored ?r ?v) 1))
        (at end (decrease (requires ?p ?r) 1))
        (at end (increase (capacity ?v ?m) (resource-size ?r)))
        (at end (available ?v))
    )
)

(:durative-action TRAVEL
    :parameters (?v - volunteer ?from ?to - locatable, ?mode - modeOfTravel)
    :duration (= ?duration (time-to-arrive ?from ?to ?mode))
    :condition (and
        (at start (> (remainingActivePeriod ?v) (time-to-arrive ?from ?to ?mode)))
        (at start (at ?v ?from))
        (at start (usingTransport ?v ?mode))
        (at start (linked ?from ?to))
        (at start (available ?v))
    )
    :effect (and
        (at start (not (available ?v)))
        (at start (decrease (remainingActivePeriod ?v) (time-to-arrive ?from ?to ?mode)))
        (at end (not (at ?v ?from)))
        (at end (at ?v ?to))
        (at end (available ?v))
    )
)

(:durative-action TRANSFER-RESOURCE
    :parameters (?v1 ?v2 - volunteer ?m1 ?m2 - modeOfTravel ?r - resource ?l - locatable)
    :duration (= ?duration 0.4)
    :condition (and
        (at start (available ?v1))
        (at start (> (remainingActivePeriod ?v1) 0.4))
        (at start (available ?v2))
        (at start (> (remainingActivePeriod ?v2) 0.4))
        (at start (at ?v1 ?l))
        (at start (at ?v2 ?l))
        (at start (usingTransport ?v1 ?m1))
        (at start (usingTransport ?v2 ?m2))
        (at start (>= (resources-stored ?r ?v1) 1))
        (at start (>= (capacity ?v2 ?m2) (resource-size ?r)))
    )
    :effect (and
        (at start (not (available ?v1)))
        (at end (decrease (remainingActivePeriod ?v1) 0.4))
        (at start (not (available ?v2)))
        (at end (decrease (remainingActivePeriod ?v2) 0.4))
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
        (at start (< (remainingActivePeriod ?v) 3)) 
        (at start (available ?v))
    )
    :effect (and 
        (at start (not (available ?v)))
        (at end (increase (remainingActivePeriod ?v) (activePeriod ?v)))
        (at end (available ?v))
    )
)
)