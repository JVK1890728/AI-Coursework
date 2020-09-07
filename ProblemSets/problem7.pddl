(define (problem problem6) (:domain volunteerPlanner)
(:objects 
    vWilliam, vDan - volunteer
    arRaff arBen arGiulio arJay - atRiskPerson
    dStrand - depot
    egg painkillers bread apple chocolate - resource
    walking - modeOfTravel
)

(:init
    ; resources
    (= (resource-size egg) 0.2)
    (= (resource-size painkillers) 0.4)
    (= (resource-size bread) 0.8)
    (= (resource-size apple) 0.1)
    (= (resource-size chocolate) 0.3)

    ; depots
    (= (resources-stored egg dStrand) 100)
    (= (resources-stored painkillers dStrand) 50)
    (= (resources-stored bread dStrand) 50)
    (= (resources-stored apple dStrand) 50)
    (= (resources-stored chocolate dStrand) 50)

    ; volunteers 
    (at vWilliam dStrand)
    (available vWilliam)
    (usingTransport vWilliam walking)
    (= (activePeriod vWilliam) 60)
    (= (remainingActivePeriod vWilliam) 60)
    (= (capacity vWilliam walking) 10)
    (= (resources-stored egg vWilliam) 0)
    (= (resources-stored painkillers vWilliam) 0)
    (= (resources-stored bread vWilliam) 0)
    (= (resources-stored apple vWilliam) 0)
    (= (resources-stored chocolate vWilliam) 0)
    
    (at vDan dStrand)
    (available vDan)
    (usingTransport vDan walking)
    (= (activePeriod vDan) 60)
    (= (remainingActivePeriod vDan) 60)
    (= (capacity vDan walking) 6)
    (= (resources-stored egg vDan) 0)
    (= (resources-stored painkillers vDan) 0)
    (= (resources-stored bread vDan) 0)
    (= (resources-stored apple vDan) 0)
    (= (resources-stored chocolate vDan) 0)

    ; cluster 1
    ; cluster 1 requirements
    (= (requires arRaff egg) 2)
    (= (requires arRaff painkillers) 1)
    (= (requires arRaff bread) 2)
    (= (requires arRaff apple) 6)
    (= (requires arRaff chocolate) 1)
    ; cluster 1 links
    (linked arRaff dStrand)
    (linked dStrand arRaff)
    (= (time-to-arrive dStrand arRaff walking) 10)
    (= (time-to-arrive arRaff dStrand walking) 10)

    ; cluster 2
    ; cluster 2 requirements
    (= (requires arBen egg) 6)
    (= (requires arBen painkillers) 2)
    (= (requires arBen bread) 1)
    (= (requires arBen apple) 3)
    (= (requires arBen chocolate) 3)
    (= (requires arGiulio egg) 4)
    (= (requires arGiulio painkillers) 4)
    (= (requires arGiulio bread) 2)
    (= (requires arGiulio apple) 6)
    (= (requires arGiulio chocolate) 3)
    (= (requires arJay egg) 12)
    (= (requires arJay painkillers) 5)
    (= (requires arJay bread) 2)
    (= (requires arJay apple) 2)
    (= (requires arJay chocolate) 1)

    ; cluster 2 links
    (linked dStrand arBen)
    (linked arBen dStrand)
    (= (time-to-arrive dStrand arBen walking) 10)
    (= (time-to-arrive arBen dStrand walking) 10)
    (linked dStrand arJay)
    (linked arJay dStrand)
    (= (time-to-arrive dStrand arJay walking) 10)
    (= (time-to-arrive arJay dStrand walking) 10)
    (linked dStrand arGiulio)
    (linked arGiulio dStrand)
    (= (time-to-arrive dStrand arGiulio walking) 10)
    (= (time-to-arrive arGiulio dStrand walking) 10)
    (linked arBen arJay)
    (linked arJay arBen)
    (= (time-to-arrive arBen arJay walking) 1)
    (= (time-to-arrive arJay arBen walking) 1)
    (linked arBen arGiulio)
    (linked arGiulio arBen)
    (= (time-to-arrive arBen arGiulio walking) 1)
    (= (time-to-arrive arGiulio arBen walking) 1)
    (linked arJay arGiulio)
    (linked arGiulio arJay)
    (= (time-to-arrive arJay arGiulio walking) 1)
    (= (time-to-arrive arGiulio arJay walking) 1)
)

(:goal (and
    (= (requires arRaff egg) 0)
    (= (requires arRaff painkillers) 0)
    (= (requires arRaff bread) 0)
    (= (requires arRaff apple) 0)
    (= (requires arRaff chocolate) 0)
    (= (requires arBen egg) 0)
    (= (requires arBen painkillers) 0)
    (= (requires arBen bread) 0)
    (= (requires arBen apple) 0)
    (= (requires arBen chocolate) 0)
    (= (requires arGiulio egg) 0)
    (= (requires arGiulio painkillers) 0)
    (= (requires arGiulio bread) 0)
    (= (requires arGiulio apple) 0)
    (= (requires arGiulio chocolate) 0)
    (= (requires arJay egg) 0)
    (= (requires arJay painkillers) 0)
    (= (requires arJay bread) 0)
    (= (requires arJay apple) 0)
    (= (requires arJay chocolate) 0)

))
)
