(define (problem problem5) (:domain volunteerPlanner)

(:objects
    v1 v2 v3 - volunteer
    d1 d2 d3 - depot
    ar1 ar2 ar3 ar4 ar5 - atRiskPerson
    walking - modeOfTravel
    r1 r2 r3 - resource
    l1 l2 l3 l4 - locatable
)

(:init
    ; define map
    (linked ar1 ar2)
    (linked ar2 ar1)
    (= (time-to-arrive ar1 ar2 walking) 10)
    (= (time-to-arrive ar2 ar1 walking) 10)
    
    (linked ar2 ar3)
    (linked ar3 ar2)
    (= (time-to-arrive ar2 ar3 walking) 8)
    (= (time-to-arrive ar3 ar2 walking) 8)
    
    (linked ar1 d2)
    (linked d2 ar1)
    (= (time-to-arrive ar1 d2 walking) 6)
    (= (time-to-arrive d2 ar1 walking) 6)
    
    (linked d2 ar2)
    (linked ar2 d2)
    (= (time-to-arrive d2 ar2 walking) 5)
    (= (time-to-arrive ar2 d2 walking) 5)
    
    (linked d2 l2)
    (linked l2 d2)
    (= (time-to-arrive d2 l2 walking) 4)
    (= (time-to-arrive l2 d2 walking) 4)
    
    (linked d2 l3)
    (linked l3 d2)
    (= (time-to-arrive d2 l3 walking) 6)
    (= (time-to-arrive l3 d2 walking) 6)
    
    (linked l2 ar5)
    (linked ar5 l2)
    (= (time-to-arrive l2 ar5 walking) 3)
    (= (time-to-arrive ar5 l2 walking) 3)
    
    (linked ar5 l1)
    (linked l1 ar5)
    (= (time-to-arrive ar5 l1 walking) 2)
    (= (time-to-arrive l1 ar5 walking) 2)
    
    (linked l1 d3)
    (linked d3 l1)
    (= (time-to-arrive l1 d3 walking) 2)
    (= (time-to-arrive d3 l1 walking) 2)
    
    (linked d3 l2)
    (linked l2 d3)
    (= (time-to-arrive d3 l2 walking) 4)
    (= (time-to-arrive l2 d3 walking) 4)
    
    (linked d3 l4)
    (linked l4 d3)
    (= (time-to-arrive d3 l4 walking) 7)
    (= (time-to-arrive l4 d3 walking) 7)
    
    (linked d3 l3)
    (linked l3 d3)
    (= (time-to-arrive d3 l3 walking) 5)
    (= (time-to-arrive l3 d3 walking) 5)
    
    (linked d1 ar3)
    (linked ar3 d1)
    (= (time-to-arrive d1 ar3 walking) 4)
    (= (time-to-arrive ar3 d1 walking) 4)
    
    (linked ar3 l3)
    (linked l3 ar3)
    (= (time-to-arrive ar3 l3 walking) 6)
    (= (time-to-arrive l3 ar3 walking) 6)
    
    (linked d1 l3)
    (linked l3 d1)
    (= (time-to-arrive d1 l3 walking) 5)
    (= (time-to-arrive l3 d1 walking) 5)
    
    (linked l3 ar4)
    (linked ar4 l3)
    (= (time-to-arrive l3 ar3 walking) 13)
    (= (time-to-arrive ar3 l3 walking) 13)
    
    
    ; define depots
    (= (resources-stored r1 d1) 15)
    (= (resources-stored r2 d1) 9)
    (= (resources-stored r3 d1) 0)
    
    (= (resources-stored r1 d2) 2)
    (= (resources-stored r2 d2) 17)
    (= (resources-stored r3 d2) 11)
    
    (= (resources-stored r1 d3) 6)
    (= (resources-stored r2 d3) 5)
    (= (resources-stored r3 d3) 16)
    ; total for r1 is 23
    ; total for r2 is 31
    ; total for r3 is 27
    
    
    ; define at risk people
    (= (requires ar1 r1) 6)
    (= (requires ar1 r2) 0)
    (= (requires ar1 r3) 7)
    
    (= (requires ar2 r1) 3)
    (= (requires ar2 r2) 9)
    (= (requires ar2 r3) 0)
    
    (= (requires ar3 r1) 12)
    (= (requires ar3 r2) 5)
    (= (requires ar3 r3) 8)
    
    (= (requires ar4 r1) 0)
    (= (requires ar4 r2) 11)
    (= (requires ar4 r3) 4)
    
    (= (requires ar5 r1) 3)
    (= (requires ar5 r2) 6)
    (= (requires ar5 r3) 8)
    ; total for r1 is 23
    ; total for r2 is 31
    ; total for r3 is 27
    
    
    ; define resources
    (= (resource-size r1) 0.6)
    (= (resource-size r2) 0.2)
    (= (resource-size r3) 1.5)
    
    
    ; define volunteers
    (available v1)
    (at v1 l4)
    (usingTransport v1 walking)
    (= (capacity v1 walking) 7)
    (= (activePeriod v1) 40)
    (= (resources-stored r1 v1) 0)
    (= (resources-stored r2 v1) 0)
    (= (resources-stored r3 v1) 0)
    
    (available v2)
    (at v2 l3)
    (usingTransport v2 walking)
    (= (capacity v2 walking) 11)
    (= (activePeriod v2) 70)
    (= (resources-stored r1 v2) 0)
    (= (resources-stored r2 v2) 0)
    (= (resources-stored r3 v2) 0)
    
    (available v3)
    (at v3 ar3)
    (usingTransport v3 walking)
    (= (capacity v3 walking) 5.5)
    (= (activePeriod v3) 50)
    (= (resources-stored r1 v3) 0)
    (= (resources-stored r2 v3) 0)
    (= (resources-stored r3 v3) 0)
)

(:goal (and
    (= (requires ar1 r1) 0)
    (= (requires ar1 r2) 0)
    (= (requires ar1 r3) 0)

    (= (requires ar2 r1) 0)
    (= (requires ar2 r2) 0)
    (= (requires ar2 r3) 0)

    (= (requires ar3 r1) 0)
    (= (requires ar3 r2) 0)
    (= (requires ar3 r3) 0)

    (= (requires ar4 r1) 0)
    (= (requires ar4 r2) 0)
    (= (requires ar4 r3) 0)

    (= (requires ar5 r1) 0)
    (= (requires ar5 r2) 0)
    (= (requires ar5 r3) 0)
))

)