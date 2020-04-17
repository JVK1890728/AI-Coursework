(define (problem problem5) (:domain volunteerPlanner)

(:objects
    volunteer1 volunteer2 volunteer3 - volunteer
    depot1 depot2 depot3 - depot
    arPerson1 arPerson2 arPerson3 arPerson4 arPerson5 - atRiskPerson
    walking - modeOfTravel
    resource1 resource2 resource3 - resource
)

(:init
    ; resources
    (= (resource-size resource1) 0.6)
    (= (resource-size resource2) 0.2)
    (= (resource-size resource3) 1.5)

    ; depots
    (= (resources-stored resource1 depot1) 15)
    (= (resources-stored resource2 depot1) 9)
    (= (resources-stored resource3 depot1) 0)
    
    (= (resources-stored resource1 depot2) 2)
    (= (resources-stored resource2 depot2) 17)
    (= (resources-stored resource3 depot2) 11)
    
    (= (resources-stored resource1 depot3) 6)
    (= (resources-stored resource2 depot3) 5)
    (= (resources-stored resource3 depot3) 16)
    ; total for resource1 is 23
    ; total for resource2 is 31
    ; total for resource3 is 27

    ; volunteers
    (available volunteer1)
    (at volunteer3 depot1)
    (usingTransport volunteer1 walking)
    (= (capacity volunteer1 walking) 7)
    (= (activePeriod volunteer1) 40)
    (= (remainingActivePeriod volunteer1) 40)
    (= (resources-stored resource1 volunteer1) 0)
    (= (resources-stored resource2 volunteer1) 0)
    (= (resources-stored resource3 volunteer1) 0)
    
    (available volunteer2)
    (at volunteer2 arPerson3)
    (usingTransport volunteer2 walking)
    (= (capacity volunteer2 walking) 11)
    (= (activePeriod volunteer2) 70)
    (= (remainingActivePeriod volunteer2) 70)
    (= (resources-stored resource1 volunteer2) 0)
    (= (resources-stored resource2 volunteer2) 0)
    (= (resources-stored resource3 volunteer2) 0)
    
    (available volunteer3)
    (at volunteer3 arPerson3)
    (usingTransport volunteer3 walking)
    (= (capacity volunteer3 walking) 5.5)
    (= (activePeriod volunteer3) 50)
    (= (remainingActivePeriod volunteer3) 50)
    (= (resources-stored resource1 volunteer3) 0)
    (= (resources-stored resource2 volunteer3) 0)
    (= (resources-stored resource3 volunteer3) 0)

    ; links
    (linked arPerson1 arPerson2)
    (linked arPerson2 arPerson1)
    (= (time-to-arrive arPerson1 arPerson2 walking) 10)
    (= (time-to-arrive arPerson2 arPerson1 walking) 10)
    
    (linked arPerson2 arPerson3)
    (linked arPerson3 arPerson2)
    (= (time-to-arrive arPerson2 arPerson3 walking) 8)
    (= (time-to-arrive arPerson3 arPerson2 walking) 8)
    
    (linked arPerson1 depot2)
    (linked depot2 arPerson1)
    (= (time-to-arrive arPerson1 depot2 walking) 6)
    (= (time-to-arrive depot2 arPerson1 walking) 6)
    
    (linked depot2 arPerson2)
    (linked arPerson2 depot2)
    (= (time-to-arrive depot2 arPerson2 walking) 5)
    (= (time-to-arrive arPerson2 depot2 walking) 5)
    
    (linked depot1 arPerson3)
    (linked arPerson3 depot1)
    (= (time-to-arrive depot1 arPerson3 walking) 4)
    (= (time-to-arrive arPerson3 depot1 walking) 4)
    
    (linked depot1 arPerson4)
    (linked arPerson4 depot1)
    (= (time-to-arrive depot1 arPerson4 walking) 4)
    (= (time-to-arrive arPerson4 depot1 walking) 4)
    
    (linked depot2 arPerson5)
    (linked arPerson5 depot2)
    (= (time-to-arrive depot2 arPerson5 walking) 4)
    (= (time-to-arrive arPerson5 depot2 walking) 4)
    
    (linked depot1 depot2)
    (linked depot2 depot1)
    (= (time-to-arrive depot1 depot2 walking) 4)
    (= (time-to-arrive depot2 depot1 walking) 4)

    (linked depot3 depot2)
    (linked depot2 depot3)
    (= (time-to-arrive depot3 depot2 walking) 4)
    (= (time-to-arrive depot2 depot3 walking) 4)
    
    
    ; requirements
    (= (requires arPerson1 resource1) 6)
    (= (requires arPerson1 resource2) 0)
    (= (requires arPerson1 resource3) 7)
    
    (= (requires arPerson2 resource1) 3)
    (= (requires arPerson2 resource2) 9)
    (= (requires arPerson2 resource3) 0)
    
    (= (requires arPerson3 resource1) 12)
    (= (requires arPerson3 resource2) 5)
    (= (requires arPerson3 resource3) 8)
    
    (= (requires arPerson4 resource1) 0)
    (= (requires arPerson4 resource2) 11)
    (= (requires arPerson4 resource3) 4)
    
    (= (requires arPerson5 resource1) 3)
    (= (requires arPerson5 resource2) 6)
    (= (requires arPerson5 resource3) 8)
)

(:goal (and
    (= (requires arPerson1 resource1) 0)
    (= (requires arPerson1 resource2) 0)
    (= (requires arPerson1 resource3) 0)

    (= (requires arPerson2 resource1) 0)
    (= (requires arPerson2 resource2) 0)
    (= (requires arPerson2 resource3) 0)

    (= (requires arPerson3 resource1) 0)
    (= (requires arPerson3 resource2) 0)
    (= (requires arPerson3 resource3) 0)

    (= (requires arPerson4 resource1) 0)
    (= (requires arPerson4 resource2) 0)
    (= (requires arPerson4 resource3) 0)

    (= (requires arPerson5 resource1) 0)
    (= (requires arPerson5 resource2) 0)
    (= (requires arPerson5 resource3) 0)
))

)