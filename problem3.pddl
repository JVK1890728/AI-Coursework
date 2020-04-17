(define (problem problem3) (:domain volunteerPlanner)
(:objects
    vWilliam, vDan, vJeff - volunteer
    arRaff arBen arGiulio arJay - atRiskPerson
    dStrand dWaterloo - depot
    egg painkillers - resource
    walking cycling driving - modeOfTravel
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (= (resource-size egg) 0.2)
    (= (resource-size painkillers) 0.4)

    (= (resources-stored egg dStrand) 100)
    (= (resources-stored painkillers dStrand) 50)
    (= (resources-stored egg dWaterloo) 10)
    (= (resources-stored painkillers dWaterloo) 5)
    (= (resources-stored egg vDan) 0)
    (= (resources-stored painkillers vDan) 0)
    (= (resources-stored egg vWilliam) 0)
    (= (resources-stored painkillers vWilliam) 0)
    (= (resources-stored egg vJeff) 0)
    (= (resources-stored painkillers vJeff) 0)

    (at vWilliam dStrand)
    (at vDan dStrand)
    (at vJeff dStrand)
    (available vWilliam)
    (available vDan)
    (available vJeff)
    (usingTransport vWilliam walking)
    (usingTransport vDan cycling)
    (usingTransport vJeff driving)
    (= (activePeriod vWilliam) 60)
    (= (activePeriod vDan) 60)
    (= (activePeriod vJeff) 60)

    (= (capacity vJeff driving) 30)
    (= (capacity vWilliam walking) 10)
    (= (capacity vWilliam cycling) 6)
    (= (capacity vDan walking) 10)
    (= (capacity vDan cycling) 6)

    (linked dStrand arRaff)
    (linked arRaff dStrand)
    (linked dStrand arBen)
    (linked arBen dStrand)
    (linked dWaterloo arJay)
    (linked arJay dWaterloo)
    (linked dStrand arJay)
    (linked arJay dStrand)
    (linked dWaterloo arGiulio)
    (linked arGiulio dWaterloo)
    (linked dWaterloo dStrand)
    (linked dStrand dWaterloo)
    
    (= (time-to-arrive dStrand arRaff walking) 10)
    (= (time-to-arrive arRaff dStrand walking) 10)
    (= (time-to-arrive dStrand arRaff cycling) 3)
    (= (time-to-arrive arRaff dStrand cycling) 3)
    (= (time-to-arrive dStrand arRaff driving) 2)
    (= (time-to-arrive arRaff dStrand driving) 2)
    (= (time-to-arrive dStrand arBen walking) 6)
    (= (time-to-arrive arBen dStrand walking) 6)
    (= (time-to-arrive dStrand arBen cycling) 2)
    (= (time-to-arrive arBen dStrand cycling) 2)
    (= (time-to-arrive dStrand arBen driving) 1)
    (= (time-to-arrive arBen dStrand driving) 1)
    (= (time-to-arrive dWaterloo arGiulio walking) 12)
    (= (time-to-arrive arGiulio dWaterloo walking) 12)
    (= (time-to-arrive dWaterloo arGiulio cycling) 4)
    (= (time-to-arrive arGiulio dWaterloo cycling) 4)
    (= (time-to-arrive dWaterloo arGiulio driving) 2)
    (= (time-to-arrive arGiulio dWaterloo driving) 2)
    (= (time-to-arrive dStrand arJay walking) 40)
    (= (time-to-arrive arJay dStrand walking) 40)
    (= (time-to-arrive dStrand arJay cycling) 25)
    (= (time-to-arrive arJay dStrand cycling) 25)
    (= (time-to-arrive dStrand arJay driving) 15)
    (= (time-to-arrive arJay dStrand driving) 15)
    (= (time-to-arrive dWaterloo arJay walking) 25)
    (= (time-to-arrive arJay dWaterloo walking) 25)
    (= (time-to-arrive dWaterloo arJay cycling) 20)
    (= (time-to-arrive arJay dWaterloo cycling) 20)
    (= (time-to-arrive dWaterloo arJay driving) 12)
    (= (time-to-arrive arJay dWaterloo driving) 12)

    (= (time-to-arrive dWaterloo dStrand walking) 20)
    (= (time-to-arrive dStrand dWaterloo walking) 20)
    (= (time-to-arrive dWaterloo dStrand cycling) 7)
    (= (time-to-arrive dStrand dWaterloo cycling) 7)
    (= (time-to-arrive dWaterloo dStrand driving) 5)
    (= (time-to-arrive dStrand dWaterloo driving) 5)
    

    

    (= (requires arRaff egg) 2)
    (= (requires arRaff painkillers) 1)
    (= (requires arBen egg) 1)
    (= (requires arBen painkillers) 6)
    (= (requires arGiulio egg) 4)
    (= (requires arGiulio painkillers) 8)
    (= (requires arJay egg) 5)
    (= (requires arJay painkillers) 5)

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

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
