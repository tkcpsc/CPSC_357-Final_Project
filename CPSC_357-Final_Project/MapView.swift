//
//  MapView.swift
//  CPSC_357-Final_Project
//
//  Created by Tommy Kudey on 12/5/24.
//


import SwiftUI
import MapKit

struct MapView: View {
    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )
    @State private var golfCourses: [IdentifiableMapItem] = []

    var body: some View {
        NavigationView {
            VStack {
                Text("Nearby Golf Courses")
                    .font(.headline)

                Map(position: $cameraPosition) {
                    ForEach(golfCourses) { course in
                        Marker(
                            course.mapItem.name ?? "Unknown",
                            coordinate: course.mapItem.placemark.coordinate
                        )
                    }
                }
                .frame(height: 300)

                List(golfCourses) { course in
                    VStack(alignment: .leading) {
                        Text(course.mapItem.name ?? "Unknown")
                            .font(.headline)
                        if let address = course.mapItem.placemark.formattedAddress {
                            Text(address)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .padding()
            .onAppear(perform: searchForGolfCourses)
            .navigationTitle("Map")
        }
    }

    private func searchForGolfCourses() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "Golf Course"
        request.region = cameraPosition.region ?? MKCoordinateRegion()

        let search = MKLocalSearch(request: request)
        search.start { response, error in
            if let response = response {
                golfCourses = response.mapItems.map { IdentifiableMapItem(mapItem: $0) }
            } else if let error = error {
                print("Error searching for golf courses: \(error.localizedDescription)")
            }
        }
    }
}

struct IdentifiableMapItem: Identifiable {
    let id = UUID()
    let mapItem: MKMapItem
}

extension MKPlacemark {
    var formattedAddress: String? {
        [subThoroughfare, thoroughfare, locality, administrativeArea, postalCode]
            .compactMap { $0 }
            .joined(separator: ", ")
    }
}

#Preview{}
