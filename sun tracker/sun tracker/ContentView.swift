//
//  ContentView.swift
//  sun tracker
//
//  Created by ahoora nabi on 07/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                
                TabView {
                            detailsView()
                                .tabItem {
                                    Label("Details", systemImage: "list.bullet.rectangle.fill") }
                    mapView()
                                    .tabItem {
                                        Label("Map", systemImage: "map.fill")
                                    }
                    ARViewScreen()
                                    .tabItem {
                                        Label("AR", systemImage: "arkit")
                                    }
                    SettingsView()
                                    .tabItem {
                                        Label("Settings", systemImage: "gearshape.fill")
                    
                }
            }
            
    }
        }
    }
}


#Preview {
    ContentView()
        
}
