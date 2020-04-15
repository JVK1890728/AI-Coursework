(define (problem problem2) (:domain volunteerPlanner)
(:objects
    William, Dan - volunteer
    Raff Ben Giulio - atRiskPerson
    Strand Waterloo - depot
    egg painkillers - resource
    walking cycling - modeOfTravel
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (= (resources-stored egg Strand) 100)
    (= (resources-stored painkillers Strand) 50)

    (= (resources-stored egg Waterloo) 10)
    (= (resources-stored painkillers Waterloo) 5)

    (at William Strand)
    (at Dan Strand)
    (available William)
    (available Dan)
    (usingTransport William walking)
    (usingTransport Dan walking)

    (= (capacity William walking) 10)
    (= (capacity William cycling) 6)
    (= (capacity Dan walking) 10)
    (= (capacity Dan cycling) 6)
    (= (resources-stored egg Dan) 0)
    (= (resources-stored painkillers Dan) 0)
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
    
    (linked Waterloo Giulio)
    (linked Giulio Waterloo)
    (= (time-to-arrive Waterloo Giulio walking) 9)
    (= (time-to-arrive Waterloo Giulio cycling) 6)
    (= (requires Giulio egg) 4)
    (= (requires Giulio painkillers) 8)

    (linked Waterloo Strand)
    (linked Strand Waterloo)
    (= (time-to-arrive Waterloo Strand walking) 20)
    (= (time-to-arrive Waterloo Strand cycling) 7)
)

(:goal (and
    (= (requires Ben egg) 0)
    (= (requires Ben painkillers) 0)
    (= (requires Raff egg) 0)
    (= (requires Raff painkillers) 0)
    (= (requires Giulio egg) 0)
    (= (requires Giulio painkillers) 0)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)

