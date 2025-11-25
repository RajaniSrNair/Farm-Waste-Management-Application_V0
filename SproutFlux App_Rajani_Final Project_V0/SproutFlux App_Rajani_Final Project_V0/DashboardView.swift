//
//  DashboardView.swift
//  SproutFlux App_Rajani_Final Project_V0
//
//  Created by user286658 on 11/5/25.
//

import SwiftUI

struct DashboardView: View{
    var body: some View{
        ZStack{
            Color(.systemGreen) .opacity(0.08) .ignoresSafeArea()
            
            VStack(spacing: 20){
                Text("SpoutFlux")
                    .font(.largeTitle) .bold() .foregroundColor(.green)
                Spacer()
                Text("No data yet")
                    .font(.title2)
                    .foregroundColor(.secondary)
                Spacer()
            }
            .padding(.top, 60)
        }
    }
}

#Preview{
    DashboardView()
}
