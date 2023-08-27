//
//  LocationsViewModel.swift
//  MeMap
//
//  Created by Jayadi Kurniawan on 25/08/23.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    // all locations
    @Published var locations: [Location]
    
    // current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // show list location
    @Published var showLocationsList: Bool = false
    
    // show location detail using sheet
    @Published var sheetLocation: Location? = nil
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
 
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            // same with showLocationsList.toggle()
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        // get current index
        
        /*
        let currentIndex = locations.firstIndex { location in
                return location == mapLocation
        }
        */
        
        // same as above, but simpler
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            print("Can't find current index")
            return
        }
        
        // check if current index is valid
        let nextIndex = currentIndex + 1
        
        // really important to prevent crash
        guard locations.indices.contains(nextIndex) else {
            
            // next index is not valid, restart from 0
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
        // next index is valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
