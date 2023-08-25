//
//  MeMapApp.swift
//  MeMap
//
//  Created by Jayadi Kurniawan on 25/08/23.
//

import SwiftUI

@main
struct MeMapApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(vm)
        }
    }
}
