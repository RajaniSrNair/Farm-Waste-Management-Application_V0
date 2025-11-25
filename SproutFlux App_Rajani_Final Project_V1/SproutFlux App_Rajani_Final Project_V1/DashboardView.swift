//
//  DashboardView.swift
//  SproutFlux App_Rajani_Final Project_V1
//
//  Created by user286658 on 11/5/25.

//Simple placeholder dashboard
//Lays out a visible dashboard content- the title, a placeholder message and vertical spacing for a balanced layout vertically

import SwiftUI

struct DashboardView: View{
    var body: some View{
        ZStack{
            Color(.systemGreen) .opacity(0.08) .ignoresSafeArea()
            //subtle light green full screen background
            
            VStack(spacing: 20){   //vertical spacing between each element is 20
                Text("SpoutFlux")
                    .font(.largeTitle) .bold() .foregroundColor(.green)
                Spacer()   //helps place "No data yet" vertically between the title and bottom of the screen
                Text("No data yet")
                    .font(.title2)
                    .foregroundColor(.secondary)
                Spacer()  //adds more space below to balance the layout vertically
            }
            .padding(.top, 60)  //adds 60 points of extra space at the top of the vertical stack so the title isn't too close to top of the screen
        }
    }
}

#Preview{
    DashboardView()
}
