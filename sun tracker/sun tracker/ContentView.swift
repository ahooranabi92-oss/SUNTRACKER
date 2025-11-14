//
//  ContentView.swift
//  sun tracker
//
//  Created by ahoora nabi on 07/11/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject private var locationManager = LocationManager()
    
    @State private var selectedTab: String = "Map"
    
    var body: some View {
        ZStack {
            
            Group {
                if selectedTab == "Details" {
                    DetailsView()
                } else if selectedTab == "Map" {
                    mapView()
                } else if selectedTab == "AR" {
                    ARView()
                } else if selectedTab == "Settings" {
                    SettingsView()
                }
            }
            .edgesIgnoringSafeArea(selectedTab == "Map" || selectedTab == "AR" ? .all : .top)
            VStack {
               
                
                Spacer()
                
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
        .preferredColorScheme(.dark)
    }
    
    struct CustomTabBar: View {
        @Binding var selectedTab: String
        
        var body: some View {
            HStack(spacing: 60) {
                TabBarButton(title: "Details", icon: "list.bullet", tab: "Details", selectedTab: $selectedTab)
                TabBarButton(title: "Map", icon: "map.fill", tab: "Map", selectedTab: $selectedTab)
                TabBarButton(title: "AR", icon: "cube.fill", tab: "AR", selectedTab: $selectedTab)
                TabBarButton(title: "Settings", icon: "gearshape.fill", tab: "Settings", selectedTab: $selectedTab)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .background(Color.black.opacity(0.85))
            .cornerRadius(20)
            .padding(.bottom, 8)
        }
    }
    
    struct TabBarButton: View {
        let title: String
        let icon: String
        let tab: String
        @Binding var selectedTab: String
        
        var body: some View {
            Button {
                selectedTab = tab
            } label: {
                VStack(spacing: 4) {
                    Image(systemName: icon)
                        .font(.title2)
                    Text(title)
                        .font(.caption)
                }
            }
            .foregroundColor(selectedTab == tab ? .red : .white.opacity(0.8))
            .opacity(selectedTab == tab ? 1.0 : 0.7)
        }
    }
    
    struct TopHeaderView: View {
        let locationName: String
        let dateString: String
        
        var body: some View {
            VStack(spacing: 1) {
                HStack {
                    Image(systemName: "location.fill")
                        .foregroundColor(.white)
                    Text(locationName)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 25)
                .padding(.top, 50)
                .padding(.bottom, 10)
                
                
                Spacer()
            }
            .background(Color.clear)
        }
    }
}


#Preview {
    ContentView()
}
