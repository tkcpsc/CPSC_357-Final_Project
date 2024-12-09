//
//  MapView.swift
//  CPSC_357-Final_Project
//
//  Created by Tommy Kudey on 12/5/24.
//


import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Nearby Practice Ranges")
                    .font(.headline)
                Map(coordinateRegion: $region)
                    .frame(height: 300)
            }
            .padding()
            .navigationTitle("Map")
        }
    }
}