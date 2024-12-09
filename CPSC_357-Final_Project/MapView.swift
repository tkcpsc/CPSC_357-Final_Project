//
//  MapView.swift
//  CPSC_357-Final_Project
//
//  Created by Tommy Kudey on 12/5/24.
//



import SwiftUI
import MapKit // Import MapKit for map-related functionality.

struct MapView: View {
    // The MapView struct conforms to the View protocol and provides a map-based interface.
    
    @State private var cameraPosition = MapCameraPosition.region(
        // Initializes the map camera position with a default region (centered on Los Angeles, CA).
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )
    @State private var golfCourses: [IdentifiableMapItem] = []
    // A state variable to hold a list of nearby golf courses as IdentifiableMapItem objects.

    var body: some View {
        // The body defines the content and layout of the MapView.
        NavigationView {
            // Embeds the content in a navigation view to display a navigation title.
            VStack {
                // Arranges the map and list vertically.
                Text("Nearby Golf Courses")
                    .font(.headline)
                    // Displays a title for the view.

                Map(position: $cameraPosition) {
                    // Displays a map with the camera position bound to the state variable.
                    ForEach(golfCourses) { course in
                        // Iterates through golfCourses to place markers on the map.
                        Marker(
                            course.mapItem.name ?? "Unknown",
                            coordinate: course.mapItem.placemark.coordinate
                        )
                    }
                }
                .frame(height: 300)
                // Sets a fixed height for the map view.

                List(golfCourses) { course in
                    // Displays a list of golf courses with their names and addresses.
                    VStack(alignment: .leading) {
                        Text(course.mapItem.name ?? "Unknown")
                            .font(.headline)
                            // Displays the course name.
                        if let address = course.mapItem.placemark.formattedAddress {
                            // If an address exists, display it.
                            Text(address)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                // Applies a lighter color for the address text.
                        }
                    }
                }
            }
            .padding()
            // Adds padding around the content.
            .onAppear(perform: searchForGolfCourses)
            // Calls the searchForGolfCourses method when the view appears.
            .navigationTitle("Map")
            // Sets the title of the navigation bar to "Map".
        }
    }

    private func searchForGolfCourses() {
        // Searches for nearby golf courses using MapKit's local search.
        let request = MKLocalSearch.Request()
        // Creates a search request for "Golf Course".
        request.naturalLanguageQuery = "Golf Course"
        request.region = cameraPosition.region ?? MKCoordinateRegion()
        // Limits the search to the current map region.

        let search = MKLocalSearch(request: request)
        search.start { response, error in
            // Starts the search and handles the response or any errors.
            if let response = response {
                golfCourses = response.mapItems.map { IdentifiableMapItem(mapItem: $0) }
                // Maps the response's MKMapItems to IdentifiableMapItem objects.
            } else if let error = error {
                print("Error searching for golf courses: \(error.localizedDescription)")
                // Logs any errors encountered during the search.
            }
        }
    }
}

struct IdentifiableMapItem: Identifiable {
    // A wrapper for MKMapItem to make it conform to the Identifiable protocol.
    let id = UUID() // Provides a unique identifier for each map item.
    let mapItem: MKMapItem
    // Stores the underlying MKMapItem.
}

extension MKPlacemark {
    // Adds a computed property to MKPlacemark to format its address as a string.
    var formattedAddress: String? {
        // Combines various address components into a single formatted string.
        [subThoroughfare, thoroughfare, locality, administrativeArea, postalCode]
            .compactMap { $0 }
            .joined(separator: ", ")
    }
}
