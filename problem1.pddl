(define (problem problem1) (:domain volunteerPlanner)
(:objects
    vWilliam - volunteer
    arRaff arBen - atRiskPerson
    dStrand - depot
    egg painkillers - resource
    walking cycling - modeOfTravel
)

(:init
    ; resources
    (= (resource-size egg) 0.2)
    (= (resource-size painkillers) 0.4)

    ; depots
    (= (resources-stored egg dStrand) 100)
    (= (resources-stored painkillers dStrand) 50)

    ; volunteers
    (at vWilliam dStrand)
    (available vWilliam)
    (= (activePeriod vWilliam) 100)
    (usingTransport vWilliam walking)
    (= (capacity vWilliam walking) 10)
    (= (resources-stored egg vWilliam) 0)
    (= (resources-stored painkillers vWilliam) 0)

    ; links
    (linked dStrand arRaff)
    (linked arRaff dStrand)
    (= (time-to-arrive dStrand arRaff walking) 10)
    (= (time-to-arrive arRaff dStrand walking) 10)
    
    (linked dStrand arBen)
    (linked arBen dStrand)
    (= (time-to-arrive dStrand arBen walking) 6)
    (= (time-to-arrive arBen dStrand walking) 6)

    ; requirements
    (= (requires arBen egg) 1)
    (= (requires arBen painkillers) 6)
    (= (requires arRaff egg) 2)
    (= (requires arRaff painkillers) 1)
)

(:goal (and
    (= (requires arBen egg) 0)
    (= (requires arBen painkillers) 0)
    (= (requires arRaff egg) 0)
    (= (requires arRaff painkillers) 0)
))
)