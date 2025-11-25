//
//  ContentView.swift
//  SproutFlux App_Rajani_Final Project_V0
//
//  Created by user286658 on 11/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LogWasteView()
                .tabItem { Label ("Log Waste", systemImage: "leaf")}
            DashboardView()
                    .tabItem { Label ("Dashboard", systemImage: "chart.bar.fill")}
        
    }
        .accentColor(.green)
        }
                           }


#Preview {
    ContentView()
}
