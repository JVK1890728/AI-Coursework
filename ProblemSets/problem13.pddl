(define (problem problem1) (:domain volunteerPlanner)
(:objects
    v1 - volunteer
    ar1 ar2 ar3 ar4 ar5 ar6 ar7 ar8 - atRiskPerson
    dStrand - depot
    egg painkillers - resource
    walking cycling - modeOfTravel
)

(:init
    ; resources
    (= (resource-size egg) 0.2)
    (= (resource-size painkillers) 0.4)

    ; depots
    (= (resources-stored egg dStrand) 200)
    (= (resources-stored painkillers dStrand) 100)

    ; volunteers
    (at v1 dStrand)
    (available v1)
    (= (activePeriod v1) 100)
    (= (remainingActivePeriod v1) 100)
    (usingTransport v1 walking)
    (= (capacity v1 walking) 20)
    (= (resources-stored egg v1) 0)
    (= (resources-stored painkillers v1) 0)

    ; links
    (linked dStrand ar1)
    (linked ar1 dStrand)
    (= (time-to-arrive dStrand ar1 walking) 10)
    (= (time-to-arrive ar1 dStrand walking) 10)
    
    (linked dStrand ar2)
    (linked ar2 dStrand)
    (= (time-to-arrive dStrand ar2 walking) 5)
    (= (time-to-arrive ar2 dStrand walking) 5)

    (linked dStrand ar3)
    (linked ar3 dStrand)
    (= (time-to-arrive dStrand ar3 walking) 15)
    (= (time-to-arrive ar3 dStrand walking) 15)

    (linked dStrand ar4)
    (linked ar4 dStrand)
    (= (time-to-arrive dStrand ar4 walking) 12)
    (= (time-to-arrive ar4 dStrand walking) 12)

    (linked dStrand ar5)
    (linked ar5 dStrand)
    (= (time-to-arrive dStrand ar5 walking) 16)
    (= (time-to-arrive ar5 dStrand walking) 16)

    (linked dStrand ar6)
    (linked ar6 dStrand)
    (= (time-to-arrive dStrand ar6 walking) 8)
    (= (time-to-arrive ar6 dStrand walking) 8)

    (linked dStrand ar7)
    (linked ar7 dStrand)
    (= (time-to-arrive dStrand ar7 walking) 10)
    (= (time-to-arrive ar7 dStrand walking) 10)

    (linked dStrand ar8)
    (linked ar8 dStrand)
    (= (time-to-arrive dStrand ar8 walking) 7)
    (= (time-to-arrive ar8 dStrand walking) 7)

    ; requirements
    (= (requires ar8 egg) 2)
    (= (requires ar8 painkillers) 10)
    (= (requires ar7 egg) 2)
    (= (requires ar7 painkillers) 5)
    (= (requires ar6 egg) 3)
    (= (requires ar6 painkillers) 5)
    (= (requires ar5 egg) 4)
    (= (requires ar5 painkillers) 12)
    (= (requires ar4 egg) 1)
    (= (requires ar4 painkillers) 2)
    (= (requires ar3 egg) 2)
    (= (requires ar3 painkillers) 5)
    (= (requires ar2 egg) 4)
    (= (requires ar2 painkillers) 5)
    (= (requires ar1 egg) 2)
    (= (requires ar1 painkillers) 4)
)

(:goal (and
    (= (requires ar8 egg) 0)
    (= (requires ar8 painkillers) 0)
    (= (requires ar7 egg) 0)
    (= (requires ar7 painkillers) 0)
    (= (requires ar6 egg) 0)
    (= (requires ar6 painkillers) 0)
    (= (requires ar5 egg) 0)
    (= (requires ar5 painkillers) 0)
    (= (requires ar4 egg) 0)
    (= (requires ar4 painkillers) 0)
    (= (requires ar3 egg) 0)
    (= (requires ar3 painkillers) 0)
    (= (requires ar2 egg) 0)
    (= (requires ar2 painkillers) 0)
    (= (requires ar1 egg) 0)
    (= (requires ar1 painkillers) 0)
))
)