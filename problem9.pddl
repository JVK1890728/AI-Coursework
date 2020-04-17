(define (problem problem_9) (:domain volunteerPlanner)
(:objects
    vWilliam - volunteer
    arRaff arBen arDan arSeb - atRiskPerson
    dStrand - depot
    egg painkillers - resource
    walking cycling - modeOfTravel
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (= (resources-stored egg dStrand) 100)
    (= (resources-stored painkillers dStrand) 50)

    (at vWilliam dStrand)
    (= (activePeriod vWilliam) 100)
    (available vWilliam)
    (usingTransport vWilliam walking)
    (= (capacity vWilliam walking) 10)
    (= (capacity vWilliam cycling) 6)
    (= (resources-stored egg vWilliam) 0)
    (= (resources-stored painkillers vWilliam) 0)

    (= (resource-size egg) 0.2)
    (= (resource-size painkillers) 0.4)

    (linked dStrand arRaff)
    (linked arRaff dStrand)
    (= (time-to-arrive dStrand arRaff walking) 10)
    (= (time-to-arrive arRaff dStrand walking) 10)
    (= (time-to-arrive dStrand arRaff cycling) 3)
    (= (time-to-arrive arRaff dStrand cycling) 3)
    (= (requires arRaff egg) 2)
    (= (requires arRaff painkillers) 1)
    
    (linked dStrand arBen)
    (linked arBen dStrand)
    (= (time-to-arrive dStrand arBen walking) 6)
    (= (time-to-arrive arBen dStrand walking) 6)
    (= (time-to-arrive dStrand arBen cycling) 2)
    (= (time-to-arrive arBen dStrand cycling) 2)
    (= (requires arBen egg) 1)
    (= (requires arBen painkillers) 6)
    
    (linked dStrand arSeb)
    (linked arSeb dStrand)
    (= (time-to-arrive dStrand arSeb walking) 4)
    (= (time-to-arrive arSeb dStrand walking) 4)
    (= (time-to-arrive dStrand arSeb cycling) 1)
    (= (time-to-arrive arSeb dStrand cycling) 1)
    (= (requires arSeb egg) 5)
    (= (requires arSeb painkillers) 2)

    (linked dStrand arDan)
    (linked arDan dStrand)
    (= (time-to-arrive dStrand arDan walking) 8)
    (= (time-to-arrive arDan dStrand walking) 8)
    (= (time-to-arrive dStrand arDan cycling) 3)
    (= (time-to-arrive arDan dStrand cycling) 3)
    (= (requires arDan egg) 2)
    (= (requires arDan painkillers) 4)
)

(:goal (and
    (= (requires arBen egg) 0)
    (= (requires arBen painkillers) 0)
    (= (requires arRaff egg) 0)
    (= (requires arRaff painkillers) 0)
    (= (requires arDan egg) 0)
    (= (requires arDan painkillers) 0)
    (= (requires arSeb egg) 0)
    (= (requires arSeb painkillers) 0)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)

