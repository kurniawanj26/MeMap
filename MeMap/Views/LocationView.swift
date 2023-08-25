//
//  LocationView.swift
//  MeMap
//
//  Created by Jayadi Kurniawan on 25/08/23.
//

import SwiftUI

struct LocationView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) {
                Text($0.name)
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationsViewModel())
    }
}
