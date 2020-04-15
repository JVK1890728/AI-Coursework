(define (problem basic_problem) (:domain volunteerPlanner)
(:objects
    William - volunteer
    Raff Ben - atRiskPerson
    Strand - depot
    egg painkillers - resource
    walking cycling - modeOfTravel
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (= (resources-stored egg Strand) 100)
    (= (resources-stored painkillers Strand) 50)

    (at William Strand)
    (available William)
    (usingTransport William walking)
    (= (capacity William walking) 10)
    (= (capacity William cycling) 6)
    (= (resources-stored egg William) 0)
    (= (resources-stored painkillers William) 0)

    (= (resource-size egg) 3)
    (= (resource-size painkillers) 1)

    (linked Strand Raff)
    (linked Raff Strand)
    (= (time-to-arrive Strand Raff walking) 5)
    (= (time-to-arrive Strand Raff cycling) 3)
    (= (requires Raff egg) 2)
    (= (requires Raff painkillers) 1)
    
    (linked Strand Ben)
    (linked Ben Strand)
    (= (time-to-arrive Strand Raff walking) 9)
    (= (time-to-arrive Strand Raff cycling) 6)
    (= (requires Ben egg) 1)
    (= (requires Ben painkillers) 6)
)

(:goal (and
    (= (requires Ben egg) 0)
    (= (requires Ben painkillers) 0)
    (= (requires Raff egg) 0)
    (= (requires Raff painkillers) 0)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)

