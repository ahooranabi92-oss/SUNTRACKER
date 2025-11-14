import SwiftUI
import MapKit

struct MapHeaderView: View {
    let latitude: Double
    let longitude: Double
    let locationName: String
    
    @State private var position: MapCameraPosition
    
    init(latitude: Double, longitude: Double, locationName: String) {
        self.latitude = latitude
        self.longitude = longitude
        self.locationName = locationName
        
        _position = State(initialValue: .region(MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
            span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20)
        )))
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Map(position: $position) {
                Annotation("", coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude)) {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 12, height: 12)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                        )
                }
            }
            .mapStyle(.standard(elevation: .realistic))
            .mapControlVisibility(.hidden)
            .frame(height: 200)
            
            HStack {
                Image(systemName: "location.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
                
                Text(locationName)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color.black.opacity(0.7))
            .cornerRadius(20)
            .padding([.top, .leading], 16)
        }
    }
}

#Preview {
    ContentView()
}
