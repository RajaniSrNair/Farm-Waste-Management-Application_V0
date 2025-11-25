//
//  LogWasteView.swift
//  SproutFlux App_Rajani_Final Project_V1
//
//  Created by user286658 on 11/5/25.
//
//Placeholder screen for user to start recording the waste
//View designed as an entry point for LogWaste feature- intend UI Scaffolding

import SwiftUI

struct LogWasteView: View {
    var body: some View{
        ZStack{
            Color(.systemGreen) .opacity(0.08) .ignoresSafeArea()
           
            VStack (spacing: 30) {
                Text("SproutFlux")
                    .font(.largeTitle) .bold() .foregroundColor(.green)
                Spacer()
                Button{
                    // placeholder for future navigation to list/add forms
                } label: {
                    Text("Start Logging")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal, 32)
                }
                Spacer()
            }
            .padding(.top, 60)
            
        }
    }
}
#Preview{
    LogWasteView()
}
