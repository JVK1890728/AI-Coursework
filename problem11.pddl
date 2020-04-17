(define (problem problem1) (:domain volunteerPlanner)
(:objects
    vWilliam - volunteer
    arRaff arBen arDan arGiulio arZak arJay - atRiskPerson
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
    (= (remainingActivePeriod vWilliam) 100)
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

    (linked dStrand arDan)
    (linked arDan dStrand)
    (= (time-to-arrive dStrand arDan walking) 3)
    (= (time-to-arrive arDan dStrand walking) 3)
    
    (linked dStrand arGiulio)
    (linked arGiulio dStrand)
    (= (time-to-arrive dStrand arGiulio walking) 7)
    (= (time-to-arrive arGiulio dStrand walking) 7)
    
    (linked dStrand arZak)
    (linked arZak dStrand)
    (= (time-to-arrive dStrand arZak walking) 11)
    (= (time-to-arrive arZak dStrand walking) 11)
    
    (linked dStrand arJay)
    (linked arJay dStrand)
    (= (time-to-arrive dStrand arJay walking) 12)
    (= (time-to-arrive arJay dStrand walking) 12)

    ; requirements
    (= (requires arBen egg) 1)
    (= (requires arBen painkillers) 6)
    (= (requires arRaff egg) 2)
    (= (requires arRaff painkillers) 1)
    (= (requires arDan egg) 3)
    (= (requires arDan painkillers) 4)
    (= (requires arGiulio egg) 3)
    (= (requires arGiulio painkillers) 2)
    (= (requires arZak egg) 3)
    (= (requires arZak painkillers) 4)
    (= (requires arJay egg) 2)
    (= (requires arJay painkillers) 1)
)

(:goal (and
    (= (requires arBen egg) 0)
    (= (requires arBen painkillers) 0)
    (= (requires arRaff egg) 0)
    (= (requires arRaff painkillers) 0)
    (= (requires arDan egg) 0)
    (= (requires arDan painkillers) 0)
    (= (requires arGiulio egg) 0)
    (= (requires arGiulio painkillers) 0)
    (= (requires arZak egg) 0)
    (= (requires arZak painkillers) 0)
    (= (requires arJay egg) 0)
    (= (requires arJay painkillers) 0)
))
)