//
//  ContentView.swift
//  SproutFlux App_Rajani_Final Project_V1
//
//  Created by user286658 on 11/5/25.
//

//Main screen controller for the app
//Decides what to show to the user depending on whether they are signed in or not
//Looks at the authentication state from AuthManager to decide which screen to display

import SwiftUI

struct ContentView: View {
    
    //runs authManager to check if user is signed in
    
    @StateObject private var auth = AuthManager()
    //an instance of AuthManager, auth, is created
    
    var body: some View {
        Group {
    //Container that allows if/else inside a single view
              if auth.isSignedIn {
        
        //builds the main interface that appears after login
                
                  TabView {  //creates a tab bar interface. multiple tabs at the bottom
                    
                    LogWasteView()
                        .tabItem { Label ("Log Waste", systemImage: "leaf")}
                      //.tabItem defines label and system icon for each tab
                   
                    DashboardView()
                        .tabItem { Label ("Dashboard", systemImage: "chart.bar.fill")}
                    
                }
                .environmentObject(auth)
                .accentColor(.green)
 //environmentObject injects the same 
//if user is logged in (from AuthManager), the main app interface is shown- 2 tabs at the bottom containing separate views- LogWaste and Dashboard

            } else {
        
        //builds the signed out interface
                
                LoginView() .environmentObject(auth)
                
        //displays the login screen if isSignedIn is false
                
            }
        }
    }
}

#Preview {
    ContentView()
}
