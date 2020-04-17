(define (problem problem2) (:domain volunteerPlanner)
(:objects
    vWilliam, vDan - volunteer
    arRaff arBen arGiulio - atRiskPerson
    dStrand dWaterloo - depot
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
    (= (resources-stored egg dWaterloo) 10)
    (= (resources-stored painkillers dWaterloo) 5)

    ; volunteers
    (at vWilliam dStrand)
    (available vWilliam)
    (usingTransport vWilliam walking)
    (= (capacity vWilliam walking) 10)
    (= (resources-stored egg vWilliam) 0)
    (= (resources-stored painkillers vWilliam) 0)

    (at vDan dStrand)
    (available vDan)
    (usingTransport vDan walking)
    (= (capacity vDan walking) 10)
    (= (resources-stored egg vDan) 0)
    (= (resources-stored painkillers vDan) 0)

    ; links
    (linked dStrand arRaff)
    (linked arRaff dStrand)
    (= (time-to-arrive dStrand arRaff walking) 10)
    (= (time-to-arrive arRaff dStrand walking) 10)

    (linked dStrand arBen)
    (linked arBen dStrand)
    (= (time-to-arrive dStrand arBen walking) 6)
    (= (time-to-arrive arBen dStrand walking) 6)
    
    (linked dWaterloo arGiulio)
    (linked arGiulio dWaterloo)
    (= (time-to-arrive dWaterloo arGiulio walking) 12)
    (= (time-to-arrive arGiulio dWaterloo walking) 12)

    (linked dWaterloo dStrand)
    (linked dStrand dWaterloo)
    (= (time-to-arrive dWaterloo dStrand walking) 20)
    (= (time-to-arrive dStrand dWaterloo walking) 20)

    ; requirements 
    (= (requires arRaff egg) 2)
    (= (requires arRaff painkillers) 1)
    (= (requires arBen egg) 1)
    (= (requires arBen painkillers) 6)
    (= (requires arGiulio egg) 4)
    (= (requires arGiulio painkillers) 8)
)

(:goal (and
    (= (requires arBen egg) 0)
    (= (requires arBen painkillers) 0)
    (= (requires arRaff egg) 0)
    (= (requires arRaff painkillers) 0)
    (= (requires arGiulio egg) 0)
    (= (requires arGiulio painkillers) 0)
))
)

