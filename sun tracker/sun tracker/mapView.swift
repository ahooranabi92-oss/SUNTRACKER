//
//  mapView.swift
//  sun tracker
//
//  Created by ahoora nabi on 09/11/25.
//

import SwiftUI
import MapKit


struct mapView: View {
    @State private var region: MapCameraPosition = .camera(MapCamera(centerCoordinate: CLLocationCoordinate2D(latitude:40.8518, longitude: 14.2681),distance: 60000,heading: 0,pitch: 56))
    var body: some View {
       
        ZStack {
            Map(position: $region)
                .ignoresSafeArea()
            
            
            
            
            
            
            
            
            
            VStack{
                HStack(alignment: .top){
                    VStack(alignment: .leading, spacing: 10) {
                                            Button {} label: {
                                                Image(systemName: "sun.max.fill")
                                                    .padding(10)
                                                    .background(Color.black.opacity(0.6))
                                                    .clipShape(Circle())
                                            }
                                            Button {} label: {
                                                Image(systemName: "cube.fill")
                                                    .padding(10)
                                                    .background(Color.black.opacity(0.6))
                                                    .clipShape(Circle())
                                            }
                                        }
                    Spacer()
                    VStack(alignment: .trailing, spacing: 15) {
                                            Button {} label: {
                                                Image(systemName: "ellipsis")
                                                    .padding(15)
                                                    .background(Color.black.opacity(0.6))
                                                    .clipShape(Circle())
    
                                            }
                                            Button {} label: {
                                                Image(systemName: "map.fill")
                                                    .padding(10)
                                                    .background(Color.black.opacity(0.6))
                                                    .clipShape(Circle())
                                            }
                                            Button {} label: {
                                                Image(systemName: "location.north.fill")
                                                    .padding(10)
                                                    .background(Color.black.opacity(0.6))
                                                    .clipShape(Circle())
                                            }
                                            Button {} label: {
                                                Text("3D")
                                                    .font(.caption)
                                                    .frame(width: 38, height: 38)
                                                    .background(Color.black.opacity(0.6))
                                                    .clipShape(Circle())
                                            }
                                        }
                                    }
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 15)
                                    .padding(.top, 10)
                Spacer()
                }
            }
        }
    }


#Preview {
    mapView()
}
