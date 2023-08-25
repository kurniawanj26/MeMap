//
//  LocationsViewModel.swift
//  MeMap
//
//  Created by Jayadi Kurniawan on 25/08/23.
//

import Foundation

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
    
}
