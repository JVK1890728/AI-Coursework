(define (problem problem6) (:domain volunteerPlanner)
(:objects 
    vWilliam, vDan - volunteer
    arRaff arBen arGiulio arJay - atRiskPerson
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
    
    (at vWilliam dStrand)
    (available vWilliam)
    (usingTransport vWilliam walking)
    (= (activePeriod vWilliam) 60)
    (= (remainingActivePeriod vWilliam) 60)
    (= (capacity vWilliam walking) 10)
    (= (resources-stored egg vWilliam) 0)
    (= (resources-stored painkillers vWilliam) 0)
    
    (at vDan dStrand)
    (available vDan)
    (usingTransport vDan cycling)
    (= (activePeriod vDan) 60)
    (= (remainingActivePeriod vDan) 60)
    (= (capacity vDan cycling) 6)
    (= (resources-stored egg vDan) 0)
    (= (resources-stored painkillers vDan) 0)

    ; links
    ; cluster 1
    ; cluster 1 requirements
    (= (requires arRaff egg) 2)
    (= (requires arRaff painkillers) 1)
    ; cluster 1 links
    (linked arRaff dStrand)
    (linked dStrand arRaff)
    (= (time-to-arrive dStrand arRaff walking) 10)
    (= (time-to-arrive arRaff dStrand walking) 10)
    (= (time-to-arrive dStrand arRaff cycling) 3)
    (= (time-to-arrive arRaff dStrand cycling) 3)

    ; cluster 2
    ; cluster 2 requirements
    (= (requires arBen egg) 1)
    (= (requires arBen painkillers) 6)
    (= (requires arGiulio egg) 4)
    (= (requires arGiulio painkillers) 8)
    (= (requires arJay egg) 5)
    (= (requires arJay painkillers) 5)

    ; cluster 2 links
    (linked dStrand arBen)
    (linked arBen dStrand)
    (= (time-to-arrive dStrand arBen walking) 10)
    (= (time-to-arrive arBen dStrand walking) 10)
    (= (time-to-arrive dStrand arBen cycling) 3)
    (= (time-to-arrive arBen dStrand cycling) 3)
    (linked dStrand arJay)
    (linked arJay dStrand)
    (= (time-to-arrive dStrand arJay walking) 10)
    (= (time-to-arrive arJay dStrand walking) 10)
    (= (time-to-arrive dStrand arJay cycling) 3)
    (= (time-to-arrive arJay dStrand cycling) 3)
    (linked dStrand arGiulio)
    (linked arGiulio dStrand)
    (= (time-to-arrive dStrand arGiulio walking) 10)
    (= (time-to-arrive arGiulio dStrand walking) 10)
    (= (time-to-arrive dStrand arGiulio cycling) 3)
    (= (time-to-arrive arGiulio dStrand cycling) 3)
    (linked arBen arJay)
    (linked arJay arBen)
    (= (time-to-arrive arBen arJay walking) 1)
    (= (time-to-arrive arJay arBen walking) 1)
    (= (time-to-arrive arBen arJay cycling) 0.5)
    (= (time-to-arrive arJay arBen cycling) 0.5)
    (linked arBen arGiulio)
    (linked arGiulio arBen)
    (= (time-to-arrive arBen arGiulio walking) 1)
    (= (time-to-arrive arGiulio arBen walking) 1)
    (= (time-to-arrive arBen arGiulio cycling) 0.5)
    (= (time-to-arrive arGiulio arBen cycling) 0.5)
    (linked arJay arGiulio)
    (linked arGiulio arJay)
    (= (time-to-arrive arJay arGiulio walking) 1)
    (= (time-to-arrive arGiulio arJay walking) 1)
    (= (time-to-arrive arJay arGiulio cycling) 0.5)
    (= (time-to-arrive arGiulio arJay cycling) 0.5)
)

(:goal (and
    (= (requires arBen egg) 0)
    (= (requires arBen painkillers) 0)
    (= (requires arRaff egg) 0)
    (= (requires arRaff painkillers) 0)
    (= (requires arGiulio egg) 0)
    (= (requires arGiulio painkillers) 0)
    (= (requires arJay egg) 0)
    (= (requires arJay painkillers) 0)
))
)
