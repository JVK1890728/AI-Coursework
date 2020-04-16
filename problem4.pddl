(define (problem clustersProblem) (:domain volunteerPlanner)
(:objects 
    vWilliam, vDan - volunteer
    arRaff arBen arGiulio - atRiskPerson
    arSeb arJeffrey arZak arJay - atRiskPerson
    arKolling arColes arKeppens arAgi - atRiskPerson
    dStrand dWaterloo - depot
    egg painkillers - resource
    walking cycling - modeOfTravel
)

(:init
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

    ; volunteers 
    (at vWilliam dStrand)
    (at vDan dWaterloo)
    (available vWilliam)
    (available vDan)
    (usingTransport vWilliam walking)
    (usingTransport vDan walking)
    (= (capacity vWilliam walking) 10)
    (= (capacity vDan walking) 10)

    ; depot links
    (linked dWaterloo dStrand)
    (linked dStrand dWaterloo)
    (= (time-to-arrive dWaterloo dStrand walking) 20)
    (= (time-to-arrive dStrand dWaterloo walking) 20)
    (= (time-to-arrive dWaterloo dStrand cycling) 7)
    (= (time-to-arrive dStrand dWaterloo cycling) 7)
    
    ; cluster 1
    ; cluster 1 requirements
    (= (requires arRaff egg) 2)
    (= (requires arRaff painkillers) 1)
    (= (requires arBen egg) 1)
    (= (requires arBen painkillers) 6)
    (= (requires arGiulio egg) 4)
    (= (requires arGiulio painkillers) 8)

    ; cluster 1 links
    (linked dStrand arRaff)
    (linked arRaff dStrand)
    (= (time-to-arrive dStrand arRaff walking) 10)
    (= (time-to-arrive arRaff dStrand walking) 10)
    (linked dStrand arBen)
    (linked arBen dStrand)
    (= (time-to-arrive dStrand arBen walking) 11)
    (= (time-to-arrive arBen dStrand walking) 11)
    (linked dStrand arGiulio)
    (linked arGiulio dStrand)
    (= (time-to-arrive dStrand arGiulio walking) 12)
    (= (time-to-arrive arGiulio dStrand walking) 12)
    (linked arRaff arBen)
    (linked arBen arRaff)
    (= (time-to-arrive arBen arRaff walking) 1)
    (= (time-to-arrive arRaff arBen walking) 1)
    (linked arGiulio arBen)
    (linked arBen arGiulio)
    (= (time-to-arrive arBen arGiulio walking) 1)
    (= (time-to-arrive arGiulio arBen walking) 1)
    (linked arRaff arGiulio)
    (linked arGiulio arRaff)
    (= (time-to-arrive arGiulio arRaff walking) 2)
    (= (time-to-arrive arRaff arGiulio walking) 2)
    
    ; cluster 2
    ; cluster 2 requirements
    (= (requires arSeb egg) 2)
    (= (requires arSeb painkillers) 1)
    (= (requires arJeffrey egg) 1)
    (= (requires arJeffrey painkillers) 6)
    (= (requires arZak egg) 4)
    (= (requires arZak painkillers) 8)
    (= (requires arJay egg) 2)
    (= (requires arJay painkillers) 3)
    
    ; cluster 2 links
    (linked dStrand arSeb)
    (linked arSeb dStrand)
    (= (time-to-arrive dStrand arSeb walking) 7)
    (= (time-to-arrive arSeb dStrand walking) 7)
    (linked dStrand arJeffrey)
    (linked arJeffrey dStrand)
    (= (time-to-arrive dStrand arJeffrey walking) 8)
    (= (time-to-arrive arJeffrey dStrand walking) 8)
    (linked dStrand arZak)
    (linked arZak dStrand)
    (= (time-to-arrive dStrand arZak walking) 8)
    (= (time-to-arrive arZak dStrand walking) 8)
    (linked dStrand arJay)
    (linked arJay dStrand)
    (= (time-to-arrive dStrand arJay walking) 6)
    (= (time-to-arrive arJay dStrand walking) 6)
    (linked arSeb arJeffrey)
    (linked arJeffrey arSeb)
    (= (time-to-arrive arSeb arJeffrey walking) 1)
    (= (time-to-arrive arJeffrey arSeb walking) 1)
    (linked arSeb arZak)
    (linked arZak arSeb)
    (= (time-to-arrive arSeb arZak walking) 1)
    (= (time-to-arrive arZak arSeb walking) 1)
    (linked arSeb arJay)
    (linked arJay arSeb)
    (= (time-to-arrive arSeb arJay walking) 1)
    (= (time-to-arrive arJay arSeb walking) 1)
    (linked arZak arJeffrey)
    (linked arJeffrey arZak)
    (= (time-to-arrive arZak arJeffrey walking) 1)
    (= (time-to-arrive arJeffrey arZak walking) 1)
    (linked arJay arJeffrey)
    (linked arJeffrey arJay )
    (= (time-to-arrive arJay arJeffrey walking) 1)
    (= (time-to-arrive arJeffrey arJay walking) 1)
    (linked arJay arZak)
    (linked arZak arJay)
    (= (time-to-arrive arJay arZak walking) 1)
    (= (time-to-arrive arZak arJay walking) 1)

    ; cluster 3
    ; cluster 3 requirements
    (= (requires arKolling egg) 2)
    (= (requires arKolling painkillers) 1)
    (= (requires arColes egg) 1)
    (= (requires arColes painkillers) 6)
    (= (requires arKeppens egg) 4)
    (= (requires arKeppens painkillers) 8)
    (= (requires arAgi egg) 4)
    (= (requires arAgi painkillers) 8)

    ; cluster 3 links
    (linked dWaterloo arKolling)
    (linked arKolling dWaterloo)
    (= (time-to-arrive dWaterloo arKolling walking) 10)
    (= (time-to-arrive arKolling dWaterloo walking) 10)
    (linked dWaterloo arColes)
    (linked arColes dWaterloo)
    (= (time-to-arrive dWaterloo arColes walking) 11)
    (= (time-to-arrive arColes dWaterloo walking) 11)
    (linked dWaterloo arKeppens)
    (linked arKeppens dWaterloo)
    (= (time-to-arrive dWaterloo arKeppens walking) 12)
    (= (time-to-arrive arKeppens dWaterloo walking) 12)
    (linked dWaterloo arAgi)
    (linked arAgi dWaterloo)
    (= (time-to-arrive dWaterloo arAgi walking) 12)
    (= (time-to-arrive arAgi dWaterloo walking) 12)
    (linked arKolling arColes)
    (linked arColes arKolling)
    (= (time-to-arrive arKolling arColes walking) 1)
    (= (time-to-arrive arColes arKolling walking) 1)
    (linked arKolling arKeppens)
    (linked arKeppens arKolling)
    (= (time-to-arrive arKolling arKeppens walking) 1)
    (= (time-to-arrive arKeppens arKolling walking) 1)
    (linked arKolling arAgi)
    (linked arAgi arKolling)
    (= (time-to-arrive arKolling arAgi walking) 1)
    (= (time-to-arrive arAgi arKolling walking) 1)
    (linked arKeppens arColes)
    (linked arColes arKeppens)
    (= (time-to-arrive arKeppens arColes walking) 1)
    (= (time-to-arrive arColes arKeppens walking) 1)
    (linked arAgi arColes)
    (linked arColes arAgi )
    (= (time-to-arrive arAgi arColes walking) 1)
    (= (time-to-arrive arColes arAgi walking) 1)
    (linked arAgi arKeppens)
    (linked arKeppens arAgi)
    (= (time-to-arrive arAgi arKeppens walking) 1)
    (= (time-to-arrive arKeppens arAgi walking) 1)

)

(:goal (and
    ; cluster 1
    (= (requires arBen egg) 0)
    (= (requires arBen painkillers) 0)
    (= (requires arRaff egg) 0)
    (= (requires arRaff painkillers) 0)
    (= (requires arGiulio egg) 0)
    (= (requires arGiulio painkillers) 0)

    ; cluster 2
    (= (requires arSeb egg) 0)
    (= (requires arSeb painkillers) 0)
    (= (requires arJeffrey egg) 0)
    (= (requires arJeffrey painkillers) 0)
    (= (requires arZak egg) 0)
    (= (requires arZak painkillers) 0)
    (= (requires arJay egg) 0)
    (= (requires arJay painkillers) 0)

    ; cluster 3
    (= (requires arKolling egg) 0)
    (= (requires arKolling painkillers) 0)
    (= (requires arColes egg) 0)
    (= (requires arColes painkillers) 0)
    (= (requires arKeppens egg) 0)
    (= (requires arKeppens painkillers) 0)
    (= (requires arAgi egg) 0)
    (= (requires arAgi painkillers) 0)
))

)
